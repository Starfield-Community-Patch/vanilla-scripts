ScriptName DNLocalAlarmScript Extends ObjectReference
{ Script for a localized alarm system that wakes linked robots and turrets. }

;-- Variables ---------------------------------------
Int CONST_AlarmState_Armed = 0 Const
Int CONST_AlarmState_Disarmed = 1 Const
Int CONST_AlarmState_Triggered = 2 Const
Int CONST_CombatState_IsInCombat = 1 Const
Int alarmSFXID = -1

;-- Properties --------------------------------------
Group OptionalProperties
  Quest Property AlarmQuest Auto Const
  Int Property AlarmPrereqStage = -1 Auto Const
  Int Property AlarmTurnOffStage = -1 Auto Const
  Int Property AlarmStageToSet = -1 Auto Const
  Float Property TargetTriggerDelayMin = 0.0 Auto Const
  Float Property TargetTriggerDelayMax = 1.0 Auto Const
  Bool Property ShouldSkipAlarmSFX = False Auto Const
EndGroup

Group AutofillProperties
  Keyword Property DNLocalAlarmSourceLinkKeyword Auto Const mandatory
  Keyword Property DNLocalAlarmTargetLinkKeyword Auto Const mandatory
  wwiseevent Property AlarmSound Auto Const
EndGroup

Int Property AlarmState Auto conditional hidden

;-- Functions ---------------------------------------

Event OnTimer(Int timerID)
  ; Empty function
EndEvent

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
  ; Empty function
EndEvent

Event OnGainLoS(ObjectReference akViewer, ObjectReference akTarget)
  ; Empty function
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function
EndEvent

Function Arm()
  If AlarmQuest == None || !AlarmQuest.GetStageDone(AlarmTurnOffStage)
    Self.GoToState("Armed")
    Self.SetAlarmSourceObjectState(Self.GetLinkedRefChain(DNLocalAlarmSourceLinkKeyword, 100), True)
    Self.SetAlarmSourceObjectState(Self.GetRefsLinkedToMe(DNLocalAlarmSourceLinkKeyword, None), True)
  EndIf
EndFunction

Function TriggerAlarm()
  Self.TryToTriggerAlarm(None)
EndFunction

Function TryToTriggerAlarm(Actor akSource)
  If AlarmQuest == None || (AlarmPrereqStage < 0 || AlarmQuest.GetStageDone(AlarmPrereqStage)) && (AlarmTurnOffStage < 0 || !AlarmQuest.GetStageDone(AlarmTurnOffStage))
    If akSource == None || !akSource.IsDead() && akSource.GetCombatState() == CONST_CombatState_IsInCombat && akSource.HasDetectionLOS(Game.GetPlayer() as ObjectReference)
      Self.GoToState("Triggered")
      Self.Private_TriggerAlarm(akSource)
    EndIf
  EndIf
  If Self.GetState() == "Busy"
    Self.GoToState("Armed")
  EndIf
EndFunction

Function Disarm()
  Self.GoToState("Disarmed")
  Self.SetAlarmSourceObjectState(Self.GetLinkedRefChain(DNLocalAlarmSourceLinkKeyword, 100), False)
  Self.SetAlarmSourceObjectState(Self.GetRefsLinkedToMe(DNLocalAlarmSourceLinkKeyword, None), False)
EndFunction

Function SetAlarmSourceObjectState(ObjectReference[] sources, Bool isArmed)
  Actor player = Game.GetPlayer()
  Int I = 0
  While I < sources.Length
    Actor sourceAsActor = sources[I] as Actor
    If sourceAsActor != None
      Self.RegisterForRemoteEvent(sourceAsActor as ScriptObject, "OnCombatStateChanged")
      Self.RegisterForDetectionLOSGain(sourceAsActor, player as ObjectReference)
      If isArmed
        sourceAsActor.SetUnconscious(False)
      Else
        sourceAsActor.SetUnconscious(True)
      EndIf
    Else
      Self.RegisterForRemoteEvent(sources[I] as ScriptObject, "OnTriggerEnter")
    EndIf
    I += 1
  EndWhile
EndFunction

Function StopAlarmSFX()
  If alarmSFXID >= 0
    wwiseevent.StopInstance(alarmSFXID)
    alarmSFXID = -1
  EndIf
EndFunction

Function Private_TriggerAlarm(Actor source)
  If !ShouldSkipAlarmSFX && AlarmSound != None
    If source == None
      source == Game.GetPlayer()
    EndIf
    alarmSFXID = AlarmSound.Play(source as ObjectReference, None, None)
  EndIf
  Self.Private_TriggerAlarmForRefs(Self.GetLinkedRefChain(DNLocalAlarmTargetLinkKeyword, 100))
  Self.Private_TriggerAlarmForRefs(Self.GetRefsLinkedToMe(DNLocalAlarmTargetLinkKeyword, None))
EndFunction

Function Private_TriggerAlarmForRefs(ObjectReference[] alarmedRefs)
  Int I = 0
  While I < alarmedRefs.Length && Self.GetState() != "Disarmed"
    Actor currentAsActor = alarmedRefs[I] as Actor
    If currentAsActor != None
      robotpodscript currentAsRobotActor = currentAsActor as robotpodscript
      If currentAsRobotActor != None
        currentAsRobotActor.WakeRobotFromPod()
      Else
        currentAsActor.SetUnconscious(False)
      EndIf
      If TargetTriggerDelayMax > 0.0
        Utility.Wait(Utility.RandomFloat(TargetTriggerDelayMin, TargetTriggerDelayMax))
      EndIf
    Else
      DNLocalAlarmScript currentAsAlarmScript = alarmedRefs[I] as DNLocalAlarmScript
      If currentAsAlarmScript != None
        currentAsAlarmScript.TriggerAlarm()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

;-- State -------------------------------------------
State Armed

  Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
    Self.GoToState("Busy")
    Self.TryToTriggerAlarm(akSource)
  EndEvent

  Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
    Self.GoToState("Busy")
    Self.TryToTriggerAlarm(akSource as Actor)
  EndEvent

  Event OnGainLoS(ObjectReference akViewer, ObjectReference akTarget)
    Self.GoToState("Busy")
    Self.TryToTriggerAlarm(akViewer as Actor)
  EndEvent

  Event OnBeginState(String oldStateName)
    AlarmState = CONST_AlarmState_Armed
  EndEvent
EndState

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State Disarmed

  Event OnBeginState(String oldStateName)
    AlarmState = CONST_AlarmState_Disarmed
    Self.UnregisterForAllEvents()
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnCellLoad()
    Self.GoToState("Armed")
    Self.SetAlarmSourceObjectState(Self.GetLinkedRefChain(DNLocalAlarmSourceLinkKeyword, 100), True)
    Self.SetAlarmSourceObjectState(Self.GetRefsLinkedToMe(DNLocalAlarmSourceLinkKeyword, None), True)
  EndEvent
EndState

;-- State -------------------------------------------
State Triggered

  Event OnBeginState(String oldStateName)
    AlarmState = CONST_AlarmState_Triggered
    If AlarmQuest != None && AlarmStageToSet >= 0
      AlarmQuest.SetStage(AlarmStageToSet)
    EndIf
  EndEvent
EndState
