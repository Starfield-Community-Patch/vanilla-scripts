ScriptName SQ_ENV_AfflictionsScript Extends Quest

;-- Structs -----------------------------------------
Struct FallingAfflictionDatum
  env_afflictionscript Affliction
  Bool SmallFall
  Bool MediumFall
  Bool LargeFall
EndStruct


;-- Variables ---------------------------------------
Int DebugDieRoll_Cure = -1
Int DebugDieRoll_Improve = -1
Int DebugDieRoll_Infection = -1
Int DebugDieRoll_Worsen = -1
Int NumberOfSystems = 4 Const
Float SystemDuration = 150.0 Const
Float TimerDur_Override = -1.0
Int iNextSystem
Int iSystem_Cure = 0 Const
Int iSystem_Improve = 3 Const
Int iSystem_Infection = 1 Const
Int iSystem_Worsen = 2 Const

;-- Properties --------------------------------------
Group Autofill
  sq_envscript Property SQ_ENV Auto Const mandatory
  Message Property ENV_AFFL_Cured_Msg Auto Const mandatory
  Message Property ENV_AFFL_Gained_Msg Auto Const mandatory
  Message Property ENV_AFFL_Worsened_Msg Auto Const mandatory
  Message Property ENV_AFFL_Improved_Msg Auto Const mandatory
  Message Property ENV_AFFL_Improved_Severity_Msg Auto Const mandatory
  GlobalVariable Property ENV_AFFL_InfectionSpreadAllowed Auto Const mandatory
  ActorValue Property ENV_AFFL_Treatment_CureChance_Infection Auto Const mandatory
  ActorValue Property ENV_AFFL_Treatment_CureChance_Injury Auto Const mandatory
EndGroup

env_afflictionscript[] Property AfflictionData Auto Const mandatory
sq_env_afflictionsscript:fallingafflictiondatum[] Property FallingAfflictionData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.StartAfflictionTimer(Self as ScriptObject)
EndEvent

Event OnTimer(Int aiTimerID)
  Self.HandleTimer()
EndEvent

Bool Function IsInfectionSpreadAllowed()
  Bool returnVal = ENV_AFFL_InfectionSpreadAllowed.GetValue() == 1.0
  Return returnVal
EndFunction

Function StartAfflictionTimer(ScriptObject CallingObject)
  Self.StartTimer(Self.GetTimerDuration(), 0)
EndFunction

Float Function GetTimerDuration()
  Float returnVal = SystemDuration / NumberOfSystems as Float
  If TimerDur_Override > -1.0
    returnVal = TimerDur_Override
  EndIf
  Return returnVal
EndFunction

Function HandleTimer()
  env_afflictionscript[] activeAfflictionDataToProcess = None
  If iNextSystem == iSystem_Cure
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(True, False, False, False, None)
  ElseIf iNextSystem == iSystem_Infection && Self.IsInfectionSpreadAllowed()
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(False, True, False, False, None)
  ElseIf iNextSystem == iSystem_Worsen
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(False, False, True, False, None)
  ElseIf iNextSystem == iSystem_Improve
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(False, False, False, True, None)
  EndIf
  Bool handled = False
  Int[] randomizedIndexes = commonarrayfunctions.GetRandomizedIndexes(activeAfflictionDataToProcess.Length)
  Int dieRoll = Game.GetDieRoll(1, 100, -1)
  Int I = 0
  While I < randomizedIndexes.Length && handled == False
    env_afflictionscript currentAffliction = activeAfflictionDataToProcess[randomizedIndexes[I]]
    If iNextSystem == iSystem_Cure
      handled = currentAffliction.AttemptToCure(dieRoll, DebugDieRoll_Cure)
    ElseIf iNextSystem == iSystem_Infection
      handled = currentAffliction.AttemptToGainInfection(dieRoll, DebugDieRoll_Infection)
    ElseIf iNextSystem == iSystem_Worsen
      handled = currentAffliction.AttemptToWorsen(dieRoll, DebugDieRoll_Worsen)
    ElseIf iNextSystem == iSystem_Improve
      handled = currentAffliction.AttemptToImprove(dieRoll, DebugDieRoll_Improve)
    EndIf
    I += 1
  EndWhile
  iNextSystem = (iNextSystem + 1) % NumberOfSystems
  Self.StartAfflictionTimer(Self as ScriptObject)
EndFunction

