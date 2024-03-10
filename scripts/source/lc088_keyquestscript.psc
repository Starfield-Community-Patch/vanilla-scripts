ScriptName LC088_KeyQuestScript Extends Quest
{ Quest script for LC088_Key, the Key portion of the Crimson Fleet Final Battle. }

;-- Variables ---------------------------------------
Int CONST_Aggression_Aggressive = 1 Const
Int CONST_Aggression_Unaggressive = 0 Const
Int CONST_CaptainActiveStage_Adler = 16 Const
Int CONST_CaptainActiveStage_Estelle = 18 Const
Int CONST_CaptainActiveStage_Huan = 17 Const
Int CONST_CaptainActiveStage_Mathis = 14 Const
Int CONST_CaptainActiveStage_Naeva = 15 Const
Int CONST_CaptainActiveStage_Rokov = 13 Const
Int CONST_CaptainState_Active = 0 Const
Int CONST_CaptainState_Dead = 2 Const
Int CONST_CaptainState_Freed = 4 Const
Int CONST_CaptainState_Imprisoned = 3 Const
Int CONST_CaptainState_Inactive = 1 Const
Int CONST_CompleteStage = 1100 Const
Int CONST_Confidence_Cowardly = 0 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_DoorToVossOpenedStage = 390 Const
Int CONST_LockLevelTerminalOnly = 253 Const
Int CONST_ReactorBattleStartStage = 700 Const
Int CONST_ReactorOverride01Stage = 790 Const
Int CONST_ReactorOverride02Stage = 890 Const
Int CONST_ReactorOverride03Stage = 990 Const
Int CONST_VossBombArmedStage = 420 Const
Int CONST_VossBombDisarmedStage = 19 Const
Int CONST_VossBombExplodedDelay = 4 Const
Int CONST_VossBombExplodedStage = 480 Const
Int CONST_VossOpensDoorsStage = 490 Const
ObjectReference Reactor01ShutdownControlRef
ObjectReference Reactor02ShutdownControlRef
ObjectReference Reactor03ShutdownControlRef
ObjectReference[] ReactorSoundMarkerRefs
inputenablelayer keyInputLayer
Actor player
Int reactorOverloadID
Bool vossBombExploded
Int vossBombTickNormalID
Int vossBombTickUrgentID
Actor vossRef

;-- Properties --------------------------------------
Group QuestProperties
  ReferenceAlias[] Property OtherKeyActors Auto Const mandatory
  wwiseevent[] Property ReactorSoundEvents Auto Const mandatory
EndGroup

