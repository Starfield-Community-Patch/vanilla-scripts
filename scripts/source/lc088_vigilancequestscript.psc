ScriptName LC088_VigilanceQuestScript Extends Quest
{ Quest script for LC088_Vigilance, the Vigilance portion of the Crimson Fleet Final Battle. }

;-- Structs -----------------------------------------
Struct PrisonerOutfitDatum
  ActorBase PrisonerActorBase
  Outfit PrisonerPostReleaseOutfit
EndStruct


;-- Variables ---------------------------------------
Int CONST_Aggression_Aggressive = 1 Const
Int CONST_Brig_GenericPrisonersToSpawn = 2 Const
Int CONST_Brig_ReleasedPrisonerStageToSet = 210 Const
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
Int CONST_Complete_Postquest_StartPostquest_Stage = 100 Const
Int CONST_Complete_Space_VigilanceCompleted_Stage = 193 Const
Int CONST_Complete_Stage = 1100 Const
Int CONST_Complete_StartNaevaScene_Stage = 1094 Const
Int CONST_DoorState_ActivationBlocked = 2 Const
Int CONST_DoorState_Open = 0 Const
Int CONST_DoorState_Sealed = 1 Const
Int CONST_Estelle_StartStage = 810 Const
Float CONST_FleeTimerDelay = 0.25 Const
Int CONST_FleeTimerID = 2 Const
Int CONST_Flee_DockingPortRemovalRadiusDistance = 4 Const
Int CONST_Flee_FleeRemovalDistance = 20 Const
Int CONST_LockLevel_RequiresTerminal = 253 Const
Int CONST_Ops_BattleMonitorTimerDelay = 1 Const
Int CONST_Ops_BattleMonitorTimerID = 5 Const
Float CONST_Ops_MovementUpdateHealthLossPercent = 0.300000012 Const
Int CONST_Ops_MovementUpdateTime = 15 Const
Int CONST_Ops_RobotActivationDelay = 7 Const
Int CONST_Ops_RobotActivationTimerDelay = 9 Const
Int CONST_Ops_RobotActivationTimerID = 4 Const
Int CONST_Ops_TurretActivationDelay = 5 Const
Int CONST_Ops_TurretActivationTimerDelay = 5 Const
Int CONST_Ops_TurretActivationTimerID = 3 Const
Int CONST_Quarters_ClearedStage = 880 Const
Int CONST_Robotics_MaxSimultaneousActiveRobots = 3 Const
Int CONST_Robotics_RoboticsBattleCompletedStage = 480 Const
Int CONST_Robotics_RoboticsBattleDeactivatedStage = 470 Const
Int CONST_Surrender_Stage = 1019 Const
Int CONST_UpdateRoboticsBattleTimerDelay = 2 Const
Int CONST_UpdateRoboticsBattleTimerID = 1 Const
Int CONST_WeaponsBattleCompletedStage = 680 Const
Bool Flee_HasFinishedFirstFleeTimer
Bool Flee_HasFinishedFleeEventSetup
robotpodscript[] Robotics_RoboticsEnemies
Bool Weapons_WeaponsAndTurretsLockedDown
ObjectReference[] brigFindWeaponsTriggers
ObjectReference brigTerminal
ObjectReference cargoBayTerminal
ObjectReference dockingPort05Ref
Bool enabledEstelle
ObjectReference engineRoomTerminal
Int estelleLevel
ObjectReference holdingCellMarkerRef
Actor kibweRef
Actor player
Actor toftRef
Bool updatingTerminal
inputenablelayer vigilanceInputLayer
ObjectReference weaponsTerminal

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard BrigPrisonerFindWeaponGuard
Guard OpsActorCollectionsGuard
Guard RoboticsEnemiesGuard

;-- Properties --------------------------------------
Group QuestProperties
  lc088_vigilancequestscript:prisoneroutfitdatum[] Property PrisonerOutfitData Auto Const mandatory
EndGroup

