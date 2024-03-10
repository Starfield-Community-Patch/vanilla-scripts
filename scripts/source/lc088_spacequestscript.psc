ScriptName LC088_SpaceQuestScript Extends Quest
{ Quest script for LC088_Space, the Space portion of the Crimson Fleet Final Battle. }

;-- Variables ---------------------------------------
Int CF_Main_AllEnemiesDefeatedCount_4 = 15
Int CF_Main_ReinforcementTriggerCount_1 = 4
Int CF_Main_ReinforcementTriggerCount_2 = 6
Int CF_Main_ReinforcementTriggerCount_3 = 8
Int CONST_AILevelMod_Hard = 2 Const
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
Int CONST_DockingPermission_Any = 0 Const
Int CONST_DockingPermission_Never = 4 Const
Int CONST_EncounterID_Alpha = 1 Const
Int CONST_EncounterID_Beta = 2 Const
Int CONST_EncounterID_Gamma = 3 Const
Int CONST_EncounterID_Main = 4 Const
Int CONST_EncounterID_Skirmish = 0 Const
Int CONST_LC082_DisableCF07TrafficManagerStage = 40 Const
Int CONST_LC088KeyStage_Complete = 1100 Const
Int CONST_LC088VigilanceStage_Complete = 1100 Const
Int CONST_NearDistance_Close = 0 Const
Int CONST_NearDistance_Long = 3 Const
Int CONST_NearDistance_Moderate = 2 Const
Int CONST_NearDistance_Short = 1 Const
Int CONST_NearFacing_AwayLarge = 3 Const
Int CONST_NearFacing_AwaySmall = 2 Const
Int CONST_NearFacing_Random = -2 Const
Int CONST_NearFacing_TowardLarge = 1 Const
Int CONST_NearFacing_TowardSmall = 0 Const
Int CONST_NearPosition_Above = 3 Const
Int CONST_NearPosition_Behind = 2 Const
Int CONST_NearPosition_Below = 4 Const
Int CONST_NearPosition_DeadAhead = -1 Const
Int CONST_NearPosition_ForwardTight = 0 Const
Int CONST_NearPosition_ForwardWide = 1 Const
Int CONST_NearPosition_Left = 5 Const
Int CONST_NearPosition_Right = 6 Const
Float CONST_ReinforcementForwardVelocityPercent = 0.75 Const
Int CONST_ReinforcementMaxDistanceFromFallback = 10000 Const
Int CONST_SDAlliesForwardShiftDistance_Batteries = 1000 Const
Int CONST_SDAlliesForwardShiftDistance_Main = 0 Const
Int CONST_SDAlliesMax_Beta = 4 Const
Int CONST_SDAlliesMax_Gamma = 5 Const
Int CONST_SDAlliesMax_Main = 6 Const
Int CONST_SDBatteryMapMarkerHeadingOffsetDistance = 1000 Const
Float CONST_SDEnemiesMainDelay_Max = 2.0 Const
Float CONST_SDEnemiesMainDelay_Min = 0.5 Const
Float CONST_SDFleetEnableDelayMax = 0.400000006 Const
Float CONST_SDFleetEnableDelayMin = 0.200000003 Const
Float CONST_SDFleetEnableDelayVigilance = 1.0 Const
Int CONST_SDState_Failed = 1 Const
Int CONST_Stage_CF_AllEscortsDefeated = 175 Const
Int CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance = 179 Const
Int CONST_Stage_CF_DisplayQTsToRemaining = 173 Const
Int CONST_Stage_CF_DockedWithVigilance = 190 Const
Int CONST_Stage_CF_MainReady = 150 Const
Int CONST_Stage_CF_PlayerSidesWithCF = 100 Const
Int CONST_Stage_CF_Quickstart = 11 Const
Int CONST_Stage_CF_Reinforcements1 = 165 Const
Int CONST_Stage_CF_Reinforcements2 = 169 Const
Int CONST_Stage_CF_Reinforcements3 = 170 Const
Int CONST_Stage_CF_Skip = 40 Const
Int CONST_Stage_CF_StartAlpha = 120 Const
Int CONST_Stage_CF_StartBeta = 130 Const
Int CONST_Stage_CF_StartGamma = 140 Const
Int CONST_Stage_CF_StartMain = 160 Const
Int CONST_Stage_CF_StartMainDone = 161 Const
Int CONST_Stage_CF_UndockedWithVigilanceAfterCompleting = 195 Const
Int CONST_Stage_CF_VigilanceInvulnerable = 163 Const
Int CONST_Stage_PlayerSetupDone = 32 Const
Int CONST_Stage_SD_CompletedAlpha = 228 Const
Int CONST_Stage_SD_CompletedBeta = 238 Const
Int CONST_Stage_SD_CompletedGamma = 248 Const
Int CONST_Stage_SD_CompletedGammaSceneDone = 249 Const
Int CONST_Stage_SD_DockedWithKey = 290 Const
Int CONST_Stage_SD_MainBattleCompleted = 270 Const
Int CONST_Stage_SD_PlayerSidesWithSD = 200 Const
Int CONST_Stage_SD_Quickstart = 12 Const
Int CONST_Stage_SD_Reinforcements3 = 265 Const
Int CONST_Stage_SD_Skip = 45 Const
Int CONST_Stage_SD_StartAlpha = 220 Const
Int CONST_Stage_SD_StartBeta = 230 Const
Int CONST_Stage_SD_StartGamma = 240 Const
Int CONST_Stage_SD_StartMain = 260 Const
Int CONST_Stage_SD_StartMainDone = 261 Const
Int CONST_Stage_SD_UndockedWithKeyAfterCompleting = 295 Const
Int CONST_VigilanceDockingLimit = 3 Const
Int CONST_VigilanceInvulnerableMessageTimerDelay = 10 Const
Int CONST_VigilanceInvulnerableMessageTimerID = 2 Const
Int CONST_VigilanceInvulnerableSceneTimerID = 1 Const
Float CONST_VigilanceInvulnerableSceneWaitDelay = 20.0 Const
Float CONST_VigilanceShieldDamageDelayPerIncrement = 0.100000001 Const
Int CONST_VigilanceShieldDamageIncrements = 60 Const
Int CONST_VigilanceShieldDamagePerIncrement = 85 Const
Int CONST_VigilanceShieldSystemMaxDamage = 10000 Const
Int CONST_WaitForQuestStartupFailsafeMax = 120 Const
Location DBAlphaSpaceCellLoc
Location DBBetaSpaceCellLoc
Location DBGammaSpaceCellLoc
Location KeySpaceCellLoc
inputenablelayer LC088SpaceEnableLayer
Bool Main_MusicOverrideActive
Int Main_ReinforcementWavesTriggered
Int SD_LastBatteryDestroyedID
Int SD_Main_AllEnemiesDefeatedCount_4 = 0
Int SD_Main_ReinforcementTriggerCount_1 = 0
Int SD_Main_ReinforcementTriggerCount_2 = 0
Int SD_Main_ReinforcementTriggerCount_3 = 0
Location VigilanceSpaceCellLoc
Scene currentSpaceScene
spaceshipreference keyRef
Actor playerRef
Bool questStartupFinished
spaceshipreference vigilanceRef
Bool waitingForPlayerToSit

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ReinforcementsGuard
Guard SpaceSceneGuard

;-- Properties --------------------------------------
Group QuestProperties
  spaceshipbase Property DEBUG_PlayerShipCF Auto Const mandatory
  spaceshipbase Property DEBUG_PlayerShipSD Auto Const mandatory
