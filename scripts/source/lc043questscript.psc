ScriptName LC043QuestScript Extends Quest conditional
{ Quest script for LC043, SY-920. }

;-- Variables ---------------------------------------
Int CONST_GuardShipConfrontationSceneDelay = 0 Const
Int CONST_Stage_SY01_AccessGrantedStage = 120 Const
Int CONST_Stage_SY01_EntryStage = 100 Const
Int CONST_Stage_SY01_SecurityAlarmTriggeredStage = 150 Const
Int CONST_Stage_SY02_EntryStage = 200 Const
Int CONST_Stage_SY03_EntryStage = 300 Const
Int CONST_Stage_SY03_HuanBetrayedStage = 320 Const
Int CONST_Stage_Space_NonquestGuardsHostile = 50 Const
Int CONST_Stage_Space_PostquestSetupStage = 1000 Const
Int CONST_Stage_Space_QuestEscapeStartedStage = 460 Const
Int CONST_Stage_Space_QuestSetupStage = 99 Const
Float CONST_UpdateSY01StateTimerDelay = 0.5 Const
Int CONST_UpdateSY01StateTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard SY01State

;-- Properties --------------------------------------
Group AutofillProperties
  LocationAlias Property Alias_LC043SY01Location Auto Const mandatory
  LocationAlias Property Alias_LC043SY02Location Auto Const mandatory
  LocationAlias Property Alias_LC043SY03Location Auto Const mandatory
  Location Property LC043SYLocation Auto Const mandatory
  Location Property LC043SYSpaceCellLocation Auto Const mandatory
  Location Property LC043SY01Location Auto Const mandatory
  Location Property LC043SY02Location Auto Const mandatory
  Location Property LC043SY03Location Auto Const mandatory
  Location Property SLuytensStar_PLuytensRock_Orbit Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Prequest_All Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Quest_All Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Postquest_All Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Guards Auto Const mandatory
  ReferenceAlias Property SY_Ships_GuardLeader Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  RefCollectionAlias Property SY01_ActorsAll Auto Const mandatory
  RefCollectionAlias Property SY02_ActorsAll Auto Const mandatory
  RefCollectionAlias Property SY03_ActorsAll Auto Const mandatory
  Faction Property LC043SY01Faction Auto Const mandatory
  Faction Property LC043SY02Faction Auto Const mandatory
  Faction Property LC043SY03Faction Auto Const mandatory
  RefCollectionAlias Property SY01_CargoBayLoungeGuards Auto Const mandatory
  RefCollectionAlias Property SY01_CargoBayTrespassTriggers Auto Const mandatory
  ReferenceAlias Property SY03_AlarmGuardRemovalTrigger Auto Const mandatory
  RefCollectionAlias Property SY03_AlarmGuards Auto Const mandatory
  ActorValue Property Suspicious Auto Const mandatory
  ActorValue Property LC043_GuardConfrontActiveConfrontValue Auto Const mandatory
  Message Property LC043_TrespassMessage Auto Const mandatory
  Scene Property LC043_10_GuardConfront Auto Const mandatory
  wwiseevent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const mandatory
EndGroup

Bool Property playerWasInTrespassTrigger Auto conditional hidden

;-- Functions ---------------------------------------

Function UpdateTrespassTriggerStatus()
  ; Empty function
EndFunction

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerEnter")
  Self.RegisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerLeave")
  Self.RegisterForRemoteEvent(SY03_AlarmGuardRemovalTrigger as ScriptObject, "OnTriggerEnter")
  If PlayerShip.GetRef().GetCurrentLocation() == LC043SYSpaceCellLocation
    Var[] akArgs = new Var[2]
    akArgs[0] = None
    akArgs[1] = LC043SYSpaceCellLocation as Var
    Self.CallFunctionNoWait("HandleLocationChange", akArgs)
  EndIf
EndEvent

Function CleanupPrequestAliases()
  SY_Ships_Prequest_All.RemoveAll()
  LC043SYSpaceCellLocation.Reset()
  SY_Ships_Quest_All.ResetAll()