Group AutofillProperties
  lc082_brigquestscript Property LC082 Auto Const mandatory
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Quest Property LC088_Space Auto Const mandatory
  Quest Property CF_Post Auto Const mandatory
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
  ReferenceAlias Property Kibwe Auto Const mandatory
  ReferenceAlias Property Ops_KibweStartMarker Auto Const mandatory
  ReferenceAlias Property Toft Auto Const mandatory
  ReferenceAlias Property Ops_ToftStartMarker Auto Const mandatory
  ReferenceAlias Property Brig_Terminal Auto Const mandatory
  RefCollectionAlias Property Brig_GenericPrisoners Auto Const mandatory
  RefCollectionAlias Property Brig_ReleasedPrisoners Auto Const mandatory
  RefCollectionAlias Property Brig_Enemies Auto Const mandatory
  RefCollectionAlias Property Brig_PrisonerFindWeaponTriggers Auto Const mandatory
  ReferenceAlias Property Brig_LarryDumbrosky Auto Const mandatory
  ReferenceAlias Property Brig_AyumiKomiko Auto Const mandatory
  ReferenceAlias Property Brig_AustinRake Auto Const mandatory
  ReferenceAlias Property Cargo_Terminal Auto Const mandatory
  RefCollectionAlias Property Rokov_RoomEnemies Auto Const mandatory
  ReferenceAlias Property Robotics_EventManager Auto Const mandatory
  RefCollectionAlias Property Robotics_RoboticsRoomDoors Auto Const mandatory
  ReferenceAlias Property Naeva_EngineRoom3Terminal Auto Const mandatory
  RefCollectionAlias Property Naeva_EngineRoom3Enemies Auto Const mandatory
  RefCollectionAlias Property Naeva_Allies Auto Const mandatory
  ReferenceAlias Property Weapons_Terminal Auto Const mandatory
  ReferenceAlias Property Weapons_WeaponsBayDoor Auto Const mandatory
  RefCollectionAlias Property Weapons_AmbushDoors Auto Const mandatory
  RefCollectionAlias Property Weapons_EnemiesAll Auto Const mandatory
  RefCollectionAlias Property Weapons_EnemiesInWeaponBays Auto Const mandatory
  RefCollectionAlias Property Weapons_EnemiesRobotsAndTurrets Auto Const mandatory
  RefCollectionAlias Property Mess_AmbushDoors Auto Const mandatory
  RefCollectionAlias Property Mess_AmbushEnemies Auto Const mandatory
  ReferenceAlias Property Estelle_EndMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level1_StartMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level2_StartMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level1_EnableMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level2_EnableMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level3_EnableMarker Auto Const mandatory
  RefCollectionAlias Property Estelle_Level1_QuartersEnemies Auto Const mandatory
  RefCollectionAlias Property Estelle_Level2_QuartersEnemies Auto Const mandatory
  RefCollectionAlias Property Estelle_Level2_QuartersAllies Auto Const mandatory
  RefCollectionAlias Property Estelle_Level3_QuartersAllies Auto Const mandatory
  ReferenceAlias Property Flee_DockingPort05 Auto Const mandatory
  ReferenceAlias Property Flee_HoldingCellMarker Auto Const mandatory
  RefCollectionAlias Property Flee_EnemiesFleeing Auto Const mandatory
  RefCollectionAlias Property Flee_EnemiesFleeingToGenericDockingPort Auto Const mandatory
  RefCollectionAlias Property Flee_NonBossBattleEnemies Auto Const mandatory
  RefCollectionAlias Property Flee_FleeAreaDoors Auto Const mandatory
  RefCollectionAlias Property Ops_RobotsAndTurrets Auto Const mandatory
  RefCollectionAlias Property Ops_Robots Auto Const mandatory
  RefCollectionAlias Property Ops_Robots_Initial Auto Const mandatory
  RefCollectionAlias Property Ops_Turrets Auto Const mandatory
  RefCollectionAlias Property Ops_BossHoldPositionTargets Auto Const mandatory
  RefCollectionAlias Property Ops_Elevators_FloorMarkers Auto Const mandatory
  RefCollectionAlias Property Ops_Doors_ElevatorAccessDoors Auto Const mandatory
  RefCollectionAlias Property Ops_Doors_OperationsCenterDoors Auto Const mandatory
  ReferenceAlias Property CF08BattleAlarm Auto Const mandatory
  Scene Property LC088_810_Estelle_Start Auto Const mandatory
  Scene Property LC088_810_Estelle_Start_2 Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const mandatory
  Cell Property LC082Vigilance01 Auto Const mandatory
  Cell Property ssLC082Vigilance02 Auto Const mandatory
  Location Property LC082VigilanceLocation Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_CF08VigilanceAndKey Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_Vigilance Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  Faction Property CrimeFactionAdlerKemp Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
  Keyword Property ActorTypeRobot Auto Const mandatory
  Keyword Property DMP_LinkRobotPod Auto Const mandatory
  Keyword Property LC088_LinkCaptainStartMarker Auto Const mandatory
  Keyword Property LC088_LinkRoboticsRobot Auto Const mandatory
  Keyword Property LC088_Ops_BossHoldPositionLink Auto Const mandatory
  Keyword Property LC088_Ops_BossHoldPositionInitialMarkerKeyword Auto Const mandatory
  Keyword Property LC088_Vigilance_Brig_CurrentPrisonerKeyword Auto Const mandatory
  ActorValue Property LC088_Vigilance_Brig_PrisonerFoundWeaponValue Auto Const mandatory
  ActorValue Property LC088_Vigilance_CaptainEventCompletedValue Auto Const mandatory
  ActorValue Property LC088_Ops_BossHoldPositionValue Auto Const mandatory
  ActorValue Property LC088_Ops_MovementUpdateHealthPercentStampValue Auto Const mandatory
  ActorValue Property LC088_Ops_MovementUpdateTimestampValue Auto Const mandatory
  Armor Property Clothes_UC_Prisoner Auto Const mandatory
  LeveledItem Property LLI_Role_UC Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  player = Game.GetPlayer()
  kibweRef = Kibwe.GetActorRef()
  toftRef = Toft.GetActorRef()
  brigTerminal = Brig_Terminal.GetRef()
  brigFindWeaponsTriggers = Brig_PrisonerFindWeaponTriggers.GetArray()
  cargoBayTerminal = Cargo_Terminal.GetRef()
  engineRoomTerminal = Naeva_EngineRoom3Terminal.GetRef()
  weaponsTerminal = Weapons_Terminal.GetRef()
  dockingPort05Ref = Flee_DockingPort05.GetRef()
  holdingCellMarkerRef = Flee_HoldingCellMarker.GetRef()
  vigilanceInputLayer = inputenablelayer.Create()
  kibweRef.Reset(None)
  toftRef.Reset(None)
  Flee_NonBossBattleEnemies.ResetAll()
  Ops_RobotsAndTurrets.ResetAll()
  LC082.ResetAllPrisoners()
  LC082Vigilance01.SetFactionOwner(None)
  ssLC082Vigilance02.SetFactionOwner(None)
  Int I = 0
  While I < brigFindWeaponsTriggers.Length
    Self.RegisterForRemoteEvent(brigFindWeaponsTriggers[I] as ScriptObject, "OnTriggerEnter")
    I += 1
  EndWhile
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnLocationChange")
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Unconscious")
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Ally")
EndEvent

