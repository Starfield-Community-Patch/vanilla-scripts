ScriptName LC165QuestScript Extends Quest conditional
{ One of the quest script for LC165, Buried Temple. Handles most of the quest logic. }

;-- Structs -----------------------------------------
Struct AdversaryBattleStageDatum
  String Name
  Bool MustExecute
  Float StageHealthThreshold = 0.0
  Float BackstopHealthThreshold = 0.0
  Int StageToSetOnEnterBeforeShifting = -1
  Int StageToSetOnEnterAfterShifting = -1
  Spell SpellToAddOnEnter
  String FunctionToCallDuringShift
  String ShiftToTrigger
  Bool ShouldUseHoldPreferred
  Keyword HoldPositionKeyword
  RefCollectionAlias HoldPositionMarkers
  Bool AllowDemonStage = False
  Bool AllowGravWellStage = False
  Bool AddTraumaPackStage = False
  Bool IsAdversaryFleeStage = False
  Bool IsAdversaryEndStage = False
EndStruct

Struct StarbornDatum
  String StarbornName
  ReferenceAlias StarbornAlias
  Actor starbornActorRef
  RefCollectionAlias StarbornDuplicatesCollection
  String StarbornBattleStartFunctionName
  String StarbornUpdateFunctionName
  String StarbornHitFunctionName
  String StarbornDyingFunctionName
  String StarbornSpellCastFunctionName
  String StarbornSwapCombatStyleFunctionName
  String StarbornOnDistanceLessThanName
  Float StarbornTimerDelay = 1.0
  Keyword StarbornMovementHoldPositionKeyword
  Float StarbornMovementUpdate_NotAtTargetTime = 20.0
  Float StarbornMovementUpdate_AtTargetTime = 0.0
  Float StarbornMovementUpdate_HealthLossPercentage = 0.0
  Int StarbornBattleStartStage = -1
  Int StarbornBattleDeathStage = -1
  Int StarbornBattleEndStage = -1
EndStruct


;-- Variables ---------------------------------------
Int CONST_AILevelMod_Hard = 2 Const
Int CONST_AdversaryFleeValue_ShouldFleeWithHoldPosition = 2 Const
Int CONST_AdversaryFleeValue_ShouldFleeWithRun = 1 Const
Int CONST_AdversaryFleeValue_ShouldNotFlee = 0 Const
Int CONST_Adversary_DataIndex = 5 Const
Int CONST_Adversary_DeathSceneCompletedStage = 1199 Const
Int CONST_Adversary_DeathSceneFailsafeTimeout = 300 Const
Int CONST_Adversary_EmissaryDuplicateCount = 3 Const
Int CONST_Adversary_InitAdversaryFailsafeTimeout = 120 Const
Int CONST_Aggression_VeryAggressive = 2 Const
Int CONST_AllyArrivalAttemptsMax = 10 Const
Int CONST_AllyArrivalTimerDelay = 1 Const
Int CONST_AllyArrivalTimerID = 11 Const
Int CONST_AllyJoinedStage = 230 Const
Int CONST_AllyRejoinDistance = 2 Const
Float CONST_ArtifactRingSpeed_AfterBattle = 0.25 Const
Float CONST_ArtifactRingSpeed_BeforeBattle = 0.25 Const
Float CONST_ArtifactRingSpeed_DuringBattle = 0.5 Const
Float CONST_AwardFinalArtifactPowerDelay = 3.0 Const
Int CONST_BridgeDuplicationLineCountdown_StartValue = 2 Const
Int CONST_Bridge_BridgeCatchupTeleportDistance = 18 Const
Int CONST_Bridge_CombatStyle_Assault = 2 Const
Int CONST_Bridge_CombatStyle_Charger = 1 Const
Int CONST_Bridge_CombatStyle_Sniper = 0 Const
Int CONST_Bridge_DataIndex = 0 Const
Int CONST_Bridge_DeathCountParallelize_2 = 1 Const
Int CONST_Bridge_DeathCountParallelize_3 = 3 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_Courtyard_DataIndex = 1 Const
Int CONST_Courtyard_FirstReanimateActiveStage = 410 Const
Int CONST_Courtyard_FirstReanimateTargetsCount = 6 Const
Int CONST_Courtyard_MassReanimateDelay = 2 Const
Float CONST_Courtyard_PerReanimateDelay = 0.200000003 Const
Int CONST_Courtyard_SecondReanimateTargetsCount = 4 Const
Int CONST_Courtyard_SecondReanimateZombieThreshold = 3 Const
Int CONST_Courtyard_ThirdReanimateActiveStage = 411 Const
Int CONST_Courtyard_ThirdReanimateTargetsCount = 5 Const
Int CONST_Courtyard_ThirdReanimateZombieThreshold = 3 Const
Float CONST_DissolveVFXDelay = 2.0 Const
Float CONST_Elevator01Speed = 0.07
Float CONST_Elevator02Speed = 0.043000001 Const
Int CONST_ElevatorGateOpenFailsafeCount = 50 Const
Int CONST_Fire_DataIndex = 2 Const
Int CONST_ForceAdversaryShiftFailsafe = 200 Const
Float CONST_Gravity_MasadaIII = 1.120000005 Const
Int CONST_Ice_DataIndex = 3 Const
Int CONST_MQ302BArtifactID = 23 Const
Int CONST_OpenState_Open = 1 Const
Float CONST_ParallelSelfOffsetMax = 3.0 Const
Float CONST_ParallelSelfOffsetMin = 0.5 Const
Int CONST_QuickstartLevel = 50 Const
Int CONST_RuinsDemonsMax = 6 Const
Float CONST_RuinsDemonsRespawnDelay = 15.0 Const
Float CONST_RuinsInitialSpawnDelay = 0.5 Const
Float CONST_RuinsSpawnNearPlayerDistance_Max = 12.0 Const
Float CONST_RuinsSpawnNearPlayerDistance_Min = 4.0 Const
Int CONST_RuinsTargetSelectionAttemptsMax = 4 Const
Int CONST_RuinsTeleportDistanceMax = 50 Const
Float CONST_RuinsTeleportNearPlayerDistance_Max = 12.0 Const
Float CONST_RuinsTeleportNearPlayerDistance_Min = 8.0 Const
Int CONST_Ruins_DataIndex = 4 Const
Int CONST_Ruins_HitCountWhileObserving_Max = 1 Const
Int CONST_Stage_BridgeStarbornParallelSelfReactStage = 310 Const
Int CONST_Stage_Complete = 2000 Const
Int CONST_Stage_EngineeringHackedStage = 606 Const
Int CONST_Stage_EngineeringRobotReactStage = 605 Const
Int CONST_Stage_ExteriorIDCardReaderUsedStage = 495 Const
Int CONST_Stage_PlayerTakesArtifactActivator = 1290 Const
Int CONST_Stage_Quickstart_Space = 0 Const
Int CONST_Stage_Ruins_BattleStartSceneEndedStage = 1001 Const
Int CONST_Stage_SetupAdversaryFaction = 25 Const
Int CONST_Stage_Startup_BothEnemies = 22 Const
Int CONST_Stage_Startup_EmissaryEnemy = 21 Const
Int CONST_Stage_Startup_HunterEnemy = 20 Const
Int CONST_StarbornAdversaryRescueDistance = 50 Const
Int CONST_StarbornAdversarySurrenderSceneFailsafe = 100 Const
Int CONST_StarbornAdversary_ArtifactSurgeDelay = 2 Const
Float CONST_StarbornAdversary_CheckForStateChangeTimerDelay = 1.0 Const
Int CONST_StarbornAdversary_CheckForStateChangeTimerID = 10 Const
Int CONST_StarbornAdversary_DemonCastDelay = 8 Const
Int CONST_StarbornAdversary_DemonState_ReadyToCast = 1 Const
Int CONST_StarbornAdversary_DemonState_Waiting = 0 Const
Int CONST_StarbornAdversary_DemonsToSpawnPerCastMax = 3 Const
Int CONST_StarbornAdversary_DemonsToSpawnTotal = 5 Const
Float CONST_StarbornAdversary_GravWellCastDelay = 12.0 Const
Float CONST_StarbornAdversary_GravWellCastDistance = 10.0 Const
Float CONST_StarbornAdversary_GravWellDetonateDelay = 4.0 Const
Int CONST_StarbornAdversary_GravWellState_TryToCreate = 1 Const
Int CONST_StarbornAdversary_GravWellState_TryToDetonate = 3 Const
Int CONST_StarbornAdversary_GravWellState_WaitToCreate = 0 Const
Int CONST_StarbornAdversary_GravWellState_WaitToDetonate = 2 Const
Int CONST_StarbornAdversary_ShiftsToLoad = 2 Const
Int CONST_StarbornAdversary_State_TempleInitial = 0 Const
Int CONST_StarbornAtTargetDistance = 16 Const
Int CONST_StarbornBattleState_Adversary_Normal = 1 Const
Int CONST_StarbornBattleState_Adversary_Waiting = 0 Const
Int CONST_StarbornBattleState_Bridge_Complete = 100 Const
Int CONST_StarbornBattleState_Bridge_Initial = 0 Const
Int CONST_StarbornBattleState_Bridge_Parallelized_1 = 2 Const
Int CONST_StarbornBattleState_Bridge_Parallelized_2 = 3 Const
Int CONST_StarbornBattleState_Bridge_Parallelized_3 = 4 Const
Int CONST_StarbornBattleState_Bridge_RealEnemyExposed = 5 Const
Int CONST_StarbornBattleState_Bridge_Start = 1 Const
Int CONST_StarbornBattleState_Courtyard_Complete = 100 Const
Int CONST_StarbornBattleState_Courtyard_FirstReanimateActive = 1 Const
Int CONST_StarbornBattleState_Courtyard_FirstReanimateReady = 0 Const
Int CONST_StarbornBattleState_Courtyard_Initial = 0 Const
Int CONST_StarbornBattleState_Courtyard_Normal = 6 Const
Int CONST_StarbornBattleState_Courtyard_SecondReanimateActive = 3 Const
Int CONST_StarbornBattleState_Courtyard_SecondReanimateReady = 2 Const
Int CONST_StarbornBattleState_Courtyard_ThirdReanimateActive = 5 Const
Int CONST_StarbornBattleState_Courtyard_ThirdReanimateReady = 4 Const
Int CONST_StarbornBattleState_Engineering_Complete = 100 Const
Int CONST_StarbornBattleState_Engineering_Initial = 0 Const
Int CONST_StarbornBattleState_Engineering_Normal = 1 Const
Int CONST_StarbornBattleState_Ruins_Attacking = 2 Const
Int CONST_StarbornBattleState_Ruins_Complete = 100 Const
Int CONST_StarbornBattleState_Ruins_Initial = 0 Const
Int CONST_StarbornBattleState_Ruins_Observing = 1 Const
Int CONST_StarbornBridge_TeleportMarkerSearchRadius = 50 Const
Int CONST_StarbornEngineering_ActiveRobotCountMax = 2 Const
Float CONST_StarbornEngineering_GravWellCastDelay = 10.0 Const
Float CONST_StarbornEngineering_GravWellCastDistance = 10.0 Const
Float CONST_StarbornEngineering_GravWellDetonateDelay = 4.0 Const
Int CONST_StarbornEngineering_GravWellState_TryToCreate = 1 Const
Int CONST_StarbornEngineering_GravWellState_TryToDetonate = 3 Const
Int CONST_StarbornEngineering_GravWellState_WaitToCreate = 0 Const
Int CONST_StarbornEngineering_GravWellState_WaitToDetonate = 2 Const
Int CONST_StarbornEngineering_InitialAppearanceDelay = 3 Const
Int CONST_StarbornShouldCastCombatSpellValue = 5 Const
Int CONST_StarbornStateValue_Adversary_Normal = 1 Const
Int CONST_StarbornStateValue_Adversary_ShouldCastInitialParallelSelf = 2 Const
Int CONST_StarbornStateValue_Adversary_Waiting = 0 Const
Int CONST_StarbornStateValue_Bridge_Normal = 2 Const
Int CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat = 3 Const
Int CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfPackage = 1 Const
Int CONST_StarbornStateValue_Bridge_WaitingForPlayer = 0 Const
Int CONST_StarbornStateValue_Courtyard_Normal = 2 Const
Int CONST_StarbornStateValue_Courtyard_ShouldCastMassReanimate = 1 Const
Int CONST_StarbornStateValue_Courtyard_WaitInTower = 0 Const
Int CONST_StarbornStateValue_Engineering_Normal = 1 Const
Int CONST_StarbornStateValue_Ruins_Attacking = 2 Const
Int CONST_StarbornStateValue_Ruins_Observing = 1 Const
Int CourtyardBattleState = 0
Actor[] CourtyardReanimateTargetsAll
Actor[] CourtyardReanimateTargetsRandomized
Bool DEBUG_AdversaryDebugMode
Bool DEBUG_StarbornRuinsBlockDemonSpawning
Int EngineeringBattleState = 0
inputenablelayer LC165EnableLayer
Int RuinsBattleState = 0
Int Ruins_HitCountWhileObserving
Actor adversary01DuplicateRef
Actor adversary01Ref
Actor adversary02DuplicateRef
Actor adversary02Ref
Bool adversaryBattleComplete
Int adversaryBattleStageDataIndex
Bool adversaryCompletedZeroGPhase
Bool adversaryHasShiftedAwayFromTemple
Float adversaryHealthBaseTotal
Int adversaryLastShiftIndex = -1
Int allyArrivalAttempts
ObjectReference[] allyArrivalMarkerChain
ObjectReference artifactActivatorRef
ObjectReference artifactPlatformRef
ObjectReference artifactRingsRef
ObjectReference artifactZeroGExplosion
ObjectReference bridgeBoundsTriggerRef
Actor bridgeCharger
ObjectReference bridgeHoldPositionTriggerRef
Actor bridgeLastHit
Int bridge_DeathCount
Int bridge_DuplicationLineCountdown = -1
Int bridge_NextCombatStyle
Bool bridge_WaitingForParallelSelfCast
ObjectReference courtyardLastSwapMarker1
ObjectReference courtyardLastSwapMarker2
RefCollectionAlias currentAdversaryHoldPositionTargetCollection
Int demonDuplicateID
Int elevatorSFXID
idcardreader exteriorIDCardReaderRef
Bool hasDispelledAdversaryVoidForm
Bool initialized
Actor player
Bool safeToForceAdversaryShift
ObjectReference scriptedExplosionHazard
ObjectReference scriptedGravWellHazard
Float scriptedGravWellTimestamp
lc165shiftingquestscript selfAsShiftingScript
lc165spacequestscript selfAsSpaceQuestScript
Int stageToSetOnNextShift = -1
Actor starbornAdversaryCurrentPrimary
Int starbornAdversaryDemonState
Actor starbornAdversaryEmissary
Int starbornAdversaryGravWellState
Bool starbornAdversaryHasSpawnedInitialDemons
Actor starbornAdversaryHunter
Actor starbornAdversaryPrimary
Float starbornAdversaryScriptedDemonTimestamp
ObjectReference starbornAdversary_GravWellTargetPoint
Actor starbornBridgePrimary
Int starbornEngineeringGravWellState
ObjectReference starbornEngineering_GravWellTargetPoint
Bool starbornEngineering_RobotsDisabled
Actor starbornFireActorRef
Bool starbornFireDead
Bool starbornFireHasKey
Actor starbornIceActorRef
Bool starbornIceDead
Float[] starbornRuinsDemonsRespawnTimes
ObjectReference starbornRuinsTriggerRef
defaultmultistateactivator templeExteriorDoorBarsRef
defaultmultistateactivator templeExteriorDoorRef
defaultmultistateactivator templeInteriorDoorRef
Bool templeInteriorInitialized
Bool waitingForLoadOutOfTemple

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AdversaryBattleStageDataGuard
Guard AdversaryDemonGuard
Guard AdversaryGravWellGuard
Guard AdversaryShiftingGuard
Guard AdversaryZeroGGuard
Guard BridgeParallelSelfGuard
Guard ChangeLocationGuard
Guard CourtyardBattleStateGuard
Guard EngineeringGravWellGuard
Guard RuinsBattleStateGuard

;-- Properties --------------------------------------
Group QuestProperties
  lc165questscript:starborndatum[] Property StarbornData Auto mandatory
  { Data for each of the Starborn minibosses. }
  lc165questscript:adversarybattlestagedatum[] Property AdversaryBattleStageData Auto mandatory
  { Array of data used for the BOTH battle. This array gets overwritten by the Hunter or Emissary-specific arrays, if appropriate. }
  lc165questscript:adversarybattlestagedatum[] Property AdversaryBattleStageData_Hunter Auto Const mandatory
  { Array of data used for the HUNTER ONLY battle. }
  lc165questscript:adversarybattlestagedatum[] Property AdversaryBattleStageData_Emissary Auto Const mandatory
  { Array of data used for the EMISSARY ONLY battle. }
EndGroup

