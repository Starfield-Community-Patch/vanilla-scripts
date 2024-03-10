ScriptName LC030_QuestScript Extends Quest
{ Quest script for LC030, The Lock. }

;-- Variables ---------------------------------------
Int CONST_CF03_ExteriorCompletedStage = 41 Const
Int CONST_CF03_StageRequiredForCeilingCollapse = 80 Const
Int CONST_CF03_StageToSetWhenIDCardReaderUsed = 48 Const
Int CONST_CF03_TransferChamberCompletedStage = 70 Const
Int CONST_CollapsingCeilingTimerDelay = 1 Const
Int CONST_CollapsingCeilingTimerID = 2 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_ExteriorMonitorDelgadoNearPlayerDistance = 14 Const
Int CONST_ExteriorMonitorDisableDistance = 30 Const
Int CONST_ExteriorMonitorTimerDelay = 3 Const
Int CONST_ExteriorMonitorTimerID = 1 Const
Int CONST_FissureEnemySafeRange = 4 Const
String CONST_IDCardReaderUsedEventName = "CardSwiped" Const
Int CONST_ShuttleBayMaxZHeight = -20 Const
Int CONST_ShuttleBayMonitorTimerDelay = 2 Const
Int CONST_ShuttleBayMonitorTimerID = 4 Const
Int CONST_StageToSetDuringCeilingCollapse = 250 Const
Int CONST_StageToSetOnCollapsingWallActivated = 269 Const
Int CONST_StageToSetOnLeavingTheLock = 690 Const
Int CONST_StageToSetWhenShuttleBayCleared = 650 Const
Int CONST_TransferChamberMonitorTimerDelay = 3 Const
Int CONST_TransferChamberMonitorTimerID = 3 Const
inputenablelayer LC030InputLayer
Actor[] allAllies
ObjectReference collapsingCeilingActivatorRef
ObjectReference collapsingCeilingTriggerRef
Actor delgadoRef
Actor genericAlly01Ref
Actor genericAlly02Ref
Bool hasCollapsedCeiling
Bool hasCompletedExterior
ObjectReference loosePanelDoorRef
ObjectReference mapMarkerRef
ObjectReference mathisMoveToMarkerRef
Actor mathisRef
Actor playerRef
spaceshipreference playerShipRef
spaceshipreference shuttleBayShuttleRef

;-- Properties --------------------------------------
Group AutofillProperties
  Quest Property CF03 Auto Const mandatory
  bescript Property BE_CF03_Shuttle Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  LocationAlias Property LC030LockLocation Auto Const mandatory
  LocationAlias Property ShuttleBayShuttleLocation Auto Const mandatory
  ReferenceAlias Property Mathis Auto Const mandatory
  ReferenceAlias Property Mathis_CollapsingCeilingMoveToMarker Auto Const mandatory
  ReferenceAlias Property Delgado Auto Const mandatory
  ReferenceAlias Property GenericAlly01 Auto Const mandatory
  ReferenceAlias Property GenericAlly02 Auto Const mandatory
  ReferenceAlias Property MapMarker Auto Const mandatory
  RefCollectionAlias Property ExteriorEnemiesBeyondTheLock Auto Const mandatory
  RefCollectionAlias Property ExteriorEnemiesWithinTheLock Auto Const mandatory
  RefCollectionAlias Property TransferChamberEnemies_All Auto Const mandatory
  RefCollectionAlias Property FissureEnemies_All Auto Const mandatory
  RefCollectionAlias Property BarracksCreatures_All Auto Const mandatory
  RefCollectionAlias Property ShuttleBayEnemies_All Auto Const mandatory
  ReferenceAlias Property TransferChamberFailsafeTrigger Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingTrigger Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingActivator Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingCollisionPrim Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingNavcutPrim Auto Const mandatory
  ReferenceAlias Property LoosePanelDoor Auto Const mandatory
  ReferenceAlias Property ShuttleBayGryllobaQueen Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property ShuttleBayShuttle Auto Const mandatory
  ReferenceAlias Property StationTheKey Auto Const mandatory
  ReferenceAlias Property KeyPlayerDockingPort Auto Const mandatory
  Cell Property LC030Lock01 Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_1 Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_2 Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_1_NotPlayable Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_2_NotPlayable Auto Const mandatory
  Keyword Property LinkAmbushTrigger Auto Const mandatory
  Keyword Property SpaceshipStoredLink Auto Const mandatory
  Location Property SKryx_PSuvorov_Surface Auto Const mandatory
  wwiseevent Property QST_CF03_CeilingCollapse_Collapse Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property Confidence Auto Const mandatory
  ActorValue Property AmbushTriggered Auto Const mandatory
  GlobalVariable Property CF03ExteriorActorsHoldNearPlayerGlobal Auto Const mandatory
  ObjectReference Property CF03DelgadoInsideLockEntranceMarkerRef Auto Const mandatory
  ObjectReference Property CF03MathisInsideLockEntranceMarkerRef Auto Const mandatory
  ObjectReference Property CF03GenericAlly01InsideLockEntranceMarkerRef Auto Const mandatory
  ObjectReference Property CF03GenericAlly02InsideLockEntranceMarkerRef Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SwapOutShuttle()
  ; Empty function
