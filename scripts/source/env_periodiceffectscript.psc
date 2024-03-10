ScriptName ENV_PeriodicEffectScript Extends ActiveMagicEffect

;-- Structs -----------------------------------------
Struct PeriodicEffectDatum
  Bool FireOnStart
  { These effects should fire when the magic effect starts }
  Int FireOnTimerID = -1
  { These effects should fire when the OnTimer event for this ID occurs }
  Bool StopFiringIfSuccessful = True
  { If true (default), if this Periodic Effect fires, ignore any further Periodic Effect that would also fire on this same FireOnTimerID / FireOnStart }
  GlobalVariable ChanceGlobal
  { if there is a ChanceGlobal, that becomes a chance on a d100 to fire the effect (everything below) }
  ActorValue ChanceAV
  { added to the ChanceGlobal }
  Bool MagnitudeScalesChance
  { If true: If there is a ChanceGlobal, it's value is multiplied by the magnitude; if there is no ChanceGlobal the magnitude IS the chance. }
  conditionform Conditions
  { if true, before firing, make sure this condition form is true for the subject }
  Spell SpellToCast
  { Cast this spell when this effect is fired }
  FormList IncrementalSpellListToCast
  { Cast a spell from this list when effect is fired. Start with spells in lower index. If already present, dispell it and cast the next higher one that isn't already running on player. }
  Bool AddSpellInsteadOfCast = False
  { If true will add spell instead of casting it (for abilities, etc.) }
  env_afflictionscript AfflictionToGain
  { Gain this affliction when this effect is fired }
  FormList RandomAfflictionsToGainList
  { Gain the afflictions in this formlist when this effect is fired. Put the same affliction in the array if you want to weight it to be more likely that others }
  Message MessageToDisplay
  { Display this message when this effect is fired }
  Bool ShowAsHelpMessage
  { Display the message as a tutorial message }
  Float HelpMessageDuration
  { How long to disply help message }
  Keyword DialogueSubTopicToSay
  { Dialogue for player to "say" when this effect is fired (ie choking, gasping, etc.)
A quest must be running with this dialogue... usually a unique game started quest) }
  Int DetectionEventSoundLevel = -1
  { if > -1, will send a detection event with this sound level }
EndStruct

Struct TimerDatum
  Int ID
  GlobalVariable IntervalGlobal
  { A global holding the interval in seconds, for this timer. Values of 0 or less are ignored. }
  GlobalVariable MaxIntervalGlobal
  { Optional: If set, IntervalGlobal becomes a min and this global becomes the max of a randomized interval in seconds, for this timer. Values of 0 or less are ignored. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TimerDataSetting
  env_periodiceffectscript:timerdatum[] Property TimerData Auto Const
  { If you aren't just firing things on start, then you need to create at least one TimerDatum in this list. }
EndGroup

Group PeriodicEffectDataSetting
  env_periodiceffectscript:periodiceffectdatum[] Property PeriodicEffectData Auto Const mandatory
  Message Property MessageToDisplayOnFinish Auto Const
  { Display this message when this effect finishes }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.ProcessPeriodicEventData(Self.GetAllPeriodicEffectsFiringOnStart())
  Self.StartTimers(TimerData)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If MessageToDisplayOnFinish != None
    MessageToDisplayOnFinish.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  env_periodiceffectscript:periodiceffectdatum[] foundPeriodicEffectData = Self.GetAllPeriodicEffectsFiringOnTimerID(aiTimerID)
  Self.ProcessPeriodicEventData(foundPeriodicEffectData)
  Self.StartTimerInDatum(TimerData[TimerData.findstruct("ID", aiTimerID, 0)])
EndEvent

Function StartTimers(env_periodiceffectscript:timerdatum[] Timers)
  Int I = 0
  While I < Timers.Length
    Self.StartTimerInDatum(Timers[I])
    I += 1
  EndWhile
EndFunction

Function StartTimerInDatum(env_periodiceffectscript:timerdatum TimerDatumToStart)
  GlobalVariable IntervalGlobal = TimerDatumToStart.IntervalGlobal
  GlobalVariable MaxIntervalGlobal = TimerDatumToStart.MaxIntervalGlobal
  If IntervalGlobal
    Float interval = IntervalGlobal.GetValue()
    If MaxIntervalGlobal
      interval = Utility.RandomFloat(interval, MaxIntervalGlobal.GetValue())
    EndIf
    If interval > 0.0
      Self.StartTimer(interval, TimerDatumToStart.ID)
    EndIf
  EndIf
EndFunction

Function ProcessPeriodicEventData(env_periodiceffectscript:periodiceffectdatum[] PeriodicEffectDataToProcess)
  If Self.IsBoundGameObjectAvailable() == False
    Return 
  EndIf
  Actor TargetActor = Self.GetTargetActor()
  Actor CasterActor = Self.GetCasterActor()
  If CasterActor == None
    CasterActor = TargetActor
  EndIf
  Bool ShouldStopFiring = False
  Int I = 0
  While I < PeriodicEffectDataToProcess.Length && ShouldStopFiring == False && CasterActor as Bool
    env_periodiceffectscript:periodiceffectdatum currentPeriodicEffectDatum = PeriodicEffectDataToProcess[I]
    Bool chanceSuccess = True
    Bool conditionsSuccess = True
    If (currentPeriodicEffectDatum.ChanceGlobal != None || currentPeriodicEffectDatum.ChanceAV as Bool) || currentPeriodicEffectDatum.MagnitudeScalesChance
      Float chance = 1.0
      If currentPeriodicEffectDatum.ChanceGlobal
        chance = currentPeriodicEffectDatum.ChanceGlobal.GetValueInt() as Float
        If currentPeriodicEffectDatum.ChanceAV
          chance += TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV)
        EndIf
      ElseIf currentPeriodicEffectDatum.ChanceAV
        chance = TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV)
      EndIf
      If currentPeriodicEffectDatum.MagnitudeScalesChance
        Float magnitude = Self.GetMagnitude()
        chance *= magnitude
      EndIf
      chanceSuccess = Game.GetDieRollSuccess(chance as Int, 1, 100, -1, -1)
    EndIf
    If currentPeriodicEffectDatum.Conditions != None
      conditionsSuccess = currentPeriodicEffectDatum.Conditions.IsTrue(TargetActor as ObjectReference, None)
    EndIf
    If chanceSuccess == True && conditionsSuccess == True
      If currentPeriodicEffectDatum.SpellToCast
        currentPeriodicEffectDatum.SpellToCast.Cast(CasterActor as ObjectReference, TargetActor as ObjectReference)
      EndIf
      If currentPeriodicEffectDatum.IncrementalSpellListToCast
        FormList currentSpellList = currentPeriodicEffectDatum.IncrementalSpellListToCast
        Int iSpell = 0
        Int iLastSpell = currentSpellList.GetSize() - 1
        If iLastSpell < 0
          
        EndIf
        Spell foundSpell = None
        While iSpell <= iLastSpell
          Spell currentSpell = currentSpellList.GetAt(iSpell) as Spell
          If TargetActor.IsSpellTarget(currentSpell as Form)
            foundSpell = currentSpell
            If iSpell < iLastSpell
              Spell nextSpell = currentSpellList.GetAt(iSpell + 1) as Spell
              Self.DispelOrRemoveSpell(foundSpell, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast)
              Self.CastOrAddSpell(nextSpell, CasterActor, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast)
            EndIf
            iSpell = iLastSpell
          EndIf
          iSpell += 1
        EndWhile
        If foundSpell == None
          Spell nextspell = currentSpellList.GetAt(0) as Spell
          Self.CastOrAddSpell(nextspell, CasterActor, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast)
        EndIf
      EndIf
      If currentPeriodicEffectDatum.AfflictionToGain
        Self.GainAffliction(TargetActor, currentPeriodicEffectDatum.AfflictionToGain)
      EndIf
      If currentPeriodicEffectDatum.RandomAfflictionsToGainList
        Int iRandom = Utility.RandomInt(0, currentPeriodicEffectDatum.RandomAfflictionsToGainList.GetSize() - 1)
        env_afflictionscript randomAffliction = currentPeriodicEffectDatum.RandomAfflictionsToGainList.GetAt(iRandom) as env_afflictionscript
        Self.GainAffliction(TargetActor, randomAffliction)
      EndIf
      If currentPeriodicEffectDatum.MessageToDisplay
        If currentPeriodicEffectDatum.ShowAsHelpMessage
          currentPeriodicEffectDatum.MessageToDisplay.ShowAsHelpMessage("PeriodicEffectHelpMsg", currentPeriodicEffectDatum.HelpMessageDuration, 1.0, 1, "", 0, None)
        Else
          currentPeriodicEffectDatum.MessageToDisplay.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        EndIf
      EndIf
      If currentPeriodicEffectDatum.DialogueSubTopicToSay
        TargetActor.SayCustom(currentPeriodicEffectDatum.DialogueSubTopicToSay, None, False, None)
      EndIf
      If currentPeriodicEffectDatum.DetectionEventSoundLevel > -1
        TargetActor.CreateDetectionEvent(TargetActor, currentPeriodicEffectDatum.DetectionEventSoundLevel)
      EndIf
      If currentPeriodicEffectDatum.StopFiringIfSuccessful
        ShouldStopFiring = True
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function GainAffliction(Actor TargetActor, env_afflictionscript AfflictionToGain)
  If TargetActor == Game.GetPlayer()
    AfflictionToGain.Gain(True, False)
  EndIf
EndFunction

Function CastOrAddSpell(Spell SpellToCastOrAdd, Actor CasterActor, Actor TargetActor, Bool AddSpell)
  If AddSpell
    TargetActor.AddSpell(SpellToCastOrAdd, True)
  Else
    SpellToCastOrAdd.Cast(CasterActor as ObjectReference, TargetActor as ObjectReference)
  EndIf
EndFunction

Function DispelOrRemoveSpell(Spell SpellToDispelOrRemove, Actor TargetActor, Bool RemoveSpell)
  If RemoveSpell
    TargetActor.RemoveSpell(SpellToDispelOrRemove)
  Else
    TargetActor.DispelSpell(SpellToDispelOrRemove)
  EndIf
EndFunction

env_periodiceffectscript:periodiceffectdatum[] Function GetAllPeriodicEffectsFiringOnStart()
  env_periodiceffectscript:periodiceffectdatum[] foundPeriodicEffectDatum = new env_periodiceffectscript:periodiceffectdatum[0]
  Int iFound = PeriodicEffectData.findstruct("FireOnStart", True, 0)
  While iFound >= 0
    foundPeriodicEffectDatum.add(PeriodicEffectData[iFound], 1)
    If iFound < PeriodicEffectData.Length - 1
      iFound = PeriodicEffectData.findstruct("FireOnStart", True, iFound + 1)
    Else
      iFound = -1
    EndIf
  EndWhile
  Return foundPeriodicEffectDatum
EndFunction

env_periodiceffectscript:periodiceffectdatum[] Function GetAllPeriodicEffectsFiringOnTimerID(Int ID)
  env_periodiceffectscript:periodiceffectdatum[] foundPeriodicEffectData = new env_periodiceffectscript:periodiceffectdatum[0]
  Int iFound = PeriodicEffectData.findstruct("FireOnTimerID", ID, 0)
  While iFound >= 0
    foundPeriodicEffectData.add(PeriodicEffectData[iFound], 1)
    If iFound < PeriodicEffectData.Length - 1
      iFound = PeriodicEffectData.findstruct("FireOnTimerID", ID, iFound + 1)
    Else
      iFound = -1
    EndIf
  EndWhile
  Return foundPeriodicEffectData
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