Group AutofillProperties
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  starborntemplequestscript Property StarbornTempleQuest Auto Const mandatory
  Location Property LC165BuriedTempleLocation Auto Const mandatory
  ReferenceAlias Property Companion Auto Const mandatory
  RefCollectionAlias Property Followers Auto Const mandatory
  ReferenceAlias Property Ally Auto Const mandatory
  ReferenceAlias Property Adversary01 Auto Const mandatory
  ReferenceAlias Property Adversary02 Auto Const mandatory
  Scene Property MQ302_191_Entrance_EmissaryJoin Auto Const mandatory
  Scene Property MQ302_191_Entrance_HunterJoin Auto Const mandatory
  Scene Property MQ302_Battle_01_Bridge_BattleStart Auto Const mandatory
  ReferenceAlias Property StarbornBridge_BridgeBoundsTrigger Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_HoldPositionTrigger Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_InitialDuplicateSpawnPoints Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_ChargerTeleportPoints Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_AssaultTeleportPoints Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_SniperTeleportPoints Auto Const mandatory
  FormList Property LC165_Starborn_Bridge_TeleportPointMarkerList Auto Const mandatory
  Spell Property LC165_Starborn_Bridge_ScriptedParallelSelfInitialSpell Auto Const mandatory
  Spell Property LC165_Starborn_Bridge_ScriptedParallelSelfSpell Auto Const mandatory
  ActorValue Property LC165_Starborn_Bridge_CombatStyleValue Auto Const mandatory
  ActorValue Property LC165_Starborn_Bridge_HasPerformedInitialTeleportValue Auto Const mandatory
  Keyword Property LC165_Starborn_Bridge_DuplicationLines Auto Const mandatory
  ObjectReference Property LC165ExteriorHoldingPenMarkerRef Auto Const mandatory
  Scene Property MQ302_Battle_02_Courtyard_MassReanimate01 Auto Const mandatory
  Scene Property MQ302_Battle_02_Courtyard_MassReanimate02 Auto Const mandatory
  Scene Property MQ302_Battle_02_Courtyard_MassReanimate03 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets_Wave01 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets_Wave02 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets_Wave03 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_HoldPositionTargets Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_Navcut Auto Const mandatory
  Scene Property MQ302_Battle_03_Engineering_BattleStart Auto Const mandatory
  ReferenceAlias Property StarbornFire Auto Const mandatory
  ReferenceAlias Property StarbornIce Auto Const mandatory
  ReferenceAlias Property StarbornEngineering_HoldPositionTargetInitial Auto Const mandatory
  ReferenceAlias Property StarbornEngineering_GravityWellSourceMarkerInitial Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_HoldPositionTargets Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_GravityWellSourceMarkers Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_RobotsActive Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_RobotsInactive Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_TurretsAll Auto Const mandatory
  Spell Property LC165_Starborn_Ice_ScriptedGravityWellSpell Auto Const mandatory
  Spell Property LC165_Starborn_Fire_ScriptedSupernovaSpell Auto Const mandatory
  Static Property LC165_Engineering_GravityWellSourceMarker Auto Const mandatory
  Scene Property MQ302_Battle_05_Ruins_BattleStart Auto Const mandatory
  Scene Property MQ302_Battle_05_Ruins_TeleportReaction Auto Const mandatory
  ReferenceAlias Property StarbornRuins_InitialInnerDemonSpawnPointChainHead Auto Const mandatory
  ReferenceAlias Property StarbornRuins_HoldPositionTrigger Auto Const mandatory
  RefCollectionAlias Property StarbornRuins_ObservingHoldPositionTargets Auto Const mandatory
  Spell Property LC165_Starborn_Adversary_ScriptedInnerDemonSpell Auto Const mandatory
  Spell Property ArtifactPowerSenseStarStuff_Spell Auto Const mandatory
  Perk Property LC165_Starborn_Ruins_InnerDemonPerk Auto Const mandatory
  Scene Property MQ302_Battle_06_Adversary_Museum_Arrival Auto Const mandatory
  Scene Property MQ302_Battle_06_Adversary_EmissaryDeath Auto Const mandatory
  Scene Property MQ302_Battle_06_Adversary_HunterDeath Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Primary Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Hunter Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Emissary Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_ActiveDistortion Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_DeathMarker01 Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_DeathMarker02 Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_InitialDuplicateSpawnPointChainHead Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Nishina_TeleportMarkerChainHead Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_Demons Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_ZeroGImpulseObjects Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_ZeroGDisableObjects Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_GravityWellSourceMarkers Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_Astral_Dancers Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_NASAMuseum_InitialDemonSpawnPoints Auto Const mandatory
  ObjectReference Property LC165AdversarySoloSceneMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary01SceneMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary02SceneMarkerRef Auto Const mandatory
  ObjectReference Property LC165AdversarySoloCombatStartMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary01CombatStartMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary02CombatStartMarkerRef Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_MQ302B_A_Battles Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_MQ302B_B_BattleFinal Auto Const mandatory
  Explosion Property ArtifactPower_AntiGravityField Auto Const mandatory
  Keyword Property MQHunterKeyword Auto Const mandatory
  Keyword Property MQEmissaryKeyword Auto Const mandatory
  Keyword Property LC165_StarbornAdversaryInaccessibleKeyword Auto Const mandatory
  Keyword Property LC165_BossHoldPosition_PreferredKeyword Auto Const mandatory
  Cell Property LC165BuriedTemple03 Auto Const mandatory
  Static Property LC165_Adversary_GravityWellSourceMarker Auto Const mandatory
  Armor Property Spacesuit_Starborn_Companion_PlayerOrFollower Auto Const mandatory
  ReferenceAlias Property AllyArrivalMarker Auto Const mandatory
  Static Property LC165_AllyArrivalMarker Auto Const mandatory
  ReferenceAlias Property ExteriorIDCard Auto Const mandatory
  ReferenceAlias Property ExteriorIDCardFallback Auto Const mandatory
  ReferenceAlias Property ExteriorIDCardFallbackSpawnPoint Auto Const mandatory
  ReferenceAlias Property ExteriorIDCardReader Auto Const mandatory
  ReferenceAlias Property ExteriorLoadDoor Auto Const mandatory
  ReferenceAlias Property EngineeringKey Auto Const mandatory
  ReferenceAlias Property EngineeringKeyFallback Auto Const mandatory
  ReferenceAlias Property EngineeringKeyFallbackSpawnPoint Auto Const mandatory
  ReferenceAlias Property MQ302BPetrov Auto Const mandatory
  ReferenceAlias Property PetrovsDoor Auto Const mandatory
  ReferenceAlias Property ElevatorTopActivator Auto Const mandatory
  ReferenceAlias Property ElevatorTopDoor Auto Const mandatory
  ReferenceAlias Property ElevatorBottomActivator Auto Const mandatory
  ReferenceAlias Property ElevatorBottomDoor Auto Const mandatory
  ReferenceAlias Property Elevator01EnableMarker Auto Const mandatory
  ReferenceAlias Property Elevator02EnableMarker Auto Const mandatory
  ReferenceAlias Property Elevator02Gate Auto Const mandatory
  ReferenceAlias Property ElevatorStaticEnableMarker Auto Const mandatory
  Keyword Property LC165LinkElevatorPlatformHelperKeyword Auto Const mandatory
  Keyword Property LC165LinkElevatorDoorKeyword Auto Const mandatory
  Keyword Property LC165LinkElevatorTopCollisionKeyword Auto Const mandatory
  Keyword Property LC165LinkElevatorSoundMarkerKeyword Auto Const mandatory
  wwiseevent Property WwiseEvent_OBJElevatorLoadStart Auto Const mandatory
  wwiseevent Property OBJ_Elevator_Mine_Transit_LP Auto Const mandatory
  ReferenceAlias Property TempleExteriorDoorBars Auto Const mandatory
  ReferenceAlias Property TempleExteriorDoor Auto Const mandatory
  ReferenceAlias Property TempleInteriorDoor Auto Const mandatory
  ReferenceAlias Property ArtifactActivator Auto Const mandatory
  ReferenceAlias Property ArtifactRings Auto Const mandatory
  ReferenceAlias Property ArtifactRingsAudioMarker Auto Const mandatory
  ReferenceAlias Property ArtifactPlatform Auto Const mandatory
  RefCollectionAlias Property ArtifactCollision Auto Const mandatory
  ReferenceAlias Property SBPowerCollectionActivator Auto Const mandatory
  Spell Property ArtifactPower_GrantSpell_Phased_Time Auto Const mandatory
  wwiseevent Property WwiseEvent_AMBArtifactVisionX Auto Const mandatory
  ObjectReference Property LC165HoldingPenMarkerRef Auto Const mandatory
  ObjectReference Property LC165AllyHoldingPenMarkerRef Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property LC165StarbornEnemyFaction Auto Const mandatory
  ActorValue Property LC165_StarbornStateValue Auto Const mandatory
  ActorValue Property LC165_StarbornMovementUpdateTimestampValue Auto Const mandatory
  ActorValue Property LC165_StarbornMovementReachedTargetTimestampValue Auto Const mandatory
  ActorValue Property LC165_StarbornMovementHealthPercentStampValue Auto Const mandatory
  ActorValue Property LC165_BossHoldPositionValue Auto Const mandatory
  ActorValue Property LC165_AdversaryFleeValue Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  ActorValue Property Confidence Auto Const mandatory
  ActorValue Property Experience Auto Const mandatory
  ActorValue Property QuantumEssence Auto Const mandatory
  Keyword[] Property StarbornMovementHoldPositionKeywords Auto Const mandatory
  Keyword Property LC165_StarbornEventActorLinkKeyword Auto Const mandatory
  Keyword Property LC165_StarbornDuplicateLinkKeyword Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
  Message Property QuantumEssenceAddMSG Auto Const mandatory
  Static Property XMarker Auto Const mandatory
  Spell Property LC165_Scripted_VoidFormAb Auto Const mandatory
  Spell Property AbStarbornDeath Auto Const mandatory
  Spell Property LC165_AbParallelSelfDeath Auto Const mandatory
  Spell Property LC165_AbReanimate Auto Const mandatory
  Spell Property LC165_AbInnerDemonDeath Auto Const mandatory
  Spell Property AIPower_VoidForm Auto Const mandatory
  Spell Property LC165_Scripted_VoidFormSpell Auto Const mandatory
  Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
  Hazard Property LC165_ScriptedGravWellHazard Auto Const mandatory
  Explosion Property LC165_ScriptedGravWellExplosion Auto Const mandatory
  Explosion Property LC165_ScriptedSupernovaExplosion Auto Const mandatory
  Explosion Property LC165_StarbornReanimateExplosion Auto Const mandatory
  Explosion Property LC165_StarbornTeleportInExplosion Auto Const mandatory
  Explosion Property LC165_StarbornTeleportOutExplosion Auto Const mandatory
  Explosion Property LC165_StarbornTeleportSwapExplosion Auto Const mandatory
  Explosion Property LC165_StarbornParallelSelfSpawnExplosion Auto Const mandatory
  Explosion Property LC165_StarbornInnerDemonSpawnExplosion Auto Const mandatory
  Explosion Property LC165_AnomalyTeleportExplosion Auto Const mandatory
  combatstyle Property LC165_csStarbornChargerBridge Auto Const mandatory
  combatstyle Property LC165_csStarbornChargerBridge_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_Sniper Auto Const mandatory
  combatstyle Property LC165_csStarborn_Sniper_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_Assault Auto Const mandatory
  combatstyle Property LC165_csStarborn_Assault_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_MQHunter Auto Const mandatory
  combatstyle Property LC165_csStarborn_MQHunter_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_MQEmissary Auto Const mandatory
  combatstyle Property LC165_csStarborn_MQEmissary_CastCombatSpell Auto Const mandatory
  wwiseevent Property WwiseEvent_ShakeController_p75_p75_03 Auto Const mandatory
  MiscObject Property Artifact_MU Auto Const mandatory
  RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const mandatory
  Potion Property Aid_MedPack Auto Const mandatory
  Potion Property Aid_TraumaPack Auto Const mandatory
EndGroup

Bool Property usedSurfaceQuickstart Auto hidden
Int Property bridgeBattleState = 0 Auto conditional hidden
Bool Property Elevator02FinishedAnimation = False Auto conditional hidden

;-- Functions ---------------------------------------

Function StarbornRuinsSwapCombatStyle(Actor starbornRuinsRef, Int starbornDataIndex, Bool shouldCastSpell)
  ; Empty function
EndFunction

Event OnQuestInit()
  player = Game.GetPlayer()
  selfAsSpaceQuestScript = (Self as Quest) as lc165spacequestscript
  selfAsShiftingScript = (Self as Quest) as lc165shiftingquestscript
  bridgeBoundsTriggerRef = StarbornBridge_BridgeBoundsTrigger.GetRef()
  bridgeHoldPositionTriggerRef = StarbornBridge_HoldPositionTrigger.GetAt(0)
  templeExteriorDoorBarsRef = TempleExteriorDoorBars.GetRef() as defaultmultistateactivator
  templeExteriorDoorRef = TempleExteriorDoor.GetRef() as defaultmultistateactivator
  templeInteriorDoorRef = TempleInteriorDoor.GetRef() as defaultmultistateactivator
  Int I = 0
  While I < StarbornData.Length
    StarbornData[I].StarbornAlias.TryToReset()
    StarbornData[I].StarbornDuplicatesCollection.ResetAll()
    I += 1
  EndWhile
  StarbornAdversary_Hunter.TryToReset()
  StarbornAdversary_Emissary.TryToReset()
  StarbornCourtyard_ReanimateTargets.ResetAll()
  StarbornEngineering_RobotsActive.ResetAll()
  StarbornEngineering_RobotsInactive.ResetAll()
  StarbornEngineering_TurretsAll.ResetAll()
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnLocationChange")
  I = 0
  While I < StarbornData.Length
    Actor current = StarbornData[I].StarbornAlias.GetActorRef()
    If current != None
      StarbornData[I].starbornActorRef = current
      current.AddToFaction(PlayerFriendFaction)
      current.Disable(False)
      Self.RegisterForStarbornEvents(current, I)
      current.RemoveItem(Aid_MedPack as Form, 100, False, None)
    EndIf
    I += 1
  EndWhile
  Self.StarbornBridgeInit(CONST_Bridge_DataIndex)
  CourtyardReanimateTargetsAll = StarbornCourtyard_ReanimateTargets.GetArray() as Actor[]
  CourtyardReanimateTargetsRandomized = commonarrayfunctions.CopyAndRandomizeObjArray(StarbornCourtyard_ReanimateTargets.GetArray()) as Actor[]
  starbornFireActorRef = StarbornFire.GetActorRef()
  starbornIceActorRef = StarbornIce.GetActorRef()
  ObjectReference[] randomizedRobots = commonarrayfunctions.CopyAndRandomizeObjArray(StarbornEngineering_RobotsActive.GetArray())
  StarbornEngineering_RobotsActive.RemoveAll()
  StarbornEngineering_RobotsActive.AddArray(randomizedRobots)
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Unconscious")
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Frenzy")
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Ally")
  starbornRuinsTriggerRef = StarbornRuins_HoldPositionTrigger.GetRef()
  starbornRuinsDemonsRespawnTimes = new Float[0]
  exteriorIDCardReaderRef = ExteriorIDCardReader.GetRef() as idcardreader
  Self.RegisterForCustomEvent(exteriorIDCardReaderRef as ScriptObject, "idcardreader_IDReaderActivatedSuccess")
  ExteriorLoadDoor.GetRef().Unlock(False)
  Self.SetTempleDoorState(True, True)
  artifactActivatorRef = ArtifactActivator.GetRef()
  artifactRingsRef = ArtifactRings.GetRef()
  artifactPlatformRef = ArtifactPlatform.GetRef()
  artifactActivatorRef.BlockActivation(True, True)
  Self.RegisterForRemoteEvent(artifactActivatorRef as ScriptObject, "OnActivate")
EndEvent

Function QuickstartTo(ObjectReference quickstartMarker)
  If !Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) && !Self.GetStageDone(CONST_Stage_Startup_EmissaryEnemy) && !Self.GetStageDone(CONST_Stage_Startup_BothEnemies)
    Self.SetStage(CONST_Stage_Startup_HunterEnemy)
  EndIf
  If Self.GetStageDone(CONST_Stage_Quickstart_Space) && quickstartMarker == None
    selfAsSpaceQuestScript.QuickstartToSpace()
  Else
    usedSurfaceQuickstart = True
    Actor allyRef = Ally.GetActorRef()
    If allyRef != None
      SQ_Followers.SetRoleActive(allyRef, True, True, 0.0, 0.0)
      allyRef.IgnoreFriendlyHits(True)
    EndIf
    Self.SetStage(CONST_Stage_SetupAdversaryFaction)
    player.MoveTo(quickstartMarker, 0.0, 0.0, 0.0, True, False)
    Companion.TryToMoveTo(quickstartMarker)
    Followers.MoveAllTo(quickstartMarker)
  EndIf
EndFunction

Function EnterVoidForm(Actor target)
  If target != None
    LC165_Scripted_VoidFormSpell.Cast(target as ObjectReference, target as ObjectReference)
  EndIf
EndFunction

Function ExitVoidForm(Actor target)
  If target != None
    target.RemoveSpell(LC165_Scripted_VoidFormSpell)
    target.DispelSpell(LC165_Scripted_VoidFormSpell)
  EndIf
EndFunction

Function TeleportIn(ObjectReference target, Spell teleportInSpell, Explosion teleportInExplosion)
  If target != None
    If teleportInSpell == None && teleportInExplosion == None
      teleportInExplosion = LC165_StarbornTeleportInExplosion
    EndIf
    Actor targetActor = target as Actor
    If targetActor
      If teleportInSpell != None
        targetActor.AddSpell(teleportInSpell, True)
      EndIf
    EndIf
    If teleportInExplosion != None
      target.PlaceAtMe(teleportInExplosion as Form, 1, False, False, True, None, None, True)
    EndIf
  EndIf
EndFunction

Function TeleportOut(Actor target, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutDelay, Bool shouldDisable)
  If target != None
    If teleportOutSpell == None && teleportOutExplosion == None
      teleportOutExplosion = LC165_StarbornTeleportOutExplosion
    EndIf
    If teleportOutSpell != None
      target.AddSpell(teleportOutSpell, True)
      Utility.Wait(CONST_DissolveVFXDelay)
    EndIf
    If teleportOutExplosion != None
      target.PlaceAtMe(teleportOutExplosion as Form, 1, False, False, True, None, None, True)
    EndIf
    Utility.Wait(teleportOutDelay)
    If shouldDisable
      target.Disable(False)
    EndIf
  EndIf
EndFunction

Function TeleportOutNoWait(Actor target, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutDelay, Bool shouldDisable)
  Var[] akArgs = new Var[5]
  akArgs[0] = target as Var
  akArgs[1] = teleportOutSpell as Var
  akArgs[2] = teleportOutExplosion as Var
  akArgs[3] = teleportOutDelay as Var
  akArgs[4] = shouldDisable as Var
  Self.CallFunctionNoWait("TeleportOut", akArgs)
EndFunction

