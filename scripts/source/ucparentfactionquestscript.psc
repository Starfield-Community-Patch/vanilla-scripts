ScriptName UCParentFactionQuestScript Extends Quest

;-- Variables ---------------------------------------
Int iTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard MindControlGuard

;-- Properties --------------------------------------
GlobalVariable Property UC04_ReconstructionStateTimerLength Auto Const mandatory
{ Global var used to determine how long we wait before trying to turn off the New Atlantis "reconstruction" state }
Location Property CityNewAtlantisLocation Auto Const mandatory
{ New Atlantis city location used to make sure we're not turning off the state change while the player's around }
Int Property FailsafeTimerLength = 60 Auto Const
{ If the player is in New Atlantis when we try to clean up this state change, use this timer length to wait and check again }
Int Property StageToSet = 1000 Auto Const
{ Stage to set once enough time has elapsed and the player's no longer on New Atlantis to clean up the reconstruction }
RefCollectionAlias Property Thralls Auto Const mandatory
{ Collection used to handle any human thralls and cleaning up their voicetypes }
VoiceType Property NPCFTerrormorphThrall Auto Const mandatory
{ Female Terrormorph Thrall voicetype }
VoiceType Property NPCMTerrormorphThrall Auto Const mandatory
{ Male Terrormorph Thrall voicetype }
Race Property HumanRace Auto Const mandatory
{ Used to know if we should override the NPC's voicetype }
Float Property AggressionOverride = 2.0 Auto Const
{ What we set the mind controlled NPCs aggression to }
ActorValue Property Aggression Auto Const mandatory
{ AV used to make the NPCs hostile }
ActorValue Property UC_MindControl_InitialAggression Auto Const mandatory
{ The NPCs mind control value when the moment starts }
Topic Property Thrall_TakeOverStart Auto Const mandatory
{ Topic to play when a human NPC is initially taken over by a Terrormorph }
Keyword Property UC_MindControlledNPC Auto Const mandatory
{ Keyword applied to Mind Controlled NPC's }

;-- Functions ---------------------------------------

Function SendNPCSuccessfullyMindControledEvent(Actor akSourceTerrormorph, Actor akMindControlTarget)
  Var[] akargs = new Var[2]
  akargs[0] = akSourceTerrormorph as Var
  akargs[1] = akMindControlTarget as Var
  Self.SendCustomEvent("ucparentfactionquestscript_MindControlTriggered", akargs)
EndFunction

Function SendUCR04SampleCollectedEvent(Actor akTargetActor)
  Var[] akargs = new Var[1]
  akargs[0] = akTargetActor as Var
  Self.SendCustomEvent("ucparentfactionquestscript_UCR04SampleCollected", akargs)
EndFunction

Function BeginStateChangeTimer()
  Self.StartTimer(UC04_ReconstructionStateTimerLength.GetValue(), iTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID
    Location CurrLoc = Game.GetPlayer().GetCurrentLocation()
    If CurrLoc != CityNewAtlantisLocation && !CityNewAtlantisLocation.IsChild(CurrLoc)
      Self.SetStage(StageToSet)
    Else
      Self.StartTimer(FailsafeTimerLength as Float, iTimerID)
    EndIf
  EndIf
EndEvent

Function StartThrallTimer()
  (Thralls as thrallcollvocleanupscript).StartCheck()
EndFunction

Function StartMindControlBehavior(Actor TargetActor, Actor akCaster)
  Guard MindControlGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Thralls.AddRef(TargetActor as ObjectReference)
    Float currAggression = TargetActor.GetValue(Aggression)
    If TargetActor.GetBaseValue(Aggression) == currAggression
      If currAggression < AggressionOverride
        TargetActor.AddKeyword(UC_MindControlledNPC)
        TargetActor.SetValue(UC_MindControl_InitialAggression, currAggression)
        TargetActor.SetValue(Aggression, AggressionOverride)
      EndIf
    EndIf
    If TargetActor.GetRace() == HumanRace
      VoiceType OverrideVoiceType = None
      ActorBase TargetBase = TargetActor.GetBaseObject() as ActorBase
      If TargetBase
        If TargetBase.GetSex() == 0
          OverrideVoiceType = NPCMTerrormorphThrall
        Else
          OverrideVoiceType = NPCFTerrormorphThrall
        EndIf
        If OverrideVoiceType != None && TargetActor.GetVoiceType() != OverrideVoiceType
          TargetActor.SetOverrideVoiceType(OverrideVoiceType)
          TargetActor.Say(Thrall_TakeOverStart, None, False, None)
        EndIf
      EndIf
    EndIf
    Self.SendNPCSuccessfullyMindControledEvent(akCaster, TargetActor)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StopMindControlBehavior(Actor OriginalTarget)
  Guard MindControlGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Float currAggression = OriginalTarget.GetValue(Aggression)
    Float SavedAggression = OriginalTarget.GetValue(UC_MindControl_InitialAggression)
    Float BaseAggression = OriginalTarget.GetBaseValue(Aggression)
    If currAggression != SavedAggression && BaseAggression == AggressionOverride
      OriginalTarget.SetValue(Aggression, SavedAggression)
      OriginalTarget.SetValue(UC_MindControl_InitialAggression, 0.0)
    EndIf
    OriginalTarget.StopCombat()
    If OriginalTarget.GetVoiceType() == NPCFTerrormorphThrall || OriginalTarget.GetVoiceType() == NPCMTerrormorphThrall
      OriginalTarget.SetOverrideVoiceType(None)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