Function SetupAllCaptainEvents()
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Rokov, CONST_CaptainActiveStage_Rokov, Rokov.GetActorRef(), Rokov_EnableMarker.GetRef(), Rokov_DisableMarker.GetRef())
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Mathis, CONST_CaptainActiveStage_Mathis, Mathis.GetActorRef(), Mathis_EnableMarker.GetRef(), Mathis_DisableMarker.GetRef())
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Naeva, CONST_CaptainActiveStage_Naeva, Naeva.GetActorRef(), Naeva_EnableMarker.GetRef(), Naeva_DisableMarker.GetRef())
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Adler, CONST_CaptainActiveStage_Adler, Adler.GetActorRef(), Adler_EnableMarker.GetRef(), Adler_DisableMarker.GetRef())
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Huan, CONST_CaptainActiveStage_Huan, Huan.GetActorRef(), Huan_EnableMarker.GetRef(), Huan_DisableMarker.GetRef())
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Estelle, CONST_CaptainActiveStage_Estelle, Estelle.GetActorRef(), Estelle_EnableMarker.GetRef(), Estelle_DisableMarker.GetRef())
  If CrimsonFleetCaptainState_Estelle.GetValue() == CONST_CaptainState_Active as Float
    estelleLevel = CrimsonFleetCaptainStateDifficulty_Estelle.GetValueInt()
  EndIf
  Int adlerState = CrimsonFleetCaptainState_Adler.GetValueInt()
  If adlerState == CONST_CaptainState_Active || adlerState == CONST_CaptainState_Imprisoned
    Adler.GetActorRef().RemoveFromFaction(CrimeFactionAdlerKemp)
  EndIf
EndFunction

Function SetupCaptainEvent(GlobalVariable captainStateGlobal, Int captainActiveStage, Actor captain, ObjectReference enableMarker, ObjectReference disableMarker)
  Int captainState = captainStateGlobal.GetValueInt()
  If captainState == CONST_CaptainState_Active
    captain.Disable(False)
    captain.Reset(None)
    captain.IgnoreFriendlyHits(True)
    captain.AddToFaction(CrimeFactionCrimsonFleet)
    enableMarker.Enable(False)
    disableMarker.Disable(False)
    Self.SetStage(captainActiveStage)
  Else
    enableMarker.Disable(False)
    disableMarker.Enable(False)
    If captainState == CONST_CaptainState_Imprisoned
      captain.IgnoreFriendlyHits(True)
      captain.AddToFaction(CrimeFactionCrimsonFleet)
      If !captain.HasKeyword(LC088_Vigilance_Brig_CurrentPrisonerKeyword)
        LC082.AddPrisoner(captain, -1)
      EndIf
    EndIf
  EndIf
EndFunction

Function SetCaptainComplete(Actor captainActor)
  If captainActor.IsEnabled()
    captainActor.SetValue(LC088_Vigilance_CaptainEventCompletedValue, 1.0)
    captainActor.EvaluatePackage(False)
    captainActor.StopCombat()
  EndIf
EndFunction

Function SetCaptainAlliesComplete(RefCollectionAlias captainAllyCollection)
  Int I = 0
  Actor[] captainAllies = captainAllyCollection.GetArray() as Actor[]
  While I < captainAllies.Length
    Self.SetCaptainComplete(captainAllies[I])
    I += 1
  EndWhile
EndFunction

Function ShutdownAllCaptainEvents(Bool excludeNaevaIfSurrenderActive)
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Rokov, Rokov, False)
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Mathis, Mathis, False)
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Naeva, Naeva, True)
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Adler, Adler, False)
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Huan, Huan, False)
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Estelle, Estelle, False)
EndFunction

Function ShutdownCaptainEvent(GlobalVariable captainStateGlobal, ReferenceAlias captainAlias, Bool shouldSkipClearingAlias)
  Int captainState = captainStateGlobal.GetValueInt()
  If captainState != CONST_CaptainState_Dead
    If captainState == CONST_CaptainState_Imprisoned
      captainStateGlobal.SetValue(CONST_CaptainState_Freed as Float)
    Else
      Actor captain = captainAlias.GetActorRef()
      captain.IgnoreFriendlyHits(False)
      captain.EvaluatePackage(False)
      captain.MoveToPackageLocation()
      captain.EnableNoWait(False)
    EndIf
    If !shouldSkipClearingAlias
      captainAlias.Clear()
    EndIf
  EndIf
EndFunction

Function EnableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainStartMarker)
  Actor captainRef = captainAlias.GetActorRef()
  ObjectReference captainStartMarkerRef = captainStartMarker.GetRef()
  If captainRef != None
    captainRef.Enable(False)
    captainRef.MoveTo(captainStartMarkerRef, 0.0, 0.0, 0.0, True, False)
    captainRef.EvaluatePackage(False)
  EndIf
EndFunction

Function EnableCaptainAlly(ReferenceAlias allyAlias)
  Self.EnableCaptainAllyRef(allyAlias.GetActorRef())
EndFunction

Function EnableCaptainAllyRef(Actor allyRef)
  If allyRef != None
    allyRef.Reset(None)
    allyRef.IgnoreFriendlyHits(True)
    allyRef.Enable(False)
    allyRef.MoveToMyEditorLocation()
    allyRef.EvaluatePackage(False)
  EndIf
EndFunction

Event SQ_ParentScript.SQ_NativeTerminalActor_Unconscious(sq_parentscript akSource, Var[] akArgs)
  ObjectReference nativeTerminal = akArgs[0] as ObjectReference
  Actor nativeTerminalActor = akArgs[1] as Actor
  Bool isUnconscuous = akArgs[2] as Bool
  If nativeTerminal != None && nativeTerminalActor != None && isUnconscuous && nativeTerminal.GetParentCell() == LC082Vigilance01
    Self.RemoveNativeTerminalEnemy(nativeTerminalActor)
  EndIf
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Ally(sq_parentscript akSource, Var[] akArgs)
  ObjectReference nativeTerminal = akArgs[0] as ObjectReference
  Actor nativeTerminalActor = akArgs[1] as Actor
  If nativeTerminal != None && nativeTerminalActor != None && nativeTerminal.GetParentCell() == LC082Vigilance01
    Self.RemoveNativeTerminalEnemy(nativeTerminalActor)
    nativeTerminalActor.RemoveFromFaction(UCSysDefFaction)
    nativeTerminalActor.AddToFaction(CrimeFactionCrimsonFleet)
  EndIf