EndGroup

Group AutofillProperties
  Quest Property LC082 Auto Const mandatory
  Quest Property LC088_Vigilance Auto Const mandatory
  Quest Property LC088_Key Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  LocationAlias Property KeySpaceCellLocation Auto Const mandatory
  LocationAlias Property VigilanceSpaceCellLocation Auto Const mandatory
  LocationAlias Property DBAlphaSpaceCellLocation Auto Const mandatory
  LocationAlias Property DBBetaSpaceCellLocation Auto Const mandatory
  LocationAlias Property DBGammaSpaceCellLocation Auto Const mandatory
  ReferenceAlias Property KeyAlias Auto Const mandatory
  ReferenceAlias Property Vigilance Auto Const mandatory
  ReferenceAlias Property Player Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_RokovShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_MathisShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_NaevaShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_AdlerShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_HuanShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_EstelleShip Auto Const mandatory
  RefCollectionAlias Property CF_Captains_All Auto Const mandatory
  ReferenceAlias Property SD_ToftShip Auto Const mandatory
  ReferenceAlias Property SD_ArchangelShip Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Group Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryAlpha Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryBeta Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryGamma Auto Const mandatory
  ReferenceAlias Property KeyMapMarker Auto Const mandatory
  ReferenceAlias Property VigilanceEnableMarkerCF07 Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryAlphaMapMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryBetaMapMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryGammaMapMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryAlphaProjectileSourceMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryBetaProjectileSourceMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryGammaProjectileSourceMarker Auto Const mandatory
  ReferenceAlias Property VigilanceArrivalMarker Auto Const mandatory
  ReferenceAlias Property VigilanceTrafficMarker Auto Const mandatory
  ReferenceAlias Property KeyTrafficMarker Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property StationTheKey_CFMainEnableMarker Auto Const mandatory
  ReferenceAlias Property KeyTurretsEnableMarker Auto Const mandatory
  RefCollectionAlias Property KeyTurrets Auto Const mandatory
  RefCollectionAlias Property IncidentalDialogueBlockedCollection Auto Const mandatory
  RefCollectionAlias Property CF_Allies_All Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Skirmish Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Alpha Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Beta Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Gamma Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Main Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Main_Reinforcements Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Main_FallbackReinforcements Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_All Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Skirmish Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Alpha Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Beta Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Gamma Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Main Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Main_Reinforcements_1 Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Main_Reinforcements_2 Auto Const mandatory
  RefCollectionAlias Property GenericShipsAll Auto Const mandatory
  RefCollectionAlias Property SD_Allies_All Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Skirmish Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Alpha Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Beta Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Gamma Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Main_SysDefFleet Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_All Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Skirmish Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Alpha Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Beta Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Gamma Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Main Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Main_Reinforcements_1 Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Main_Reinforcements_2 Auto Const mandatory
  ReferenceAlias Property SD_BatteryDestroyedSpeaker Auto Const mandatory
  ReferenceAlias Property SD_Alpha_ArrivalPointMarkerChainHead Auto Const mandatory
  ReferenceAlias Property SD_Beta_ArrivalPointMarkerChainHead Auto Const mandatory
  ReferenceAlias Property SD_Gamma_ArrivalPointMarkerChainHead Auto Const mandatory
  ReferenceAlias Property SD_Main_ArrivalPointMarkerChainHead Auto Const mandatory
  RefCollectionAlias Property GammaShipsAll Auto Const mandatory
  GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  GlobalVariable Property LC088SpaceMainEnemiesKilled Auto Const mandatory
  Faction Property PlayerFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property DockingPermission Auto Const mandatory
  ActorValue Property ShieldHealth Auto Const mandatory
  ActorValue Property ShipSystemEngineHealth Auto Const mandatory
  ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
  ActorValue Property SpaceshipMainEnginePower Auto Const mandatory
  ActorValue Property SpaceshipShieldPower Auto Const mandatory
  ActorValue Property HideShipFromHUDValue Auto Const mandatory
  Keyword Property CF05_JadeSwanShipKeyword Auto Const mandatory
  Keyword Property LC088_Space_CF_LinkToFormationKeyword Auto Const mandatory
  Keyword Property LC088_Space_CF_CaptainsDockingLinkToVigilance Auto Const mandatory
  Keyword Property LC088_Space_SD_ReinforcementDockedWithKeyKeyword Auto Const mandatory
  Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory
  Scene Property LC088_Space_SD_225_BatteryDestroyed Auto Const mandatory
  Scene Property LC088_Space_SD_226_BatteryPhaseComplete Auto Const mandatory
  Spell Property LC088_DefensiveBatteryRegenSpell Auto Const mandatory
  Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
  Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
  Perk Property LC088_Space_VigilanceDamageReductionPerk Auto Const mandatory
  Perk Property Skill_Piloting Auto Const mandatory
  Potion Property ShipRepairKit Auto Const mandatory
  FormList Property LC088_Space_QuickstartCrewList Auto Const mandatory
  Message Property LC088_Space_VigilanceShieldsImpenetrableMessage Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_CF08SpaceBattle Auto Const mandatory
  Static Property XMarkerHeading Auto Const mandatory
  ObjectReference Property scDebugStartOriginMarker Auto Const mandatory
  ObjectReference Property TheKey_DataCoreAnalyzer_EnableMarkerRef Auto Const mandatory
  ObjectReference Property TheKey_DataCoreAnalyzer_DisableMarkerRef Auto Const mandatory
  ReferenceAlias Property TheKey_DataCoreAnalyzer Auto Const mandatory
  ObjectReference Property LC082_DataCoreAnalyzer_DisableMarkerRef Auto Const mandatory
  ObjectReference Property LC082_DataCoreAnalyzer_EnableMarkerRef Auto Const mandatory
  ReferenceAlias Property LC082_DataCoreAnalyzer Auto Const mandatory
  VisualEffect Property LC088_Space_DefensiveBatteriesFireOnVigilance Auto Const mandatory
  GlobalVariable Property LC088_Space_UseNewDefensiveBatteryFireVFX Auto Const mandatory
  GlobalVariable Property LC088_Space_DefensiveBatteryFireToShieldDegenDelay Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  playerRef = Game.GetPlayer()
  keyRef = KeyAlias.GetShipRef()
  vigilanceRef = Vigilance.GetShipRef()
  KeySpaceCellLoc = KeySpaceCellLocation.GetLocation()
  VigilanceSpaceCellLoc = VigilanceSpaceCellLocation.GetLocation()
  DBAlphaSpaceCellLoc = DBAlphaSpaceCellLocation.GetLocation()
  DBBetaSpaceCellLoc = DBBetaSpaceCellLocation.GetLocation()
  DBGammaSpaceCellLoc = DBGammaSpaceCellLocation.GetLocation()
  CF_Allies_All.AddRefCollection(CF_Allies_Skirmish)
  CF_Allies_All.AddRefCollection(CF_Allies_Alpha)
  CF_Allies_All.AddRefCollection(CF_Allies_Beta)
  CF_Allies_All.AddRefCollection(CF_Allies_Gamma)
  CF_Allies_All.AddRefCollection(CF_Allies_Main)
  IncidentalDialogueBlockedCollection.AddRefCollection(CF_Allies_All)
  CF_Enemies_All.AddRefCollection(CF_Enemies_Skirmish)
  CF_Enemies_All.AddRefCollection(CF_Enemies_Alpha)
  CF_Enemies_All.AddRefCollection(CF_Enemies_Beta)
  CF_Enemies_All.AddRefCollection(CF_Enemies_Gamma)
  CF_Enemies_All.AddRefCollection(CF_Enemies_Main)
  IncidentalDialogueBlockedCollection.AddRefCollection(CF_Enemies_All)
  SD_Allies_All.AddRefCollection(SD_Allies_Alpha)
  SD_Allies_All.AddRefCollection(SD_Allies_Beta)
  SD_Allies_All.AddRefCollection(SD_Allies_Gamma)
  SD_Allies_All.AddRefCollection(SD_Allies_Main_SysDefFleet)
  IncidentalDialogueBlockedCollection.AddRefCollection(SD_Allies_All)
  SD_Enemies_All.AddRefCollection(SD_Enemies_Skirmish)
  SD_Enemies_All.AddRefCollection(SD_Enemies_Alpha)
  SD_Enemies_All.AddRefCollection(SD_Enemies_Beta)
  SD_Enemies_All.AddRefCollection(SD_Enemies_Gamma)
  SD_Enemies_All.AddRefCollection(SD_Enemies_Main)
  IncidentalDialogueBlockedCollection.AddRefCollection(SD_Enemies_All)
  GenericShipsAll.AddRefCollection(CF_Allies_All)
  GenericShipsAll.AddRefCollection(CF_Enemies_All)
  GenericShipsAll.AddRefCollection(SD_Allies_All)
  GenericShipsAll.AddRefCollection(SD_Enemies_All)
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipDock")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock")
  Self.RegisterForRemoteEvent(CF_Enemies_Main as ScriptObject, "OnDeath")
  Self.RegisterForRemoteEvent(SD_Enemies_Main as ScriptObject, "OnDeath")
  Self.SetDockingEnabled(keyRef, False)
  Self.SetDockingEnabled(vigilanceRef, False)
  VigilanceTrafficMarker.TryToDisable()
  StationTheKey_CFMainEnableMarker.TryToDisable()
  KeyTurretsEnableMarker.TryToEnable()
  CF_Allies_Skirmish.EnableAll(False)
  CF_Enemies_Skirmish.EnableAll(False)
  If CF_SysDefShutdown.GetValue() != CONST_SDState_Failed as Float
    SD_Allies_Skirmish.EnableAll(False)
    SD_Enemies_Skirmish.EnableAll(False)
    LC082.SetStage(CONST_LC082_DisableCF07TrafficManagerStage)
  EndIf
  Self.InitAllCaptainEvents()
  Int I = 0
  ObjectReference[] cfEnemyShips = CF_Enemies_All.GetArray()
  While I < cfEnemyShips.Length
    cfEnemyShips[I].SetValue(DockingPermission, CONST_DockingPermission_Never as Float)
    I += 1
  EndWhile
  I = 0
  ObjectReference[] sdEnemyShips = SD_Enemies_All.GetArray()
  While I < sdEnemyShips.Length
    sdEnemyShips[I].SetValue(DockingPermission, CONST_DockingPermission_Never as Float)
    I += 1
  EndWhile
  questStartupFinished = True