Group AutofillProperties
  Quest Property LC082 Auto Const mandatory
  LocationAlias Property LC088KeyInteriorLocation Auto Const mandatory
  ReferenceAlias Property Rokov Auto Const mandatory
  ReferenceAlias Property Rokov_EnableMarker Auto Const mandatory
  ReferenceAlias Property Rokov_DisableMarker Auto Const mandatory
  ReferenceAlias Property Mathis Auto Const mandatory
  ReferenceAlias Property Mathis_EnableMarker Auto Const mandatory
  ReferenceAlias Property Mathis_DisableMarker Auto Const mandatory
  ReferenceAlias Property Naeva Auto Const mandatory
  ReferenceAlias Property Naeva_EnableMarker Auto Const mandatory
  ReferenceAlias Property Naeva_DisableMarker Auto Const mandatory
  ReferenceAlias Property Adler Auto Const mandatory
  ReferenceAlias Property Adler_EnableMarker Auto Const mandatory
  ReferenceAlias Property Adler_DisableMarker Auto Const mandatory
  ReferenceAlias Property Huan Auto Const mandatory
  ReferenceAlias Property Huan_EnableMarker Auto Const mandatory
  ReferenceAlias Property Huan_DisableMarker Auto Const mandatory
  ReferenceAlias Property Estelle Auto Const mandatory
  ReferenceAlias Property Estelle_EnableMarker Auto Const mandatory
  ReferenceAlias Property Estelle_DisableMarker Auto Const mandatory
  ReferenceAlias Property Delgado Auto Const mandatory
  ReferenceAlias Property Jasmine Auto Const mandatory
  ReferenceAlias Property Voss Auto Const mandatory
  ReferenceAlias Property Reactor01ShutdownControl Auto Const mandatory
  ReferenceAlias Property Reactor02ShutdownControl Auto Const mandatory
  ReferenceAlias Property Reactor03ShutdownControl Auto Const mandatory
  ReferenceAlias Property ReactorSoundMarkerChainHead Auto Const mandatory
  RefCollectionAlias Property Reactor01Activators Auto Const mandatory
  RefCollectionAlias Property Reactor02Activators Auto Const mandatory
  RefCollectionAlias Property Reactor03Activators Auto Const mandatory
  RefCollectionAlias Property GenericEnemiesGroup1 Auto Const mandatory
  RefCollectionAlias Property GenericEnemiesGroup2 Auto Const mandatory
  RefCollectionAlias Property GenericEnemiesGroup3 Auto Const mandatory
  RefCollectionAlias Property LoadElevators Auto Const mandatory
  ReferenceAlias Property Ops_EntryDoor Auto Const mandatory
  Keyword Property LC082_Brig_CurrentPrisonerKeyword Auto Const mandatory
  Keyword Property LC088_Key_LinkStartMarkerKeyword Auto Const mandatory
  Keyword Property LC088_Key_LinkRestraintKeyword Auto Const mandatory
  Keyword Property ActorTypeRobot Auto Const mandatory
  Keyword Property LinkCombatTravel Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
  Keyword Property LocTypeSettlement Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  Cell Property StationTheKeyShipInterior Auto Const mandatory
  Cell Property StationTheKeyInterior Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  ActorValue Property Confidence Auto Const mandatory
  Explosion Property ChestBombExplosion Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_CF08VigilanceAndKey Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_Key Auto Const mandatory
  Location Property TheKeyInteriorLocation Auto Const mandatory
  Faction Property PlayerFaction Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  Faction Property CrimeFactionAdlerKemp Auto Const mandatory
  Message Property LC088_Key_EmergencyShutdownNotRespondingMessage Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_01_Overload Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_01_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_02_Overload Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_02_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_03_Overload Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_03_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_OverloadAlarm Auto Const mandatory
  wwiseevent Property QST_CF08_Voss_Bomb_Tick_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Voss_Bomb_Tick_Urgent Auto Const mandatory
  wwiseevent Property QST_CF08_Voss_Bomb_Detonate Auto Const mandatory
EndGroup

Int Property CONST_ReactorState_Active = 0 Auto Const hidden
Int Property CONST_ReactorState_Inactive = 1 Auto Const hidden
Int Property CONST_ReactorState_Destroyed = 2 Auto Const hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function
EndEvent

Event OnQuestInit()
  player = Game.GetPlayer()
  vossRef = Voss.GetActorRef()
  keyInputLayer = inputenablelayer.Create()
  Reactor01ShutdownControlRef = Reactor01ShutdownControl.GetRef()
  Reactor02ShutdownControlRef = Reactor02ShutdownControl.GetRef()
  Reactor03ShutdownControlRef = Reactor03ShutdownControl.GetRef()
  ObjectReference ReactorSoundMarkerChainHeadRef = ReactorSoundMarkerChainHead.GetRef()
  ReactorSoundMarkerRefs = ReactorSoundMarkerChainHeadRef.GetLinkedRefChain(None, 100)
  ReactorSoundMarkerRefs.insert(ReactorSoundMarkerChainHeadRef, 0)
  StationTheKeyShipInterior.SetFactionOwner(PlayerFaction)
  StationTheKeyInterior.SetFactionOwner(PlayerFaction)
  LC088KeyInteriorLocation.GetLocation().RemoveKeyword(LocTypeSettlement)
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(vossRef as ScriptObject, "OnLoad")
  Self.RegisterForRemoteEvent(vossRef as ScriptObject, "OnDying")
  Self.RegisterForRemoteEvent(Reactor01ShutdownControlRef as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(Reactor02ShutdownControlRef as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(Reactor03ShutdownControlRef as ScriptObject, "OnActivate")
EndEvent

Function SetupAllCaptainEvents()
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, Rokov)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, Mathis)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, Adler)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, Huan)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, Estelle)
  Int adlerState = CrimsonFleetCaptainState_Adler.GetValueInt()
  If adlerState == CONST_CaptainState_Active
    Adler.GetActorRef().RemoveFromFaction(CrimeFactionAdlerKemp)
  EndIf
  Naeva.TryToDisable()
  Self.SetupCaptainEvent(CONST_CaptainState_Inactive, CONST_CaptainActiveStage_Naeva, Naeva)