EndEvent

Function RemoveNativeTerminalEnemy(Actor enemy)
  RefCollectionAlias enemyCol = None
  If Brig_Enemies.Find(enemy as ObjectReference) >= 0
    enemyCol = Brig_Enemies
  ElseIf Rokov_RoomEnemies.Find(enemy as ObjectReference) >= 0
    enemyCol = Rokov_RoomEnemies
  ElseIf Naeva_EngineRoom3Enemies.Find(enemy as ObjectReference) >= 0
    enemyCol = Naeva_EngineRoom3Enemies
  ElseIf Weapons_EnemiesAll.Find(enemy as ObjectReference) >= 0
    enemyCol = Weapons_EnemiesAll
  EndIf
  If enemyCol != None
    (enemyCol as lc088_vigilanceenemyrefcolscript).RemoveEnemyRef(enemy as ObjectReference)
  EndIf
EndFunction

Function SetupBrigPrisoners()
  LC082.DisablePrisoner(Brig_LarryDumbrosky.GetActorRef())
  LC082.DisablePrisoner(Brig_AyumiKomiko.GetActorRef())
  LC082.DisablePrisoner(Brig_AustinRake.GetActorRef())
  Int I = 0
  While I < CONST_Brig_GenericPrisonersToSpawn
    Brig_GenericPrisoners.AddRef(LC082.AddPrisoner(None, -1) as ObjectReference)
    I += 1
  EndWhile
EndFunction

Function ReleaseAllPrisoners()
  Int I = 1
  Int brigDataLength = LC082.GetBrigDataLength()
  While I < brigDataLength
    Self.ReleasePrisoner(I)
    I += 1
  EndWhile
EndFunction

Function ReleaseAllPrisonersAndWait()
  Int I = 1
  Int brigDataLength = LC082.GetBrigDataLength()
  While I < brigDataLength
    Self.ReleasePrisonerAndWait(I)
    I += 1
  EndWhile
EndFunction

Function ReleasePrisoner(Int cellID)
  Var[] akArgs = new Var[1]
  akArgs[0] = cellID as Var
  Self.CallFunctionNoWait("ReleasePrisonerAndWait", akArgs)
EndFunction

Function ReleasePrisonerAndWait(Int cellID)
  Actor releasedPrisoner = LC082.ReleasePrisoner(cellID)
  If releasedPrisoner != None
    Brig_ReleasedPrisoners.AddRef(releasedPrisoner as ObjectReference)
    Self.SetStage(CONST_Brig_ReleasedPrisonerStageToSet)
  EndIf
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  Actor prisoner = akActionRef as Actor
  Guard BrigPrisonerFindWeaponGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If prisoner.GetValue(LC088_Vigilance_Brig_PrisonerFoundWeaponValue) == 0.0
      prisoner.SetValue(LC088_Vigilance_Brig_PrisonerFoundWeaponValue, 1.0)
      prisoner.AddItem(LLI_Role_UC as Form, 1, False)
      prisoner.EvaluatePackage(False)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Function CleanupAllPrisoners()
  Self.CallFunctionNoWait("CleanupAllPrisonersAndWait", None)
EndFunction

Function CleanupAllPrisonersAndWait()
  Self.ReleaseAllPrisonersAndWait()
  Int count = Brig_ReleasedPrisoners.GetCount()
  Int I = 0
  While I < count
    Actor current = Brig_ReleasedPrisoners.GetAt(I) as Actor
    ActorBase currentBase = current.GetLeveledActorBase()
    Int currentOutfitDataIndex = PrisonerOutfitData.findstruct("PrisonerActorBase", currentBase, 0)
    If currentOutfitDataIndex >= 0
      current.Disable(False)
      current.RemoveItem(Clothes_UC_Prisoner as Form, 1, False, None)
      current.SetOutfit(PrisonerOutfitData[currentOutfitDataIndex].PrisonerPostReleaseOutfit, False)
      current.IgnoreFriendlyHits(False)
      current.EvaluatePackage(False)
      current.MoveToPackageLocation()
      current.EnableNoWait(False)
    Else
      current.DisableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Robotics_SetupRoboticsEnemiesArray()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.Robotics_InitRoboticsEnemiesArray()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Robotics_InitRoboticsEnemiesArray()
  If Robotics_RoboticsEnemies == None
    If Self.GetStageDone(CONST_CaptainActiveStage_Mathis)
      Robotics_RoboticsEnemies = Robotics_EventManager.GetRef().GetLinkedRef(LinkCustom01).GetLinkedRefChain(LC088_LinkRoboticsRobot, 100) as robotpodscript[]
      Robotics_RoboticsEnemies[0].DamageValue(Health, Robotics_RoboticsEnemies[0].GetValue(Health) * 0.800000012)
      Robotics_RoboticsEnemies[1].DamageValue(Health, Robotics_RoboticsEnemies[1].GetValue(Health) * 0.600000024)
      Robotics_RoboticsEnemies[2].DamageValue(Health, Robotics_RoboticsEnemies[2].GetValue(Health) * 0.200000003)
    Else
      Robotics_RoboticsEnemies = Robotics_EventManager.GetRef().GetLinkedRef(LinkCustom02).GetLinkedRefChain(LC088_LinkRoboticsRobot, 100) as robotpodscript[]
    EndIf
  EndIf
EndFunction