Function CombatTeleportNearPlayerNoWait(Actor actorToTeleport, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Self.CombatTeleportNearRefNoWait(actorToTeleport, player as ObjectReference, minDistance, maxDistance, allowZOffset, alwaysInFront, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
EndFunction

Function CombatTeleportNearPlayer(Actor actorToTeleport, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Self.CombatTeleportNearRef(actorToTeleport, player as ObjectReference, minDistance, maxDistance, allowZOffset, alwaysInFront, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
EndFunction

Function CombatTeleportNearRefNoWait(Actor actorToTeleport, ObjectReference sourceRef, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Var[] akArgs = new Var[11]
  akArgs[0] = actorToTeleport as Var
  akArgs[1] = sourceRef as Var
  akArgs[2] = minDistance as Var
  akArgs[3] = maxDistance as Var
  akArgs[4] = allowZOffset as Var
  akArgs[5] = alwaysInFront as Var
  akArgs[6] = teleportInSpell as Var
  akArgs[7] = teleportInExplosion as Var
  akArgs[8] = teleportOutSpell as Var
  akArgs[9] = teleportOutExplosion as Var
  akArgs[10] = teleportOutSpellDelay as Var
  Self.CallFunctionNoWait("CombatTeleportNearRef", akArgs)
EndFunction

Function CombatTeleportNearRef(Actor actorToTeleport, ObjectReference sourceRef, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If !actorToTeleport.IsDead()
    Float[] akOffsets = new Float[3]
    If maxDistance > 0.0
      akOffsets[0] = Utility.RandomFloat(minDistance, maxDistance)
      akOffsets[1] = Utility.RandomFloat(minDistance, maxDistance)
      akOffsets[2] = Utility.RandomFloat(minDistance, maxDistance)
      If Utility.RandomInt(0, 1) == 0
        akOffsets[0] = akOffsets[0] * -1.0
      EndIf
      If !alwaysInFront && Utility.RandomInt(0, 1) == 0
        akOffsets[1] = akOffsets[1] * -1.0
      EndIf
      If !allowZOffset
        akOffsets[2] = 0.0
      ElseIf Utility.RandomInt(0, 1) == 0
        akOffsets[2] = akOffsets[2] * -1.0
      EndIf
    EndIf
    ObjectReference target = sourceRef.PlaceAtMe(XMarker as Form, 1, False, False, True, akOffsets, None, True)
    If minDistance > 0.0 || maxDistance > 0.0
      target.MoveToNearestNavmeshLocation()
    EndIf
    Self.CombatTeleport(actorToTeleport, target, False, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
    target.Delete()
  EndIf
EndFunction

Function CombatTeleportNoWait(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Var[] akArgs = new Var[8]
  akArgs[0] = actorToTeleport as Var
  akArgs[1] = target as Var
  akArgs[2] = shouldBeInvisibleAfterTeleport as Var
  akArgs[3] = teleportInSpell as Var
  akArgs[4] = teleportInExplosion as Var
  akArgs[5] = teleportOutSpell as Var
  akArgs[6] = teleportOutExplosion as Var
  akArgs[7] = teleportOutSpellDelay as Var
  Self.CallFunctionNoWait("CombatTeleport", akArgs)
EndFunction

Function CombatTeleport(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If actorToTeleport.IsEnabled() && actorToTeleport.Is3DLoaded()
    Self.TeleportOut(actorToTeleport, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, False)
  EndIf
  If shouldBeInvisibleAfterTeleport
    Self.EnterVoidForm(actorToTeleport)
    actorToTeleport.DispelSpell(ArtifactPowerSenseStarStuff_Spell)
  EndIf
  If !shouldBeInvisibleAfterTeleport
    Self.TeleportIn(target, teleportInSpell, teleportInExplosion)
  EndIf
  actorToTeleport.MoveTo(target, 0.0, 0.0, 0.0, True, False)
  If actorToTeleport.IsDisabled()
    actorToTeleport.Enable(False)
  EndIf
  If !shouldBeInvisibleAfterTeleport
    Self.ExitVoidForm(actorToTeleport)
  EndIf
  If !actorToTeleport.IsDead()
    actorToTeleport.StartCombat(player as ObjectReference, False)
  EndIf
EndFunction

Function NoncombatTeleportNoWait(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Var[] akArgs = new Var[8]
  akArgs[0] = actorToTeleport as Var
  akArgs[1] = target as Var
  akArgs[2] = shouldBeInvisibleAfterTeleport as Var
  akArgs[3] = teleportInSpell as Var
  akArgs[4] = teleportInExplosion as Var
  akArgs[5] = teleportOutSpell as Var
  akArgs[6] = teleportOutExplosion as Var
  akArgs[7] = teleportOutSpellDelay as Var
  Self.CallFunctionNoWait("NoncombatTeleport", akArgs)
EndFunction

Function NoncombatTeleport(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If actorToTeleport.IsEnabled() && actorToTeleport.Is3DLoaded()
    Self.TeleportOut(actorToTeleport, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, False)
  EndIf
  If shouldBeInvisibleAfterTeleport
    Self.EnterVoidForm(actorToTeleport)
  EndIf
  actorToTeleport.MoveTo(target, 0.0, 0.0, 0.0, True, False)
  If actorToTeleport.IsDisabled()
    actorToTeleport.Enable(False)
  EndIf
  If !shouldBeInvisibleAfterTeleport
    Self.TeleportIn(actorToTeleport as ObjectReference, teleportInSpell, teleportInExplosion)
    Self.ExitVoidForm(actorToTeleport)
  EndIf
EndFunction

Actor Function CreateRuinsDemon(Int starbornDataIndex, RefCollectionAlias demonRefCollection)
  Actor actorToDuplicate = None
  If demonDuplicateID == 1 && actorToDuplicate == None
    If Companion.GetActorRef() != None
      actorToDuplicate = Companion.GetActorRef()
      demonDuplicateID += 1
    Else
      demonDuplicateID += 1
    EndIf
  EndIf
  If demonDuplicateID == 2 && actorToDuplicate == None
    If Ally.GetActorRef() != None
      actorToDuplicate = Ally.GetActorRef()
      demonDuplicateID += 1
    Else
      demonDuplicateID += 1
    EndIf
  EndIf
  If demonDuplicateID == 3
    demonDuplicateID = 0
  EndIf
  If demonDuplicateID == 0 && actorToDuplicate == None
    actorToDuplicate = player
    demonDuplicateID += 1
  EndIf
  Actor createdDemon = Self.CreateDuplicate(LC165HoldingPenMarkerRef, actorToDuplicate, StarbornData[starbornDataIndex].starbornActorRef, demonRefCollection, starbornDataIndex, False)
  createdDemon.Enable(False)
  Return createdDemon
EndFunction

Actor Function CreateDuplicate(ObjectReference spawnPoint, Actor actorToDuplicate, Actor creatingActor, RefCollectionAlias duplicateCollection, Int starbornDataIndex, Bool shouldRegisterForEvents)
  Actor duplicate = spawnPoint.PlaceDuplicateActorAtMe(actorToDuplicate, False, True, True, None, None, True)
  duplicate.RemoveFromAllFactions()
  duplicate.SetGroupFaction(None)
  duplicate.AddToFaction(LC165StarbornEnemyFaction)
  duplicate.SetValue(Aggression, CONST_Aggression_VeryAggressive as Float)
  duplicate.SetValue(Confidence, CONST_Confidence_Foolhardy as Float)
  duplicate.SetLinkedRef(actorToDuplicate as ObjectReference, LC165_StarbornDuplicateLinkKeyword, True)
  If creatingActor != None
    duplicate.SetLinkedRef(creatingActor as ObjectReference, LC165_StarbornEventActorLinkKeyword, True)
  EndIf
  If duplicateCollection != None
    duplicateCollection.AddRef(duplicate as ObjectReference)
  EndIf
  If shouldRegisterForEvents
    Self.RegisterForStarbornEvents(duplicate, starbornDataIndex)
  EndIf
  Return duplicate
EndFunction

Actor Function CreateParallelSelf(Actor actorToDuplicate, Actor creatingActor, RefCollectionAlias duplicateCollection, Int starbornDataIndex, Bool shouldRegisterForEvents)
  ObjectReference spawnPoint = Self.GetParallelSelfSpawnPoint(actorToDuplicate as ObjectReference)
  Actor duplicate = Self.CreateDuplicate(spawnPoint, actorToDuplicate, creatingActor, duplicateCollection, starbornDataIndex, shouldRegisterForEvents)
  spawnPoint.Delete()
  Return duplicate
EndFunction

ObjectReference Function GetParallelSelfSpawnPoint(ObjectReference source)
  Float[] offsets = new Float[3]
  offsets[0] = Utility.RandomFloat(CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax)
  offsets[1] = Utility.RandomFloat(CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax)
  ObjectReference spawnPoint = source.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True)
  spawnPoint.MoveToNearestNavmeshLocation()
  Return spawnPoint
EndFunction

Function CreateScriptedGraityWell(ObjectReference source)
  Self.DestroyScriptedGravityWell(None, False)
  scriptedExplosionHazard = source.PlaceAtMe(LC165_ScriptedGravWellExplosion as Form, 1, False, False, True, None, None, True)
  scriptedGravWellHazard = source.PlaceAtMe(LC165_ScriptedGravWellHazard as Form, 1, False, False, True, None, None, True)
EndFunction

Function DestroyScriptedGravityWell(Explosion explosionToSpawn, Bool shouldUpdateTimestamp)
  If scriptedGravWellHazard != None
    If explosionToSpawn == None
      If scriptedExplosionHazard != None
        scriptedExplosionHazard.Delete()
        scriptedExplosionHazard = None
      EndIf
      If scriptedGravWellHazard != None
        scriptedGravWellHazard.Delete()
        scriptedGravWellHazard = None
      EndIf
    Else
      ObjectReference myXMarker = scriptedGravWellHazard.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
      scriptedExplosionHazard.Delete()
      scriptedExplosionHazard = None
      scriptedGravWellHazard.Delete()
      scriptedGravWellHazard = None
      myXMarker.PlaceAtMe(explosionToSpawn as Form, 1, False, False, True, None, None, True)
      myXMarker.Delete()
    EndIf
    If shouldUpdateTimestamp
      scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
    EndIf
  EndIf
EndFunction

Function StartScriptedReanimate(Actor caster, Actor[] reanimateTargets, Float reanimateDelay)
  Int I = 0
  While I < reanimateTargets.Length && !caster.IsDead()
    reanimateTargets[I].PlaceAtMe(LC165_StarbornReanimateExplosion as Form, 1, False, False, True, None, None, True)
    reanimateTargets[I].Resurrect()
    reanimateTargets[I].AddSpell(LC165_AbReanimate, True)
    I += 1
    If I < reanimateTargets.Length && reanimateDelay > 0.0
      Utility.Wait(reanimateDelay)
    EndIf
  EndWhile
EndFunction

Int Function CountScriptedReanimate(Actor[] reanimateTargets)
  Int activeActorCount = 0
  Int I = 0
  While I < reanimateTargets.Length
    If !reanimateTargets[I].IsDead()
      activeActorCount += 1
    EndIf
    I += 1
  EndWhile
  Return activeActorCount
EndFunction

Function CleanupScriptedActors(Actor[] targets, Int numToCleanup, Bool shouldDisable, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Int cleanedUpCount = 0
  Int I = 0
  While I < targets.Length && (cleanedUpCount < numToCleanup || numToCleanup < 0)
    If !targets[I].IsDead() && !targets[I].IsDisabled()
      cleanedUpCount += 1
      If shouldDisable
        Self.TeleportOutNoWait(targets[I], teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, True)
      Else
        targets[I].Kill(None)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function DissolveStarborn(Actor starbornToDissolve)
  starbornToDissolve.BlockActivation(True, True)
  starbornToDissolve.AddSpell(AbStarbornDeath, True)
  Utility.Wait(CONST_DissolveVFXDelay)
  FortifyQuantumEssenceSpell.Cast(starbornToDissolve as ObjectReference, player as ObjectReference)
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  starbornToDissolve.DisableNoWait(False)
EndFunction

Function DropStarbornItem(Actor starbornToDropItem, ObjectReference itemToDrop)
  ObjectReference itemMarker = starbornToDropItem.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
  itemMarker.MoveToNearestNavmeshLocation()
  itemToDrop.MoveTo(itemMarker, 0.0, 0.0, 0.0, True, False)
  itemToDrop.SetMotionType(2, True)
  itemMarker.Delete()
EndFunction

Function RegisterForStarbornEvents(Actor currentStarborn, Int starbornDataIndex)
  currentStarborn.SetValue(LC165_StarbornMovementHealthPercentStampValue, currentStarborn.GetValuePercentage(Health))
  If StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime >= 0.0
    currentStarborn.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, 0.0)
  EndIf
  If StarbornData[starbornDataIndex].StarbornSpellCastFunctionName != ""
    Self.RegisterForRemoteEvent(currentStarborn as ScriptObject, "OnSpellCast")
  EndIf
  If StarbornData[starbornDataIndex].StarbornHitFunctionName != ""
    Self.RegisterForHitEvent(currentStarborn as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
  If StarbornData[starbornDataIndex].StarbornDyingFunctionName != ""
    Self.RegisterForRemoteEvent(currentStarborn as ScriptObject, "OnDying")
  EndIf
EndFunction

Function StartStarbornBattle(Actor currentStarborn)
  Int starbornDataIndex = StarbornData.findstruct("starbornActorRef", currentStarborn, 0)
  Var[] akArgs = new Var[2]
  akArgs[0] = currentStarborn as Var
  akArgs[1] = starbornDataIndex as Var
  Self.CallFunction(StarbornData[starbornDataIndex].StarbornBattleStartFunctionName, akArgs)
  If StarbornData[starbornDataIndex].StarbornUpdateFunctionName != ""
    Self.StartTimer(StarbornData[starbornDataIndex].StarbornTimerDelay, starbornDataIndex)
  EndIf
  MUSGenesisCombatBoss_MQ302B_A_Battles.Add()
EndFunction

Event OnTimer(Int timerID)
  If timerID < StarbornData.Length
    Var[] akArgs = new Var[1]
    akArgs[0] = timerID as Var
    Self.CallFunction(StarbornData[timerID].StarbornUpdateFunctionName, akArgs)
    If Self.GetStageDone(StarbornData[timerID].StarbornBattleEndStage)
      MUSGenesisCombatBoss_MQ302B_A_Battles.Remove()
    Else
      Self.StartTimer(StarbornData[timerID].StarbornTimerDelay, timerID)
    EndIf
  ElseIf timerID == CONST_StarbornAdversary_CheckForStateChangeTimerID
    Self.StarbornAdversaryCheckForStateChange()
    If !adversaryBattleComplete
      Self.StartTimer(CONST_StarbornAdversary_CheckForStateChangeTimerDelay, CONST_StarbornAdversary_CheckForStateChangeTimerID)
    EndIf
  ElseIf timerID == CONST_AllyArrivalTimerID
    Self.TryToTeleportAllyForArrival()
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Var[] akArgs = Self.GetEventHandlerParameterData(akTarget as Actor)
  Int index = akArgs[3] as Int
  If index >= 0
    akArgs[0] = (akAggressor as Actor) as Var
    Bool shouldReregister = Self.CallFunction(StarbornData[index].StarbornHitFunctionName, akArgs) as Bool
    If shouldReregister
      Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    EndIf
  EndIf
EndEvent

Event Actor.OnDying(Actor akSource, ObjectReference akKiller)
  Var[] akArgs = Self.GetEventHandlerParameterData(akSource)
  Int index = akArgs[3] as Int
  If index >= 0
    akArgs[0] = akKiller as Var
    Self.CallFunction(StarbornData[index].StarbornDyingFunctionName, akArgs)
  EndIf
EndEvent

Event ObjectReference.OnSpellCast(ObjectReference akSource, Form akSpell)
  Var[] akArgs = Self.GetEventHandlerParameterData(akSource as Actor)
  Int index = akArgs[3] as Int
  If index >= 0
    akArgs[0] = akSpell as Var
    Self.CallFunction(StarbornData[index].StarbornSpellCastFunctionName, akArgs)
  EndIf
  If templeInteriorInitialized && !adversaryHasShiftedAwayFromTemple
    artifactRingsRef.PlayAnimation("FXPlay01")
  EndIf
EndEvent

Var[] Function GetEventHandlerParameterData(Actor akSource)
  Var[] akArgs = new Var[4]
  akArgs[1] = akSource as Var
  Actor akEventLink = akSource.GetLinkedRef(LC165_StarbornEventActorLinkKeyword) as Actor
  If akEventLink == None
    akArgs[2] = akSource as Var
  Else
    akArgs[2] = akEventLink as Var
  EndIf
  akArgs[3] = StarbornData.findstruct("starbornActorRef", akArgs[2] as Actor, 0) as Var
  Return akArgs
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  Guard ChangeLocationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If akOldLoc == LC165BuriedTempleLocation && akNewLoc != LC165BuriedTempleLocation && player.GetCurrentLocation() != LC165BuriedTempleLocation
      Int I = 0
      While I < StarbornData.Length
        Self.CancelTimer(I)
        I += 1
      EndWhile
      MUSGenesisCombatBoss_MQ302B_A_Battles.Remove()
      ObjectReference test = Ally.GetActorRef() as ObjectReference
      Actor allyRef = Ally.GetActorRef()
      If allyRef != None && Self.GetStageDone(CONST_AllyJoinedStage) && allyRef.IsEnabled()
        SQ_Followers.SetRoleInactive(allyRef, True, False, True)
        Self.TeleportOut(allyRef, None, None, -1.0, True)
      EndIf
    ElseIf akNewLoc == LC165BuriedTempleLocation
      Int i = 0
      While i < StarbornData.Length
        If Self.GetStageDone(StarbornData[i].StarbornBattleStartStage) && !Self.GetStageDone(StarbornData[i].StarbornBattleEndStage) && StarbornData[i].StarbornUpdateFunctionName != ""
          Self.StartTimer(0.0, i)
          MUSGenesisCombatBoss_MQ302B_A_Battles.Add()
        EndIf
        i += 1
      EndWhile
      ObjectReference test = Ally.GetActorRef() as ObjectReference
      Actor allyref = Ally.GetActorRef()
      If allyref != None && Self.GetStageDone(CONST_AllyJoinedStage) && allyref.IsDisabled()
        Float[] akOffsets = new Float[3]
        akOffsets[1] = CONST_AllyRejoinDistance as Float
        ObjectReference target = player.PlaceAtMe(XMarker as Form, 1, False, False, True, akOffsets, None, True)
        target.MoveToNearestNavmeshLocation()
        allyref.MoveTo(target, 0.0, 0.0, 0.0, True, False)
        Self.TeleportIn(allyref as ObjectReference, None, None)
        allyref.EnableNoWait(False)
        SQ_Followers.SetRoleActive(allyref, True, True, 0.0, 0.0)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Unconscious(sq_parentscript source, Var[] akArgs)
  Actor targetActor = akArgs[1] as Actor
  If StarbornEngineering_RobotsActive.Find(targetActor as ObjectReference) >= 0 || StarbornEngineering_RobotsInactive.Find(targetActor as ObjectReference) >= 0
    Self.StarbornEngineeringDisableRobots()
  EndIf
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Ally(sq_parentscript source, Var[] akArgs)
  Actor targetActor = akArgs[1] as Actor
  If StarbornEngineering_RobotsActive.Find(targetActor as ObjectReference) >= 0 || StarbornEngineering_RobotsInactive.Find(targetActor as ObjectReference) >= 0
    Self.StarbornEngineeringDisableRobots()
  EndIf
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Frenzy(sq_parentscript source, Var[] akArgs)
  Actor targetActor = akArgs[1] as Actor
  If StarbornEngineering_RobotsActive.Find(targetActor as ObjectReference) >= 0 || StarbornEngineering_RobotsInactive.Find(targetActor as ObjectReference) >= 0
    Self.StarbornEngineeringDisableRobots()
  EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  If akSource == artifactActivatorRef && (akActivator == player as ObjectReference)
    artifactActivatorRef.DisableNoWait(False)
    player.AddAliasedItem(Artifact_MU as Form, MQ00_ArtifactsHolder as Alias, 1, True)
    Self.SetStage(CONST_Stage_PlayerTakesArtifactActivator)
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If akObj1 is Actor
    akObj1.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, Utility.GetCurrentRealTime())
  Else
    akObj2.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, Utility.GetCurrentRealTime())
  EndIf
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If waitingForLoadOutOfTemple
    waitingForLoadOutOfTemple = False
    Self.AwardFinalArtifactPower()
  EndIf
EndEvent

Function UpdateAndEVPIndex(Int starbornDataIndex, Spell spellToUpdate, Bool shouldAddSpell, Int starbornStateValue, Bool shouldRemoveFromPlayerFriendFaction, Bool shouldStartCombat)
  lc165questscript:starborndatum current = StarbornData[starbornDataIndex]
  Self.UpdateAndEVPActor(current.starbornActorRef, starbornDataIndex, spellToUpdate, shouldAddSpell, starbornStateValue, shouldRemoveFromPlayerFriendFaction, False)
  If current.StarbornDuplicatesCollection != None
    Actor[] currentDuplicates = current.StarbornDuplicatesCollection.GetArray() as Actor[]
    If currentDuplicates != None
      Int I = 0
      While I < currentDuplicates.Length
        If currentDuplicates[I] != current.starbornActorRef
          Self.UpdateAndEVPActor(currentDuplicates[I], starbornDataIndex, spellToUpdate, shouldAddSpell, starbornStateValue, shouldRemoveFromPlayerFriendFaction, shouldStartCombat)
        EndIf
        I += 1
      EndWhile
    EndIf
  EndIf
EndFunction

Function UpdateAndEVPActor(Actor actorToUpdate, Int starbornDataIndex, Spell spellToUpdate, Bool shouldAddSpell, Int starbornStateValue, Bool shouldRemoveFromPlayerFriendFaction, Bool shouldStartCombat)
  If spellToUpdate != None
    If shouldAddSpell
      actorToUpdate.AddSpell(spellToUpdate, True)
    Else
      actorToUpdate.RemoveSpell(spellToUpdate)
    EndIf
    Var[] akArgs = new Var[3]
    akArgs[0] = actorToUpdate as Var
    akArgs[1] = starbornDataIndex as Var
    akArgs[2] = shouldAddSpell as Var
    Self.CallFunction(StarbornData[starbornDataIndex].StarbornSwapCombatStyleFunctionName, akArgs)
  EndIf
  If starbornStateValue != -1
    actorToUpdate.SetValue(LC165_StarbornStateValue, starbornStateValue as Float)
  EndIf
  If shouldRemoveFromPlayerFriendFaction
    actorToUpdate.RemoveFromFaction(PlayerFriendFaction)
  EndIf
  If (shouldRemoveFromPlayerFriendFaction || shouldStartCombat) && !actorToUpdate.IsDead() && !actorToUpdate.IsDisabled()
    actorToUpdate.StartCombat(player as ObjectReference, False)
  EndIf
  actorToUpdate.EvaluatePackage(False)
EndFunction

Bool Function ShouldUpdateMovement(Actor actorToUpdate, Int starbornDataIndex, Float healthLossPercentage)
  Bool healthUpdate = Self.ShouldUpdateMovementDueToHealthLoss(actorToUpdate, starbornDataIndex, healthLossPercentage)
  If healthUpdate
    Return True
  Else
    Bool timeUpdate = Self.ShouldUpdateMovementDueToTime(actorToUpdate, starbornDataIndex)
    If timeUpdate
      Return True
    EndIf
  EndIf
  Return False
EndFunction

Bool Function ShouldUpdateMovementDueToHealthLoss(Actor actorToUpdate, Int starbornDataIndex, Float healthLossPercentage)
  If healthLossPercentage == -1.0
    healthLossPercentage = StarbornData[starbornDataIndex].StarbornMovementUpdate_HealthLossPercentage
  EndIf
  If healthLossPercentage > 0.0
    Float currentHealthPercentage = actorToUpdate.GetValuePercentage(Health)
    Float lastHealthPercentage = actorToUpdate.GetValue(LC165_StarbornMovementHealthPercentStampValue)
    If currentHealthPercentage < lastHealthPercentage - healthLossPercentage
      Return True
    EndIf
  EndIf
  Return False
EndFunction

Bool Function ShouldUpdateMovementDueToTime(Actor actorToUpdate, Int starbornDataIndex)
  Float currentTime = Utility.GetCurrentRealTime()
  Float timeForNextMovementUpdate = 0.0
  If StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime > 0.0
    Float reachedTargetTime = actorToUpdate.GetValue(LC165_StarbornMovementReachedTargetTimestampValue)
    If reachedTargetTime > 0.0
      If currentTime < reachedTargetTime
        actorToUpdate.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, currentTime)
        reachedTargetTime = currentTime
      EndIf
      timeForNextMovementUpdate = reachedTargetTime + StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime
    EndIf
  EndIf
  If timeForNextMovementUpdate == 0.0
    Float lastMovementUpdateTime = actorToUpdate.GetValue(LC165_StarbornMovementUpdateTimestampValue)
    If currentTime < lastMovementUpdateTime
      actorToUpdate.SetValue(LC165_StarbornMovementUpdateTimestampValue, currentTime)
      lastMovementUpdateTime = currentTime
    EndIf
    timeForNextMovementUpdate = lastMovementUpdateTime + StarbornData[starbornDataIndex].StarbornMovementUpdate_NotAtTargetTime
  EndIf
  Return currentTime >= timeForNextMovementUpdate
EndFunction

ObjectReference Function SetNewHoldPositionTargetRandom(Actor actorToUpdate, Keyword HoldPositionKeyword, RefCollectionAlias potentialHoldPositionTargetsCol, Bool shouldTeleport, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If potentialHoldPositionTargetsCol == None || potentialHoldPositionTargetsCol.GetCount() == 0
    Return None
  Else
    ObjectReference[] potentialHoldPositionTargets = potentialHoldPositionTargetsCol.GetArray()
    If potentialHoldPositionTargets.Length == 1
      Return Self.SetNewHoldPositionTarget(actorToUpdate, HoldPositionKeyword, potentialHoldPositionTargets[0], shouldTeleport, shouldBeInvisibleAfterTeleport, None, None, None, None, -1.0)
    Else
      ObjectReference currentHoldPositionTarget = actorToUpdate.GetLinkedRef(HoldPositionKeyword)
      If currentHoldPositionTarget != None
        Int currentHoldPositionTargetIndex = potentialHoldPositionTargets.find(currentHoldPositionTarget, 0)
        If currentHoldPositionTargetIndex >= 0
          potentialHoldPositionTargets.remove(currentHoldPositionTargetIndex, 1)
        EndIf
      EndIf
      Int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1)
      ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
      Return Self.SetNewHoldPositionTarget(actorToUpdate, HoldPositionKeyword, newHoldPositionTarget, shouldTeleport, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
    EndIf
  EndIf
EndFunction

ObjectReference Function SetNewHoldPositionTarget(Actor actorToUpdate, Keyword HoldPositionKeyword, ObjectReference newHoldPositionTarget, Bool shouldTeleport, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If actorToUpdate.GetLinkedRef(HoldPositionKeyword) != None && actorToUpdate.GetValue(LC165_StarbornMovementReachedTargetTimestampValue) >= 0.0
    Self.UnregisterForDistanceEvents(actorToUpdate as ScriptObject, actorToUpdate.GetLinkedRef(HoldPositionKeyword) as ScriptObject, -1)
  EndIf
  actorToUpdate.SetLinkedRef(newHoldPositionTarget, HoldPositionKeyword, True)
  If actorToUpdate.GetValue(LC165_BossHoldPositionValue) != CONST_StarbornShouldCastCombatSpellValue as Float
    actorToUpdate.SetValue(LC165_BossHoldPositionValue, 1.0 - actorToUpdate.GetValue(LC165_BossHoldPositionValue))
  EndIf
  actorToUpdate.SetValue(LC165_StarbornMovementUpdateTimestampValue, Utility.GetCurrentRealTime())
  actorToUpdate.SetValue(LC165_StarbornMovementHealthPercentStampValue, actorToUpdate.GetValuePercentage(Health))
  actorToUpdate.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, 0.0)
  If newHoldPositionTarget != None
    Self.RegisterForDistanceLessThanEvent(actorToUpdate as ScriptObject, newHoldPositionTarget as ScriptObject, CONST_StarbornAtTargetDistance as Float, 0)
  EndIf
  actorToUpdate.EvaluatePackage(False)
  If shouldTeleport && !actorToUpdate.IsDead()
    Self.CombatTeleportNoWait(actorToUpdate, newHoldPositionTarget, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
  EndIf
  Return newHoldPositionTarget
EndFunction

Function StartAllyArrivalTimer()
  ObjectReference allyArrivalMarkerChainHeadRef = AllyArrivalMarker.GetRef()
  allyArrivalMarkerChain = allyArrivalMarkerChainHeadRef.GetLinkedRefChain(None, 100)
  allyArrivalMarkerChain.insert(allyArrivalMarkerChainHeadRef, 0)
  Self.StartTimer(0.0, CONST_AllyArrivalTimerID)
EndFunction

Function TryToTeleportAllyForArrival()
  ObjectReference allyArrivalTargetRef = None
  Int I = 0
  While allyArrivalTargetRef == None && I < allyArrivalMarkerChain.Length
    If player.HasDetectionLOS(allyArrivalMarkerChain[I])
      allyArrivalTargetRef = allyArrivalMarkerChain[I]
    EndIf
    I += 1
  EndWhile
  If allyArrivalTargetRef == None && allyArrivalAttempts < CONST_AllyArrivalAttemptsMax
    allyArrivalAttempts += 1
    Self.StartTimer(CONST_AllyArrivalTimerDelay as Float, CONST_AllyArrivalTimerID)
  Else
    If allyArrivalTargetRef == None
      allyArrivalTargetRef = Game.FindClosestReferenceOfTypeFromRef(LC165_AllyArrivalMarker as Form, player as ObjectReference, 1000.0)
    EndIf
    If allyArrivalTargetRef == None
      allyArrivalTargetRef = allyArrivalMarkerChain[0]
    EndIf
    Self.NoncombatTeleport(Ally.GetActorRef(), allyArrivalTargetRef, False, None, None, None, None, -1.0)
    If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy)
      MQ302_191_Entrance_EmissaryJoin.Start()
    Else
      MQ302_191_Entrance_HunterJoin.Start()
    EndIf
  EndIf
EndFunction

Function StarbornBridgeInit(Int starbornDataIndex)
  Actor starbornBridgeRef = StarbornData[starbornDataIndex].starbornActorRef
  starbornBridgeRef.SetValue(LC165_Starborn_Bridge_CombatStyleValue, CONST_Bridge_CombatStyle_Assault as Float)
  starbornBridgePrimary = Self.StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False)
  Self.StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False)
  Self.StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False)
  Int I = 0
  Actor[] duplicates = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  While I < duplicates.Length
    duplicates[I].MoveTo(LC165ExteriorHoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
    duplicates[I].AddToFaction(PlayerFriendFaction)
    duplicates[I].EnableNoWait(False)
    I += 1
  EndWhile
EndFunction

Function StarbornBridgeStart(Actor starbornBridgeRef, Int starbornDataIndex)
  bridgeBattleState = CONST_StarbornBattleState_Bridge_Start
  bridge_WaitingForParallelSelfCast = True
  starbornBridgePrimary.SetGhost(True)
  starbornBridgePrimary.RemoveFromFaction(PlayerFriendFaction)
  Self.NoncombatTeleport(starbornBridgePrimary, starbornBridgeRef as ObjectReference, False, None, None, None, None, 0.0)
  MQ302_Battle_01_Bridge_BattleStart.Start()
  ObjectReference[] spawnPoints = StarbornBridge_InitialDuplicateSpawnPoints.GetArray()
  Actor[] duplicates = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  Int I = 1
  While I < duplicates.Length
    duplicates[I].RemoveFromFaction(PlayerFriendFaction)
    Self.CombatTeleport(duplicates[I], spawnPoints[I - 1], False, None, LC165_StarbornParallelSelfSpawnExplosion, None, None, 0.0)
    I += 1
  EndWhile
  starbornBridgePrimary.SetGhost(False)
  starbornBridgePrimary.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1.0)
  Self.UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True, False)
  bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_1
  bridge_DuplicationLineCountdown = 1
  bridge_WaitingForParallelSelfCast = False
EndFunction

Function StarbornBridgeUpdate(Int starbornDataIndex)
  If bridgeBattleState == CONST_StarbornBattleState_Bridge_RealEnemyExposed && StarbornData[starbornDataIndex].starbornActorRef.IsDead()
    bridgeBattleState = CONST_StarbornBattleState_Bridge_Complete
    If StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0
      Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage)
    EndIf
    Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
  ElseIf bridgeBattleState < CONST_StarbornBattleState_Bridge_RealEnemyExposed
    Actor[] bridgeRefs = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
    If bridgeRefs == None
      bridgeRefs = new Actor[0]
    EndIf
    Actor lastFoundDead = None
    Int I = bridgeRefs.Length - 1
    While I >= 0
      If bridgeRefs[I].IsDead()
        lastFoundDead = bridgeRefs[I]
        bridge_DeathCount += 1
        Self.TeleportOutNoWait(bridgeRefs[I], LC165_AbParallelSelfDeath, None, -1.0, True)
        StarbornData[starbornDataIndex].StarbornDuplicatesCollection.RemoveRef(bridgeRefs[I] as ObjectReference)
        bridgeRefs.remove(I, 1)
      EndIf
      I -= 1
    EndWhile
    If bridgeRefs.Length == 0
      Self.StarbornBridgeSwapInRealStarborn(lastFoundDead, starbornDataIndex)
    ElseIf bridgeRefs.Length == 1 && bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_3
      Self.StarbornBridgeSwapInRealStarborn(bridgeRefs[0], starbornDataIndex)
    ElseIf bridge_DuplicationLineCountdown >= 0
      bridge_DuplicationLineCountdown -= 1
      If bridge_DuplicationLineCountdown == 0
        bridge_DuplicationLineCountdown = -1
        I = 0
        While I < bridgeRefs.Length
          bridgeRefs[I].SayCustom(LC165_Starborn_Bridge_DuplicationLines, None, False, None)
          I += 1
        EndWhile
      EndIf
    Else
      If !bridge_WaitingForParallelSelfCast
        If bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_1 && bridge_DeathCount >= CONST_Bridge_DeathCountParallelize_2
          bridge_WaitingForParallelSelfCast = True
          Self.UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, True, CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat, False, False)
        ElseIf bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_2 && bridge_DeathCount >= CONST_Bridge_DeathCountParallelize_3
          bridge_WaitingForParallelSelfCast = True
          Self.UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, True, CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat, False, False)
        EndIf
      EndIf
      If bridgeBattleState >= CONST_StarbornBattleState_Bridge_Parallelized_1
        I = 0
        While I < bridgeRefs.Length
          Actor currentRef = bridgeRefs[I]
          Int currentRefCombatStyle = currentRef.GetValue(LC165_Starborn_Bridge_CombatStyleValue) as Int
          Bool shouldTeleport = False
          If !bridgeBoundsTriggerRef.IsInTrigger(currentRef as ObjectReference) && (!currentRef.GetParentCell() != LC165BuriedTemple03 as Bool)
            shouldTeleport = True
          ElseIf !bridgeHoldPositionTriggerRef.IsInTrigger(currentRef as ObjectReference) && bridgeHoldPositionTriggerRef.IsInTrigger(player as ObjectReference) && (currentRef.GetDistance(player as ObjectReference) > CONST_Bridge_BridgeCatchupTeleportDistance as Float)
            shouldTeleport = True
          ElseIf currentRef.GetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue) == 0.0
            shouldTeleport = True
            currentRef.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1.0)
          ElseIf Self.ShouldUpdateMovementDueToHealthLoss(bridgeRefs[I], starbornDataIndex, -1.0)
            shouldTeleport = True
            currentRef.SetValue(LC165_StarbornMovementHealthPercentStampValue, currentRef.GetValuePercentage(Health))
          EndIf
          If shouldTeleport
            If currentRefCombatStyle == CONST_Bridge_CombatStyle_Charger
              ObjectReference teleportPoint = Game.FindClosestReferenceOfAnyTypeInListFromRef(LC165_Starborn_Bridge_TeleportPointMarkerList, player as ObjectReference, CONST_StarbornBridge_TeleportMarkerSearchRadius as Float)
              If teleportPoint == None
                teleportPoint = StarbornBridge_ChargerTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_ChargerTeleportPoints.GetCount() - 1))
              EndIf
              Self.CombatTeleportNoWait(currentRef, teleportPoint, False, None, None, None, None, -1.0)
            ElseIf currentRefCombatStyle == CONST_Bridge_CombatStyle_Assault
              ObjectReference teleportpoint = StarbornBridge_AssaultTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_AssaultTeleportPoints.GetCount() - 1))
              Self.CombatTeleportNoWait(currentRef, teleportpoint, False, None, None, None, None, -1.0)
            Else
              ObjectReference teleportpoint = StarbornBridge_SniperTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_SniperTeleportPoints.GetCount() - 1))
              Self.CombatTeleportNoWait(currentRef, teleportpoint, False, None, None, None, None, -1.0)
            EndIf
          EndIf
          I += 1
        EndWhile
        If !Self.GetStageDone(CONST_Stage_BridgeStarbornParallelSelfReactStage)
          Self.SetStage(CONST_Stage_BridgeStarbornParallelSelfReactStage)
        EndIf
      EndIf
    EndIf
  EndIf