EndEvent

Function WaitForQuestStartup()
  Int failsafe = 0
  While !questStartupFinished && failsafe < CONST_WaitForQuestStartupFailsafeMax
    failsafe += 1
    Utility.Wait(0.5)
  EndWhile
EndFunction

Function InitAllCaptainEvents()
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, CF_Captain_RokovShip)
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, CF_Captain_MathisShip)
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, CF_Captain_AdlerShip)
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, CF_Captain_HuanShip)
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, CF_Captain_EstelleShip)
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Naeva.GetValueInt(), CONST_CaptainActiveStage_Naeva, CF_Captain_NaevaShip)
EndFunction

Function InitCaptainEvent(Int captainState, Int captainActiveStage, ReferenceAlias captainShip)
  spaceshipreference captainShipRef = captainShip.GetShipRef()
  If captainState == CONST_CaptainState_Active
    Self.SetStage(captainActiveStage)
    CF_Captains_All.AddRef(captainShipRef as ObjectReference)
    captainShipRef.AddToFaction(CrimeFactionCrimsonFleet)
    captainShipRef.EnableNoWait(False)
    captainShipRef.InstantDock(keyRef as ObjectReference)
  Else
    captainShipRef.DisableNoWait(False)
  EndIf
EndFunction

Function SetupAllCaptainEvents()
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, CF_Captain_RokovShip, None)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, CF_Captain_MathisShip, CF_Allies_Alpha)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, CF_Captain_AdlerShip, None)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, CF_Captain_HuanShip, CF_Allies_Gamma)
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, CF_Captain_EstelleShip, CF_Allies_Beta)
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    Self.SetupCaptainEvent(CrimsonFleetCaptainState_Naeva.GetValueInt(), CONST_CaptainActiveStage_Naeva, CF_Captain_NaevaShip, None)
  Else
    spaceshipreference naevaShip = CF_Captain_NaevaShip.GetShipRef()
    naevaShip.DisableNoWait(False)
    CF_Captains_All.RemoveRef(naevaShip as ObjectReference)
  EndIf
EndFunction

Function SetupCaptainEvent(Int captainState, Int captainActiveStage, ReferenceAlias captainShip, RefCollectionAlias cfAlliesCollection)
  spaceshipreference captainShipRef = captainShip.GetShipRef()
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    If captainState == CONST_CaptainState_Active
      CF_Allies_All.AddRef(captainShipRef as ObjectReference)
      CF_Allies_Main.AddRef(captainShipRef as ObjectReference)
      IncidentalDialogueBlockedCollection.AddRef(captainShipRef as ObjectReference)
      captainShipRef.IgnoreFriendlyHits(True)
      If cfAlliesCollection != None
        cfAlliesCollection.AddRef(captainShipRef as ObjectReference)
        CF_Allies_Main_Reinforcements.AddRef(captainShipRef as ObjectReference)
      EndIf
    ElseIf cfAlliesCollection != None && CF_Allies_Main_FallbackReinforcements.GetCount() > 0
      spaceshipreference nextFallback = CF_Allies_Main_FallbackReinforcements.GetAt(0) as spaceshipreference
      CF_Allies_Main_FallbackReinforcements.RemoveRef(nextFallback as ObjectReference)
      CF_Allies_All.AddRef(nextFallback as ObjectReference)
      CF_Allies_Main.AddRef(nextFallback as ObjectReference)
      CF_Allies_Main_Reinforcements.AddRef(nextFallback as ObjectReference)
      IncidentalDialogueBlockedCollection.AddRef(nextFallback as ObjectReference)
      nextFallback.IgnoreFriendlyHits(True)
    EndIf
  ElseIf captainState == CONST_CaptainState_Active
    captainShipRef.SetEssential(False)
    SD_Enemies_All.AddRef(captainShipRef as ObjectReference)
    If cfAlliesCollection == None
      SD_Enemies_Main.AddRef(captainShipRef as ObjectReference)
      captainShipRef.InstantUndock()
      captainShipRef.MoveTo(captainShipRef.GetLinkedRef(LC088_Space_CF_LinkToFormationKeyword), 0.0, 0.0, 0.0, True, False)
    Else
      SD_Enemies_Main_Reinforcements_1.AddRef(captainShipRef as ObjectReference)
    EndIf
  EndIf
EndFunction