Function Robotics_StartRoboticsBayBattle()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage)
      Self.Robotics_InitRoboticsEnemiesArray()
      Self.StartTimer(0.0, CONST_UpdateRoboticsBattleTimerID)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Robotics_UpdateRoboticsBattle()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage)
      Int activeRobots = 0
      Int I = 0
      While I < Robotics_RoboticsEnemies.Length && activeRobots < CONST_Robotics_MaxSimultaneousActiveRobots
        If Robotics_RoboticsEnemies[I].IsDead()
          Robotics_RoboticsEnemies.remove(I, 1)
        ElseIf Robotics_RoboticsEnemies[I].IsUnconscious()
          Robotics_RoboticsEnemies[I].WakeRobotFromPod()
          Robotics_RoboticsEnemies[I].SetUnconscious(False)
          activeRobots += 1
          I += 1
        Else
          activeRobots += 1
          I += 1
        EndIf
      EndWhile
      If activeRobots == 0
        Self.SetStage(CONST_Robotics_RoboticsBattleCompletedStage)
      Else
        Self.StartTimer(CONST_UpdateRoboticsBattleTimerDelay as Float, CONST_UpdateRoboticsBattleTimerID)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Robotics_DeactivateRobots()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage)
      Self.CancelTimer(CONST_UpdateRoboticsBattleTimerID)
      Self.Robotics_InitRoboticsEnemiesArray()
      Int I = 0
      While I < Robotics_RoboticsEnemies.Length
        If Robotics_RoboticsEnemies[I].GetLinkedRef(DMP_LinkRobotPod) != None
          Robotics_RoboticsEnemies[I].SendRobotToPod()
        Else
          Robotics_RoboticsEnemies[I].SetUnconscious(True)
        EndIf
        I += 1
      EndWhile
      Self.SetStage(CONST_Robotics_RoboticsBattleDeactivatedStage)
      Self.SetStage(CONST_Robotics_RoboticsBattleCompletedStage)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Robotics_SealRoboticsBayDoors()
  Int I = 0
  Int count = Robotics_RoboticsRoomDoors.GetCount()
  While I < count && !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage)
    Robotics_RoboticsRoomDoors.GetAt(I).SetOpen(False)
    I += 1
  EndWhile
EndFunction

Function Robotics_UnsealRoboticsBayDoors()
  Int I = 0
  Int count = Robotics_RoboticsRoomDoors.GetCount()
  While I < count
    Robotics_RoboticsRoomDoors.GetAt(I).SetOpen(True)
    I += 1
  EndWhile
EndFunction

Function EVPNaevaAndAllies()
  Naeva.TryToEvaluatePackage()
  Naeva_Allies.EvaluateAll()
EndFunction

Function Weapons_ConvertRobotsAndTurrets()
  Actor[] robotsAndTurrets = Weapons_EnemiesRobotsAndTurrets.GetArray() as Actor[]
  Int I = 0
  While I < robotsAndTurrets.Length
    robotsAndTurrets[I].RemoveFromAllFactions()
    robotsAndTurrets[I].AddToFaction(PlayerFriendFaction)
    robotsAndTurrets[I].AddToFaction(CrimeFactionCrimsonFleet)
    robotsAndTurrets[I].SetValue(Aggression, CONST_Aggression_Aggressive as Float)
    robotsAndTurrets[I].SetPlayerTeammate(True, False, False)
    robotpodscript robotActor = robotsAndTurrets[I] as robotpodscript
    If robotActor != None
      robotActor.WakeRobotFromPod()
    Else
      robotsAndTurrets[I].SetUnconscious(False)
    EndIf
    (Weapons_EnemiesAll as lc088_vigilanceenemyrefcolscript).RemoveEnemyRef(robotsAndTurrets[I] as ObjectReference)
    I += 1
  EndWhile
EndFunction

Function Weapons_SealWeaponBays()
  ObjectReference wbDoor = Weapons_WeaponsBayDoor.GetRef()
  wbDoor.SetOpen(False)
  wbDoor.Lock(True, False, True)
  wbDoor.SetLockLevel(CONST_LockLevel_RequiresTerminal)
  Actor[] enemiesInWeaponBays = Weapons_EnemiesInWeaponBays.GetArray() as Actor[]
  Int I = 0
  While I < enemiesInWeaponBays.Length
    (Weapons_EnemiesAll as lc088_vigilanceenemyrefcolscript).RemoveEnemyRef(enemiesInWeaponBays[I] as ObjectReference)
    I += 1
  EndWhile
EndFunction

Function Weapons_StartAmbush()
  ObjectReference[] ambushDoors = Weapons_AmbushDoors.GetArray()
  Int I = 0
  While I < ambushDoors.Length
    If !ambushDoors[I].IsLocked()
      ambushDoors[I].SetOpen(True)
    EndIf
    I += 1
  EndWhile
  Actor[] robotsAndTurrets = Weapons_EnemiesRobotsAndTurrets.GetArray() as Actor[]
  I = 0
  While I < robotsAndTurrets.Length
    Actor current = robotsAndTurrets[I]
    robotpodscript currentAsRobot = current as robotpodscript
    If currentAsRobot != None
      currentAsRobot.WakeRobotFromPod()
    Else
      current.SetUnconscious(False)
    EndIf
    I += 1
  EndWhile
  Utility.Wait(1.0)
  Actor[] allEnemies = Weapons_EnemiesAll.GetArray() as Actor[]
  I = 0
  While I < allEnemies.Length
    allEnemies[I].StartCombat(player as ObjectReference, False)
    I += 1
  EndWhile
EndFunction

Function Mess_StartAmbush()
  Int I = 0
  Int count = Mess_AmbushDoors.GetCount()
  While I < count
    Mess_AmbushDoors.GetAt(I).SetOpen(True)
    I += 1
  EndWhile
  I = 0
  count = Mess_AmbushEnemies.GetCount()
  While I < count
    Actor current = Mess_AmbushEnemies.GetAt(I) as Actor
    current.StartCombat(player as ObjectReference, False)
    I += 1
  EndWhile
EndFunction