EndFunction

Event OnQuestInit()
  playerRef = Game.GetPlayer()
  mathisRef = Mathis.GetActorRef()
  delgadoRef = Delgado.GetActorRef()
  genericAlly01Ref = GenericAlly01.GetActorRef()
  genericAlly02Ref = GenericAlly02.GetActorRef()
  shuttleBayShuttleRef = ShuttleBayShuttle.GetShipRef()
  allAllies = new Actor[4]
  allAllies[0] = delgadoRef
  allAllies[1] = mathisRef
  allAllies[2] = genericAlly01Ref
  allAllies[3] = genericAlly02Ref
  mathisMoveToMarkerRef = Mathis_CollapsingCeilingMoveToMarker.GetRef()
  mapMarkerRef = MapMarker.GetRef()
  collapsingCeilingTriggerRef = CollapsingCeilingTrigger.GetRef()
  collapsingCeilingActivatorRef = CollapsingCeilingActivator.GetRef()
  loosePanelDoorRef = LoosePanelDoor.GetRef()
  GenericAlly01.TryToReset()
  GenericAlly01.TryToReset()
  ShuttleBayGryllobaQueen.TryToReset()
  ExteriorEnemiesBeyondTheLock.ResetAll()
  ExteriorEnemiesWithinTheLock.ResetAll()
  TransferChamberEnemies_All.ResetAll()
  BarracksCreatures_All.ResetAll()
  ShuttleBayEnemies_All.ResetAll()
  Self.SetIgnoreFriendlyHitsOnAllies(True)
  Self.RegisterForRemoteEvent(genericAlly01Ref as ScriptObject, "OnLoad")
  If genericAlly01Ref.Is3DLoaded()
    Self.RemoveAllyBackpacks()
  EndIf
  Self.RegisterForRemoteEvent(shuttleBayShuttleRef as ScriptObject, "OnLoad")
  Self.RegisterForRemoteEvent(collapsingCeilingTriggerRef as ScriptObject, "OnTriggerEnter")
  Self.RegisterForRemoteEvent(loosePanelDoorRef as ScriptObject, "OnActivate")
  TransferChamberEnemies_All.SetValue(Confidence, CONST_Confidence_Foolhardy as Float)
  BarracksCreatures_All.SetValue(Confidence, CONST_Confidence_Foolhardy as Float)
  ShuttleBayEnemies_All.SetValue(Confidence, CONST_Confidence_Foolhardy as Float)
EndEvent

Event ObjectReference.OnLoad(ObjectReference akSource)
  If akSource == genericAlly01Ref as ObjectReference
    Self.RemoveAllyBackpacks()
  EndIf
  If (akSource == shuttleBayShuttleRef as ObjectReference) && Self.GetStageDone(CONST_StageToSetWhenShuttleBayCleared)
    BE_CF03_Shuttle.SetEnemyShipLandingRampsOpenState(True)
  EndIf
EndEvent

Function RemoveAllyBackpacks()
  Self.UnregisterForRemoteEvent(genericAlly01Ref as ScriptObject, "OnLoad")
  Int I = 0
  While I < allAllies.Length
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_1 as Form, 1, False, None)
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_2 as Form, 1, False, None)
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_1_NotPlayable as Form, 1, False, None)
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_2_NotPlayable as Form, 1, False, None)
    I += 1
  EndWhile
EndFunction

Function StartExteriorMonitor()
  Self.StartTimer(CONST_ExteriorMonitorTimerDelay as Float, CONST_ExteriorMonitorTimerID)