EndFunction

Function CleanupQuestAliases()
  SY_Ships_Quest_All.RemoveAll()
  Alias_LC043SY01Location.ForceLocationTo(None)
  Alias_LC043SY02Location.ForceLocationTo(None)
  Alias_LC043SY03Location.ForceLocationTo(None)
  Alias_LC043SY01Location.RefillDependentAliases()
  Alias_LC043SY02Location.RefillDependentAliases()
  Alias_LC043SY03Location.RefillDependentAliases()
  LC043SYSpaceCellLocation.Reset()
  SY_Ships_Postquest_All.ResetAll()
EndFunction

Function FillInteriorAliases()
  Alias_LC043SY01Location.ForceLocationTo(LC043SY01Location)
  Alias_LC043SY01Location.RefillDependentAliases()
  Self.SetCollectionCrimeFaction(SY01_ActorsAll, LC043SY01Faction)
  LC043SY01Location.Reset()
  SY01_ActorsAll.ResetAll()
  Alias_LC043SY02Location.ForceLocationTo(LC043SY02Location)
  Alias_LC043SY02Location.RefillDependentAliases()
  Self.SetCollectionCrimeFaction(SY02_ActorsAll, LC043SY02Faction)
  LC043SY02Location.Reset()
  SY02_ActorsAll.ResetAll()
  Alias_LC043SY03Location.ForceLocationTo(LC043SY03Location)
  Alias_LC043SY03Location.RefillDependentAliases()
  Self.SetCollectionCrimeFaction(SY03_ActorsAll, LC043SY03Faction)
  LC043SY03Location.Reset()
  SY03_ActorsAll.ResetAll()
  Self.RegisterForTriggerEvents()
EndFunction

Function SetCollectionCrimeFaction(RefCollectionAlias actorCol, Faction crimeFaction)
  Int I = 0
  Int count = actorCol.GetCount()
  While I < count
    (actorCol.GetAt(I) as Actor).SetCrimeFaction(crimeFaction)
    I += 1
  EndWhile
EndFunction

Function RegisterForTriggerEvents()
  ObjectReference[] trespassTriggerRefs = SY01_CargoBayTrespassTriggers.GetArray()
  Int I = 0
  While I < trespassTriggerRefs.Length
    Self.RegisterForRemoteEvent(trespassTriggerRefs[I] as ScriptObject, "OnTriggerEnter")
    Self.RegisterForRemoteEvent(trespassTriggerRefs[I] as ScriptObject, "OnTriggerLeave")
    I += 1
  EndWhile
  Self.RegisterForRemoteEvent(SY03_AlarmGuardRemovalTrigger.GetRef() as ScriptObject, "OnTriggerEnter")
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  Self.HandleLocationChange(akOldLoc, akNewLoc)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
  Self.HandleLocationChange(akOldLoc, akNewLoc)
EndEvent

Function HandleLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == LC043SYSpaceCellLocation && (!Self.GetStageDone(CONST_Stage_SY03_EntryStage) || Self.GetStageDone(CONST_Stage_Space_PostquestSetupStage))
    Int currentStage = Self.GetStage()
    If !Self.GetStageDone(CONST_Stage_Space_NonquestGuardsHostile) && (currentStage < CONST_Stage_Space_QuestSetupStage || currentStage >= CONST_Stage_Space_PostquestSetupStage)
      Self.SetupGuardConfrontation(True)
    EndIf
  ElseIf akNewLoc == LC043SY01Location && !Self.GetStageDone(CONST_Stage_SY01_SecurityAlarmTriggeredStage)
    Self.SetStage(CONST_Stage_SY01_EntryStage)
  ElseIf akNewLoc == LC043SY02Location && !Self.GetStageDone(CONST_Stage_SY02_EntryStage)
    Self.SetStage(CONST_Stage_SY02_EntryStage)
  ElseIf akNewLoc == LC043SY03Location && !Self.GetStageDone(CONST_Stage_SY03_EntryStage)
    Self.SetStage(CONST_Stage_SY03_EntryStage)
  ElseIf akOldLoc == LC043SYSpaceCellLocation && !akNewLoc.IsChild(LC043SYSpaceCellLocation) && Self.GetStageDone(CONST_Stage_Space_QuestEscapeStartedStage) && !Self.GetStageDone(CONST_Stage_Space_PostquestSetupStage)
    Self.SetStage(CONST_Stage_Space_PostquestSetupStage)
  EndIf
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference source, ObjectReference akActionRef)
  If SY01_CargoBayTrespassTriggers.Find(source) >= 0
    Self.UpdateTrespassTriggerStatus()
  ElseIf source == SY03_AlarmGuardRemovalTrigger.GetRef() && SY03_AlarmGuards.Find(akActionRef) >= 0 && Self.GetStageDone(CONST_Stage_SY03_HuanBetrayedStage)
    akActionRef.DisableNoWait(True)
  EndIf
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference source, ObjectReference akActionRef)
  If SY01_CargoBayTrespassTriggers.Find(source) >= 0
    Self.UpdateTrespassTriggerStatus()
  EndIf