EndFunction

Function StarbornBridgeSpellCast(Form spellCast, Actor caster, Actor starbornBridgeRef, Int starbornDataIndex)
  If spellCast == LC165_Starborn_Bridge_ScriptedParallelSelfSpell as Form
    Guard BridgeParallelSelfGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If caster.GetValue(LC165_StarbornStateValue) == CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat as Float
        Self.UpdateAndEVPActor(caster, starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True, False)
        Actor duplicate = Self.StarbornBridgeSpawnParallelSelf(caster, starbornBridgeRef, starbornDataIndex, True)
        Self.UpdateAndEVPActor(duplicate, starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True, False)
        If bridge_WaitingForParallelSelfCast
          If bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_1
            bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_2
          ElseIf bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_2
            bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_3
          EndIf
          bridge_DuplicationLineCountdown = CONST_BridgeDuplicationLineCountdown_StartValue
          bridge_WaitingForParallelSelfCast = False
        EndIf
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Function StarbornBridgeDying(ObjectReference akKiller, Actor target, Actor starbornBridgeRef, Int starbornDataIndex)
  If target == starbornBridgeRef
    Self.DissolveStarborn(starbornBridgeRef)
  EndIf
EndFunction

Function StarbornBridgeSwapCombatStyle(Actor starbornBridgeRef, Int starbornDataIndex, Bool shouldCastSpell)
  Self.StarbornBridgeSetCombatStyle(starbornBridgeRef, shouldCastSpell)
EndFunction

Actor Function StarbornBridgeSpawnParallelSelf(Actor source, Actor starbornBridgeRef, Int starbornDataIndex, Bool shouldTeleportAfterCreation)
  Actor duplicate = Self.CreateDuplicate(LC165HoldingPenMarkerRef, source, starbornBridgeRef, StarbornData[starbornDataIndex].StarbornDuplicatesCollection, starbornDataIndex, True)
  Self.StarbornBridgeSelectCombatStyle(duplicate)
  Self.SetNewHoldPositionTargetRandom(duplicate, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornBridge_HoldPositionTrigger, False, False, None, None, None, None, -1.0)
  If shouldTeleportAfterCreation
    Self.CombatTeleportNearRef(duplicate, source as ObjectReference, CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax, True, False, None, LC165_StarbornParallelSelfSpawnExplosion, None, None, -1.0)
  Else
    duplicate.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1.0)
  EndIf
  Return duplicate
EndFunction

Function StarbornBridgeSelectCombatStyle(Actor actorToUpdate)
  actorToUpdate.SetValue(LC165_Starborn_Bridge_CombatStyleValue, bridge_NextCombatStyle as Float)
  bridge_NextCombatStyle = (bridge_NextCombatStyle + 1) % 3
  Self.StarbornBridgeSetCombatStyle(actorToUpdate, False)
EndFunction

Function StarbornBridgeSetCombatStyle(Actor actorToUpdate, Bool shouldCastSpell)
  Int combatStyleValue = actorToUpdate.GetValue(LC165_Starborn_Bridge_CombatStyleValue) as Int
  If shouldCastSpell
    If combatStyleValue == CONST_Bridge_CombatStyle_Charger
      actorToUpdate.SetCombatStyle(LC165_csStarbornChargerBridge_CastCombatSpell)
    ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Assault
      actorToUpdate.SetCombatStyle(LC165_csStarborn_Assault_CastCombatSpell)
    ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Sniper
      actorToUpdate.SetCombatStyle(LC165_csStarborn_Sniper_CastCombatSpell)
    EndIf
  ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Charger
    actorToUpdate.SetCombatStyle(LC165_csStarbornChargerBridge)
  ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Assault
    actorToUpdate.SetCombatStyle(csStarborn_Assault)
  ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Sniper
    actorToUpdate.SetCombatStyle(csStarborn_Sniper)
  EndIf
EndFunction

Function StarbornBridgeSwapInRealStarborn(Actor oldActor, Int starbornDataIndex)
  bridgeBattleState = CONST_StarbornBattleState_Bridge_RealEnemyExposed
  Self.TeleportOut(oldActor, None, None, -1.0, False)
  Actor starbornBridgeRef = StarbornData[starbornDataIndex].starbornActorRef
  If oldActor.IsDead()
    oldActor.DisableNoWait(False)
    Self.TeleportIn(oldActor as ObjectReference, None, None)
    starbornBridgeRef.MoveTo(oldActor as ObjectReference, 0.0, 0.0, 0.0, True, False)
    starbornBridgeRef.EnableNoWait(False)
    starbornBridgeRef.EnableNoWait(False)
    starbornBridgeRef.Kill(None)
    oldActor.Delete()
  Else
    Float healthLost = oldActor.GetBaseValue(Health) - oldActor.GetValue(Health)
    oldActor.DisableNoWait(False)
    ObjectReference teleportPoint = StarbornBridge_AssaultTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_AssaultTeleportPoints.GetCount() - 1))
    Self.TeleportIn(teleportPoint, None, None)
    starbornBridgeRef.MoveTo(teleportPoint, 0.0, 0.0, 0.0, True, False)
    starbornBridgeRef.EnableNoWait(False)
    starbornBridgeRef.DamageValue(Health, healthLost)
    starbornBridgeRef.SetCombatStyle(csStarborn_Assault)
    Self.UpdateAndEVPActor(starbornBridgeRef, starbornDataIndex, None, False, CONST_StarbornStateValue_Bridge_Normal, True, False)
    starbornBridgeRef.StartCombat(player as ObjectReference, False)
    oldActor.Delete()
  EndIf