EndFunction

Function SetupCaptainEvent(Int captainState, Int captainActiveStage, ReferenceAlias captainAlias)
  Actor captainRef = captainAlias.GetActorRef()
  If captainState == CONST_CaptainState_Active
    Self.SetupKeyActor(captainRef)
    Self.SetStage(captainActiveStage)
  Else
    captainAlias.Clear()
    If !captainRef.IsDead()
      captainRef.EvaluatePackage(False)
      captainRef.MoveToPackageLocation()
    EndIf
  EndIf
EndFunction

Function SetupOtherActors()
  Int I = 0
  While I < OtherKeyActors.Length
    Self.SetupKeyActor(OtherKeyActors[I].GetActorRef())
    I += 1
  EndWhile
  Delgado.GetActorRef().AddToFaction(PlayerFriendFaction)
EndFunction

Function SetupAllEnemyGroups()
  Self.SetupEnemyGroup(GenericEnemiesGroup1)
  Self.SetupEnemyGroup(GenericEnemiesGroup2)
  Self.SetupEnemyGroup(GenericEnemiesGroup3)
EndFunction

Function SetupEnemyGroup(RefCollectionAlias enemyGroup)
  Int I = 0
  Int count = enemyGroup.GetCount()
  While I < count
    Self.SetupKeyActor(enemyGroup.GetAt(I) as Actor)
    I += 1
  EndWhile
EndFunction

Function SetupKeyActor(Actor keyActor)
  If keyActor != None
    keyActor.Reset(None)
    keyActor.SetProtected(False)
    keyActor.SetEssential(False)
    keyActor.SetGhost(False)
    keyActor.SetValue(Game.GetInvulnerableAV(), 0.0)
    keyActor.IgnoreFriendlyHits(False)
    keyActor.RemoveFromAllFactions()
    keyActor.AddToFaction(CrimeFactionCrimsonFleet)
    If keyActor.GetValue(Aggression) < CONST_Aggression_Aggressive as Float
      keyActor.SetValue(Aggression, CONST_Aggression_Aggressive as Float)
    EndIf
    keyActor.SetValue(Confidence, CONST_Confidence_Foolhardy as Float)
    ObjectReference startMarker = keyActor.GetLinkedRef(LC088_Key_LinkStartMarkerKeyword)
    If startMarker == None
      keyActor.MoveToMyEditorLocation()
    Else
      keyActor.MoveTo(startMarker, 0.0, 0.0, 0.0, True, False)
    EndIf
    keyActor.DisableNoWait(False)
  EndIf
EndFunction

Function SetupReactors(RefCollectionAlias reactorCollection, Int reactorID)
  lc088_keyreactorscript[] reactors = reactorCollection.GetArray() as lc088_keyreactorscript[]
  Int I = 0
  While I < reactors.Length
    If reactors[I] != None
      reactors[I].RegisterForReactorEvent(reactorID)
    EndIf
    I += 1
  EndWhile
EndFunction

Function EnableEnemyGroup(Int enemyGroup)
  If enemyGroup == 1
    GenericEnemiesGroup1.EnableAll(False)
    Self.TryToEnableCaptain(Mathis, Mathis_EnableMarker, Mathis_DisableMarker)
    Jasmine.TryToEnableNoWait()
    If !vossBombExploded
      Voss.TryToEnableNoWait()
    EndIf
  ElseIf enemyGroup == 2
    GenericEnemiesGroup2.EnableAll(False)
    Self.TryToEnableCaptain(Rokov, Rokov_EnableMarker, Rokov_DisableMarker)
    Self.TryToEnableCaptain(Adler, Adler_EnableMarker, Adler_DisableMarker)
  ElseIf enemyGroup == 3
    GenericEnemiesGroup3.EnableAll(False)
    Self.TryToEnableCaptain(Huan, Huan_EnableMarker, Huan_DisableMarker)
    Self.TryToEnableCaptain(Estelle, Estelle_EnableMarker, Estelle_DisableMarker)
  EndIf
EndFunction