EndFunction

Function MonitorExterior()
  If hasCompletedExterior
    
  ElseIf CF03.GetStage() >= CONST_CF03_ExteriorCompletedStage
    Self.EndExteriorMonitor()
  ElseIf playerRef.GetCurrentLocation() != LC030LockLocation.GetLocation()
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
    CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(0.0)
    If !playerRef.GetCurrentLocation().IsChild(SKryx_PSuvorov_Surface)
      Int I = 0
      While I < allAllies.Length
        allAllies[I].EvaluatePackage(False)
        allAllies[I].MoveToPackageLocation()
        I += 1
      EndWhile
    EndIf
  Else
    Bool actorsHoldingNearDelgado = False
    If playerRef.GetDistance(mapMarkerRef) < delgadoRef.GetDistance(mapMarkerRef)
      CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(1.0)
    Else
      actorsHoldingNearDelgado = True
      CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(0.0)
    EndIf
    If actorsHoldingNearDelgado || (delgadoRef.GetDistance(playerRef as ObjectReference) < CONST_ExteriorMonitorDelgadoNearPlayerDistance as Float)
      Self.MonitorCleanupDistantEnemies(ExteriorEnemiesBeyondTheLock, False)
    EndIf
    Int i = 0
    While i < allAllies.Length
      If allAllies[i].GetValue(Health) < 0.0
        allAllies[i].RestoreValue(Health, Math.Abs(allAllies[i].GetValue(Health) + 10.0))
      EndIf
      i += 1
    EndWhile
    Self.EVPAllies()
    Self.StartTimer(CONST_ExteriorMonitorTimerDelay as Float, CONST_ExteriorMonitorTimerID)
  EndIf
EndFunction

Function MonitorCleanupDistantEnemies(RefCollectionAlias enemyCollection, Bool forceCleanup)
  Actor[] enemies = enemyCollection.GetArray() as Actor[]
  Int I = 0
  While I < enemies.Length
    Actor current = enemies[I]
    If current != None && current.GetValue(AmbushTriggered) > 0.0
      If current.IsDead()
        enemyCollection.RemoveRef(current as ObjectReference)
      ElseIf forceCleanup || (delgadoRef.GetDistance(current as ObjectReference) > CONST_ExteriorMonitorDisableDistance as Float) && (playerRef.GetDistance(current as ObjectReference) > CONST_ExteriorMonitorDisableDistance as Float) && !playerRef.HasDetectionLOS(current as ObjectReference)
        enemyCollection.RemoveRef(current as ObjectReference)
        current.DisableNoWait(False)
        current.Delete()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function EndExteriorMonitorNoWait()
  Self.CallFunctionNoWait("EndExteriorMonitor", None)
EndFunction

Function EndExteriorMonitor()
  hasCompletedExterior = True
  Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
  Self.MonitorCleanupDistantEnemies(ExteriorEnemiesBeyondTheLock, True)
  Self.MonitorCleanupDistantEnemies(ExteriorEnemiesWithinTheLock, True)
EndFunction

Function SetIgnoreFriendlyHitsOnAllies(Bool shouldIgnore)
  Int I = 0
  While I < allAllies.Length
    allAllies[I].IgnoreFriendlyHits(shouldIgnore)
    I += 1
  EndWhile
EndFunction

Function MoveAlliesToPackageLocations()
  Int I = 0
  While I < allAllies.Length
    allAllies[I].EvaluatePackage(False)
    allAllies[I].MoveToPackageLocation()
    I += 1
  EndWhile
EndFunction

Function EVPAllies()
  Int I = 0
  While I < allAllies.Length
    allAllies[I].EvaluatePackage(False)
    I += 1
  EndWhile
EndFunction