EndFunction

Function StarbornBridgeForceRescueTeleport(Actor rescueTriggerActor)
  If StarbornData[CONST_Bridge_DataIndex].StarbornDuplicatesCollection.GetArray().find(rescueTriggerActor as ObjectReference, 0) >= 0
    rescueTriggerActor.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 0.0)
  EndIf
EndFunction

Function StarbornCourtyardStart(Actor starbornCourtyardRef, Int starbornDataIndex)
  Guard CourtyardBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    CourtyardBattleState = CONST_StarbornBattleState_Courtyard_FirstReanimateReady
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  MQ302_Battle_02_Courtyard_MassReanimate01.Start()
EndFunction

Function StarbornCourtyardUpdate(Int starbornDataIndex)
  Guard CourtyardBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor starbornCourtyardRef = StarbornData[starbornDataIndex].starbornActorRef
    If starbornCourtyardRef.IsDead()
      Self.DropStarbornItem(starbornCourtyardRef, ExteriorIDCard.GetRef())
      ExteriorIDCardFallback.GetRef().MoveTo(ExteriorIDCardFallbackSpawnPoint.GetRef(), 0.0, 0.0, 0.0, True, False)
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_Complete
      StarbornCourtyard_Navcut.DisableAll(False)
      If StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0
        Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage)
      EndIf
      Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
      Self.CleanupScriptedActors(CourtyardReanimateTargetsAll, -1, False, None, None, -1.0)
      Return 
    EndIf
    If CourtyardBattleState < CONST_StarbornBattleState_Courtyard_Normal
      If CourtyardBattleState == CONST_StarbornBattleState_Courtyard_FirstReanimateActive && Self.GetCourtyardZombiesCount() < CONST_Courtyard_SecondReanimateZombieThreshold
        CourtyardBattleState = CONST_StarbornBattleState_Courtyard_SecondReanimateReady
        MQ302_Battle_02_Courtyard_MassReanimate02.Start()
      ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_SecondReanimateActive && Self.GetCourtyardZombiesCount() < CONST_Courtyard_ThirdReanimateZombieThreshold
        CourtyardBattleState = CONST_StarbornBattleState_Courtyard_ThirdReanimateReady
        MQ302_Battle_02_Courtyard_MassReanimate03.Start()
      ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_ThirdReanimateActive
        CourtyardBattleState = CONST_StarbornBattleState_Courtyard_Normal
        Self.SetNewHoldPositionTargetRandom(starbornCourtyardRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornCourtyard_HoldPositionTargets, True, False, None, None, None, None, -1.0)
      EndIf
    ElseIf Self.ShouldUpdateMovement(starbornCourtyardRef, starbornDataIndex, -1.0)
      Self.StarbornCourtyardTryToTeleportSwapWithZombie(starbornDataIndex)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornCourtyardDying(ObjectReference akKiller, Actor target, Actor starbornCourtyardRef, Int starbornDataIndex)
  If target == starbornCourtyardRef
    Self.DissolveStarborn(starbornCourtyardRef)
  EndIf
EndFunction

Function PerformCourtyardScriptedMassReanimateNoWait()
  Self.CallFunctionNoWait("PerformCourtyardScriptedMassReanimate", None)
EndFunction

Function PerformCourtyardScriptedMassReanimate()
  Guard CourtyardBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor starbornCourtyardRef = StarbornData[CONST_Courtyard_DataIndex].starbornActorRef
    Actor[] actorsToReanimate = None
    If CourtyardBattleState == CONST_StarbornBattleState_Courtyard_Initial
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_FirstReanimateActive
      actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave01.GetArray() as Actor[]
      Self.SetStage(CONST_Courtyard_FirstReanimateActiveStage)
    ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_SecondReanimateReady
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_SecondReanimateActive
      actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave02.GetArray() as Actor[]
    ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_ThirdReanimateReady
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_ThirdReanimateActive
      actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave03.GetArray() as Actor[]
      Self.SetStage(CONST_Courtyard_ThirdReanimateActiveStage)
      Self.UpdateAndEVPActor(starbornCourtyardRef, CONST_Courtyard_DataIndex, None, False, CONST_StarbornStateValue_Courtyard_Normal, True, False)
    EndIf
    Self.StartScriptedReanimate(starbornCourtyardRef, actorsToReanimate, CONST_Courtyard_PerReanimateDelay)
    Utility.Wait(CONST_Courtyard_MassReanimateDelay as Float)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornCourtyardTryToTeleportSwapWithZombie(Int starbornDataIndex)
  Actor starbornCourtyardRef = StarbornData[starbornDataIndex].starbornActorRef
  Self.SetNewHoldPositionTargetRandom(starbornCourtyardRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornCourtyard_HoldPositionTargets, False, False, None, None, None, None, -1.0)
  Actor firstLivingCourtyardZombie = None
  Actor[] allCourtyardZombies = commonarrayfunctions.CopyAndRandomizeActorArray(CourtyardReanimateTargetsAll)
  Int I = 0
  While I < allCourtyardZombies.Length && firstLivingCourtyardZombie == None
    If !allCourtyardZombies[I].IsDead()
      firstLivingCourtyardZombie = allCourtyardZombies[I]
    EndIf
    I += 1
  EndWhile
  If firstLivingCourtyardZombie != None
    If !starbornCourtyardRef.IsDead() && !firstLivingCourtyardZombie.IsDead()
      courtyardLastSwapMarker2 = firstLivingCourtyardZombie.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
      courtyardLastSwapMarker2.MoveToNearestNavmeshLocation()
      courtyardLastSwapMarker1 = starbornCourtyardRef.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
      Self.TeleportIn(starbornCourtyardRef as ObjectReference, None, LC165_StarbornTeleportSwapExplosion)
      Self.TeleportIn(firstLivingCourtyardZombie as ObjectReference, None, LC165_StarbornTeleportSwapExplosion)
      starbornCourtyardRef.MoveTo(courtyardLastSwapMarker2, 0.0, 0.0, 0.0, True, False)
      firstLivingCourtyardZombie.MoveTo(courtyardLastSwapMarker1, 0.0, 0.0, 0.0, True, False)
      courtyardLastSwapMarker1.Delete()
      courtyardLastSwapMarker2.Delete()
    EndIf
  EndIf
EndFunction

Int Function GetCourtyardZombiesCount()
  Int count = Self.CountScriptedReanimate(CourtyardReanimateTargetsAll)
  Return count
EndFunction

Function DEBUG_KillCourtyardZombies(Int numToKill)
  Self.CleanupScriptedActors(CourtyardReanimateTargetsAll, numToKill, False, None, None, -1.0)
EndFunction

Event IDCardReader.IDReaderActivatedSuccess(idcardreader akSource, Var[] akArgs)
  If akSource == exteriorIDCardReaderRef
    Self.SetStage(CONST_Stage_ExteriorIDCardReaderUsedStage)
  EndIf
EndEvent

Function StarbornEngineeringStart(Actor starbornFireRef, Int starbornDataIndex)
  Self.SetNewHoldPositionTarget(starbornFireActorRef, StarbornData[CONST_Fire_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargetInitial.GetRef(), False, False, None, None, None, None, -1.0)
  Self.SetNewHoldPositionTarget(starbornIceActorRef, StarbornData[CONST_Ice_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargetInitial.GetRef().GetLinkedRef(None), False, False, None, None, None, None, -1.0)
  ObjectReference EngineeringGravityWellSourceMarkerInitial = StarbornEngineering_GravityWellSourceMarkerInitial.GetRef()
  Self.CreateScriptedGraityWell(EngineeringGravityWellSourceMarkerInitial)
  scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
  Utility.Wait(CONST_StarbornEngineering_InitialAppearanceDelay as Float)
  Self.DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True)
  Self.NoncombatTeleport(starbornIceActorRef, starbornIceActorRef as ObjectReference, False, None, LC165_StarbornTeleportInExplosion, None, None, -1.0)
  Self.UpdateAndEVPActor(starbornIceActorRef, CONST_Ice_DataIndex, None, False, CONST_StarbornStateValue_Engineering_Normal, True, False)
  Float[] fireMarkerOffsetValues = new Float[3]
  fireMarkerOffsetValues[2] = 2.0
  ObjectReference fireMarker = EngineeringGravityWellSourceMarkerInitial.PlaceAtMe(XMarker as Form, 1, False, False, True, fireMarkerOffsetValues, None, True)
  Self.NoncombatTeleport(starbornFireActorRef, fireMarker, False, None, LC165_StarbornTeleportInExplosion, None, None, -1.0)
  Self.UpdateAndEVPActor(starbornFireActorRef, CONST_Fire_DataIndex, None, False, CONST_StarbornStateValue_Engineering_Normal, True, False)
  fireMarker.Delete()
  MQ302_Battle_03_Engineering_BattleStart.Start()
  StarbornEngineering_GravityWellSourceMarkers.RemoveRef(EngineeringGravityWellSourceMarkerInitial)
  EngineeringGravityWellSourceMarkerInitial.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
  Actor[] EngineeringTurrets = StarbornEngineering_TurretsAll.GetArray() as Actor[]
  Int I = 0
  While I < EngineeringTurrets.Length
    EngineeringTurrets[I].SetUnconscious(False)
    I += 1
  EndWhile
  robotpodscript[] EngineeringRobotsInitial = StarbornEngineering_RobotsActive.GetArray() as robotpodscript[]
  I = 0
  While I < EngineeringRobotsInitial.Length
    EngineeringRobotsInitial[I].WakeRobotFromPod()
    EngineeringRobotsInitial[I].StartCombat(player as ObjectReference, False)
    I += 1
  EndWhile
  EngineeringBattleState = CONST_StarbornBattleState_Engineering_Normal
EndFunction

Function StarbornEngineeringUpdate(Int starbornDataIndex)
  If !starbornFireDead && starbornFireActorRef.IsDead()
    starbornFireDead = True
    If !starbornIceDead
      starbornFireHasKey = False
    EndIf
    Self.SetStage(StarbornData[CONST_Fire_DataIndex].StarbornBattleDeathStage)
  EndIf
  If !starbornIceDead && starbornIceActorRef.IsDead()
    starbornIceDead = True
    If !starbornFireDead
      starbornFireHasKey = True
    EndIf
    Self.DestroyScriptedGravityWell(None, False)
    Self.SetStage(StarbornData[CONST_Ice_DataIndex].StarbornBattleDeathStage)
  EndIf
  If starbornFireDead && starbornIceDead
    If starbornFireHasKey
      Self.DropStarbornItem(starbornFireActorRef, EngineeringKey.GetRef())
    Else
      Self.DropStarbornItem(starbornIceActorRef, EngineeringKey.GetRef())
    EndIf
    EngineeringKeyFallback.GetRef().MoveTo(EngineeringKeyFallbackSpawnPoint.GetRef(), 0.0, 0.0, 0.0, True, False)
    Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
    EngineeringBattleState = CONST_StarbornBattleState_Engineering_Complete
  EndIf
  Bool shouldUpdateFireMovement = !starbornFireDead && Self.ShouldUpdateMovement(starbornFireActorRef, CONST_Fire_DataIndex, -1.0)
  Bool shouldUpdateIceMovement = !starbornIceDead && Self.ShouldUpdateMovement(starbornIceActorRef, CONST_Ice_DataIndex, -1.0)
  If shouldUpdateFireMovement || shouldUpdateIceMovement
    ObjectReference fireHoldPositionTarget = Self.SetNewHoldPositionTargetRandom(starbornFireActorRef, StarbornData[CONST_Fire_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargets, False, False, None, None, None, None, -1.0)
    If !starbornIceDead
      Self.SetNewHoldPositionTarget(starbornIceActorRef, StarbornData[CONST_Ice_DataIndex].StarbornMovementHoldPositionKeyword, fireHoldPositionTarget.GetLinkedRef(None), False, False, None, None, None, None, -1.0)
    EndIf
  EndIf
  Float currentTime = Utility.GetCurrentRealTime()
  If currentTime < scriptedGravWellTimestamp
    scriptedGravWellTimestamp = currentTime
  EndIf
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_WaitToCreate
      Float nextGravWellTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellCastDelay
      If currentTime < nextGravWellTime
        nextGravWellTime = currentTime
      EndIf
      If currentTime >= nextGravWellTime
        starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_TryToCreate
        Self.UpdateAndEVPActor(starbornIceActorRef, CONST_Ice_DataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, True, -1, False, False)
      EndIf
    ElseIf starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_WaitToDetonate
      Float detonateTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellDetonateDelay
      If currentTime < detonateTime
        detonateTime = currentTime
      EndIf
      If currentTime >= detonateTime
        If !starbornFireDead
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_TryToDetonate
          Self.UpdateAndEVPActor(starbornFireActorRef, CONST_Fire_DataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, True, -1, False, False)
        Else
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
          Self.DestroyScriptedGravityWell(None, True)
        EndIf
      EndIf
    ElseIf starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToDetonate
      Float cleanupTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellDetonateDelay * 1.5
      If currentTime < cleanupTime
        cleanupTime = currentTime
      EndIf
      If currentTime >= cleanupTime
        starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
        Self.DestroyScriptedGravityWell(None, True)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  If !starbornEngineering_RobotsDisabled
    robotpodscript[] EngineeringRobotsActive = StarbornEngineering_RobotsActive.GetArray() as robotpodscript[]
    Int I = 0
    While I < EngineeringRobotsActive.Length
      If EngineeringRobotsActive[I].IsDead()
        StarbornEngineering_RobotsActive.RemoveRef(EngineeringRobotsActive[I] as ObjectReference)
      EndIf
      I += 1
    EndWhile
    Int robotsToActivate = CONST_StarbornEngineering_ActiveRobotCountMax - StarbornEngineering_RobotsActive.GetCount()
    If robotsToActivate > 0 && !Self.GetStageDone(CONST_Stage_EngineeringRobotReactStage)
      Self.SetStage(CONST_Stage_EngineeringRobotReactStage)
    EndIf
    While robotsToActivate > 0 && StarbornEngineering_RobotsInactive.GetCount() > 0
      robotpodscript nextRobot = StarbornEngineering_RobotsInactive.GetAt(0) as robotpodscript
      StarbornEngineering_RobotsInactive.RemoveRef(nextRobot as ObjectReference)
      StarbornEngineering_RobotsActive.AddRef(nextRobot as ObjectReference)
      nextRobot.WakeRobotFromPod()
      nextRobot.StartCombat(player as ObjectReference, False)
      robotsToActivate -= 1
    EndWhile
  EndIf
EndFunction

Function StarbornEngineeringDying(ObjectReference akKiller, Actor target, Actor starbornEngineeringRef, Int starbornDataIndex)
  If target == starbornEngineeringRef
    Self.DissolveStarborn(starbornEngineeringRef)
  EndIf
EndFunction

Function StarbornEngineeringDisableRobots()
  Self.SetStage(CONST_Stage_EngineeringHackedStage)
  StarbornEngineering_RobotsInactive.RemoveAll()
  StarbornEngineering_RobotsActive.RemoveAll()
  starbornEngineering_RobotsDisabled = True
EndFunction

Function StarbornFireSpellCast(Form spellCast, Actor caster, Actor starbornFireRef, Int starbornDataIndex)
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If spellCast == LC165_Starborn_Fire_ScriptedSupernovaSpell as Form
      Self.UpdateAndEVPActor(starbornFireRef, starbornDataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, False, -1, False, False)
      If starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToDetonate
        starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
        Self.DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornIceSpellCast(Form spellCast, Actor caster, Actor starbornIceRef, Int starbornDataIndex)
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If spellCast == LC165_Starborn_Ice_ScriptedGravityWellSpell as Form
      Self.UpdateAndEVPActor(starbornIceRef, starbornDataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, False, -1, False, False)
      If starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToCreate
        starbornEngineering_GravWellTargetPoint = Game.FindClosestReferenceOfType(LC165_Engineering_GravityWellSourceMarker as Form, player.GetPositionX(), player.GetPositionY(), player.GetPositionZ(), CONST_StarbornEngineering_GravWellCastDistance)
        scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
        If starbornEngineering_GravWellTargetPoint == None
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
        Else
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToDetonate
          Self.CreateScriptedGraityWell(starbornEngineering_GravWellTargetPoint)
          StarbornEngineering_GravityWellSourceMarkers.RemoveRef(starbornEngineering_GravWellTargetPoint)
          starbornEngineering_GravWellTargetPoint.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornFireSwapCombatStyle(Actor starbornFireRef, Int starbornDataIndex, Bool shouldCastSpell)
  If shouldCastSpell
    starbornFireRef.SetCombatStyle(LC165_csStarborn_Assault_CastCombatSpell)
  Else
    starbornFireRef.SetCombatStyle(csStarborn_Assault)
  EndIf
EndFunction

Function StarbornIceSwapCombatStyle(Actor starbornIceRef, Int starbornDataIndex, Bool shouldCastSpell)
  If shouldCastSpell
    starbornIceRef.SetCombatStyle(LC165_csStarborn_Sniper_CastCombatSpell)
  Else
    starbornIceRef.SetCombatStyle(csStarborn_Sniper)
  EndIf
EndFunction

Function CheckPetrovFailsafe()
  If MQ302BPetrov.GetActorRef().IsDead()
    PetrovsDoor.GetRef().Unlock(False)
  EndIf
EndFunction

Function PlayInitialElevatorLeverSFX()
  WwiseEvent_OBJElevatorLoadStart.Play(ElevatorTopActivator.GetRef(), None, None)
EndFunction

Function SetupElevators()
  ObjectReference elevator01PlatformHelperRef = Elevator01EnableMarker.GetRef().GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword)
  elevator01PlatformHelperRef.SetAnimationVariableFloat("CurrentPosition", 1.0)
  elevator01PlatformHelperRef.SetAnimationVariableFloat("Position", 0.0)
  elevator01PlatformHelperRef.SetAnimationVariableFloat("Speed", CONST_Elevator01Speed)
  ObjectReference elevator02PlatformHelperRef = Elevator02EnableMarker.GetRef().GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword)
  elevator02PlatformHelperRef.SetAnimationVariableFloat("CurrentPosition", 1.0)
  elevator02PlatformHelperRef.SetAnimationVariableFloat("Position", 0.0)
  elevator02PlatformHelperRef.SetAnimationVariableFloat("Speed", CONST_Elevator02Speed)
EndFunction

Function PlayElevator01NoWait()
  ObjectReference elevator01EnableMarkerRef = Elevator01EnableMarker.GetRef()
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable(False)
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).Enable(False)
  elevatorSFXID = OBJ_Elevator_Mine_Transit_LP.Play(Game.GetPlayer() as ObjectReference, None, None)
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword).PlayAnimation("Play01")
EndFunction

Function DisableElevator01()
  ObjectReference elevator01EnableMarkerRef = Elevator01EnableMarker.GetRef()
  elevator01EnableMarkerRef.DisableNoWait(False)
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).DisableNoWait(False)
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).DisableNoWait(False)
  wwiseevent.StopInstance(elevatorSFXID)