Function DisableEnemyGroup(Int enemyGroup)
  If enemyGroup == 1
    GenericEnemiesGroup1.DisableAll(False)
    Self.TryToDisableCaptain(Mathis, Mathis_EnableMarker, Mathis_DisableMarker)
    Jasmine.TryToDisableNoWait()
    Voss.TryToDisableNoWait()
  ElseIf enemyGroup == 2
    GenericEnemiesGroup2.DisableAll(False)
    Self.TryToDisableCaptain(Rokov, Rokov_EnableMarker, Rokov_DisableMarker)
    Self.TryToDisableCaptain(Adler, Adler_EnableMarker, Adler_DisableMarker)
  ElseIf enemyGroup == 3
    GenericEnemiesGroup3.DisableAll(False)
    Self.TryToDisableCaptain(Huan, Huan_EnableMarker, Huan_DisableMarker)
    Self.TryToDisableCaptain(Estelle, Estelle_EnableMarker, Estelle_DisableMarker)
  EndIf
EndFunction

Function TryToEnableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainEnableMarkerAlias, ReferenceAlias captainDisableMarkerAlias)
  Actor captainRef = captainAlias.GetActorRef()
  If captainRef != None
    captainRef.EnableNoWait(False)
    captainEnableMarkerAlias.TryToEnableNoWait()
    captainDisableMarkerAlias.TryToDisableNoWait()
  Else
    captainEnableMarkerAlias.TryToDisableNoWait()
    captainDisableMarkerAlias.TryToEnableNoWait()
  EndIf
EndFunction

Function TryToDisableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainEnableMarkerAlias, ReferenceAlias captainDisableMarkerAlias)
  captainAlias.TryToDisableNoWait()
  captainEnableMarkerAlias.TryToDisableNoWait()
  captainDisableMarkerAlias.TryToDisableNoWait()
EndFunction

Function SetElevatorsLockedDown(Bool shouldBeLockedDown)
  Int I = 0
  Int count = LoadElevators.GetCount()
  While I < count
    (LoadElevators.GetAt(I) as loadelevatorfloorscript).SetAccessible(!shouldBeLockedDown)
    I += 1
  EndWhile
EndFunction

Function OpenDoorCollection(RefCollectionAlias doorCollection)
  Int I = 0
  Int count = doorCollection.GetCount()
  While I < count
    doorCollection.GetAt(I).SetOpen(True)
    I += 1
  EndWhile
EndFunction

Function SetupOpsEntryDoor()
  ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef()
  opsEntryDoorRef.BlockActivation(True, False)
EndFunction

Function SealOpsEntryDoor()
  ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef()
  opsEntryDoorRef.BlockActivation(False, False)
  opsEntryDoorRef.Lock(True, False, True)
  opsEntryDoorRef.SetLockLevel(CONST_LockLevelTerminalOnly)
EndFunction

Function OpenOpsEntryDoor()
  ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef()
  opsEntryDoorRef.BlockActivation(False, False)
  opsEntryDoorRef.Unlock(False)
  opsEntryDoorRef.SetOpen(True)
EndFunction

Function LockPlayerControls(Bool shouldLock)
  If shouldLock
    keyInputLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
  Else
    keyInputLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  EndIf
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSource)
  If (akSource == vossRef as ObjectReference) && vossBombTickNormalID == 0 && Self.GetStageDone(CONST_DoorToVossOpenedStage) && !Self.GetStageDone(CONST_VossBombExplodedStage) && !Self.GetStageDone(CONST_VossBombDisarmedStage)
    vossBombTickNormalID = QST_CF08_Voss_Bomb_Tick_Normal.Play(vossRef as ObjectReference, None, None)
  EndIf
EndEvent

Event Actor.OnDying(Actor akSource, ObjectReference akKiller)
  If akSource == vossRef && !Self.GetStageDone(CONST_VossBombDisarmedStage)
    Self.VossBombDetonate()
  EndIf
EndEvent

Function VossBombDetonate()
  vossBombExploded = True
  QST_CF08_Voss_Bomb_Detonate.Play(vossRef as ObjectReference, None, None)
  vossRef.PlaceAtMe(ChestBombExplosion as Form, 1, False, False, True, None, None, True)
  Utility.Wait(0.25)
  vossRef.DisableNoWait(False)
  Utility.Wait(CONST_VossBombExplodedDelay as Float)
  Self.SetStage(CONST_VossBombExplodedStage)