Function DisableAllCaptainShips()
  CF_Captain_RokovShip.TryToDisable()
  CF_Captain_MathisShip.TryToDisable()
  CF_Captain_AdlerShip.TryToDisable()
  CF_Captain_HuanShip.TryToDisable()
  CF_Captain_EstelleShip.TryToDisable()
  CF_Captain_NaevaShip.TryToDisable()
EndFunction

Function SetupDefensiveBatteries()
  Self.SetupDefensiveBattery(DefensiveBatteryAlpha.GetShipRef())
  Self.SetupDefensiveBattery(DefensiveBatteryBeta.GetShipRef())
  Self.SetupDefensiveBattery(DefensiveBatteryGamma.GetShipRef())
  If Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD)
    ObjectReference alphaHeadingRef = DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None)
    alphaHeadingRef.SetPosition(alphaHeadingRef.GetPositionX(), alphaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance as Float, alphaHeadingRef.GetPositionZ())
    ObjectReference betaHeadingRef = DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None)
    betaHeadingRef.SetPosition(betaHeadingRef.GetPositionX(), betaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance as Float, betaHeadingRef.GetPositionZ())
    ObjectReference gammaHeadingRef = DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None)
    gammaHeadingRef.SetPosition(gammaHeadingRef.GetPositionX(), gammaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance as Float, gammaHeadingRef.GetPositionZ())
  EndIf
EndFunction

Function SetupDefensiveBattery(spaceshipreference battery)
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    battery.SetEssential(True)
    battery.SetNoBleedoutRecovery(True)
    battery.EnablePartRepair(ShipSystemShieldsHealth, False)
    battery.EnablePartRepair(SpaceshipShieldPower, False)
    battery.DamageValue(ShieldHealth, 10000.0)
    battery.DamageValue(Health, 10000.0)
  Else
    battery.SetEssential(False)
  EndIf
EndFunction

Function SetupKeyTurrets()
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    CF_Allies_All.AddRefCollection(KeyTurrets)
    CF_Allies_Main.AddRefCollection(KeyTurrets)
  Else
    SD_Enemies_All.AddRefCollection(KeyTurrets)
    SD_Enemies_Main.AddRefCollection(KeyTurrets)
  EndIf
EndFunction

Function IgnoreAlliedFriendlyHits()
  RefCollectionAlias allyCollection = None
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    allyCollection = CF_Allies_All
  Else
    allyCollection = SD_Allies_All
  EndIf
  Int I = 0
  Int count = allyCollection.GetCount()
  While I < count
    (allyCollection.GetAt(I) as spaceshipreference).IgnoreFriendlyHits(True)
    I += 1
  EndWhile
EndFunction

Function CleanupCF05JadeSwan()
  ObjectReference[] jadeSwanShips = PlayerShip.GetRef().FindAllReferencesWithKeyword(CF05_JadeSwanShipKeyword as Form, 100000.0)
  Int I = 0
  While I < jadeSwanShips.Length
    If jadeSwanShips[I].IsCreated()
      jadeSwanShips[I].DisableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function RegisterForLoadScreenEvent()
  Self.RegisterForMenuOpenCloseEvent("LoadingMenu")
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLocation, Location akNewLocation)
  If Self.GetStageDone(CONST_Stage_CF_Skip) || Self.GetStageDone(CONST_Stage_SD_Skip)
    
  ElseIf !Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) && !Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD)
    If akNewLocation == KeySpaceCellLoc
      Self.SetStage(CONST_Stage_CF_PlayerSidesWithCF)
    ElseIf akNewLocation == VigilanceSpaceCellLoc && CF_SysDefShutdown.GetValueInt() == 0
      Self.SetStage(CONST_Stage_SD_PlayerSidesWithSD)
    EndIf
  EndIf
  If akNewLocation == KeySpaceCellLoc
    If Main_MusicOverrideActive
      MUSGenesisCombatBoss_CF08SpaceBattle.Add()
    ElseIf Self.GetStageDone(CONST_Stage_CF_MainReady) && !Self.GetStageDone(CONST_Stage_CF_StartMainDone) || Self.GetStageDone(CONST_Stage_SD_CompletedGammaSceneDone) && !Self.GetStageDone(CONST_Stage_SD_StartMainDone)
      Self.Main_SetPlayerControlsEnabled(False)
    EndIf
  ElseIf Main_MusicOverrideActive
    MUSGenesisCombatBoss_CF08SpaceBattle.Remove()
  EndIf
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If !abOpening
    Location currentLocation = PlayerShip.GetRef().GetCurrentLocation()
    If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
      If currentLocation == DBAlphaSpaceCellLoc
        Self.SetStage(CONST_Stage_CF_StartAlpha)
      ElseIf currentLocation == DBBetaSpaceCellLoc
        Self.SetStage(CONST_Stage_CF_StartBeta)
      ElseIf currentLocation == DBGammaSpaceCellLoc
        Self.SetStage(CONST_Stage_CF_StartGamma)
      ElseIf currentLocation == KeySpaceCellLoc && Self.GetStageDone(CONST_Stage_CF_MainReady)
        Self.CleanupCF05JadeSwan()
        Self.SetStage(CONST_Stage_CF_StartMain)
        Self.UnregisterForMenuOpenCloseEvent("LoadingMenu")
      EndIf
    ElseIf currentLocation == DBAlphaSpaceCellLoc
      Self.SetStage(CONST_Stage_SD_StartAlpha)
    ElseIf currentLocation == DBBetaSpaceCellLoc
      Self.SetStage(CONST_Stage_SD_StartBeta)
    ElseIf currentLocation == DBGammaSpaceCellLoc
      Self.SetStage(CONST_Stage_SD_StartGamma)
    ElseIf currentLocation == KeySpaceCellLoc
      Self.CleanupCF05JadeSwan()
      Self.SetStage(CONST_Stage_SD_StartMain)
      Self.UnregisterForMenuOpenCloseEvent("LoadingMenu")
    EndIf
  EndIf
EndEvent

Event OnTimer(Int timerID)
  If timerID == CONST_VigilanceInvulnerableSceneTimerID
    Self.SetStage(CONST_Stage_CF_VigilanceInvulnerable)
  ElseIf timerID == CONST_VigilanceInvulnerableMessageTimerID
    If !Self.GetStageDone(CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance)
      Self.RegisterForHitEvent(vigilanceRef as ScriptObject, playerRef as ScriptObject, None, None, -1, -1, -1, -1, True)
    EndIf
  EndIf
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSource, ObjectReference akSenderRef, ObjectReference akKiller)
  Self.Main_CheckForReinforcements(akSenderRef)
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSource, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If akParent == vigilanceRef && !abComplete && Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    Self.SetStage(CONST_Stage_CF_DockedWithVigilance)
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipDock")
  ElseIf akParent == keyRef && !abComplete && Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD)
    Self.SetStage(CONST_Stage_SD_DockedWithKey)
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipDock")
  EndIf
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSource, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If akParent == vigilanceRef && abComplete && (Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) || Self.GetStageDone(CONST_Stage_CF_Skip)) && LC088_Vigilance.GetStageDone(CONST_LC088VigilanceStage_Complete)
    Self.SetStage(CONST_Stage_CF_UndockedWithVigilanceAfterCompleting)
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipUndock")
  ElseIf akParent == keyRef && abComplete && (Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD) || Self.GetStageDone(CONST_Stage_SD_Skip)) && LC088_Key.GetStageDone(CONST_LC088KeyStage_Complete)
    Self.SetStage(CONST_Stage_SD_UndockedWithKeyAfterCompleting)
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipUndock")
  EndIf