EndFunction

Function PlayElevator02NoWait()
  Self.CallFunctionNoWait("PlayElevator02", None)
EndFunction

Function PlayElevator02()
  ObjectReference elevator02EnableMarkerRef = Elevator02EnableMarker.GetRef()
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable(False)
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).Enable(False)
  elevatorSFXID = OBJ_Elevator_Mine_Transit_LP.Play(Game.GetPlayer() as ObjectReference, None, None)
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword).PlayAnimationAndWait("Play01", "Done")
  wwiseevent.StopInstance(elevatorSFXID)
  ObjectReference elevator02GateRef = Elevator02Gate.GetRef()
  elevator02GateRef.SetOpen(True)
  Int failsafe = 0
  While elevator02GateRef.GetOpenState() != CONST_OpenState_Open && failsafe < CONST_ElevatorGateOpenFailsafeCount
    failsafe += 1
    Utility.Wait(0.100000001)
  EndWhile
  ElevatorTopDoor.TryToEnable()
  ElevatorTopActivator.TryToDisable()
  ElevatorBottomDoor.TryToEnable()
  ElevatorBottomActivator.TryToDisable()
  Elevator02FinishedAnimation = True
EndFunction

Function QuickstartElevator02()
  ObjectReference elevator02EnableMarkerRef = Elevator02EnableMarker.GetRef()
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable(False)
  ObjectReference elevator02PlatformHelperRef = elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword)
  elevator02PlatformHelperRef.SetAnimationVariableFloat("Speed", 1.0)
  elevator02PlatformHelperRef.PlayAnimationAndWait("Play01", "Done")
  ObjectReference elevator02GateRef = Elevator02Gate.GetRef()
  elevator02GateRef.SetOpen(True)
  ElevatorTopDoor.TryToEnable()
  ElevatorTopActivator.TryToDisable()
  ElevatorBottomDoor.TryToEnable()
  ElevatorBottomActivator.TryToDisable()
  Elevator02FinishedAnimation = True
EndFunction

Function StarbornRuinsStart(Actor starbornRuinsRef, Int starbornDataIndex)
  MQ302_Battle_05_Ruins_BattleStart.Start()
  Actor[] initialDemons = None
  If !DEBUG_StarbornRuinsBlockDemonSpawning
    ObjectReference initialSpawnPointHead = StarbornRuins_InitialInnerDemonSpawnPointChainHead.GetRef()
    ObjectReference[] initialSpawnPoints = StarbornRuins_InitialInnerDemonSpawnPointChainHead.GetRef().GetLinkedRefChain(None, 100)
    initialSpawnPoints.insert(initialSpawnPointHead, 0)
    initialDemons = new Actor[0]
    Int i = 0
    While i < initialSpawnPoints.Length
      Actor currentDemon = Self.StarbornRuinsSpawnDemon(starbornRuinsRef, starbornDataIndex, initialSpawnPoints[i], False)
      initialDemons.add(currentDemon, 1)
      Utility.Wait(CONST_RuinsInitialSpawnDelay)
      i += 1
    EndWhile
  EndIf
  While !Self.GetStageDone(CONST_Stage_Ruins_BattleStartSceneEndedStage)
    Utility.Wait(0.100000001)
  EndWhile
  Int I = 0
  While initialDemons != None && I < initialDemons.Length
    Self.StarbornRuinsStartCombatDemon(initialDemons[I], starbornDataIndex)
    I += 1
  EndWhile
  starbornRuinsRef.Enable(False)
  starbornRuinsRef.SetValue(LC165_StarbornStateValue, CONST_StarbornStateValue_Ruins_Observing as Float)
  Self.SetRuinsObservingStateHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornRuins_ObservingHoldPositionTargets, True, True, None, None, None, None, -1.0)
  starbornRuinsRef.EvaluatePackage(False)
  starbornRuinsRef.RemoveFromFaction(PlayerFriendFaction)
  Guard RuinsBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    RuinsBattleState = CONST_StarbornBattleState_Ruins_Observing
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornRuinsUpdate(Int starbornDataIndex)
  Guard RuinsBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor starbornRuinsRef = StarbornData[starbornDataIndex].starbornActorRef
    If starbornRuinsRef.IsDead()
      If RuinsBattleState < CONST_StarbornBattleState_Ruins_Complete
        RuinsBattleState = CONST_StarbornBattleState_Ruins_Complete
        Self.CleanupScriptedActors(StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[], -1, True, None, None, -1.0)
        If StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0
          Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage)
        EndIf
        Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
      EndIf
    Else
      Bool playerIsInTrigger = starbornRuinsTriggerRef.IsInTrigger(player as ObjectReference)
      If !playerIsInTrigger || Self.ShouldUpdateMovement(starbornRuinsRef, starbornDataIndex, -1.0)
        If playerIsInTrigger && RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing
          Ruins_HitCountWhileObserving = 0
          Self.UpdateAndEVPActor(starbornRuinsRef, starbornDataIndex, None, False, CONST_StarbornStateValue_Ruins_Attacking, False, False)
          Self.SetNewHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, None, False, False, None, None, None, None, -1.0)
          Self.ExitVoidForm(starbornRuinsRef)
          RuinsBattleState = CONST_StarbornBattleState_Ruins_Attacking
        ElseIf RuinsBattleState == CONST_StarbornBattleState_Ruins_Attacking
          starbornRuinsRef.SetValue(LC165_StarbornStateValue, CONST_StarbornStateValue_Ruins_Observing as Float)
          Self.SetRuinsObservingStateHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornRuins_ObservingHoldPositionTargets, True, True, None, None, None, None, -1.0)
          starbornRuinsRef.EvaluatePackage(False)
          RuinsBattleState = CONST_StarbornBattleState_Ruins_Observing
          MQ302_Battle_05_Ruins_TeleportReaction.Start()
        EndIf
      EndIf
      If !DEBUG_StarbornRuinsBlockDemonSpawning
        Float currentTime = Utility.GetCurrentRealTime()
        RefCollectionAlias starbornRuinsDemonCollection = StarbornData[starbornDataIndex].StarbornDuplicatesCollection
        Actor[] starbornRuinsDemons = starbornRuinsDemonCollection.GetArray() as Actor[]
        If starbornRuinsDemons == None
          starbornRuinsDemons = new Actor[0]
        EndIf
        Int I = 0
        While I < starbornRuinsDemons.Length
          Actor current = starbornRuinsDemons[I]
          If current.IsDead()
            Self.TeleportOutNoWait(current, LC165_AbInnerDemonDeath, None, -1.0, True)
            starbornRuinsDemonCollection.RemoveRef(current as ObjectReference)
            starbornRuinsDemonsRespawnTimes.add(currentTime, 1)
          EndIf
          I += 1
        EndWhile
        If starbornRuinsDemonsRespawnTimes.Length > 0 && (starbornRuinsDemonsRespawnTimes[0] < currentTime || currentTime > starbornRuinsDemonsRespawnTimes[0] + CONST_RuinsDemonsRespawnDelay || starbornRuinsDemonCollection.GetCount() == 0)
          starbornRuinsDemonsRespawnTimes.remove(0, 1)
          Self.StarbornRuinsSpawnDemon(starbornRuinsRef, starbornDataIndex, None, True)
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornRuinsDying(ObjectReference akKiller, Actor target, Actor starbornRuinsRef, Int starbornDataIndex)
  If target == starbornRuinsRef
    Var[] akArgs = new Var[1]
    akArgs[0] = CONST_Ruins_DataIndex as Var
    Self.CallFunctionNoWait("StarbornRuinsUpdate", akArgs)
    Self.DissolveStarborn(starbornRuinsRef)
  EndIf
EndFunction

Bool Function StarbornRuinsHit(Actor aggressor, Actor target, Actor starbornRuinsRef, Int starbornDataIndex)
  If RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing
    Guard RuinsBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing
        Ruins_HitCountWhileObserving += 1
        If Ruins_HitCountWhileObserving >= CONST_Ruins_HitCountWhileObserving_Max
          Ruins_HitCountWhileObserving = 0
          starbornRuinsRef.SetValue(LC165_StarbornMovementUpdateTimestampValue, Utility.GetCurrentRealTime())
          Self.UpdateAndEVPActor(starbornRuinsRef, starbornDataIndex, None, False, CONST_StarbornStateValue_Ruins_Attacking, False, False)
          Self.SetNewHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, None, False, False, None, None, None, None, -1.0)
          Self.ExitVoidForm(starbornRuinsRef)
          RuinsBattleState = CONST_StarbornBattleState_Ruins_Attacking
        EndIf
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
  Return True
EndFunction

ObjectReference Function SetRuinsObservingStateHoldPositionTarget(Actor actorToUpdate, Keyword HoldPositionKeyword, RefCollectionAlias potentialHoldPositionTargetsCol, Bool shouldTeleport, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Int attempts = 0
  ObjectReference[] potentialHoldPositionTargets = potentialHoldPositionTargetsCol.GetArray()
  Int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1)
  ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
  While attempts < CONST_RuinsTargetSelectionAttemptsMax && (newHoldPositionTarget.GetDistance(player as ObjectReference) > CONST_RuinsTeleportDistanceMax as Float)
    attempts += 1
    newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1)
    newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
  EndWhile
  Return Self.SetNewHoldPositionTarget(actorToUpdate, HoldPositionKeyword, newHoldPositionTarget, shouldTeleport, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
EndFunction

Actor Function StarbornRuinsSpawnDemon(Actor starbornRuinsRef, Int starbornDataIndex, ObjectReference spawnPoint, Bool shouldStartCombatOnSpawn)
  Actor newDemon = Self.CreateRuinsDemon(starbornDataIndex, StarbornData[starbornDataIndex].StarbornDuplicatesCollection)
  If !shouldStartCombatOnSpawn
    newDemon.AddToFaction(PlayerFriendFaction)
  EndIf
  If spawnPoint != None
    Self.CombatTeleportNoWait(newDemon, spawnPoint, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0)
  Else
    Self.CombatTeleportNearPlayerNoWait(newDemon, CONST_RuinsSpawnNearPlayerDistance_Min, CONST_RuinsSpawnNearPlayerDistance_Max, True, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0)
  EndIf
  If shouldStartCombatOnSpawn
    Self.StarbornRuinsStartCombatDemon(newDemon, starbornDataIndex)
  Else
    newDemon.EvaluatePackage(False)
  EndIf
  Return newDemon
EndFunction

Function StarbornRuinsStartCombatDemon(Actor demon, Int starbornDataIndex)
  Self.UpdateAndEVPActor(demon, starbornDataIndex, None, False, CONST_StarbornStateValue_Ruins_Attacking, True, False)
EndFunction

Function SetTempleDoorState(Bool exteriorShouldBeBlocked, Bool interiorShouldBeBlocked)
  If exteriorShouldBeBlocked
    templeExteriorDoorRef.SetAnimationState("Off", False)
    templeExteriorDoorBarsRef.SetAnimationState("Off", False)
    ((templeExteriorDoorBarsRef as ObjectReference) as starborntempledoorbarsscript).SetShouldRegisterForOpenEvent(False)
  Else
    templeExteriorDoorRef.SetAnimationState("On", False)
    templeExteriorDoorBarsRef.SetAnimationState("On", False)
    ((templeExteriorDoorBarsRef as ObjectReference) as starborntempledoorbarsscript).SetShouldRegisterForOpenEvent(True)
  EndIf
  If interiorShouldBeBlocked
    templeInteriorDoorRef.SetAnimationState("Off", False)
  Else
    templeInteriorDoorRef.SetAnimationState("On", False)
  EndIf
EndFunction

Function SetupAdversaryBattleStageData()
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) && AdversaryBattleStageData_Hunter != None
    AdversaryBattleStageData = AdversaryBattleStageData_Hunter
  ElseIf Self.GetStageDone(CONST_Stage_Startup_EmissaryEnemy) && AdversaryBattleStageData_Emissary != None
    AdversaryBattleStageData = AdversaryBattleStageData_Emissary
  EndIf
EndFunction

Function InitAdversary()
  Int failsafe = 0
  While artifactActivatorRef == None && failsafe < CONST_Adversary_InitAdversaryFailsafeTimeout
    failsafe += 1
    Utility.Wait(0.100000001)
  EndWhile
  If failsafe >= CONST_Adversary_InitAdversaryFailsafeTimeout
    
  EndIf
  adversary01Ref = Adversary01.GetActorRef()
  adversary02Ref = Adversary02.GetActorRef()
  RefCollectionAlias adversaryDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection
  adversary01DuplicateRef = Self.CreateDuplicate(LC165HoldingPenMarkerRef, adversary01Ref, None, adversaryDuplicates, CONST_Adversary_DataIndex, True)
  StarbornData[CONST_Adversary_DataIndex].starbornActorRef = adversary01DuplicateRef
  Self.InitAdversaryHelper(adversary01DuplicateRef)
  adversary01DuplicateRef.EnableNoWait(False)
  StarbornAdversary_Primary.ForceRefTo(adversary01DuplicateRef as ObjectReference)
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) || Self.GetStageDone(CONST_Stage_Startup_BothEnemies)
    starbornAdversaryHunter = adversary01DuplicateRef
    StarbornAdversary_Hunter.ForceRefTo(adversary01DuplicateRef as ObjectReference)
  Else
    starbornAdversaryEmissary = adversary01DuplicateRef
    StarbornAdversary_Emissary.ForceRefTo(adversary01DuplicateRef as ObjectReference)
  EndIf
  If adversary02Ref != None
    adversary02DuplicateRef = Self.CreateDuplicate(LC165HoldingPenMarkerRef, adversary02Ref, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True)
    adversary02DuplicateRef.SetLinkedRef(adversary01DuplicateRef as ObjectReference, LC165_StarbornEventActorLinkKeyword, True)
    Self.InitAdversaryHelper(adversary02DuplicateRef)
    adversary02DuplicateRef.EnableNoWait(False)
    starbornAdversaryEmissary = adversary02DuplicateRef
    StarbornAdversary_Emissary.ForceRefTo(adversary02DuplicateRef as ObjectReference)
  EndIf
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy)
    Actor duplicate = Self.CreateDuplicate(LC165HoldingPenMarkerRef, adversary01Ref, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True)
    duplicate.SetEssential(True)
  Else
    Actor emissaryRef = None
    If adversary02Ref == None
      emissaryRef = adversary01Ref
    Else
      emissaryRef = adversary02Ref
    EndIf
    Int i = 0
    While i < CONST_Adversary_EmissaryDuplicateCount
      Actor duplicate = Self.CreateDuplicate(LC165HoldingPenMarkerRef, emissaryRef, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True)
      duplicate.SetEssential(True)
      i += 1
    EndWhile
  EndIf
  Actor[] allDuplicates = adversaryDuplicates.GetArray() as Actor[]
  Int I = 0
  While I < allDuplicates.Length
    adversaryHealthBaseTotal += allDuplicates[I].GetBaseValue(Health)
    allDuplicates[I].SetNoBleedoutRecovery(True)
    I += 1
  EndWhile
  Self.StarbornAdversaryPreloadShiftsNoWait(-1, 0)
EndFunction

Function InitAdversaryHelper(Actor adversaryRef)
  adversaryRef.Disable(False)
  adversaryRef.SetGhost(True)
  adversaryRef.SetEssential(True)
  adversaryRef.AddToFaction(PlayerFriendFaction)
  adversaryRef.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function InitTempleInterior()
  templeInteriorInitialized = True
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnSpellCast")
  Actor companionRef = Companion.GetActorRef()
  If companionRef != None
    Self.RegisterForRemoteEvent(companionRef as ScriptObject, "OnSpellCast")
  EndIf
  Actor[] followerRefs = Followers.GetArray() as Actor[]
  Int I = 0
  While followerRefs != None && I < followerRefs.Length
    Self.RegisterForRemoteEvent(followerRefs[I] as ScriptObject, "OnSpellCast")
    I += 1
  EndWhile
EndFunction