EndFunction

Function VossBombArmed()
  If !vossBombExploded
    vossBombTickUrgentID = QST_CF08_Voss_Bomb_Tick_Urgent.Play(vossRef as ObjectReference, None, None)
  EndIf
EndFunction

Function VossBombTickStop()
  wwiseevent.StopInstance(vossBombTickNormalID)
  wwiseevent.StopInstance(vossBombTickUrgentID)
EndFunction

Function VossWaitForSit()
  Self.RegisterForRemoteEvent(vossRef as ScriptObject, "OnSit")
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  Self.SetStage(CONST_VossOpensDoorsStage)
EndEvent

Function SetupReactorBattleNoWait()
  Var[] akArgs = new Var[1]
  akArgs[0] = 1 as Var
  Self.CallFunctionNoWait("DisableEnemyGroup", akArgs)
  akArgs[0] = 2 as Var
  Self.CallFunctionNoWait("DisableEnemyGroup", akArgs)
  akArgs[0] = 3 as Var
  Self.CallFunctionNoWait("EnableEnemyGroup", akArgs)
  Self.SetupReactors(Reactor01Activators, 1)
  Self.SetupReactors(Reactor02Activators, 2)
  Self.SetupReactors(Reactor03Activators, 3)
EndFunction

Function AbortReactorBattleNoWait()
  Var[] akArgs = new Var[1]
  akArgs[0] = 3 as Var
  Self.CallFunctionNoWait("DisableEnemyGroup", akArgs)
EndFunction

Function StartReactorBattle()
  StationTheKeyInterior.EnableFastTravel(False)
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
  MUSGenesisCombatBoss_Key.Add()
  reactorOverloadID = QST_CF08_Reactor_OverloadAlarm.Play(ReactorSoundMarkerRefs[2], None, None)
  Self.SetReactorState(1, CONST_ReactorState_Inactive)
  Self.SetReactorState(2, CONST_ReactorState_Inactive)
  Self.SetReactorState(3, CONST_ReactorState_Inactive)
  Actor delgadoRef = Delgado.GetActorRef()
  delgadoRef.RemoveFromFaction(PlayerFriendFaction)
  delgadoRef.BlockActivation(True, True)
EndFunction

Function EndReactorBattleNoWait()
  StationTheKeyInterior.EnableFastTravel(True)
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
  MUSGenesisCombatBoss_Key.Remove()
  wwiseevent.StopInstance(reactorOverloadID)
  Var[] akArgs = new Var[1]
  akArgs[0] = 1 as Var
  Self.CallFunctionNoWait("EnableEnemyGroup", akArgs)
  akArgs[0] = 2 as Var
  Self.CallFunctionNoWait("EnableEnemyGroup", akArgs)
EndFunction

Function EndReactorBattleAndWait()
  StationTheKeyInterior.EnableFastTravel(True)
  MUSGenesisCombatBoss_Key.Remove()
  wwiseevent.StopInstance(reactorOverloadID)
  Var[] akArgs = new Var[1]
  akArgs[0] = 1 as Var
  Self.CallFunction("EnableEnemyGroup", akArgs)
  akArgs[0] = 2 as Var
  Self.CallFunction("EnableEnemyGroup", akArgs)
EndFunction

Function SetReactorState(Int reactorID, Int reactorState)
  Var[] akArgs = new Var[2]
  akArgs[0] = reactorID as Var
  akArgs[1] = reactorState as Var
  Self.SendCustomEvent("lc088_keyquestscript_LC088ReactorStateChangeEvent", akArgs)
  ObjectReference reactorSoundMarker = ReactorSoundMarkerRefs[reactorID]
  Int reactorSoundIndex = (reactorID - 1) * 3 + reactorState
  wwiseevent reactorSound = ReactorSoundEvents[reactorSoundIndex]
  reactorSound.Play(reactorSoundMarker, None, None)
  If reactorID == 3 && reactorState == CONST_ReactorState_Active
    wwiseevent.StopInstance(reactorOverloadID)
  EndIf
EndFunction

Event Actor.OnLocationChange(Actor source, Location akOldLoc, Location akNewLoc)
  If akNewLoc == TheKeyInteriorLocation && !Self.GetStageDone(CONST_CompleteStage)
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Add()
  ElseIf akOldLoc == TheKeyInteriorLocation
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
    MUSGenesisCombatBoss_Key.Remove()
  EndIf