env_afflictionscript[] Function GetActiveAfflictions(Bool OnlyCurable, Bool OnlyInfectable, Bool OnlyWorsenable, Bool OnlyImproveable, Keyword OnlyMatchingTreatmentEffectKeyword)
  env_afflictionscript[] activeAfflictionData = new env_afflictionscript[0]
  Int I = 0
  While I < AfflictionData.Length
    env_afflictionscript currentAffliction = AfflictionData[I]
    If currentAffliction.Active
      If OnlyCurable == False || currentAffliction.GetChance_Cure() > 0
        If OnlyInfectable == False || currentAffliction.GetChance_Infection() > 0
          If OnlyWorsenable == False || currentAffliction.GetChance_Worsen() > 0
            If OnlyImproveable == False || currentAffliction.GetChance_Improve() > 0
              If OnlyMatchingTreatmentEffectKeyword == None || currentAffliction.TreatmentEffectKeyword == OnlyMatchingTreatmentEffectKeyword
                activeAfflictionData.add(currentAffliction, 1)
              EndIf
            EndIf
          EndIf
        EndIf
      EndIf
    EndIf
    I += 1
  EndWhile
  Return activeAfflictionData
EndFunction

Function ImproveActiveAfflictions(Keyword TreatmentEffectKeyword, Int ImprovementLevels, Bool IsTreatment)
  env_afflictionscript[] afflictionsToImprove = Self.GetActiveAfflictions(False, False, False, False, TreatmentEffectKeyword)
  Bool hardcoreMode = False
  Bool cureRandomInfection = IsTreatment && Game.GetDieRollSuccess(Game.GetPlayer().GetValue(ENV_AFFL_Treatment_CureChance_Infection) as Int, 1, 100, -1, -1)
  Bool cureRandomInjury = IsTreatment && Game.GetDieRollSuccess(Game.GetPlayer().GetValue(ENV_AFFL_Treatment_CureChance_Injury) as Int, 1, 100, -1, -1)
  Int[] randomizedIndexes = commonarrayfunctions.GetRandomizedIndexes(afflictionsToImprove.Length)
  Int I = 0
  While I < randomizedIndexes.Length
    env_afflictionscript currentAffliction = afflictionsToImprove[randomizedIndexes[I]]
    If hardcoreMode
      If cureRandomInfection && currentAffliction.IsInfection
        currentAffliction.Cure()
        cureRandomInfection = False
      ElseIf cureRandomInjury && currentAffliction.IsInfection == False
        currentAffliction.Cure()
        cureRandomInjury = False
      Else
        currentAffliction.Improve(ImprovementLevels)
      EndIf
    Else
      currentAffliction.Cure()
    EndIf
    I += 1
  EndWhile
EndFunction

Keyword[] Function GetTreatmentKeywordsForActiveAfflictions()
  Keyword[] treatmentKeywords = new Keyword[0]
  env_afflictionscript[] activeAfflictions = Self.GetActiveAfflictions(False, False, False, False, None)
  Int I = 0
  While I < activeAfflictions.Length
    env_afflictionscript currentAffliction = activeAfflictions[I]
    If treatmentKeywords.find(currentAffliction.TreatmentEffectKeyword, 0) < 0
      treatmentKeywords.add(currentAffliction.TreatmentEffectKeyword, 1)
    EndIf
    I += 1
  EndWhile
  Return treatmentKeywords
EndFunction

Bool Function PlayerHasMatchingTreatmentItemForAnActiveAffliction()
  Bool returnVal = False
  Actor PlayerRef = Game.GetPlayer()
  Keyword[] neededTreatmentKeywords = Self.GetTreatmentKeywordsForActiveAfflictions()
  Int I = 0
  While returnVal == False && I < neededTreatmentKeywords.Length
    Keyword currentKeyword = neededTreatmentKeywords[I]
    returnVal = PlayerRef.GetItemCount(currentKeyword as Form) > 0
    I += 1
  EndWhile
  Return returnVal
EndFunction

Bool Function FormHasMatchingTreatmentItemForAnActiveAffliction(Form FormToCheck)
  Bool returnVal = False
  Keyword[] neededTreatmentKeywords = Self.GetTreatmentKeywordsForActiveAfflictions()
  Int I = 0
  While returnVal == False && I < neededTreatmentKeywords.Length
    Keyword currentKeyword = neededTreatmentKeywords[I]
    returnVal = FormToCheck.HasKeyword(currentKeyword)
    I += 1
  EndWhile
  Return returnVal
EndFunction

env_afflictionscript[] Function GetFallingAfflictionsSmall()
  Return Self.GetFallingAfflictions(FallingAfflictionData.GetMatchingStructs("SmallFall", True, 0, -1)) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
EndFunction