Function StarbornAdversaryTeleportInForConfrontation(Bool DEBUG_forceDispel)
  If !hasDispelledAdversaryVoidForm
    hasDispelledAdversaryVoidForm = True
    ObjectReference adversary01StartPoint = None
    ObjectReference adversary02StartPoint = None
    If adversary02Ref == None
      adversary01StartPoint = LC165AdversarySoloSceneMarkerRef
    Else
      adversary01StartPoint = LC165Adversary01SceneMarkerRef
      adversary02StartPoint = LC165Adversary02SceneMarkerRef
    EndIf
    Self.TeleportIn(adversary01StartPoint, None, None)
    adversary01DuplicateRef.MoveTo(adversary01StartPoint, 0.0, 0.0, 0.0, True, False)
    If adversary02StartPoint != None
      Utility.Wait(1.0)
      Self.TeleportIn(adversary02StartPoint, None, None)
      adversary02DuplicateRef.MoveTo(adversary02StartPoint, 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
EndFunction

Function StarbornAdversaryStart(Actor starbornAdversaryRef, Int starbornDataIndex)
  Utility.Wait(1.5)
  MUSGenesisCombatBoss_MQ302B_B_BattleFinal.Add()
  If adversary02Ref == None
    Self.NoncombatTeleport(adversary01DuplicateRef, LC165AdversarySoloCombatStartMarkerRef, False, None, None, None, None, -1.0)
  Else
    Self.NoncombatTeleport(adversary01DuplicateRef, LC165Adversary01CombatStartMarkerRef, False, None, None, None, None, -1.0)
    Self.NoncombatTeleport(adversary02DuplicateRef, LC165Adversary02CombatStartMarkerRef, False, None, None, None, None, -1.0)
  EndIf
  If starbornAdversaryHunter != None
    starbornAdversaryHunter.SetGhost(False)
    Self.UpdateAndEVPActor(starbornAdversaryHunter, starbornDataIndex, None, False, CONST_StarbornStateValue_Adversary_Normal, True, False)
  EndIf
  If starbornAdversaryEmissary != None
    starbornAdversaryEmissary.SetGhost(False)
    Self.UpdateAndEVPActor(starbornAdversaryEmissary, starbornDataIndex, None, False, CONST_StarbornStateValue_Adversary_Normal, True, False)
  EndIf
  artifactRingsRef.SetAnimationVariableFloat("fRingSpeed", CONST_ArtifactRingSpeed_DuringBattle)
  Ally.GetActorRef().StartCombat(adversary01DuplicateRef as ObjectReference, False)
  Actor[] followerRefs = Followers.GetArray() as Actor[]
  Int I = 0
  While I < followerRefs.Length
    followerRefs[I].StartCombat(adversary01DuplicateRef as ObjectReference, False)
    I += 1
  EndWhile
  Actor[] allDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  ObjectReference duplicateSpawnPoint = StarbornAdversary_InitialDuplicateSpawnPointChainHead.GetRef()
  I = 0
  While I < allDuplicates.Length
    If allDuplicates[I] != starbornAdversaryHunter && allDuplicates[I] != starbornAdversaryEmissary
      Self.TeleportIn(duplicateSpawnPoint, None, LC165_StarbornParallelSelfSpawnExplosion)
      allDuplicates[I].Enable(False)
      allDuplicates[I].MoveTo(duplicateSpawnPoint, 0.0, 0.0, 0.0, True, False)
      Self.UpdateAndEVPActor(allDuplicates[I], starbornDataIndex, None, False, CONST_StarbornStateValue_Adversary_Normal, True, False)
      duplicateSpawnPoint = duplicateSpawnPoint.GetLinkedRef(None)
    EndIf
    I += 1
  EndWhile
  Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.StarbornAdversaryPerformStateChange(CONST_StarbornAdversary_State_TempleInitial, -1.0, -1.0, None)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Self.StartTimer(CONST_StarbornAdversary_CheckForStateChangeTimerDelay, CONST_StarbornAdversary_CheckForStateChangeTimerID)
EndFunction

Function StarbornAdversaryUpdate(Int starbornDataIndex)
  If !adversaryBattleComplete
    Actor[] adversaryRefs = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
    If adversaryRefs == None
      Return 
    EndIf
    If currentAdversaryHoldPositionTargetCollection != None
      Int I = 0
      While I < adversaryRefs.Length
        Bool shouldUpdateMovementHealth = Self.ShouldUpdateMovementDueToHealthLoss(adversaryRefs[I], starbornDataIndex, -1.0)
        Bool shouldUpdateMovementTime = Self.ShouldUpdateMovementDueToTime(adversaryRefs[I], starbornDataIndex)
        Bool shouldUpdateTeleport = False
        If shouldUpdateMovementHealth && adversaryRefs[I].HasKeyword(MQEmissaryKeyword) && adversaryRefs[I].GetValue(Health) > 0.0
          shouldUpdateTeleport = True
        EndIf
        If shouldUpdateMovementHealth || shouldUpdateMovementTime
          Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
            Self.SetNewHoldPositionTargetRandom(adversaryRefs[I], StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, currentAdversaryHoldPositionTargetCollection, shouldUpdateTeleport, False, None, None, None, None, -1.0)
          EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
        EndIf
        I += 1
      EndWhile
    EndIf
    Float currentTime = Utility.GetCurrentRealTime()
    Actor primeAdversary = adversaryRefs[0]
    If primeAdversary != None && (primeAdversary.GetValue(LC165_AdversaryFleeValue) == CONST_AdversaryFleeValue_ShouldNotFlee as Float) && (AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowGravWellStage || AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowDemonStage)
      Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
        If AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowGravWellStage
          Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
            If primeAdversary != starbornAdversaryCurrentPrimary
              starbornAdversaryCurrentPrimary = primeAdversary
              starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
              Self.DestroyScriptedGravityWell(None, True)
            EndIf
            If starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_WaitToCreate
              Float nextGravWellTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellCastDelay
              If currentTime < nextGravWellTime
                nextGravWellTime = currentTime
              EndIf
              If currentTime >= nextGravWellTime
                starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_TryToCreate
                Self.UpdateAndEVPActor(primeAdversary, starbornDataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, True, -1, False, False)
              EndIf
            ElseIf starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_WaitToDetonate
              Float detonateTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellDetonateDelay
              If currentTime < detonateTime
                detonateTime = currentTime
              EndIf
              If currentTime >= detonateTime
                If primeAdversary.HasKeyword(MQHunterKeyword)
                  starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_TryToDetonate
                  Self.UpdateAndEVPActor(primeAdversary, starbornDataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, True, -1, False, False)
                Else
                  starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
                  Self.DestroyScriptedGravityWell(None, True)
                EndIf
              EndIf
            ElseIf starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToDetonate
              Float cleanupTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellDetonateDelay * 1.5
              If currentTime < cleanupTime
                cleanupTime = currentTime
              EndIf
              If currentTime >= cleanupTime
                starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
                Self.DestroyScriptedGravityWell(None, True)
              EndIf
            EndIf
          EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
        EndIf
        If AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowDemonStage
          Guard AdversaryDemonGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
            If primeAdversary != starbornAdversaryCurrentPrimary
              starbornAdversaryCurrentPrimary = primeAdversary
              starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_Waiting
            EndIf
            Actor[] adversaryDemons = StarbornAdversary_Demons.GetArray() as Actor[]
            Int i = 0
            While i < adversaryDemons.Length
              If adversaryDemons[i].IsDead()
                Self.TeleportOutNoWait(adversaryDemons[i], LC165_AbInnerDemonDeath, None, -1.0, True)
                StarbornAdversary_Demons.RemoveRef(adversaryDemons[i] as ObjectReference)
              EndIf
              i += 1
            EndWhile
            Int remainingDemons = StarbornAdversary_Demons.GetCount()
            If remainingDemons < CONST_StarbornAdversary_DemonsToSpawnTotal
              If currentTime < starbornAdversaryScriptedDemonTimestamp || currentTime >= (starbornAdversaryScriptedDemonTimestamp + CONST_StarbornAdversary_DemonCastDelay as Float)
                starbornAdversaryScriptedDemonTimestamp = currentTime
                starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_ReadyToCast
                Self.UpdateAndEVPActor(primeAdversary, starbornDataIndex, LC165_Starborn_Adversary_ScriptedInnerDemonSpell, True, -1, False, False)
              EndIf
            EndIf
          EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
        EndIf
        If AdversaryBattleStageData[adversaryBattleStageDataIndex].AddTraumaPackStage
          AdversaryBattleStageData[adversaryBattleStageDataIndex].AddTraumaPackStage = False
          If primeAdversary != starbornAdversaryCurrentPrimary
            starbornAdversaryCurrentPrimary = primeAdversary
          EndIf
          primeAdversary.AddItem(Aid_TraumaPack as Form, 1, False)
        EndIf
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    EndIf
  EndIf
EndFunction

Function StarbornAdversaryCheckForStateChange()
  If !adversaryBattleComplete
    Float adversaryHealthCurrentTotal = 0.0
    Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
    Float[] adversaryRefsCurrentHealth = new Float[adversaryRefs.Length]
    Bool potentialAdversaryRemoval = False
    Actor currentAdversaryRef = None
    Int I = 0
    While I < adversaryRefs.Length
      currentAdversaryRef = adversaryRefs[I]
      adversaryRefsCurrentHealth[I] = currentAdversaryRef.GetValue(Health)
      adversaryHealthCurrentTotal += Math.Max(adversaryRefsCurrentHealth[I], 0.0)
      If !potentialAdversaryRemoval && adversaryRefsCurrentHealth[I] <= 0.0
        potentialAdversaryRemoval = True
      EndIf
      I += 1
    EndWhile
    Float adversaryHealthCurrentPercent = adversaryHealthCurrentTotal / adversaryHealthBaseTotal
    Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If !DEBUG_AdversaryDebugMode && adversaryHealthCurrentPercent <= AdversaryBattleStageData[adversaryBattleStageDataIndex + 1].StageHealthThreshold
        Self.StarbornAdversaryPerformStateChange(-1, adversaryHealthCurrentPercent, adversaryHealthCurrentTotal, None)
      ElseIf potentialAdversaryRemoval
        I = 0
        While I < adversaryRefs.Length
          If adversaryRefsCurrentHealth[I] <= 0.0
            If adversaryRefs.Length >= 2
              Actor adversaryToRemove = adversaryRefs[I]
              adversaryToRemove.KillEssential(None)
              Self.TeleportOutNoWait(adversaryToRemove, LC165_AbParallelSelfDeath, None, -1.0, True)
              StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.RemoveRef(adversaryToRemove as ObjectReference)
              adversaryRefs.remove(I, 1)
              adversaryRefsCurrentHealth.remove(I, 1)
              I -= 1
            EndIf
          EndIf
          I += 1
        EndWhile
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Function StarbornAdversaryPerformStateChange(Int forcedState, Float adversaryHealthCurrentPercent, Float adversaryHealthCurrentTotal, ObjectReference distortion)
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  Int adversaryBattlePreviousStageDataIndex = adversaryBattleStageDataIndex
  safeToForceAdversaryShift = False
  If forcedState >= 0
    adversaryBattleStageDataIndex = forcedState
  ElseIf adversaryHealthCurrentPercent >= 0.0
    Bool shouldStopAndExecute = False
    While !shouldStopAndExecute && adversaryBattleStageDataIndex < AdversaryBattleStageData.Length - 1 && adversaryHealthCurrentPercent <= AdversaryBattleStageData[adversaryBattleStageDataIndex + 1].StageHealthThreshold
      adversaryBattleStageDataIndex += 1
      If AdversaryBattleStageData[adversaryBattleStageDataIndex].MustExecute || AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold > 0.0
        shouldStopAndExecute = True
      EndIf
    EndWhile
  Else
    Return 
  EndIf
  Actor primeAdversary = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetAt(0) as Actor
  If AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].AllowGravWellStage
    primeAdversary.RemoveSpell(LC165_Starborn_Fire_ScriptedSupernovaSpell)
    primeAdversary.RemoveSpell(LC165_Starborn_Ice_ScriptedGravityWellSpell)
    Self.StarbornAdversarySwapCombatStyle(primeAdversary, CONST_Adversary_DataIndex, False)
    Self.DestroyScriptedGravityWell(None, True)
  EndIf
  If AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].AllowDemonStage
    primeAdversary.RemoveSpell(LC165_Starborn_Adversary_ScriptedInnerDemonSpell)
    Self.StarbornAdversaryKillDemons()
    Self.StarbornAdversarySwapCombatStyle(primeAdversary, CONST_Adversary_DataIndex, False)
  EndIf
  If AdversaryBattleStageData[adversaryBattleStageDataIndex].IsAdversaryEndStage
    StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.RemoveRef(primeAdversary as ObjectReference)
    Self.DestroyScriptedGravityWell(None, True)
    Self.StarbornAdversaryKillDemons()
    Self.StarbornAdversaryPlayDeathSceneAndWait(primeAdversary)
  EndIf
  Int StageToSetOnEnterBeforeShifting = AdversaryBattleStageData[adversaryBattleStageDataIndex].StageToSetOnEnterBeforeShifting
  If StageToSetOnEnterBeforeShifting >= 0
    Self.SetStage(StageToSetOnEnterBeforeShifting)
  EndIf
  Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    String ShiftToTrigger = AdversaryBattleStageData[adversaryBattleStageDataIndex].ShiftToTrigger
    String FunctionToCallDuringShift = AdversaryBattleStageData[adversaryBattleStageDataIndex].FunctionToCallDuringShift
    If ShiftToTrigger != ""
      selfAsShiftingScript.ShiftTo(ShiftToTrigger, FunctionToCallDuringShift, distortion, -1, None)
      StarbornAdversary_ActiveDistortion.Clear()
      Self.StarbornAdversaryPreloadShiftsNoWait(adversaryBattlePreviousStageDataIndex, adversaryBattleStageDataIndex)
      stageToSetOnNextShift = -1
    EndIf
    If AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold > 0.0
      Float backstopHealthTotal = AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold * adversaryHealthBaseTotal
      Float backstopHealthAdd = Math.Max(backstopHealthTotal - adversaryHealthCurrentTotal, 0.0)
      Float backstopHealthAddPerRef = backstopHealthAdd / adversaryRefs.Length as Float
      If backstopHealthAdd == 0.0
        
      Else
        adversaryRefs = commonarrayfunctions.SortRefsByValue(adversaryRefs as ObjectReference[], Health) as Actor[]
        Int ArrayLength = adversaryRefs.Length
        Actor[] reversedAdversaries = new Actor[ArrayLength]
        Float[] reversedHealth = new Float[ArrayLength]
        Int I = 0
        While I < ArrayLength
          reversedAdversaries[ArrayLength - I - 1] = adversaryRefs[I]
          reversedHealth[ArrayLength - I - 1] = adversaryRefs[I].GetValue(Health)
          I += 1
        EndWhile
        adversaryRefs = reversedAdversaries
        Float[] adversaryRefsCurrentHealth = reversedHealth
        adversaryHealthCurrentTotal = 0.0
        I = 0
        While I < adversaryRefsCurrentHealth.Length
          adversaryHealthCurrentTotal += Math.Max(adversaryRefsCurrentHealth[I], 0.0)
          I += 1
        EndWhile
        I = 0
        While I < adversaryRefs.Length
          Float currentHealthBase = adversaryRefs[I].GetBaseValue(Health)
          Float currentHealthLoss = 0.0
          Float healthRestoreRequiredToZero = 0.0
          If adversaryRefsCurrentHealth[I] >= 0.0
            currentHealthLoss = currentHealthBase - adversaryRefsCurrentHealth[I]
          Else
            currentHealthLoss = currentHealthBase
            healthRestoreRequiredToZero = Math.Abs(adversaryRefsCurrentHealth[I])
          EndIf
          If currentHealthLoss >= backstopHealthAddPerRef
            adversaryRefs[I].RestoreValue(Health, healthRestoreRequiredToZero + backstopHealthAddPerRef)
            backstopHealthAdd -= backstopHealthAddPerRef
          Else
            adversaryRefs[I].RestoreValue(Health, currentHealthLoss)
            backstopHealthAdd -= currentHealthLoss
            Int adversariesRemaining = adversaryRefs.Length - I - 1
            If adversariesRemaining > 0
              backstopHealthAddPerRef = backstopHealthAdd / adversariesRemaining as Float
            EndIf
          EndIf
          I += 1
        EndWhile
        Float adversaryHealthNewTotal = 0.0
        I = 0
        While I < adversaryRefsCurrentHealth.Length
          Float newCurrentHealth = adversaryRefs[I].GetValue(Health)
          adversaryHealthNewTotal += newCurrentHealth
          I += 1
        EndWhile
      EndIf
    EndIf
    If ShiftToTrigger != ""
      selfAsShiftingScript.ShiftAdversary(ShiftToTrigger)
      adversaryLastShiftIndex = adversaryBattleStageDataIndex
      safeToForceAdversaryShift = True
    EndIf
    Int StageToSetOnEnterAfterShifting = AdversaryBattleStageData[adversaryBattleStageDataIndex].StageToSetOnEnterAfterShifting
    If StageToSetOnEnterAfterShifting >= 0
      Self.SetStageNoWait(StageToSetOnEnterAfterShifting)
    EndIf
    If adversaryBattleStageDataIndex == AdversaryBattleStageData.Length - 1
      adversaryBattleComplete = True
    Else
      RefCollectionAlias holdPositionCollection = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionMarkers
      If holdPositionCollection != None
        currentAdversaryHoldPositionTargetCollection = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionMarkers
      EndIf
      Keyword newHoldPositionKeyword = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionKeyword
      If newHoldPositionKeyword != None
        StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword = newHoldPositionKeyword
      EndIf
      Bool currentlyHasKeyword = AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].IsAdversaryFleeStage
      Bool shouldHaveKeyword = AdversaryBattleStageData[adversaryBattleStageDataIndex].IsAdversaryFleeStage
      If currentlyHasKeyword != shouldHaveKeyword
        Int i = 0
        While i < adversaryRefs.Length
          Actor currentAdversaryRef = adversaryRefs[i]
          If shouldHaveKeyword
            currentAdversaryRef.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldFleeWithRun as Float)
            Self.RegisterForHitEvent(currentAdversaryRef as ScriptObject, None, None, None, -1, -1, -1, -1, True)
          Else
            currentAdversaryRef.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldNotFlee as Float)
            Self.UnregisterForHitEvent(currentAdversaryRef as ScriptObject, None, None, None, -1, -1, -1, -1, True)
          EndIf
          i += 1
        EndWhile
      EndIf
      Self.StarbornAdversaryUpdateAllHoldPositionLinks(AdversaryBattleStageData[adversaryBattleStageDataIndex].ShouldUseHoldPreferred)
      Spell SpellToAddOnEnter = AdversaryBattleStageData[adversaryBattleStageDataIndex].SpellToAddOnEnter
      If SpellToAddOnEnter != None
        primeAdversary.AddSpell(SpellToAddOnEnter, True)
      EndIf
    EndIf
    selfAsShiftingScript.WaitForAdversaryUpdateToFinish()
    safeToForceAdversaryShift = False
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornAdversaryPreloadShiftsNoWait(Int previousStage, Int currentStage)
  If previousStage >= 0
    String priorShiftName = AdversaryBattleStageData[previousStage].ShiftToTrigger
    String currentShiftName = AdversaryBattleStageData[currentStage].ShiftToTrigger
    If priorShiftName != "" && priorShiftName != currentShiftName
      ObjectReference previousStageEnableMarker = selfAsShiftingScript.GetShiftEnableParentMarker(priorShiftName)
      If previousStageEnableMarker != None
        previousStageEnableMarker.DisableNoWait(False)
      EndIf
    EndIf
  EndIf
  Int I = currentStage
  Int shiftsPreloaded = 0
  ObjectReference lastShiftPreloadedMarker = None
  While I < AdversaryBattleStageData.Length && shiftsPreloaded < CONST_StarbornAdversary_ShiftsToLoad
    String potentialShift = AdversaryBattleStageData[I].ShiftToTrigger
    If potentialShift != ""
      ObjectReference potentialEnableParentMarker = selfAsShiftingScript.GetShiftEnableParentMarker(potentialShift)
      If potentialEnableParentMarker != None && potentialEnableParentMarker != lastShiftPreloadedMarker
        If I == currentStage
          lastShiftPreloadedMarker = potentialEnableParentMarker
        Else
          potentialEnableParentMarker.EnableNoWait(False)
          lastShiftPreloadedMarker = potentialEnableParentMarker
          shiftsPreloaded += 1
        EndIf
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function StarbornAdversarySwapCombatStyle(Actor starbornAdversaryRef, Int starbornDataIndex, Bool shouldCastSpell)
  If shouldCastSpell
    If starbornAdversaryRef.HasKeyword(MQHunterKeyword)
      starbornAdversaryRef.SetCombatStyle(LC165_csStarborn_MQHunter_CastCombatSpell)
    Else
      starbornAdversaryRef.SetCombatStyle(LC165_csStarborn_MQEmissary_CastCombatSpell)
    EndIf
  ElseIf starbornAdversaryRef.HasKeyword(MQHunterKeyword)
    starbornAdversaryRef.SetCombatStyle(csStarborn_MQHunter)
  Else
    starbornAdversaryRef.SetCombatStyle(csStarborn_MQEmissary)
  EndIf
EndFunction

Function StarbornAdversaryForceState(Int newState, ObjectReference distortion)
  Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If adversaryBattleStageDataIndex > newState
      
    ElseIf adversaryBattleStageDataIndex == newState
      
    Else
      Self.StarbornAdversaryPerformStateChange(newState, -1.0, -1.0, distortion)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StarbornAdversaryForceStateAdvance()
  Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.StarbornAdversaryPerformStateChange(adversaryBattleStageDataIndex + 1, -1.0, -1.0, None)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ForceAdversaryShift(String shiftName)
  Int failsafe = 0
  While !safeToForceAdversaryShift && failsafe < CONST_ForceAdversaryShiftFailsafe
    Utility.Wait(0.25)
    failsafe += 1
  EndWhile
  If safeToForceAdversaryShift
    selfAsShiftingScript.UpdateAdversary(shiftName, 0.0)
  EndIf
EndFunction