EndEvent

Event OnQuestShutdown()
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
  MUSGenesisCombatBoss_Key.Remove()
EndEvent

Function Cleanup()
  player = None
  vossRef = None
  Reactor01ShutdownControlRef = None
  Reactor02ShutdownControlRef = None
  Reactor03ShutdownControlRef = None
  ReactorSoundMarkerRefs = None
  If keyInputLayer != None
    keyInputLayer.Delete()
  EndIf
  Self.CleanupCaptain(CrimsonFleetCaptainState_Rokov, Rokov)
  Self.CleanupCaptain(CrimsonFleetCaptainState_Mathis, Mathis)
  Self.CleanupCaptain(CrimsonFleetCaptainState_Adler, Adler)
  Self.CleanupCaptain(CrimsonFleetCaptainState_Huan, Huan)
  Self.CleanupCaptain(CrimsonFleetCaptainState_Estelle, Estelle)
  Rokov_EnableMarker.TryToDisableNoWait()
  Rokov_DisableMarker.TryToDisableNoWait()
  Mathis_EnableMarker.TryToDisableNoWait()
  Mathis_DisableMarker.TryToDisableNoWait()
  Naeva_EnableMarker.TryToDisableNoWait()
  Naeva_DisableMarker.TryToDisableNoWait()
  Adler_EnableMarker.TryToDisableNoWait()
  Adler_DisableMarker.TryToDisableNoWait()
  Huan_EnableMarker.TryToDisableNoWait()
  Huan_DisableMarker.TryToDisableNoWait()
  Estelle_EnableMarker.TryToDisableNoWait()
  Estelle_DisableMarker.TryToDisableNoWait()
  Actor delgadoRef = Delgado.GetActorRef()
  If !delgadoRef.IsDead()
    (LC082 as lc082_brigquestscript).AddPrisoner(delgadoRef, -1)
  EndIf
  Voss.TryToDisableNoWait()
  Jasmine.TryToDisableNoWait()
  GenericEnemiesGroup1.DisableAll(False)
  GenericEnemiesGroup2.DisableAll(False)
  GenericEnemiesGroup3.DisableAll(False)
EndFunction

Function CleanupCaptain(GlobalVariable captainStateGlobal, ReferenceAlias captainAlias)
  Actor captainRef = captainAlias.GetActorRef()
  Int captainState = captainStateGlobal.GetValueInt()
  If captainState == CONST_CaptainState_Active
    captainStateGlobal.SetValue(CONST_CaptainState_Dead as Float)
    captainRef.DisableNoWait(False)
  EndIf
EndFunction

;-- State -------------------------------------------
State Busy

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GotoState("Busy")
    Int currentStage = Self.GetStage()
    If akSource == Reactor01ShutdownControlRef
      If currentStage >= CONST_ReactorBattleStartStage && currentStage < CONST_ReactorOverride01Stage
        Reactor01ShutdownControlRef.BlockActivation(True, False)
        (Reactor01ShutdownControlRef as genericswitchscript).SetColor("Blue")
        Self.SetStage(CONST_ReactorOverride01Stage)
      Else
        LC088_Key_EmergencyShutdownNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    ElseIf akSource == Reactor02ShutdownControlRef
      If currentStage >= CONST_ReactorBattleStartStage && currentStage < CONST_ReactorOverride02Stage
        Reactor02ShutdownControlRef.BlockActivation(True, False)
        (Reactor02ShutdownControlRef as genericswitchscript).SetColor("Blue")
        Self.SetStage(CONST_ReactorOverride02Stage)
      Else
        LC088_Key_EmergencyShutdownNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    ElseIf akSource == Reactor03ShutdownControlRef
      If currentStage >= CONST_ReactorBattleStartStage && currentStage < CONST_ReactorOverride03Stage
        Reactor03ShutdownControlRef.BlockActivation(True, False)
        (Reactor03ShutdownControlRef as genericswitchscript).SetColor("Blue")
        Self.SetStage(CONST_ReactorOverride03Stage)
        Delgado.GetActorRef().BlockActivation(False, False)
      Else
        LC088_Key_EmergencyShutdownNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    EndIf
    Self.GotoState("Waiting")
  EndEvent
EndState