EndEvent

Function SetupGuardConfrontation(Bool shouldStartStandardConfrontationScene)
  SY_Ships_GuardLeader.RefillAlias()
  SY_Ships_Guards.RefillAlias()
  spaceshipreference[] guardShipRefs = SY_Ships_Guards.GetArray() as spaceshipreference[]
  Int I = 0
  While I < guardShipRefs.Length
    guardShipRefs[I].SetValue(LC043_GuardConfrontActiveConfrontValue, 1.0)
    guardShipRefs[I].EvaluatePackage(False)
    I += 1
  EndWhile
  If shouldStartStandardConfrontationScene
    Utility.Wait(CONST_GuardShipConfrontationSceneDelay as Float)
    LC043_10_GuardConfront.Start()
  EndIf
EndFunction

Function TriggerSecurityAlarm(RefCollectionAlias enemyCol, Faction enemyFaction)
  Wwise_Event_OBJ_Alarm_Starstation_Hostile.Play(Game.GetPlayer() as ObjectReference, None, None)
  enemyFaction.SetCrimeGoldViolent(1000)
  Actor[] enemies = enemyCol.GetArray() as Actor[]
  Int I = 0
  While I < enemies.Length
    robotpodscript robotActor = enemies[I] as robotpodscript
    If robotActor != None
      robotActor.WakeRobotFromPod()
    ElseIf enemies[I].IsUnconscious()
      enemies[I].SetUnconscious(False)
    EndIf
    enemies[I].SetValue(Suspicious, 1.0)
    enemies[I].EvaluatePackage(False)
    I += 1
  EndWhile
EndFunction

Function BlockSpaceTravelForEscape(Bool shouldBlock)
  SLuytensStar_PLuytensRock_Orbit.EnableSpaceTravel(Self as Quest, !shouldBlock)
EndFunction

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State Waiting

  Function UpdateTrespassTriggerStatus()
    Self.GotoState("Busy")
    If Self.GetStageDone(CONST_Stage_SY01_AccessGrantedStage) || Self.GetStageDone(CONST_Stage_SY01_SecurityAlarmTriggeredStage)
      Self.UnregisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerEnter")
      Self.UnregisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerLeave")
    Else
      Bool playerIsInTrespassTrigger = False
      Actor player = Game.GetPlayer()
      ObjectReference[] trespassTriggerRefs = SY01_CargoBayTrespassTriggers.GetArray()
      Int I = 0
      While !playerIsInTrespassTrigger && I < trespassTriggerRefs.Length
        playerIsInTrespassTrigger = trespassTriggerRefs[I].IsInTrigger(player as ObjectReference)
        I += 1
      EndWhile
      If playerIsInTrespassTrigger && !playerWasInTrespassTrigger
        LC043_TrespassMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
      playerWasInTrespassTrigger = playerIsInTrespassTrigger
      SY01_CargoBayLoungeGuards.EvaluateAll()
    EndIf
    Self.GotoState("Waiting")
  EndFunction
EndState