Function MoveAlliesIntoLock()
  If delgadoRef.GetParentCell() != LC030Lock01
    delgadoRef.MoveTo(CF03DelgadoInsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
  If mathisRef.GetParentCell() != LC030Lock01
    mathisRef.MoveTo(CF03MathisInsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
  If genericAlly01Ref.GetParentCell() != LC030Lock01
    genericAlly01Ref.MoveTo(CF03GenericAlly01InsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
  If genericAlly02Ref.GetParentCell() != LC030Lock01
    genericAlly02Ref.MoveTo(CF03GenericAlly02InsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
  Self.EVPAllies()
EndFunction

Function RegisterForDelgadoUsingIDCardReader()
  Self.RegisterForAnimationEvent(delgadoRef as ObjectReference, CONST_IDCardReaderUsedEventName)
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If (akSource == delgadoRef as ObjectReference) && asEventName == CONST_IDCardReaderUsedEventName
    Self.UnregisterForAnimationEvent(delgadoRef as ObjectReference, CONST_IDCardReaderUsedEventName)
    CF03.SetStage(CONST_CF03_StageToSetWhenIDCardReaderUsed)
  EndIf
EndEvent

Function StartTransferChamberMonitor()
  Self.StartTimer(CONST_TransferChamberMonitorTimerDelay as Float, CONST_TransferChamberMonitorTimerID)
EndFunction

Function MonitorTransferChamber()
  ObjectReference transferChamberFailsafeTriggerRef = TransferChamberFailsafeTrigger.GetRef()
  Actor[] enemies = TransferChamberEnemies_All.GetArray() as Actor[]
  Int I = 0
  While I < enemies.Length
    Actor current = enemies[I]
    If current != None && !current.IsDead() && transferChamberFailsafeTriggerRef.IsInTrigger(current as ObjectReference)
      current.Kill(None)
    EndIf
    I += 1
  EndWhile
  If !Self.GetStageDone(CONST_CF03_TransferChamberCompletedStage)
    Self.StartTimer(CONST_TransferChamberMonitorTimerDelay as Float, CONST_TransferChamberMonitorTimerID)
  EndIf
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
  If !hasCollapsedCeiling && (akTriggerRef == playerRef as ObjectReference)
    Self.CheckCollapsingCeiling()
  EndIf
EndEvent

Function CheckCollapsingCeiling()
  If collapsingCeilingTriggerRef.IsInTrigger(playerRef as ObjectReference) && CF03.GetStageDone(CONST_CF03_StageRequiredForCeilingCollapse)
    Bool shouldRestartTimer = True
    If collapsingCeilingTriggerRef.IsInTrigger(mathisRef as ObjectReference)
      shouldRestartTimer = !Self.TryToCollapseCeiling()
    ElseIf !playerRef.HasDetectionLOS(mathisMoveToMarkerRef) && !playerRef.HasDetectionLOS(mathisRef as ObjectReference)
      mathisRef.MoveTo(mathisMoveToMarkerRef, 0.0, 0.0, 0.0, True, False)
      shouldRestartTimer = !Self.TryToCollapseCeiling()
    EndIf
    If shouldRestartTimer
      Self.StartTimer(CONST_CollapsingCeilingTimerDelay as Float, CONST_CollapsingCeilingTimerID)
    EndIf
  EndIf
EndFunction

Bool Function TryToCollapseCeiling()
  CollapsingCeilingCollisionPrim.TryToEnable()
  If !collapsingCeilingTriggerRef.IsInTrigger(playerRef as ObjectReference)
    CollapsingCeilingCollisionPrim.TryToDisable()
    Return False
  Else
    Self.CollapseCeiling(False)
    Return True
  EndIf
EndFunction

Function CollapseCeiling(Bool isForcedByQuickstart)
  If !hasCollapsedCeiling
    hasCollapsedCeiling = True
    LC030InputLayer = inputenablelayer.Create()
    LC030InputLayer.EnableFastTravel(False)
    CollapsingCeilingNavcutPrim.TryToEnable()
    ObjectReference collapsingCeilingRef = CollapsingCeilingActivator.GetRef()
    collapsingCeilingRef.PlayAnimation("Play01")
    QST_CF03_CeilingCollapse_Collapse.Play(collapsingCeilingRef, None, None)
    If !isForcedByQuickstart
      Self.SetStage(CONST_StageToSetDuringCeilingCollapse)
      Game.ShakeCamera(collapsingCeilingActivatorRef, 0.5, 2.0)
      Utility.Wait(2.0)
      CollapsingCeilingCollisionPrim.TryToDisable()
    EndIf
    playerShipRef = PlayerShip.GetShipRef()
    Self.RegisterForRemoteEvent(ShuttleBayShuttle.GetShipRef() as ScriptObject, "OnLocationChange")
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
    Int I = 0
    While I < allAllies.Length
      allAllies[I].EquipItem(Spacesuit_CrimsonFleet_Backpack_1_NotPlayable as Form, False, False)
      I += 1
    EndWhile
  EndIf
EndFunction

Function UnblockCollapsingWallActivation()
  loosePanelDoorRef.BlockActivation(True, False)
EndFunction

Function TryToStopCombatInFissure()
  Actor[] fissureEnemyRefs = FissureEnemies_All.GetArray() as Actor[]
  Int I = 0
  While I < fissureEnemyRefs.Length
    Actor current = fissureEnemyRefs[I]
    If current == None || current.IsDead() || !current.IsInCombat()
      
    ElseIf current.HasDetectionLOS(playerRef as ObjectReference) || current.HasDetectionLOS(mathisRef as ObjectReference) || (current.GetDistance(playerRef as ObjectReference) < CONST_FissureEnemySafeRange as Float)
      
    Else
      current.StopCombat()
    EndIf
    I += 1
  EndWhile
EndFunction

Function StartShuttleBayMonitor()
  Self.StartTimer(CONST_ShuttleBayMonitorTimerDelay as Float, CONST_ShuttleBayMonitorTimerID)
EndFunction

Function MonitorShuttleBay()
  Actor[] shuttleBayEnemies = ShuttleBayEnemies_All.GetArray() as Actor[]
  If shuttleBayEnemies != None
    Int I = 0
    While I < shuttleBayEnemies.Length
      Actor current = shuttleBayEnemies[I]
      If current != None
        If !current.IsDead() && (current.GetPositionZ() > CONST_ShuttleBayMaxZHeight as Float)
          current.Kill(None)
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
  If !Self.GetStageDone(650)
    Self.StartTimer(CONST_ShuttleBayMonitorTimerDelay as Float, CONST_ShuttleBayMonitorTimerID)
  EndIf
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_ExteriorMonitorTimerID
    Self.MonitorExterior()
  ElseIf timerID == CONST_TransferChamberMonitorTimerID
    Self.MonitorTransferChamber()
  ElseIf timerID == CONST_CollapsingCeilingTimerID
    Self.CheckCollapsingCeiling()
  ElseIf timerID == CONST_ShuttleBayMonitorTimerID
    Self.MonitorShuttleBay()
  EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  If akSource == loosePanelDoorRef
    Self.SetStage(CONST_StageToSetOnCollapsingWallActivated)
  EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  If !hasCompletedExterior && akNewLoc == LC030LockLocation.GetLocation()
    Self.StartExteriorMonitor()
    Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
  ElseIf hasCollapsedCeiling
    If akNewLoc == ShuttleBayShuttleLocation.GetLocation()
      
    ElseIf akNewLoc != LC030LockLocation.GetLocation()
      Self.ReenableFastTravel()
    EndIf
  EndIf
EndEvent

Event SpaceshipReference.OnLocationChange(spaceshipreference akSource, Location akOldLoc, Location akNewLoc)
  If hasCollapsedCeiling
    If akSource == ShuttleBayShuttle.GetShipRef()
      playerShipRef.InstantUndock()
      playerShipRef.SetLinkedRef(KeyPlayerDockingPort.GetRef(), SpaceshipStoredLink, True)
      playerShipRef.Disable(False)
      playerShipRef.MoveTo(StationTheKey.GetRef(), 0.0, 0.0, 0.0, True, False)
      Self.UnregisterForRemoteEvent(shuttleBayShuttleRef as ScriptObject, "OnLoad")
      Self.ReenableFastTravel()
    Else
      Self.ReenableFastTravel()
    EndIf
    BE_CF03_Shuttle.SetStage(20)
  EndIf
EndEvent

Function ReenableFastTravel()
  If LC030InputLayer != None
    LC030InputLayer.EnableFastTravel(True)
    LC030InputLayer.Delete()
    LC030InputLayer = None
  EndIf
  Self.SetStage(CONST_StageToSetOnLeavingTheLock)
  Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
EndFunction

Function Cleanup()
  playerRef = None
  mathisRef = None
  delgadoRef = None
  genericAlly01Ref = None
  genericAlly02Ref = None
  allAllies = None
  mathisMoveToMarkerRef = None
  mapMarkerRef = None
  collapsingCeilingTriggerRef = None
  collapsingCeilingActivatorRef = None
  playerShipRef = None
  shuttleBayShuttleRef = None
  Self.ReenableFastTravel()
EndFunction