env_afflictionscript[] Function GetFallingAfflictionsMedium()
  Return Self.GetFallingAfflictions(FallingAfflictionData.GetMatchingStructs("MediumFall", True, 0, -1)) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
EndFunction

env_afflictionscript[] Function GetFallingAfflictionsLarge()
  Return Self.GetFallingAfflictions(FallingAfflictionData.GetMatchingStructs("LargeFall", True, 0, -1)) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
EndFunction

env_afflictionscript[] Function GetFallingAfflictions(sq_env_afflictionsscript:fallingafflictiondatum[] MatchingData)
  env_afflictionscript[] matchingAfflictions = new env_afflictionscript[MatchingData.Length]
  Int I = 0
  While I < MatchingData.Length
    matchingAfflictions[I] = MatchingData[I].Affliction
    I += 1
  EndWhile
  Return matchingAfflictions
EndFunction

Function ShowCuredMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Cured_Msg, AfflictionToShowMessageFor as Form)
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageCured")
EndFunction

Function ShowGainedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Gained_Msg, AfflictionToShowMessageFor as Form)
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageGained")
EndFunction

Function ShowWorsenedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Worsened_Msg, AfflictionToShowMessageFor as Form)
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageWorsens")
EndFunction

Function ShowImprovedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Improved_Msg, AfflictionToShowMessageFor as Form)
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageImproved")
EndFunction

Function ShowSeverityImprovedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Improved_Severity_Msg, AfflictionToShowMessageFor as Form)
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageImproved")
EndFunction

env_afflictionscript Function GetAfflictionByID(String ID)
  Int I = 0
  Int iMax = AfflictionData.Length
  While I < iMax
    env_afflictionscript currentAffliction = AfflictionData[I]
    If currentAffliction.ID == ID
      Return currentAffliction
    EndIf
    I += 1
  EndWhile
  Return None
EndFunction

Function CureAllAfflictions()
  Int I = 0
  While I < AfflictionData.Length
    AfflictionData[I].Cure()
    I += 1
  EndWhile
EndFunction

Function CureRandomAffliction(Int CureChance)
  Bool success = Game.GetDieRollSuccess(CureChance, 1, 100, -1, -1)
  If success
    env_afflictionscript[] activeAfflictions = Self.GetActiveAfflictions(False, False, False, False, None)
    Int iRandom = Utility.RandomInt(0, activeAfflictions.Length - 1)
    env_afflictionscript randomENV_AfflictionScript = activeAfflictions[iRandom]
    randomENV_AfflictionScript.Cure()
  EndIf
EndFunction

Function DebugGainAffliction(String stringID, Bool PerformSkillCheck)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID)
  Affliction.Gain(PerformSkillCheck, False)
EndFunction

Function DebugCureAffliction(String stringID)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID)
  Affliction.Cure()
EndFunction

Function DebugAttemptToCureAFfliction(String stringID)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID)
  Affliction.AttemptToCure(-1, -1)
EndFunction

Function DebugImproveAffliction(String stringID)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID)
  Affliction.Improve(1)
EndFunction

Function DebugSetTimerDuration(Float duration)
  TimerDur_Override = duration
  Self.StartAfflictionTimer(Self as ScriptObject)
EndFunction

Function DebugSetDieRollCure(Int dieRoll)
  DebugDieRoll_Cure = dieRoll
EndFunction

Function DebugSetDieRollWorsen(Int dieRoll)
  DebugDieRoll_Worsen = dieRoll
EndFunction

Function DebugSetDieRollImprove(Int dieRoll)
  DebugDieRoll_Improve = dieRoll
EndFunction

Function DebugSetDieRollInfection(Int dieRoll)
  DebugDieRoll_Infection = dieRoll
EndFunction

Function DebugTestCycle(String stringID, Int NumberOfCycles)
  NumberOfCycles = Math.Max(NumberOfCycles as Float, 1.0) as Int
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID)
  Self.DebugSetTimerDuration(0.5)
  Int I = 0
  While I < NumberOfCycles + 1
    Int waitBailout = 100
    Int waitCount = 0
    While Affliction.Active && waitCount < waitBailout
      waitCount += 1
      Utility.Wait(1.0)
    EndWhile
    If I < NumberOfCycles
      Affliction.Gain(False, False)
    EndIf
    I += 1
  EndWhile
  Self.DebugSetTimerDuration(-1.0)
EndFunction

Function DebugTestCycleAll(Int NumberOfCycles)
  NumberOfCycles = Math.Max(NumberOfCycles as Float, 1.0) as Int
  Int I = 0
  While I < AfflictionData.Length
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