Function SetupEstelle()
  If estelleLevel == 0
    Estelle_Level1_EnableMarker.TryToEnable()
    Estelle_Level1_QuartersEnemies.EnableAll(False)
    Estelle_Level2_QuartersEnemies.DisableAll(False)
  ElseIf estelleLevel == 1
    Estelle.GetActorRef().SetLinkedRef(Estelle_Level1_StartMarker.GetRef(), LC088_LinkCaptainStartMarker, True)
    Estelle_Level1_EnableMarker.TryToEnable()
    Estelle_Level1_QuartersEnemies.EnableAll(False)
    Estelle_Level2_QuartersEnemies.DisableAll(False)
  ElseIf estelleLevel == 2
    Estelle.GetActorRef().SetLinkedRef(Estelle_Level2_StartMarker.GetRef(), LC088_LinkCaptainStartMarker, True)
    Estelle_Level2_EnableMarker.TryToEnable()
    Estelle_Level1_QuartersEnemies.DisableAll(False)
    Estelle_Level2_QuartersEnemies.EnableAll(False)
  Else
    Estelle_Level3_EnableMarker.TryToEnable()
    Estelle_Level1_QuartersEnemies.DisableAll(False)
    Estelle_Level2_QuartersEnemies.DisableAll(False)
    Self.EnableEstelle()
  EndIf
EndFunction

Function EnableEstelle()
  If !enabledEstelle && estelleLevel > 0 && Self.GetStageDone(CONST_CaptainActiveStage_Estelle)
    enabledEstelle = True
    If estelleLevel == 1
      Self.EnableCaptain(Estelle, Estelle_Level1_StartMarker)
      LC088_810_Estelle_Start.Start()
    ElseIf estelleLevel == 2
      Self.EnableCaptain(Estelle, Estelle_Level2_StartMarker)
      LC088_810_Estelle_Start.Start()
    Else
      Actor estelleRef = Estelle.GetActorRef()
      ObjectReference estelleEndMarkerRef = Estelle_EndMarker.GetRef()
      estelleRef.Enable(False)
      estelleRef.MoveTo(estelleEndMarkerRef, 0.0, 0.0, 0.0, True, False)
      LC088_810_Estelle_Start_2.Start()
      Self.SetStage(CONST_Quarters_ClearedStage)
    EndIf
    If estelleLevel > 1
      Actor[] allies1 = Estelle_Level2_QuartersAllies.GetArray() as Actor[]
      Int I = 0
      While I < allies1.Length
        Self.EnableCaptainAllyRef(allies1[I])
        I += 1
      EndWhile
      If estelleLevel > 2
        Actor[] allies2 = Estelle_Level3_QuartersAllies.GetArray() as Actor[]
        I = 0
        While I < allies2.Length
          Self.EnableCaptainAllyRef(allies2[I])
          I += 1
        EndWhile
      EndIf
    EndIf
  EndIf
EndFunction

Function Flee_StartFleeing()
  Int I = 0
  Int count = Flee_FleeAreaDoors.GetCount()
  While I < count
    Flee_FleeAreaDoors.GetAt(I).SetOpen(True)
    I += 1
  EndWhile
  Self.StartTimer(CONST_FleeTimerDelay, CONST_FleeTimerID)
  Flee_EnemiesFleeing.EvaluateAll()
  I = 0
  count = Flee_NonBossBattleEnemies.GetCount()
  While I < count
    Actor current = Flee_NonBossBattleEnemies.GetAt(I) as Actor
    If current == None || current.IsDead() || Flee_EnemiesFleeing.Find(current as ObjectReference) >= 0
      
    ElseIf current.HasKeyword(ActorTypeRobot) && !player.HasDetectionLOS(current as ObjectReference)
      current.Kill(None)
    Else
      Bool removed = Self.Flee_TryToRemoveFleeingActor(current)
      If !removed
        Flee_EnemiesFleeing.AddRef(current as ObjectReference)
        Flee_EnemiesFleeingToGenericDockingPort.AddRef(current as ObjectReference)
      EndIf
    EndIf
    I += 1
  EndWhile
  Flee_HasFinishedFleeEventSetup = True
EndFunction

Function Flee_UpdateFleeEvent()
  Int I = 0
  While I < Flee_EnemiesFleeing.GetCount()
    Actor currentEnemy = Flee_EnemiesFleeing.GetAt(I) as Actor
    ObjectReference currentEnemyEscapePoint = currentEnemy.GetLinkedRef(LinkCustom01)
    If currentEnemy == None
      
    ElseIf currentEnemy.IsDead()
      Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference)
      If Flee_EnemiesFleeingToGenericDockingPort.Find(currentEnemy as ObjectReference) >= 0
        Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy as ObjectReference)
      EndIf
    ElseIf Flee_EnemiesFleeingToGenericDockingPort.Find(currentEnemy as ObjectReference) >= 0
      If Self.Flee_TryToRemoveFleeingActor(currentEnemy)
        Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference)
        Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy as ObjectReference)
      ElseIf currentEnemy.GetDistance(dockingPort05Ref) < CONST_Flee_DockingPortRemovalRadiusDistance as Float
        currentEnemy.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False)
        currentEnemy.Kill(None)
        Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference)
        Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy as ObjectReference)
      Else
        If !Flee_HasFinishedFirstFleeTimer
          currentEnemy.EvaluatePackage(False)
        EndIf
        I += 1
      EndIf
    ElseIf currentEnemyEscapePoint == None || currentEnemyEscapePoint.IsDisabled()
      Flee_EnemiesFleeingToGenericDockingPort.AddRef(currentEnemy as ObjectReference)
      currentEnemy.EvaluatePackage(False)
    ElseIf currentEnemy.GetDistance(currentEnemyEscapePoint) < CONST_Flee_DockingPortRemovalRadiusDistance as Float
      Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference)
      currentEnemy.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False)
      currentEnemy.Kill(None)
    Else
      I += 1
    EndIf
  EndWhile
  Flee_HasFinishedFirstFleeTimer = True
  If Flee_HasFinishedFleeEventSetup && Flee_EnemiesFleeing.GetCount() == 0
    
  Else
    Self.StartTimer(CONST_FleeTimerDelay, CONST_FleeTimerID)
  EndIf
EndFunction