Function StarbornAdversaryShiftingTriggerEntered(lc165adversaryshiftingtriggerscript sourceTrigger, Actor triggerActor, ObjectReference distortion)
  If triggerActor != None
    Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If triggerActor == player
        If sourceTrigger.ShouldShiftPlayer
          Int lastShiftIndex = AdversaryBattleStageData.rfindstruct("ShiftToTrigger", sourceTrigger.shiftName, -1)
          If lastShiftIndex < 0
            
          Else
            Self.StarbornAdversaryForceState(lastShiftIndex + 1, distortion)
          EndIf
        EndIf
      ElseIf triggerActor == Companion.GetActorRef() || triggerActor == Ally.GetActorRef()
        If sourceTrigger.ShouldShiftPlayer
          triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion as Form, 1, False, False, True, None, None, True)
          triggerActor.MoveTo(LC165AllyHoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
        EndIf
      ElseIf StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.Find(triggerActor as ObjectReference) >= 0
        If sourceTrigger.ShouldShiftAdversary
          Int lastshiftindex = AdversaryBattleStageData.rfindstruct("ShiftToTrigger", sourceTrigger.shiftName, -1)
          If lastshiftindex < 0
            
          ElseIf adversaryLastShiftIndex <= lastshiftindex
            triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion as Form, 1, False, False, True, None, None, True)
            triggerActor.AddKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
            triggerActor.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
            Actor[] allDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
            Bool allInaccessible = True
            Int I = 0
            While I < allDuplicates.Length && allInaccessible
              allInaccessible = allDuplicates[I].HasKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
              I += 1
            EndWhile
            If allInaccessible
              StarbornAdversary_ActiveDistortion.ForceRefTo(sourceTrigger.GetLinkedRef(None))
            EndIf
          EndIf
        EndIf
      ElseIf sourceTrigger.ShouldShiftOtherActors
        If sourceTrigger.ShouldPlayVFXForOtherActors
          triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion as Form, 1, False, False, True, None, None, True)
        EndIf
        triggerActor.DisableNoWait(False)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Function StarbornAdversaryUpdateAllHoldPositionLinks(Bool ShouldUseHoldPreferred)
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  Int I = 0
  While I < adversaryRefs.Length
    Actor current = adversaryRefs[I]
    Int j = 0
    While j < StarbornMovementHoldPositionKeywords.Length
      current.SetLinkedRef(None, StarbornMovementHoldPositionKeywords[j], True)
      j += 1
    EndWhile
    If ShouldUseHoldPreferred
      current.AddKeyword(LC165_BossHoldPosition_PreferredKeyword)
    Else
      current.RemoveKeyword(LC165_BossHoldPosition_PreferredKeyword)
    EndIf
    Keyword HoldPositionKeyword = StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword
    Self.SetNewHoldPositionTargetRandom(current, HoldPositionKeyword, currentAdversaryHoldPositionTargetCollection, False, False, None, None, None, None, -1.0)
    I += 1
  EndWhile
EndFunction

Function StarbornAdversarySpellCast(Form spellCast, Actor caster, Actor starbornAdversaryRef, Int starbornDataIndex)
  If spellCast == LC165_Starborn_Ice_ScriptedGravityWellSpell as Form
    caster.RemoveSpell(LC165_Starborn_Ice_ScriptedGravityWellSpell)
    Self.StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False)
    Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToCreate
        scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
        starbornAdversary_GravWellTargetPoint = Game.FindClosestReferenceOfType(LC165_Adversary_GravityWellSourceMarker as Form, player.GetPositionX(), player.GetPositionY(), player.GetPositionZ(), CONST_StarbornAdversary_GravWellCastDistance)
        If starbornAdversary_GravWellTargetPoint == None
          starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
        Else
          starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToDetonate
          Self.CreateScriptedGraityWell(starbornAdversary_GravWellTargetPoint)
          StarbornAdversary_GravityWellSourceMarkers.RemoveRef(starbornAdversary_GravWellTargetPoint)
          starbornAdversary_GravWellTargetPoint.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
        EndIf
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  ElseIf spellCast == LC165_Starborn_Fire_ScriptedSupernovaSpell as Form
    caster.RemoveSpell(LC165_Starborn_Fire_ScriptedSupernovaSpell)
    Self.StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False)
    Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToDetonate
        starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
        Self.DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  ElseIf spellCast == LC165_Starborn_Adversary_ScriptedInnerDemonSpell as Form
    caster.RemoveSpell(LC165_Starborn_Adversary_ScriptedInnerDemonSpell)
    Self.StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False)
    Guard AdversaryDemonGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If starbornAdversaryDemonState == CONST_StarbornAdversary_DemonState_ReadyToCast
        starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_Waiting
        If !starbornAdversaryHasSpawnedInitialDemons
          starbornAdversaryHasSpawnedInitialDemons = True
          ObjectReference[] starbornAdversaryInitialDemonSpawnPoints = StarbornAdversary_NASAMuseum_InitialDemonSpawnPoints.GetArray()
          Int I = 0
          While I < CONST_StarbornAdversary_DemonsToSpawnTotal
            Self.StarbornAdversarySpawnDemon(caster, starbornAdversaryInitialDemonSpawnPoints[I])
            I += 1
          EndWhile
        Else
          Int i = 0
          While i < CONST_StarbornAdversary_DemonsToSpawnPerCastMax && StarbornAdversary_Demons.GetCount() < CONST_StarbornAdversary_DemonsToSpawnTotal
            Self.StarbornAdversarySpawnDemon(caster, None)
            i += 1
          EndWhile
        EndIf
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Bool Function StarbornAdversaryHit(Actor aggressor, Actor target, Actor starbornAdversaryRef, Int starbornDataIndex)
  target.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldFleeWithHoldPosition as Float)
  target.EvaluatePackage(False)
EndFunction

Function StarbornAdversarySetZeroGActive()
  Guard AdversaryZeroGGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If !adversaryCompletedZeroGPhase
      artifactZeroGExplosion = artifactActivatorRef.PlaceAtMe(ArtifactPower_AntiGravityField as Form, 1, False, False, True, None, None, True)
      Self.SetVascoZeroGInactive(True)
      LC165BuriedTemple03.SetGravityScale(0.0)
      ObjectReference[] zeroGDisableObjects = StarbornAdversary_ZeroGDisableObjects.GetArray()
      Int i = 0
      While i < zeroGDisableObjects.Length
        zeroGDisableObjects[i].DisableNoWait(False)
        i += 1
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  ObjectReference[] zeroGImpulseObjects = StarbornAdversary_ZeroGImpulseObjects.GetArray()
  Int I = 0
  While I < zeroGImpulseObjects.Length
    zeroGImpulseObjects[I].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), (zeroGImpulseObjects[I].GetMass() * Utility.RandomInt(1, 2) as Float) * 0.25)
    I += 1
  EndWhile
EndFunction

Function StarbornAdversarySetZeroGInactive()
  Bool adversaryCompletedZeroGPhaseThisCall = False
  Guard AdversaryZeroGGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If !adversaryCompletedZeroGPhase
      LC165BuriedTemple03.SetGravityScale(CONST_Gravity_MasadaIII)
      Self.SetVascoZeroGInactive(False)
      adversaryCompletedZeroGPhase = True
      adversaryCompletedZeroGPhaseThisCall = True
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  If adversaryCompletedZeroGPhaseThisCall
    Self.CallFunctionNoWait("StarbornAdversarySetZeroGInactiveNoWait", None)
  EndIf
EndFunction

Function SetVascoZeroGInactive(Bool shouldBeInactive)
  Actor[] followerRefs = Followers.GetArray() as Actor[]
  If followerRefs != None
    Int I = 0
    While I < followerRefs.Length
      vascoshutdownzerogscript VascoRef = followerRefs[I] as vascoshutdownzerogscript
      If VascoRef != None
        If shouldBeInactive
          VascoRef.ShutDown()
        Else
          VascoRef.StartUp()
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction

Function StarbornAdversarySetZeroGInactiveNoWait()
  Self.UnregisterForRemoteEvent(player as ScriptObject, "OnSpellCast")
  Actor companionRef = Companion.GetActorRef()
  If companionRef != None
    Self.UnregisterForRemoteEvent(companionRef as ScriptObject, "OnSpellCast")
  EndIf
  Actor[] followerRefs = Followers.GetArray() as Actor[]
  Int I = 0
  While followerRefs != None && I < followerRefs.Length
    Self.UnregisterForRemoteEvent(followerRefs[I] as ScriptObject, "OnSpellCast")
    I += 1
  EndWhile
  ObjectReference[] zeroGDisableObjects = StarbornAdversary_ZeroGDisableObjects.GetArray()
  I = 0
  While I < zeroGDisableObjects.Length
    zeroGDisableObjects[I].EnableNoWait(False)
    I += 1
  EndWhile
EndFunction

Function StarbornAdversaryShiftAwayFromTemple()
  Self.StarbornAdversarySetZeroGInactive()
  Self.SetArtifactStage(4)
  adversaryHasShiftedAwayFromTemple = True
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) || Self.GetStageDone(CONST_Stage_Startup_BothEnemies)
    StarbornAdversary_Astral_Dancers.EnableAll(False)
  EndIf
EndFunction

Function StarbornAdversaryTeleportInNishina()
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  If adversaryRefs != None
    Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      ObjectReference nextTeleportPoint = StarbornAdversary_Nishina_TeleportMarkerChainHead.GetRef()
      Int I = 0
      While I < adversaryRefs.Length
        Self.SetNewHoldPositionTarget(adversaryRefs[I], StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword, nextTeleportPoint, True, False, None, None, None, None, -1.0)
        nextTeleportPoint = nextTeleportPoint.GetLinkedRef(None)
        I += 1
      EndWhile
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Actor Function StarbornAdversarySpawnDemon(Actor caster, ObjectReference spawnPoint)
  Actor demon = Self.CreateRuinsDemon(CONST_Adversary_DataIndex, StarbornAdversary_Demons)
  If spawnPoint == None
    Self.CombatTeleportNearRefNoWait(demon, caster as ObjectReference, CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax, True, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0)
  Else
    Self.CombatTeleportNearRefNoWait(demon, spawnPoint, 0.0, 0.0, True, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0)
  EndIf
EndFunction

Function StarbornAdversaryKillDemons()
  Self.CleanupScriptedActors(StarbornAdversary_Demons.GetArray() as Actor[], -1, True, None, None, -1.0)
EndFunction

Function StarbornAdversaryUpdateAdversaryActors()
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  If adversaryRefs != None && adversaryRefs.Length >= 1
    If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy)
      StarbornAdversary_Hunter.ForceRefTo(adversaryRefs[0] as ObjectReference)
    ElseIf Self.GetStageDone(CONST_Stage_Startup_EmissaryEnemy)
      StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[0] as ObjectReference)
    ElseIf adversaryRefs[0].HasKeyword(MQHunterKeyword)
      StarbornAdversary_Hunter.ForceRefTo(adversaryRefs[0] as ObjectReference)
      If adversaryRefs.Length >= 2
        StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[1] as ObjectReference)
      Else
        StarbornAdversary_Emissary.Clear()
      EndIf
    Else
      StarbornAdversary_Hunter.Clear()
      StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[0] as ObjectReference)
    EndIf
  EndIf
EndFunction

Function StarbornAdversaryPlayDeathSceneAndWait(Actor deathSceneActor)
  MQ302_Battle_06_Adversary_Museum_Arrival.Stop()
  deathSceneActor.DispelSpell(AIPower_VoidForm)
  deathSceneActor.DispelSpell(LC165_Scripted_VoidFormAb)
  If deathSceneActor.HasKeyword(MQHunterKeyword)
    StarbornAdversary_Hunter.ForceRefTo(deathSceneActor as ObjectReference)
    MQ302_Battle_06_Adversary_HunterDeath.Start()
  Else
    StarbornAdversary_Emissary.ForceRefTo(deathSceneActor as ObjectReference)
    MQ302_Battle_06_Adversary_EmissaryDeath.Start()
  EndIf
  Self.StarbornAdversaryMoveAndKillAdversary()
  Int failsafe = 0
  While !Self.GetStageDone(CONST_Adversary_DeathSceneCompletedStage) && failsafe < CONST_Adversary_DeathSceneFailsafeTimeout
    Utility.Wait(0.100000001)
    failsafe += 1
  EndWhile
  deathSceneActor.BlockActivation(True, True)
  deathSceneActor.KillEssential(None)
  Utility.Wait(2.0)
  WwiseEvent_ShakeController_p75_p75_03.Play(player as ObjectReference, None, None)
EndFunction

Function StarbornAdversaryMoveAndKillAdversary()
  adversary01Ref.MoveTo(StarbornAdversary_DeathMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  adversary01Ref.Enable(False)
  adversary01Ref.KillEssential(player)
  If adversary02Ref != None
    adversary02Ref.MoveTo(StarbornAdversary_DeathMarker02.GetRef(), 0.0, 0.0, 0.0, True, False)
    adversary02Ref.Enable(False)
    adversary02Ref.KillEssential(player)
  EndIf
  artifactRingsRef.SetAnimationVariableFloat("fRingSpeed", CONST_ArtifactRingSpeed_AfterBattle)
EndFunction

Function StarbornAdversaryEnd(Bool adversarySurrendered)
  MUSGenesisCombatBoss_MQ302B_B_BattleFinal.Remove()
  If !adversarySurrendered
    Self.StarbornAdversaryMoveAndKillAdversary()
  EndIf
EndFunction

Function StarbornAdversarySurrenderTeleport(Scene starbornAdversarySurrenderScene)
  Var[] akArgs = new Var[1]
  akArgs[0] = starbornAdversarySurrenderScene as Var
  Self.CallFunctionNoWait("StarbornAdversarySurrenderTeleportRef", akArgs)
EndFunction

Function StarbornAdversarySurrenderTeleportRef(Scene starbornAdversarySurrenderScene)
  If adversary01DuplicateRef != None
    adversary01DuplicateRef.SetGhost(True)
    Self.TeleportOutNoWait(adversary01DuplicateRef, None, None, -1.0, False)
  EndIf
  If adversary02DuplicateRef != None
    adversary02DuplicateRef.SetGhost(True)
    Self.TeleportOutNoWait(adversary02DuplicateRef, None, None, -1.0, False)
  EndIf
  Int failsafe = 0
  While starbornAdversarySurrenderScene.IsPlaying() && failsafe < CONST_StarbornAdversarySurrenderSceneFailsafe
    Utility.Wait(0.100000001)
    failsafe += 1
  EndWhile
  If adversary01DuplicateRef != None
    adversary01DuplicateRef.DisableNoWait(False)
  EndIf
  If adversary02DuplicateRef != None
    adversary02DuplicateRef.DisableNoWait(False)
  EndIf
EndFunction

Function StarbornAdversaryRescueCheck()
  If adversary01Ref.GetDistance(artifactActivatorRef) > CONST_StarbornAdversaryRescueDistance as Float
    adversary01Ref.RemoveItem(Spacesuit_Starborn_Companion_PlayerOrFollower as Form, 100, False, None)
    adversary01Ref.RemoveAllItems(Game.GetPlayer() as ObjectReference, False, False)
  EndIf
  If adversary02Ref != None && (adversary02Ref.GetDistance(artifactActivatorRef) > CONST_StarbornAdversaryRescueDistance as Float)
    adversary02Ref.RemoveItem(Spacesuit_Starborn_Companion_PlayerOrFollower as Form, 100, False, None)
    adversary02Ref.RemoveAllItems(Game.GetPlayer() as ObjectReference, False, False)
  EndIf
EndFunction

Function SetArtifactStageNoWait(Int stage)
  Var[] akArgs = new Var[1]
  akArgs[0] = stage as Var
  Self.CallFunctionNoWait("SetArtifactStage", akArgs)
EndFunction

Function SetArtifactStage(Int stage)
  If stage == 0
    artifactRingsRef.PlayAnimation("Reset")
  ElseIf stage == 1
    
  ElseIf stage == 2
    artifactRingsRef.PlayAnimation("Play01")
  ElseIf stage == 3
    artifactRingsRef.PlayAnimation("Play03")
  ElseIf stage == 4
    artifactRingsRef.PlayAnimation("Play04")
  ElseIf stage == 5
    ArtifactCollision.DisableAll(False)
    ArtifactRingsAudioMarker.TryToDisable()
    artifactRingsRef.PlayAnimationAndWait("Close", "AnimationComplete")
    artifactPlatformRef.PlayAnimation("Play01")
    artifactActivatorRef.BlockActivation(False, False)
  EndIf
EndFunction

Function TakeFinalArtifact()
  waitingForLoadOutOfTemple = True
  Self.RegisterForMenuOpenCloseEvent("LoadingMenu")
  Game.FadeOutGame(True, True, 0.0, 0.5, True)
  Utility.Wait(0.5)
  WwiseEvent_AMBArtifactVisionX.Play(player as ObjectReference, None, None)
  Game.PlayBinkNoWait("PowerVision_PhasedTime.bk2", False, False, True, True, False, True)
  selfAsShiftingScript.ShiftTo("TeleportOut", "", None, -1, None)
EndFunction

Function AwardFinalArtifactPower()
  Utility.Wait(CONST_AwardFinalArtifactPowerDelay)
  ArtifactPower_GrantSpell_Phased_Time.Cast(player as ObjectReference, player as ObjectReference)
  (SBPowerCollectionActivator.GetRef() as sbpowercollectionactivatorscript).PlayerReceivePower()
  Self.SetStage(CONST_Stage_Complete)
EndFunction

Function Cleanup()
  player = None
  selfAsSpaceQuestScript = None
  selfAsShiftingScript = None
  scriptedGravWellHazard = None
  scriptedExplosionHazard = None
  bridgeBoundsTriggerRef = None
  bridgeHoldPositionTriggerRef = None
  bridgeCharger = None
  bridgeLastHit = None
  CourtyardReanimateTargetsAll = None
  CourtyardReanimateTargetsRandomized = None
  courtyardLastSwapMarker1 = None
  courtyardLastSwapMarker2 = None
  exteriorIDCardReaderRef = None
  starbornFireActorRef = None
  starbornIceActorRef = None
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    starbornEngineering_GravWellTargetPoint = None
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  If LC165EnableLayer != None
    LC165EnableLayer.Delete()
  EndIf
  starbornRuinsTriggerRef = None
  templeExteriorDoorRef = None
  templeExteriorDoorBarsRef = None
  templeInteriorDoorRef = None
  adversary01Ref = None
  adversary02Ref = None
  adversary01DuplicateRef = None
  adversary02DuplicateRef = None
  starbornAdversaryPrimary = None
  starbornAdversaryCurrentPrimary = None
  starbornAdversaryHunter = None
  starbornAdversaryEmissary = None
  currentAdversaryHoldPositionTargetCollection = None
  artifactZeroGExplosion = None
  artifactActivatorRef = None
  artifactRingsRef = None
  artifactPlatformRef = None
  Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function SetPlayerControlsEnabled(Bool enableControls)
  If LC165EnableLayer == None
    LC165EnableLayer = inputenablelayer.Create()
  EndIf
  LC165EnableLayer.EnableMovement(enableControls)
  LC165EnableLayer.EnableFighting(enableControls)
  LC165EnableLayer.EnableSneaking(enableControls)
  LC165EnableLayer.EnableFarTravel(enableControls)
  LC165EnableLayer.EnableFastTravel(enableControls)
  LC165EnableLayer.EnableGravJump(enableControls)
EndFunction

Function DEBUG_TestAdversary(Int index, Bool shouldAllowFurtherShifting)
  DEBUG_AdversaryDebugMode = !shouldAllowFurtherShifting
  If !Self.GetStageDone(20) && !Self.GetStageDone(21)
    Self.SetStage(22)
  EndIf
  Self.SetStage(9)
  Self.StarbornAdversaryTeleportInForConfrontation(False)
  Self.SetStage(1120)
  Self.StarbornAdversaryForceState(index, None)
EndFunction

Function DEBUG_KillAdversaries()
  adversary01Ref.DamageValue(Health, 1000000.0)
  Actor[] duplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
  Int I = 0
  While I < duplicates.Length
    duplicates[I].DamageValue(Health, 1000000.0)
    I += 1
  EndWhile
EndFunction

Function DEBUG_StarbornRuinsBlockSpawning()
  DEBUG_StarbornRuinsBlockDemonSpawning = True
EndFunction

Function DEBUG_MoveToPlayer(ObjectReference ref)
  ref.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugCamera(Actor ID)
  Game.SetCameraTarget(ID)
EndFunction