EndEvent

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False
EndEvent

Function PlaySpaceScene(Scene sceneToPlay)
  Guard SpaceSceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If currentSpaceScene != None
      currentSpaceScene.Stop()
    EndIf
    currentSpaceScene = sceneToPlay
    currentSpaceScene.Start()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function UnblockIncidentalDialogue(Int encounterID)
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    If encounterID == CONST_EncounterID_Skirmish
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Skirmish)
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Skirmish)
    ElseIf encounterID == CONST_EncounterID_Alpha
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Alpha)
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Alpha)
    ElseIf encounterID == CONST_EncounterID_Beta
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Beta)
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Beta)
    ElseIf encounterID == CONST_EncounterID_Gamma
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Gamma)
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Gamma)
    ElseIf encounterID == CONST_EncounterID_Main
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Main)
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Main)
    EndIf
  ElseIf encounterID == CONST_EncounterID_Skirmish
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Skirmish)
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Skirmish)
  ElseIf encounterID == CONST_EncounterID_Alpha
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Alpha)
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Alpha)
  ElseIf encounterID == CONST_EncounterID_Beta
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Beta)
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Beta)
  ElseIf encounterID == CONST_EncounterID_Gamma
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Gamma)
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Gamma)
  ElseIf encounterID == CONST_EncounterID_Main
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Main_SysDefFleet)
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Main)
  EndIf
EndFunction

Function Main_SetPlayerControlsEnabled(Bool enableControls)
  If LC088SpaceEnableLayer == None
    LC088SpaceEnableLayer = inputenablelayer.Create()
  EndIf
  LC088SpaceEnableLayer.EnableMovement(enableControls)
  LC088SpaceEnableLayer.EnableFighting(enableControls)
EndFunction

Function Main_EVPAllNoWait(Bool shouldStopCombat)
  Var[] akArgs = new Var[1]
  akArgs[0] = shouldStopCombat as Var
  Self.CallFunctionNoWait("Main_EVPAll", akArgs)
EndFunction

Function Main_EVPAll(Bool shouldStopCombat)
  Vigilance.TryToEvaluatePackage()
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    Self.Main_EVPAllCollection(CF_Allies_Main, shouldStopCombat)
    Self.Main_EVPAllCollection(CF_Enemies_Main, shouldStopCombat)
  Else
    Self.Main_EVPAllCollection(SD_Allies_Group, shouldStopCombat)
    Self.Main_EVPAllCollection(SD_Allies_Main_SysDefFleet, shouldStopCombat)
    Self.Main_EVPAllCollection(SD_Enemies_Main, shouldStopCombat)
  EndIf
EndFunction