Bool Function Flee_TryToRemoveFleeingActor(Actor fleeingActor)
  If (fleeingActor.GetDistance(player as ObjectReference) >= CONST_Flee_FleeRemovalDistance as Float) && !player.HasDetectionLOS(fleeingActor as ObjectReference)
    fleeingActor.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False)
    fleeingActor.Kill(None)
    Return True
  Else
    Return False
  EndIf
EndFunction

Function Ops_SetupOps()
  kibweRef.SetGhost(True)
  kibweRef.SetEssential(False)
  kibweRef.MoveTo(Ops_KibweStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  kibweRef.EvaluatePackage(False)
  toftRef.SetGhost(True)
  toftRef.SetEssential(False)
  toftRef.MoveTo(Ops_ToftStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  toftRef.EvaluatePackage(False)
EndFunction

Function Ops_StartBattleNoWait()
  Self.CallFunctionNoWait("Ops_StartBattle", None)
EndFunction

Function Ops_StartBattle()
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
  MUSGenesisCombatBoss_Vigilance.Add()
  Self.SetNewHoldPositionTarget(kibweRef, kibweRef.GetLinkedRef(LC088_Ops_BossHoldPositionInitialMarkerKeyword))
  kibweRef.SetGhost(False)
  kibweRef.StartCombat(player as ObjectReference, False)
  Self.SetNewHoldPositionTarget(toftRef, toftRef.GetLinkedRef(LC088_Ops_BossHoldPositionInitialMarkerKeyword))
  toftRef.SetGhost(False)
  toftRef.StartCombat(player as ObjectReference, False)
  Self.StartTimer(CONST_Ops_BattleMonitorTimerDelay as Float, CONST_Ops_BattleMonitorTimerID)
  Self.StartTimer(CONST_Ops_RobotActivationTimerDelay as Float, CONST_Ops_RobotActivationTimerID)
  Self.StartTimer(CONST_Ops_TurretActivationTimerDelay as Float, CONST_Ops_TurretActivationTimerID)
EndFunction

Function Ops_ActivateAllTurrets()
  Self.ToggleOpsActorCollection(Ops_Turrets, True)
EndFunction

Function Ops_ActivateInitialRobots()
  Self.ToggleOpsActorCollection(Ops_Robots_Initial, True)
EndFunction

Function Ops_ActivateAllRobots()
  Self.ToggleOpsActorCollection(Ops_Robots, True)
EndFunction

Function Ops_UpdateBattleMonitor()
  Bool eitherSysDefLeaderAlive = False
  If !kibweRef.IsDead()
    eitherSysDefLeaderAlive = True
    If Self.ShouldUpdateMovement(kibweRef)
      Self.SetNewHoldPositionTargetRandom(kibweRef)
    EndIf
  EndIf
  If !toftRef.IsDead()
    eitherSysDefLeaderAlive = True
    If Self.ShouldUpdateMovement(toftRef)
      Self.SetNewHoldPositionTargetRandom(toftRef)
    EndIf
  EndIf
  If eitherSysDefLeaderAlive
    Self.StartTimer(CONST_Ops_BattleMonitorTimerDelay as Float, CONST_Ops_BattleMonitorTimerID)
  EndIf
EndFunction

Bool Function ShouldUpdateMovement(Actor actorToUpdate)
  Bool healthUpdate = Self.ShouldUpdateMovementDueToHealthLoss(actorToUpdate)
  If healthUpdate
    Return True
  Else
    Bool timeUpdate = Self.ShouldUpdateMovementDueToTime(actorToUpdate)
    If timeUpdate
      Return True
    EndIf
  EndIf
  Return False
EndFunction

Bool Function ShouldUpdateMovementDueToHealthLoss(Actor actorToUpdate)
  Float currentHealthPercentage = actorToUpdate.GetValuePercentage(Health)
  Float lastHealthPercentage = actorToUpdate.GetValue(LC088_Ops_MovementUpdateHealthPercentStampValue)
  If currentHealthPercentage < lastHealthPercentage - CONST_Ops_MovementUpdateHealthLossPercent
    Return True
  EndIf
  Return False
EndFunction

Bool Function ShouldUpdateMovementDueToTime(Actor actorToUpdate)
  Float currentTime = Utility.GetCurrentRealTime()
  Float lastMovementUpdateTime = actorToUpdate.GetValue(LC088_Ops_MovementUpdateTimestampValue)
  Float timeForNextMovementUpdate = lastMovementUpdateTime + CONST_Ops_MovementUpdateTime as Float
  Return lastMovementUpdateTime < currentTime || currentTime >= timeForNextMovementUpdate
EndFunction

ObjectReference Function SetNewHoldPositionTargetRandom(Actor actorToUpdate)
  ObjectReference currentHoldPositionTarget = actorToUpdate.GetLinkedRef(LC088_Ops_BossHoldPositionLink)
  ObjectReference[] potentialHoldPositionTargets = Ops_BossHoldPositionTargets.GetArray()
  Int currentHoldPositionTargetIndex = potentialHoldPositionTargets.find(currentHoldPositionTarget, 0)
  If currentHoldPositionTargetIndex >= 0
    potentialHoldPositionTargets.remove(currentHoldPositionTargetIndex, 1)
  EndIf
  Int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1)
  ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
  Self.SetNewHoldPositionTarget(actorToUpdate, newHoldPositionTarget)
EndFunction

ObjectReference Function SetNewHoldPositionTarget(Actor actorToUpdate, ObjectReference newHoldPositionTarget)
  actorToUpdate.SetLinkedRef(newHoldPositionTarget, LC088_Ops_BossHoldPositionLink, True)
  actorToUpdate.SetValue(LC088_Ops_BossHoldPositionValue, 1.0 - actorToUpdate.GetValue(LC088_Ops_BossHoldPositionValue))
  actorToUpdate.SetValue(LC088_Ops_MovementUpdateTimestampValue, Utility.GetCurrentRealTime())
  actorToUpdate.SetValue(LC088_Ops_MovementUpdateHealthPercentStampValue, actorToUpdate.GetValuePercentage(Health))
  actorToUpdate.EvaluatePackage(False)
  Return newHoldPositionTarget
EndFunction

Function Ops_EndBattleNoWait()
  Self.CallFunctionNoWait("Ops_EndBattle", None)
EndFunction

Function Ops_EndBattle()
  Self.CancelTimer(CONST_Ops_BattleMonitorTimerID)
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
  MUSGenesisCombatBoss_Vigilance.Remove()
  CF08BattleAlarm.TryToDisable()
  Self.ShutdownAllCaptainEvents(True)
  Self.ToggleOpsActorCollection(Ops_RobotsAndTurrets, False)
  Actor[] allNonbossEnemies = Flee_NonBossBattleEnemies.GetArray() as Actor[]
  Int I = 0
  While I < allNonbossEnemies.Length
    Actor currentEnemy = allNonbossEnemies[I]
    If currentEnemy == None && !currentEnemy.IsDead() && !currentEnemy.IsDisabled()
      If currentEnemy.HasKeyword(ActorTypeRobot)
        currentEnemy.SetUnconscious(True)
      Else
        currentEnemy.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False)
        currentEnemy.Kill(None)
      EndIf
    EndIf
    I += 1
  EndWhile
  Self.CleanupAllPrisoners()
  Self.Ops_UnsealSecurityDoors()
  Self.SetStageNoWait(CONST_Complete_StartNaevaScene_Stage)
  Self.Ops_SetElevatorLockedDown(False)
  Self.Ops_SetFastTravelEnabled(True)
  LC088_Space.SetStage(CONST_Complete_Space_VigilanceCompleted_Stage)
  CF_Post.SetStage(CONST_Complete_Postquest_StartPostquest_Stage)
EndFunction

Function ToggleOpsActorCollection(RefCollectionAlias actorCollection, Bool shouldActivate)
  Guard OpsActorCollectionsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor[] myActors = actorCollection.GetArray() as Actor[]
    Int I = 0
    While I < myActors.Length
      If myActors[I] != None
        If shouldActivate && !Self.GetStageDone(CONST_Complete_Stage)
          robotpodscript robotActor = myActors[I] as robotpodscript
          If robotActor != None
            robotActor.WakeRobotFromPod()
          Else
            myActors[I].SetUnconscious(False)
            myActors[I].StartCombat(player as ObjectReference, False)
          EndIf
        Else
          myActors[I].SetUnconscious(True)
        EndIf
      EndIf
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Ops_SetFastTravelEnabled(Bool IsEnabled)
  LC082Vigilance01.EnableFastTravel(IsEnabled)
EndFunction

Function Ops_InitSecurityDoors()
  Self.Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Sealed)
  Self.Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_ActivationBlocked)
EndFunction

Function Ops_SealSecurityDoors()
  Self.Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Sealed)
  Self.Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_Sealed)
EndFunction

Function Ops_UnsealSecurityDoors()
  Self.Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Open)
  Self.Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_Open)
EndFunction

Function Ops_LockPlayerControls(Bool shouldLock)
  If shouldLock
    vigilanceInputLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
  Else
    vigilanceInputLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  EndIf
EndFunction

Function Ops_SetDoorState(RefCollectionAlias doorCollection, Int doorState)
  Int I = 0
  Int count = doorCollection.GetCount()
  While I < count
    ObjectReference currentDoor = doorCollection.GetAt(I)
    If doorState == CONST_DoorState_Open
      currentDoor.Unlock(False)
      currentDoor.SetOpen(True)
      currentDoor.BlockActivation(False, False)
    ElseIf doorState == CONST_DoorState_Sealed
      currentDoor.SetOpen(False)
      currentDoor.Lock(True, False, True)
      currentDoor.SetLockLevel(CONST_LockLevel_RequiresTerminal)
      currentDoor.BlockActivation(False, False)
    ElseIf doorState == CONST_DoorState_ActivationBlocked
      currentDoor.SetOpen(False)
      currentDoor.Unlock(False)
      currentDoor.BlockActivation(True, False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Ops_SetElevatorLockedDown(Bool shouldBeLockedDown)
  Int I = 0
  Int count = Ops_Elevators_FloorMarkers.GetCount()
  While I < count
    (Ops_Elevators_FloorMarkers.GetAt(I) as loadelevatorfloorscript).SetAccessible(!shouldBeLockedDown)
    I += 1
  EndWhile
EndFunction

Event Actor.OnLocationChange(Actor source, Location akOldLoc, Location akNewLoc)
  If akNewLoc == LC082VigilanceLocation && !Self.GetStageDone(CONST_Complete_Stage)
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Add()
  ElseIf akOldLoc == LC082VigilanceLocation
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
    MUSGenesisCombatBoss_Vigilance.Remove()
  EndIf
EndEvent

Function Cleanup()
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
  MUSGenesisCombatBoss_Vigilance.Remove()
  player = None
  kibweRef = None
  toftRef = None
  brigTerminal = None
  brigFindWeaponsTriggers = None
  cargoBayTerminal = None
  engineRoomTerminal = None
  weaponsTerminal = None
  dockingPort05Ref = None
  holdingCellMarkerRef = None
  vigilanceInputLayer.Delete()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Robotics_RoboticsEnemies = None
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_UpdateRoboticsBattleTimerID
    Self.Robotics_UpdateRoboticsBattle()
  ElseIf timerID == CONST_FleeTimerID
    Self.Flee_UpdateFleeEvent()
  ElseIf timerID == CONST_Ops_TurretActivationTimerID
    Self.Ops_ActivateAllTurrets()
  ElseIf timerID == CONST_Ops_RobotActivationTimerID
    Self.Ops_ActivateInitialRobots()
  ElseIf timerID == CONST_Ops_BattleMonitorTimerID
    Self.Ops_UpdateBattleMonitor()
  EndIf
EndEvent