Function Main_EVPAllCollection(RefCollectionAlias refCol, Bool shouldStopCombat)
  spaceshipreference[] refColShips = refCol.GetArray() as spaceshipreference[]
  Int I = 0
  While I < refColShips.Length
    If !refColShips[I].IsDisabled()
      If shouldStopCombat
        refColShips[I].StopCombat()
      EndIf
      refColShips[I].EvaluatePackage(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Main_SetMusicOverrideActive(Bool shouldBeActive)
  Main_MusicOverrideActive = shouldBeActive
  If Main_MusicOverrideActive
    MUSGenesisCombatBoss_CF08SpaceBattle.Add()
  Else
    MUSGenesisCombatBoss_CF08SpaceBattle.Remove()
  EndIf
EndFunction

Function Main_FormCFBattleLine()
  spaceshipreference[] mainShips = None
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    mainShips = CF_Allies_Main.GetArray() as spaceshipreference[]
  Else
    mainShips = SD_Enemies_Main.GetArray() as spaceshipreference[]
  EndIf
  Int I = 0
  While I < mainShips.Length
    If KeyTurrets.Find(mainShips[I] as ObjectReference) < 0
      ObjectReference battleLinePosition = mainShips[I].GetLinkedRef(LC088_Space_CF_LinkToFormationKeyword)
      If battleLinePosition != None
        mainShips[I].Enable(False)
        mainShips[I].InstantUndock()
        mainShips[I].MoveTo(battleLinePosition, 0.0, 0.0, 0.0, True, False)
        mainShips[I].EvaluatePackage(False)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function Main_EnableSDFleet(RefCollectionAlias SDFleetCollection)
  vigilanceRef.Disable(False)
  vigilanceRef.MoveTo(VigilanceArrivalMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  spaceshipreference[] SDFleetRefs = SDFleetCollection.GetArray() as spaceshipreference[]
  Int I = 0
  While I < SDFleetRefs.Length
    SDFleetRefs[I].EnableWithGravJumpNoWait()
    Utility.Wait(Utility.RandomFloat(CONST_SDFleetEnableDelayMin, CONST_SDFleetEnableDelayMax))
    I += 1
  EndWhile
  Utility.Wait(CONST_SDFleetEnableDelayVigilance)
  Self.Main_EnableVigilance()
EndFunction

Function Main_EnableVigilance()
  vigilanceRef.MoveTo(VigilanceArrivalMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  vigilanceRef.EnableWithGravJump()
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    Self.StartTimer(0.0, CONST_VigilanceInvulnerableMessageTimerID)
  EndIf
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If !Self.GetStageDone(CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance)
    LC088_Space_VigilanceShieldsImpenetrableMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Self.StartTimer(CONST_VigilanceInvulnerableMessageTimerDelay as Float, CONST_VigilanceInvulnerableMessageTimerID)
  EndIf
EndEvent

Function Main_CheckForReinforcements(ObjectReference killedShip)
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    If CF_Enemies_Main.Find(killedShip) >= 0
      CF_Enemies_Main.RemoveRef(killedShip)
      LC088SpaceMainEnemiesKilled.Mod(1.0)
    EndIf
    Guard ReinforcementsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If Main_ReinforcementWavesTriggered == 0 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_1
        Main_ReinforcementWavesTriggered = 1
        Self.SetStage(CONST_Stage_CF_Reinforcements1)
      EndIf
      If Main_ReinforcementWavesTriggered == 1 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_2
        Main_ReinforcementWavesTriggered = 2
        Self.SetStage(CONST_Stage_CF_Reinforcements2)
      EndIf
      If Main_ReinforcementWavesTriggered == 2 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_3
        Main_ReinforcementWavesTriggered = 3
        Self.SetStage(CONST_Stage_CF_Reinforcements3)
      EndIf
      If Main_ReinforcementWavesTriggered == 3 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_AllEnemiesDefeatedCount_4
        Main_ReinforcementWavesTriggered = 4
        Self.SetStage(CONST_Stage_CF_AllEscortsDefeated)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Else
    If SD_Enemies_Main.Find(killedShip) >= 0
      SD_Enemies_Main.RemoveRef(killedShip)
      LC088SpaceMainEnemiesKilled.Mod(1.0)
    EndIf
    Guard ReinforcementsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If Main_ReinforcementWavesTriggered == 0 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_1
        Main_ReinforcementWavesTriggered = 1
        Self.Main_TriggerReinforcements(1)
      EndIf
      If Main_ReinforcementWavesTriggered == 1 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_2
        Main_ReinforcementWavesTriggered = 2
        Self.Main_TriggerReinforcements(2)
      EndIf
      If Main_ReinforcementWavesTriggered == 2 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_3
        Main_ReinforcementWavesTriggered = 3
        Self.SetStage(CONST_Stage_SD_Reinforcements3)
      EndIf
      If Main_ReinforcementWavesTriggered == 3 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_AllEnemiesDefeatedCount_4
        Main_ReinforcementWavesTriggered = 4
        Self.SetStage(CONST_Stage_SD_MainBattleCompleted)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Function Main_TriggerReinforcements(Int wave)
  Var[] akArgs = new Var[1]
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    If wave == 1
      CF_Enemies_Main.AddRefCollection(CF_Enemies_Main_Reinforcements_1)
      Self.CF_EnableEnemyReinforcementsMain(CF_Enemies_Main_Reinforcements_1, vigilanceRef as ObjectReference)
    ElseIf wave == 2
      Self.CF_EnableAllyReinforcementsMain(CF_Allies_Main_Reinforcements, vigilanceRef as ObjectReference)
    ElseIf wave == 3
      CF_Enemies_Main.AddRefCollection(CF_Enemies_Main_Reinforcements_2)
      Self.CF_EnableEnemyReinforcementsMain(CF_Enemies_Main_Reinforcements_2, vigilanceRef as ObjectReference)
    EndIf
  ElseIf wave == 1
    SD_Enemies_Main.AddRefCollection(SD_Enemies_Main_Reinforcements_1)
    Self.SD_UndockReinforcements(SD_Enemies_Main_Reinforcements_1)
  ElseIf wave == 2
    SD_Enemies_Main.AddRefCollection(SD_Enemies_Main_Reinforcements_2)
    Self.SD_UndockReinforcements(SD_Enemies_Main_Reinforcements_2)
  ElseIf wave == 3
    Self.Main_EnableSDFleet(SD_Allies_Main_SysDefFleet)
  EndIf
EndFunction

Function CF_EnableAllyReinforcementsBattery(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
  spaceshipreference[] reinforcementShips = reinforcements.GetArray() as spaceshipreference[]
  spaceshipreference captainShip = reinforcementShips[reinforcementShips.Length - 1]
  captainShip.Disable(False)
  Self.CF_EnableReinforcement(captainShip, fallbackRef, True)
  Int I = 0
  While I < reinforcementShips.Length - 1
    Self.CF_EnableReinforcement(reinforcementShips[I], fallbackRef, False)
    I += 1
  EndWhile
  Utility.Wait(1.0)
EndFunction

Function CF_EnableEnemyReinforcementsMain(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
  spaceshipreference[] reinforcementShips = reinforcements.GetArray() as spaceshipreference[]
  Int I = 0
  While I < reinforcementShips.Length
    Self.CF_EnableReinforcement(reinforcementShips[I], fallbackRef, False)
    I += 1
  EndWhile
EndFunction

Function CF_EnableAllyReinforcementsMain(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
  spaceshipreference[] reinforcementShips = reinforcements.GetArray() as spaceshipreference[]
  Int I = 0
  While I < reinforcementShips.Length
    reinforcementShips[I].Disable(False)
    reinforcementShips[I].RestoreValue(Health, reinforcementShips[I].GetBaseValue(Health) / 2.0)
    Self.CF_EnableReinforcement(reinforcementShips[I], fallbackRef, True)
    I += 1
  EndWhile
EndFunction

Function CF_EnableReinforcement(spaceshipreference ship, ObjectReference fallbackRef, Bool shouldWaitForJump)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  If playerShipRef.GetCurrentLocation() == fallbackRef.GetCurrentLocation() || (playerShipRef.GetDistance(fallbackRef) < CONST_ReinforcementMaxDistanceFromFallback as Float)
    ship.MoveNear(playerShipRef as ObjectReference, CONST_NearPosition_ForwardTight, CONST_NearDistance_Short, CONST_NearFacing_AwayLarge)
  Else
    ship.MoveNear(fallbackRef, CONST_NearPosition_ForwardTight, CONST_NearDistance_Short, CONST_NearFacing_AwayLarge)
  EndIf
  If shouldWaitForJump
    ship.EnableWithGravJump()
  Else
    ship.EnableWithGravJumpNoWait()
  EndIf
  ship.SetForwardVelocity(CONST_ReinforcementForwardVelocityPercent)
EndFunction

Function CF_RestoreDefensiveBattery(spaceshipreference batteryToRestore)
  (batteryToRestore as lc088_defensivebatteryscript).RegenBattery()
EndFunction

Function CF_Main_ReadyForVigilanceInvulnerableScene()
  Self.StartTimer(CONST_VigilanceInvulnerableSceneWaitDelay, CONST_VigilanceInvulnerableSceneTimerID)
EndFunction

Function CF_Main_FireBatteriesAtVigilance()
  If LC088_Space_UseNewDefensiveBatteryFireVFX.GetValue() > 0.0
    LC088_Space_DefensiveBatteriesFireOnVigilance.Play(vigilanceRef as ObjectReference, -1.0, None)
  Else
    LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryAlphaProjectileSourceMarker.GetRef(), vigilanceRef as ObjectReference)
    LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryBetaProjectileSourceMarker.GetRef(), vigilanceRef as ObjectReference)
    LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryGammaProjectileSourceMarker.GetRef(), vigilanceRef as ObjectReference)
  EndIf
EndFunction

Function CF_Main_RemoveVigilanceInvulnerability()
  Utility.Wait(LC088_Space_DefensiveBatteryFireToShieldDegenDelay.GetValue())
  vigilanceRef.AddPerk(LC088_Space_VigilanceDamageReductionPerk, False)
  Int I = 0
  While I < CONST_VigilanceShieldDamageIncrements
    vigilanceRef.DamageValue(ShieldHealth, CONST_VigilanceShieldDamagePerIncrement as Float)
    Utility.Wait(CONST_VigilanceShieldDamageDelayPerIncrement)
    I += 1
  EndWhile
  vigilanceRef.DamageValue(ShipSystemShieldsHealth, CONST_VigilanceShieldSystemMaxDamage as Float)
  vigilanceRef.RemovePerk(LC088_Space_VigilanceDamageImmunityPerk)
  vigilanceRef.RemoveKeyword(DisallowAsCombatTargetKeyword)
EndFunction

Function CF_Main_StartDockingWithVigilance()
  Int vigilanceDockingCount = 1
  Int I = 0
  While I < CF_Captains_All.GetCount() && vigilanceDockingCount < CONST_VigilanceDockingLimit
    spaceshipreference current = CF_Captains_All.GetAt(I) as spaceshipreference
    If current.GetLinkedRef(LC088_Space_CF_CaptainsDockingLinkToVigilance) == None
      current.SetLinkedRef(vigilanceRef as ObjectReference, LC088_Space_CF_CaptainsDockingLinkToVigilance, True)
      vigilanceDockingCount += 1
    EndIf
    I += 1
  EndWhile
  CF_Captains_All.EvaluateAll()
EndFunction

Function SD_SetupMainEnemyReinforcements()
  Self.SD_SetupMainEnemyReinforcementsCollection(SD_Enemies_Main_Reinforcements_1)
  Self.SD_SetupMainEnemyReinforcementsCollection(SD_Enemies_Main_Reinforcements_2)
EndFunction

Function SD_SetupMainEnemyReinforcementsCollection(RefCollectionAlias reinforcementCol)
  spaceshipreference[] reinforcementShipRefs = reinforcementCol.GetArray() as spaceshipreference[]
  Int I = 0
  While I < reinforcementShipRefs.Length
    spaceshipreference currentShip = reinforcementShipRefs[I]
    currentShip.AddKeyword(LC088_Space_SD_ReinforcementDockedWithKeyKeyword)
    currentShip.SetValue(HideShipFromHUDValue, 1.0)
    currentShip.EvaluatePackage(False)
    currentShip.InstantDock(keyRef as ObjectReference)
    I += 1
  EndWhile
EndFunction

Function SD_SetupAllyGroup()
  spaceshipreference toftShipRef = SD_ToftShip.GetShipRef()
  toftShipRef.SetEssential(True)
  SD_Allies_All.AddRef(toftShipRef as ObjectReference)
  SD_Allies_Group.AddRef(toftShipRef as ObjectReference)
  spaceshipreference archangelShipRef = SD_ArchangelShip.GetShipRef()
  archangelShipRef.SetEssential(True)
  SD_Allies_All.AddRef(archangelShipRef as ObjectReference)
  SD_Allies_Group.AddRef(archangelShipRef as ObjectReference)
  SD_Allies_Group.AddRefCollection(SD_Allies_Alpha)
EndFunction

Function SD_UpdateAndMoveAllyGroup(Int encounterID)
  If encounterID == CONST_EncounterID_Alpha
    Self.SD_MoveAllyGroup(SD_Alpha_ArrivalPointMarkerChainHead.GetRef(), encounterID)
  ElseIf encounterID == CONST_EncounterID_Beta
    Self.SD_CleanupAllyGroup()
    Self.SD_MoveAllyGroup(SD_Beta_ArrivalPointMarkerChainHead.GetRef(), encounterID)
  ElseIf encounterID == CONST_EncounterID_Gamma
    Self.SD_CleanupAllyGroup()
    Self.SD_UpdateAllyGroup(SD_Allies_Beta, CONST_SDAlliesMax_Gamma)
    Self.SD_MoveAllyGroup(SD_Gamma_ArrivalPointMarkerChainHead.GetRef(), encounterID)
  ElseIf encounterID == CONST_EncounterID_Main
    Self.SD_CleanupAllyGroup()
    Self.SD_UpdateAllyGroup(SD_Allies_Gamma, CONST_SDAlliesMax_Main)
    Self.SD_MoveAllyGroup(SD_Main_ArrivalPointMarkerChainHead.GetRef(), encounterID)
  EndIf
EndFunction

Function SD_CleanupAllyGroup()
  spaceshipreference[] allyGroupRefs = SD_Allies_Group.GetArray() as spaceshipreference[]
  Int I = 0
  While I < allyGroupRefs.Length
    spaceshipreference currentShip = allyGroupRefs[I]
    If currentShip.IsDead()
      SD_Allies_Group.RemoveRef(currentShip as ObjectReference)
    Else
      currentShip.DisableNoWait(False)
      If currentShip.IsEssential(True)
        Float currentHealth = currentShip.GetValue(Health)
        Float minHealth = currentShip.GetBaseValue(Health) / 2.0
        If currentHealth < minHealth
          currentShip.RestoreValue(Health, minHealth - currentHealth)
        EndIf
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function SD_UpdateAllyGroup(RefCollectionAlias refCollectionToAdd, Int maxAllies)
  spaceshipreference[] newAllyRefs = refCollectionToAdd.GetArray() as spaceshipreference[]
  Int alliesInGroup = SD_Allies_Group.GetCount()
  Int I = 0
  While alliesInGroup < maxAllies && I < newAllyRefs.Length
    spaceshipreference currentShip = newAllyRefs[I]
    If !currentShip.IsDead() && !currentShip.IsDisabled()
      SD_Allies_Group.AddRef(currentShip as ObjectReference)
      alliesInGroup += 1
    EndIf
    I += 1
  EndWhile
  While I < newAllyRefs.Length
    newAllyRefs[I].DisableNoWait(False)
    I += 1
  EndWhile
  IncidentalDialogueBlockedCollection.AddRefCollection(SD_Allies_Group)
EndFunction

Function SD_MoveAllyGroup(ObjectReference allyMoveToMarker, Int encounterID)
  Int offsetForwardShift = 0
  If encounterID == CONST_EncounterID_Main
    offsetForwardShift = CONST_SDAlliesForwardShiftDistance_Main
  Else
    offsetForwardShift = CONST_SDAlliesForwardShiftDistance_Batteries
  EndIf
  spaceshipreference toftShipRef = SD_ToftShip.GetShipRef()
  spaceshipreference[] allyGroupRefs = SD_Allies_Group.GetArray() as spaceshipreference[]
  ObjectReference nextAllyMoveToMarker = allyMoveToMarker.GetLinkedRef(None)
  Float[] offsetValues = new Float[3]
  ObjectReference playerMarker = PlayerShip.GetRef().PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, None, None, True)
  Int I = 0
  While I < allyGroupRefs.Length && nextAllyMoveToMarker != None
    offsetValues[0] = nextAllyMoveToMarker.GetPositionX() - playerMarker.GetPositionX()
    offsetValues[1] = nextAllyMoveToMarker.GetPositionY() - playerMarker.GetPositionY() + offsetForwardShift as Float
    offsetValues[2] = nextAllyMoveToMarker.GetPositionZ() - playerMarker.GetPositionZ()
    ObjectReference jumpMarker = playerMarker.PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, offsetValues, None, True)
    spaceshipreference currentShip = allyGroupRefs[I]
    currentShip.MoveTo(jumpMarker, 0.0, 0.0, 0.0, True, False)
    If currentShip != toftShipRef
      currentShip.EnableWithGravJumpNoWait()
      currentShip.EvaluatePackage(False)
    EndIf
    nextAllyMoveToMarker = nextAllyMoveToMarker.GetLinkedRef(None)
    jumpMarker.Delete()
    I += 1
  EndWhile
  toftShipRef.EnableWithGravJump()
  toftShipRef.EvaluatePackage(False)
  playerMarker.Delete()
EndFunction

Function SD_PlayBatteryDestroyedScene(Int encounterID)
  SD_LastBatteryDestroyedID = encounterID
  spaceshipreference[] speakerRefCol = None
  If encounterID == CONST_EncounterID_Alpha
    speakerRefCol = SD_Enemies_Alpha.GetArray() as spaceshipreference[]
  ElseIf encounterID == CONST_EncounterID_Beta
    speakerRefCol = SD_Enemies_Beta.GetArray() as spaceshipreference[]
  ElseIf encounterID == CONST_EncounterID_Gamma
    speakerRefCol = SD_Enemies_Gamma.GetArray() as spaceshipreference[]
  EndIf
  Bool foundBatteryDestroyedSpeaker = False
  Int I = 0
  While !foundBatteryDestroyedSpeaker && I < speakerRefCol.Length
    spaceshipreference currentShip = speakerRefCol[I]
    If !currentShip.IsDead()
      foundBatteryDestroyedSpeaker = True
      SD_BatteryDestroyedSpeaker.ForceRefTo(currentShip as ObjectReference)
      Self.PlaySpaceScene(LC088_Space_SD_225_BatteryDestroyed)
    EndIf
    I += 1
  EndWhile
  If !foundBatteryDestroyedSpeaker
    Self.SD_PlayBatteryPhaseCompleteScene(encounterID)
  EndIf
EndFunction

Function SD_PlayBatteryPhaseCompleteScene(Int encounterID)
  If encounterID == -1
    encounterID = SD_LastBatteryDestroyedID
  EndIf
  Guard SpaceSceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If encounterID == 1 && !Self.GetStageDone(CONST_Stage_SD_CompletedAlpha) || encounterID == 2 && !Self.GetStageDone(CONST_Stage_SD_CompletedBeta) || encounterID == 3 && !Self.GetStageDone(CONST_Stage_SD_CompletedGamma)
      Self.PlaySpaceScene(LC088_Space_SD_226_BatteryPhaseComplete)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function SD_CalculateMainBattleCounts()
  Int totalEnemyCount = SD_Enemies_Main.GetCount() + SD_Enemies_Main_Reinforcements_1.GetCount() + SD_Enemies_Main_Reinforcements_2.GetCount()
  SD_Main_ReinforcementTriggerCount_1 = SD_Enemies_Main.GetCount() / 3
  SD_Main_ReinforcementTriggerCount_2 = Math.Min(totalEnemyCount as Float, (SD_Main_ReinforcementTriggerCount_1 + SD_Enemies_Main_Reinforcements_1.GetCount() / 2 + 1) as Float) as Int
  SD_Main_ReinforcementTriggerCount_3 = Math.Min(totalEnemyCount as Float, (SD_Main_ReinforcementTriggerCount_2 + SD_Enemies_Main_Reinforcements_2.GetCount() / 2 + 1) as Float) as Int
  SD_Main_AllEnemiesDefeatedCount_4 = totalEnemyCount
EndFunction

Function SD_UndockReinforcements(RefCollectionAlias reinforcementShips)
  spaceshipreference[] reinforcementShipRefs = reinforcementShips.GetArray() as spaceshipreference[]
  Int I = 0
  While I < reinforcementShipRefs.Length
    spaceshipreference currentShip = reinforcementShipRefs[I]
    currentShip.RemoveKeyword(LC088_Space_SD_ReinforcementDockedWithKeyKeyword)
    currentShip.SetValue(HideShipFromHUDValue, 0.0)
    currentShip.EvaluatePackage(False)
    I += 1
    If I < reinforcementShipRefs.Length
      Utility.Wait(Utility.RandomFloat(CONST_SDEnemiesMainDelay_Min, CONST_SDEnemiesMainDelay_Max))
    EndIf
  EndWhile
EndFunction

Function SD_SwitchKeyToSDDocking()
  keyRef.RemoveFromFaction(CrimeFactionCrimsonFleet)
  keyRef.AddToFaction(UCSysDefFaction)
EndFunction

Function SD_DisableAllyLeaderShips()
  SD_ToftShip.TryToDisable()
  SD_ArchangelShip.TryToDisable()
EndFunction

Function Cleanup()
  playerRef = None
  keyRef = None
  vigilanceRef = None
  KeySpaceCellLoc = None
  VigilanceSpaceCellLoc = None
  DBAlphaSpaceCellLoc = None
  DBBetaSpaceCellLoc = None
  DBGammaSpaceCellLoc = None
  If LC088SpaceEnableLayer != None
    LC088SpaceEnableLayer.Delete()
  EndIf
  Guard SpaceSceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    currentSpaceScene = None
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function EnableDataCoreAnalyzer(Bool sidedWithCF)
  If sidedWithCF || Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    TheKey_DataCoreAnalyzer_DisableMarkerRef.DisableNoWait(False)
    TheKey_DataCoreAnalyzer_EnableMarkerRef.EnableNoWait(False)
  Else
    LC082_DataCoreAnalyzer_DisableMarkerRef.DisableNoWait(False)
    LC082_DataCoreAnalyzer_EnableMarkerRef.EnableNoWait(False)
  EndIf
EndFunction

Function InsertDataCore(Bool sidedWithCF)
  If sidedWithCF || Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    (TheKey_DataCoreAnalyzer.GetRef() as defaultmultistateactivator).SetAnimationState("Done", False)
  Else
    (LC082_DataCoreAnalyzer.GetRef() as defaultmultistateactivator).SetAnimationState("Done", False)
  EndIf
EndFunction

Function SetDockingEnabled(spaceshipreference shipRef, Bool SetDockingEnabled)
  If SetDockingEnabled
    shipRef.SetValue(DockingPermission, CONST_DockingPermission_Any as Float)
  Else
    shipRef.SetValue(DockingPermission, CONST_DockingPermission_Never as Float)
  EndIf
EndFunction

Function SetUpGammaShipsAll()
  GammaShipsAll.AddRefCollection(CF_Allies_Gamma)
  GammaShipsAll.AddRefCollection(CF_Enemies_Gamma)
  GammaShipsAll.AddRefCollection(SD_Allies_Gamma)
  GammaShipsAll.AddRefCollection(SD_Enemies_Gamma)
  GammaShipsAll.AddRefCollection(SD_Allies_Group)
EndFunction

Function DEBUG_GoToSpaceAndWait()
  inputenablelayer myEnableLayer = inputenablelayer.Create()
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
  Bool shouldSpawnCFShip = Self.GetStageDone(CONST_Stage_CF_Quickstart) || Self.GetStageDone(CONST_Stage_CF_Skip)
  spaceshipreference testShip = Self.DEBUG_SpawnPlayerShip(shouldSpawnCFShip)
  testShip.AddItem(ShipRepairKit as Form, 20, False)
  playerRef.MoveTo(testShip as ObjectReference, 0.0, 0.0, 0.0, True, False)
  SQ_PlayerShip.HandleShipTakeOff(True, False)
  PlayerShipPilotSeat.GetRef().Activate(playerRef as ObjectReference, False)
  myEnableLayer.Delete()
  waitingForPlayerToSit = True
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit")
  While waitingForPlayerToSit
    Utility.Wait(0.5)
  EndWhile
  SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, testShip)
EndFunction

spaceshipreference Function DEBUG_SpawnPlayerShip(Bool spawnCFShip)
  playerRef = Game.GetPlayer()
  playerRef.AddPerk(Skill_Piloting, False)
  playerRef.AddPerk(Skill_Piloting, False)
  playerRef.AddPerk(Skill_Piloting, False)
  playerRef.AddPerk(Skill_Piloting, False)
  spaceshipreference testShip = None
  If spawnCFShip
    testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipCF as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True)
  Else
    testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipSD as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True)
  EndIf
  SQ_PlayerShip.ResetPlayerShip(testShip)
  SQ_PlayerShip.ResetHomeShip(testShip)
  Return testShip
EndFunction

Function DEBUG_KillMain(Int numToKill)
  spaceshipreference[] mainEnemyRefs = None
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)
    mainEnemyRefs = CF_Enemies_Main.GetArray() as spaceshipreference[]
  Else
    mainEnemyRefs = SD_Enemies_Main.GetArray() as spaceshipreference[]
  EndIf
  Int I = 0
  While I < numToKill && I < mainEnemyRefs.Length
    If mainEnemyRefs[I].IsEssential(True) || mainEnemyRefs[I].IsDead()
      mainEnemyRefs.remove(I, 1)
    Else
      mainEnemyRefs[I].Kill(None)
      I += 1
    EndIf
  EndWhile
EndFunction

Function DEBUG_DamageVigilance()
  vigilanceRef.EnablePartRepair(ShipSystemEngineHealth, False)
  vigilanceRef.DamageValue(ShipSystemEngineHealth, vigilanceRef.GetValue(ShipSystemEngineHealth))
  vigilanceRef.DamageValue(ShieldHealth, 100000.0)
  vigilanceRef.DamageValue(ShipSystemShieldsHealth, 100000.0)
  vigilanceRef.DamageValue(Health, 100000.0)
EndFunction
