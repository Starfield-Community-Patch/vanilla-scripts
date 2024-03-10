ScriptName Fragments:Quests:QF_LC088_Space_0021E73C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Key Auto Const mandatory
LocationAlias Property KeyLocation Auto Const mandatory
LocationAlias Property KeySpaceCellLocation Auto Const mandatory
LocationAlias Property DBAlphaSpaceCellLocation Auto Const mandatory
LocationAlias Property DBBetaSpaceCellLocation Auto Const mandatory
LocationAlias Property DBGammaSpaceCellLocation Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
LocationAlias Property VigilanceSpaceCellLocation Auto Const mandatory
LocationAlias Property Alias_SuvorovSurfaceLocation Auto Const mandatory
LocationAlias Property Alias_SuvorovOrbitLocation Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_RokovShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_MathisShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_NaevaShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_AdlerShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_HuanShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_EstelleShip Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryAlpha Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryBeta Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryGamma Auto Const mandatory
ReferenceAlias Property Alias_KeyMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryAlphaMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryBetaMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryGammaMapMarker Auto Const mandatory
ReferenceAlias Property Alias_VigilanceMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryAlphaProjectileSourceMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryBetaProjectileSourceMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryGammaProjectileSourceMarker Auto Const mandatory
ReferenceAlias Property Alias_VigilanceArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyMapMarkerHeading Auto Const mandatory
ReferenceAlias Property Alias_KeyPlanetArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyOriginMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyBehindCFLinesMarker Auto Const mandatory
ReferenceAlias Property Alias_KeySDArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_Mines_Alpha_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_SD_Mines_Alpha_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyTurretsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_MainBattleAnnouncementMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyDistantArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_SD_BriefingQuickstartMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_BriefingQuickstartMarker Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_All Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Main Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_All Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_All Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Main Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_All Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Main Auto Const mandatory
RefCollectionAlias Property Alias_CF_Captains_All Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main_Reinforcements_1 Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main_Reinforcements_2 Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Main_SysDefFleet Auto Const
RefCollectionAlias Property Alias_SD_Enemies_Main_Reinforcements_1 Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Main_Reinforcements_2 Auto Const mandatory
Scene Property LC088_Space_CF_100_SkirmishStart Auto Const mandatory
Scene Property LC088_Space_CF_105_SkirmishComplete Auto Const mandatory
Scene Property LC088_Space_CF_120_AlphaStart Auto Const mandatory
Scene Property LC088_Space_CF_128_AlphaComplete Auto Const mandatory
Scene Property LC088_Space_CF_130_BetaStart Auto Const mandatory
Scene Property LC088_Space_CF_138_BetaComplete Auto Const mandatory
Scene Property LC088_Space_CF_140_GammaStart Auto Const mandatory
Scene Property LC088_Space_CF_148_GammaComplete Auto Const mandatory
Scene Property LC088_Space_CF_150_ReadyForMainBattle Auto Const mandatory
Scene Property LC088_Space_CF_160_MainBattleStart Auto Const mandatory
Scene Property LC088_Space_CF_165_VigilanceInvulnerable Auto Const mandatory
Scene Property LC088_Space_CF_170_VigilanceEscortsDefeated Auto Const mandatory
Scene Property LC088_Space_CF_180_VigilanceDefeated Auto Const mandatory
Scene Property LC088_Space_CF_190_BoardVigilance Auto Const mandatory
Scene Property LC088_Space_SD_200_SkirmishStart Auto Const mandatory
Scene Property LC088_Space_SD_205_SkirmishComplete Auto Const mandatory
Scene Property LC088_Space_SD_220_AlphaStart Auto Const mandatory
Scene Property LC088_Space_SD_228_AlphaComplete Auto Const mandatory
Scene Property LC088_Space_SD_230_BetaStart Auto Const mandatory
Scene Property LC088_Space_SD_238_BetaComplete Auto Const mandatory
Scene Property LC088_Space_SD_240_GammaStart Auto Const mandatory
Scene Property LC088_Space_SD_248_GammaComplete Auto Const mandatory
Scene Property LC088_Space_SD_260_MainBattleStart Auto Const mandatory
Scene Property LC088_Space_SD_270_CFDefendersDefeated Auto Const mandatory
Scene Property LC088_Space_SD_290_BoardKey Auto Const mandatory
Scene Property LC088_Space_CF_175_VigilanceEscortsDefeated Auto Const mandatory
Scene Property LC088_Space_CF_163_VigilanceInvulnerable Auto Const mandatory
Scene Property LC088_Space_CF_165_Reinforcements1 Auto Const mandatory
Scene Property LC088_Space_CF_170_Reinforcements2 Auto Const mandatory
Scene Property LC088_Space_CF_122_AllyStart Auto Const mandatory
Scene Property LC088_Space_CF_132_AllyStart Auto Const mandatory
Scene Property LC088_Space_CF_142_AllyStart Auto Const mandatory
Scene Property LC088_Space_CF_169_AllyStart Auto Const mandatory
Scene Property LC088_Space_SD_225_BatteryDestroyed Auto Const mandatory
Scene Property LC088_Space_SD_280_CFDefendersDefeated Auto Const mandatory
Scene Property LC088_Space_SD_265_VigilanceArrives01 Auto Const mandatory
Scene Property LC088_Space_SD_266_VigilanceArrives02 Auto Const mandatory
Scene Property LC088_Space_SD_267_VigilanceArrives03 Auto Const mandatory
Scene Property LC088_Space_SD_226_BatteryPhaseComplete Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
cf_postquestscript Property CF_Post Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property CF07 Auto Const mandatory
Quest Property CF08_Fleet Auto Const mandatory
Quest Property CF08_SysDef Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
GlobalVariable Property LC088_Space_CFSD01EvidenceCountForSquadAlpha Auto Const mandatory
GlobalVariable Property LC088_Space_CFSD01EvidenceCountForSquadBeta Auto Const mandatory
GlobalVariable Property LC088_Space_CFSD01EvidenceCountForSquadGamma Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property CFSD01EvidenceTotal Auto Const mandatory
Spell Property LC088_DefensiveBatteryRegenSpell Auto Const mandatory
Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory
Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
RefCollectionAlias Property Alias_KeyTurrets Auto Const mandatory
ObjectReference Property LC088_KeyTurretsEnableMarkerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0164_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0178_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0193_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Self.SetStage(11)
  Alias_playerShip.GetShipRef().MoveTo(Alias_KeyMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Self.SetStage(11)
  Self.SetStage(100)
  Self.SetStage(110)
  CF08_Fleet.SetObjectiveCompleted(10, True)
  CF08_Fleet.SetObjectiveCompleted(20, True)
  CF08_Fleet.SetStage(110)
  spaceshipreference playerShip = Alias_playerShip.GetShipRef()
  ObjectReference markerHeading = Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None)
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Self.SetStage(11)
  Self.SetStage(100)
  Self.SetStage(110)
  CF08_Fleet.SetObjectiveCompleted(10, True)
  CF08_Fleet.SetObjectiveCompleted(20, True)
  CF08_Fleet.SetStage(110)
  spaceshipreference playerShip = Alias_playerShip.GetShipRef()
  ObjectReference markerHeading = Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None)
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Self.SetStage(11)
  Self.SetStage(100)
  Self.SetStage(110)
  CF08_Fleet.SetObjectiveCompleted(10, True)
  CF08_Fleet.SetObjectiveCompleted(20, True)
  CF08_Fleet.SetStage(110)
  spaceshipreference playerShip = Alias_playerShip.GetShipRef()
  ObjectReference markerHeading = Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None)
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Self.SetStage(11)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(150)
  CF08_Fleet.SetObjectiveCompleted(10, True)
  CF08_Fleet.SetObjectiveCompleted(20, True)
  spaceshipreference playerShip = Alias_playerShip.GetShipRef()
  ObjectReference markerHeading = Alias_KeyMapMarker.GetRef().GetLinkedRef(None)
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(12)
  Alias_playerShip.GetShipRef().MoveTo(Alias_VigilanceMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(12)
  Self.SetStage(200)
  Self.SetStage(210)
  CF08_SysDef.SetObjectiveCompleted(10, True)
  CF08_SysDef.SetStage(110)
  Alias_playerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(12)
  Self.SetStage(200)
  Self.SetStage(210)
  Self.SetStage(220)
  Self.SetStage(229)
  CF08_SysDef.SetObjectiveCompleted(10, True)
  CF08_SysDef.SetStage(110)
  CF08_SysDef.SetStage(120)
  Alias_playerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(12)
  Self.SetStage(200)
  Self.SetStage(210)
  Self.SetStage(220)
  Self.SetStage(229)
  Self.SetStage(230)
  Self.SetStage(239)
  CF08_SysDef.SetObjectiveCompleted(10, True)
  CF08_SysDef.SetStage(110)
  CF08_SysDef.SetStage(120)
  CF08_SysDef.SetStage(130)
  Alias_playerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Self.SetStage(12)
  Self.SetStage(200)
  Self.SetStage(210)
  Self.SetStage(220)
  Self.SetStage(229)
  Self.SetStage(230)
  Self.SetStage(239)
  Self.SetStage(240)
  Self.SetStage(249)
  Self.SetStage(250)
  CF08_SysDef.SetObjectiveCompleted(10, True)
  CF08_SysDef.SetStage(110)
  CF08_SysDef.SetStage(120)
  CF08_SysDef.SetStage(130)
  CF08_SysDef.SetStage(140)
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), False)
  Alias_playerShip.GetShipRef().MoveTo(Alias_KeyMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  PlayerFaction.SetEnemy(UCSysDefFaction, False, False)
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)
  kmyQuest.DEBUG_GoToSpaceAndWait()
  CF08_Fleet.SetStage(0)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  PlayerFaction.SetAlly(UCSysDefFaction, False, False)
  Game.GetPlayer().RemoveFromFaction(CrimeFactionCrimsonFleet)
  kmyQuest.DEBUG_GoToSpaceAndWait()
  CF08_SysDef.SetStage(0)
EndFunction

Function Fragment_Stage_0024_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  PlayerFaction.SetEnemy(UCSysDefFaction, False, False)
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)
  kmyQuest.DEBUG_SpawnPlayerShip(True)
  Alias_playerShip.GetShipRef().InstantDock(Alias_Key.GetShipRef() as ObjectReference)
  CF_Main.SetStage(1)
  CF_Main.SetStage(10)
  CF_Main.SetStage(20)
  CF_Main.SetStage(300)
  CF08_Fleet.SetStage(0)
  CF08_Fleet.SetStage(10)
  CF08_Fleet.SetStage(20)
  CF08_Fleet.SetStage(30)
  CF08_Fleet.SetStage(35)
  CF08_Fleet.SetStage(40)
  CF08_Fleet.SetStage(45)
  CF08_Fleet.SetStage(50)
  Self.SetStage(100)
  kmyQuest.EnableDataCoreAnalyzer(False)
  Game.GetPlayer().MoveTo(Alias_CF_BriefingQuickstartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  PlayerFaction.SetAlly(UCSysDefFaction, False, False)
  Game.GetPlayer().RemoveFromFaction(CrimeFactionCrimsonFleet)
  kmyQuest.DEBUG_SpawnPlayerShip(False)
  Alias_playerShip.GetShipRef().InstantDock(Alias_Vigilance.GetShipRef() as ObjectReference)
  Alias_CF_Enemies_Skirmish.DisableAll(False)
  Alias_CF_Allies_Skirmish.DisableAll(False)
  Alias_SD_Enemies_Skirmish.DisableAll(False)
  CF_Main.SetStage(1)
  CF_Main.SetStage(10)
  CF_Main.SetStage(20)
  CF_Main.SetStage(200)
  LC082.SetStage(210)
  CF08_SysDef.SetStage(0)
  CF08_SysDef.SetStage(10)
  CF08_SysDef.SetStage(20)
  CF08_SysDef.SetStage(30)
  Self.SetStage(200)
  kmyQuest.EnableDataCoreAnalyzer(False)
  Game.GetPlayer().MoveTo(Alias_SD_BriefingQuickstartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0031_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.DEBUG_DamageVigilance()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.WaitForQuestStartup()
  kmyQuest.DEBUG_SpawnPlayerShip(True)
  CF_Main.SetStage(1)
  CF_Main.SetStage(10)
  CF_Main.SetStage(20)
  CF_Main.SetStage(300)
  kmyQuest.Main_EnableVigilance()
  kmyQuest.DEBUG_DamageVigilance()
  Alias_CF_Allies_Skirmish.DisableAll(False)
  Alias_CF_Allies_Main.EnableAll(False)
  Alias_CF_Enemies_All.DisableAll(False)
  kmyQuest.EnableDataCoreAnalyzer(True)
  kmyQuest.InsertDataCore(True)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.WaitForQuestStartup()
  kmyQuest.DEBUG_SpawnPlayerShip(False)
  Alias_CF_Allies_Skirmish.DisableAll(False)
  Alias_CF_Enemies_Skirmish.DisableAll(False)
  Alias_SD_Allies_Main.EnableAll(False)
  Alias_SD_Enemies_All.DisableAll(False)
  LC088_KeyTurretsEnableMarkerRef.Disable(False)
  kmyQuest.DisableAllCaptainShips()
  CF_Main.SetStage(1)
  CF_Main.SetStage(10)
  CF_Main.SetStage(20)
  CF_Main.SetStage(200)
  LC082.SetStage(210)
  kmyQuest.Main_EnableVigilance()
  kmyQuest.SD_SwitchKeyToSDDocking()
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)
  kmyQuest.EnableDataCoreAnalyzer(False)
  kmyQuest.InsertDataCore(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyDistantArrivalMarker.GetRef())
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyDistantArrivalMarker.GetRef())
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  CF_Main.SetStage(300)
  Alias_SD_Enemies_Skirmish.DisableAll(False)
  kmyQuest.IgnoreAlliedFriendlyHits()
  CF07.SetStage(1500)
  CF08_Fleet.SetStage(10)
  kmyQuest.EnableDataCoreAnalyzer(False)
  CFKey.SetStage(200)
  Alias_Vigilance.GetShipRef().SetNoBleedoutRecovery(True)
  kmyQuest.SetupAllCaptainEvents()
  kmyQuest.SetupKeyTurrets()
  Utility.Wait(2.0)
  kmyQuest.PlaySpaceScene(LC088_Space_CF_100_SkirmishStart)
EndFunction

Function Fragment_Stage_0101_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(0)
EndFunction

Function Fragment_Stage_0105_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_CF_105_SkirmishComplete)
EndFunction

Function Fragment_Stage_0106_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)
  CF08_Fleet.SetStage(30)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetupDefensiveBatteries()
  Alias_CF_Allies_Skirmish.DisableAll(False)
  Alias_CF_Enemies_Skirmish.DisableAll(False)
  Alias_CF_Enemies_Alpha.EnableAll(False)
  Alias_CF_Enemies_Beta.EnableAll(False)
  Alias_CF_Enemies_Gamma.EnableAll(False)
  Alias_CF_Allies_Main.EnableAll(False)
  Alias_CF_Captain_EstelleShip.TryToDisable()
  Alias_CF_Captain_MathisShip.TryToDisable()
  Alias_CF_Captain_HuanShip.TryToDisable()
  Alias_CF_Mines_Alpha_EnableMarker.TryToEnable()
  kmyQuest.RegisterForLoadScreenEvent()
  Alias_DefensiveBatteryAlphaMapMarker.TryToEnable()
  Alias_DefensiveBatteryBetaMapMarker.TryToEnable()
  Alias_DefensiveBatteryGammaMapMarker.TryToEnable()
  Self.SetStageNoWait(111)
EndFunction

Function Fragment_Stage_0111_Item_00()
  LC088_Vigilance.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Utility.Wait(2.0)
  If Self.GetStageDone(14)
    kmyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Alpha, Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None))
    kmyQuest.PlaySpaceScene(LC088_Space_CF_122_AllyStart)
  Else
    kmyQuest.PlaySpaceScene(LC088_Space_CF_120_AlphaStart)
  EndIf
EndFunction

Function Fragment_Stage_0121_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(1)
EndFunction

Function Fragment_Stage_0128_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryAlpha.GetShipRef())
  If Self.GetStageDone(128) && Self.GetStageDone(138) && Self.GetStageDone(148)
    Self.SetStage(150)
  Else
    kmyQuest.PlaySpaceScene(LC088_Space_CF_128_AlphaComplete)
  EndIf
EndFunction

Function Fragment_Stage_0129_Item_00()
  CF08_Fleet.SetStage(120)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Utility.Wait(2.0)
  kmyQuest.PlaySpaceScene(LC088_Space_CF_130_BetaStart)
EndFunction

Function Fragment_Stage_0131_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(18)
    Self.SetStage(132)
  Else
    kmyQuest.UnblockIncidentalDialogue(2)
  EndIf
EndFunction

Function Fragment_Stage_0132_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Beta, Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None))
  kmyQuest.PlaySpaceScene(LC088_Space_CF_132_AllyStart)
EndFunction

Function Fragment_Stage_0133_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(2)
EndFunction

Function Fragment_Stage_0138_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryBeta.GetShipRef())
  If Self.GetStageDone(128) && Self.GetStageDone(138) && Self.GetStageDone(148)
    Self.SetStage(150)
  Else
    kmyQuest.PlaySpaceScene(LC088_Space_CF_138_BetaComplete)
  EndIf
EndFunction

Function Fragment_Stage_0139_Item_00()
  CF08_Fleet.SetStage(130)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetUpGammaShipsAll()
  Utility.Wait(2.0)
  If Self.GetStageDone(17)
    kmyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Gamma, Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None))
    kmyQuest.PlaySpaceScene(LC088_Space_CF_142_AllyStart)
  Else
    kmyQuest.PlaySpaceScene(LC088_Space_CF_140_GammaStart)
  EndIf
EndFunction

Function Fragment_Stage_0141_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(3)
EndFunction

Function Fragment_Stage_0148_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryGamma.GetShipRef())
  If Self.GetStageDone(128) && Self.GetStageDone(138) && Self.GetStageDone(148)
    Self.SetStage(150)
  Else
    kmyQuest.PlaySpaceScene(LC088_Space_CF_148_GammaComplete)
  EndIf
EndFunction

Function Fragment_Stage_0149_Item_00()
  CF08_Fleet.SetStage(140)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), False)
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyBehindCFLinesMarker.GetRef())
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyBehindCFLinesMarker.GetRef())
  kmyQuest.Main_FormCFBattleLine()
  Alias_CF_MainBattleAnnouncementMarker.GetRef().MoveTo(Alias_playerShip.GetRef(), 0.0, 0.0, 0.0, True, False)
  kmyQuest.PlaySpaceScene(LC088_Space_CF_150_ReadyForMainBattle)
EndFunction

Function Fragment_Stage_0151_Item_00()
  CF08_Fleet.SetStage(210)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(33)
    Self.SetStage(162)
    Self.SetStage(161)
    Return 
  EndIf
  kmyQuest.PlaySpaceScene(LC088_Space_CF_160_MainBattleStart)
EndFunction

Function Fragment_Stage_0161_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  CF08_Fleet.SetStage(220)
  kmyQuest.CF_Main_ReadyForVigilanceInvulnerableScene()
  kmyQuest.Main_SetMusicOverrideActive(True)
  kmyQuest.Main_SetPlayerControlsEnabled(True)
  kmyQuest.Main_EVPAllNoWait(False)
  kmyQuest.UnblockIncidentalDialogue(4)
EndFunction

Function Fragment_Stage_0162_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.Main_EnableSDFleet(Alias_CF_Enemies_Main)
EndFunction

Function Fragment_Stage_0163_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_CF_163_VigilanceInvulnerable)
EndFunction

Function Fragment_Stage_0165_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_CF_165_Reinforcements1)
  kmyQuest.Main_TriggerReinforcements(1)
EndFunction

Function Fragment_Stage_0169_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.Main_TriggerReinforcements(2)
  kmyQuest.PlaySpaceScene(LC088_Space_CF_169_AllyStart)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_CF_170_Reinforcements2)
  kmyQuest.Main_TriggerReinforcements(3)
EndFunction

Function Fragment_Stage_0173_Item_00()
  CF08_Fleet.SetStage(225)
EndFunction

Function Fragment_Stage_0175_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_CF_175_VigilanceEscortsDefeated)
EndFunction

Function Fragment_Stage_0179_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.CF_Main_FireBatteriesAtVigilance()
  CF08_Fleet.SetStage(230)
  kmyQuest.CF_Main_RemoveVigilanceInvulnerability()
EndFunction

Function Fragment_Stage_0180_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_CF_180_VigilanceDefeated)
EndFunction

Function Fragment_Stage_0181_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)
  kmyQuest.CF_Main_StartDockingWithVigilance()
  CF08_Fleet.SetStage(240)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_CF_190_BoardVigilance)
EndFunction

Function Fragment_Stage_0191_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  CF08_Fleet.SetStage(310)
  kmyQuest.Main_SetMusicOverrideActive(False)
EndFunction

Function Fragment_Stage_0195_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)
EndFunction

Function Fragment_Stage_0199_Item_00()
  Alias_DefensiveBatteryAlphaMapMarker.TryToDisable()
  Alias_DefensiveBatteryBetaMapMarker.TryToDisable()
  Alias_DefensiveBatteryGammaMapMarker.TryToDisable()
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Alias_KeyMapMarker.TryToDisable()
  Alias_SuvorovSurfaceLocation.GetLocation().EnableSpaceTravel(Self as Quest, False)
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, False)
  CF_Main.SetStage(200)
  LC082.SetStage(210)
  kmyQuest.SD_SetupAllyGroup()
  kmyQuest.IgnoreAlliedFriendlyHits()
  Alias_Vigilance.GetShipRef().IgnoreFriendlyHits(True)
  CF07.SetStage(1000)
  CF08_SysDef.SetStage(10)
  kmyQuest.EnableDataCoreAnalyzer(False)
  Alias_CF_Enemies_Skirmish.DisableAll(False)
  Alias_CF_Allies_Skirmish.DisableAll(False)
  kmyQuest.SetupAllCaptainEvents()
  kmyQuest.SetupKeyTurrets()
  Utility.Wait(2.0)
  kmyQuest.PlaySpaceScene(LC088_Space_SD_200_SkirmishStart)
EndFunction

Function Fragment_Stage_0201_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(0)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_SD_205_SkirmishComplete)
EndFunction

Function Fragment_Stage_0206_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)
  CF08_SysDef.SetStage(20)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetupDefensiveBatteries()
  Alias_SD_Enemies_Alpha.EnableAll(False)
  Alias_SD_Enemies_Beta.EnableAll(False)
  Alias_SD_Enemies_Gamma.EnableAll(False)
  Alias_SD_Enemies_Main.EnableAll(False)
  Alias_SD_Enemies_Main_Reinforcements_1.EnableAll(False)
  Alias_SD_Enemies_Main_Reinforcements_2.EnableAll(False)
  kmyQuest.Main_FormCFBattleLine()
  kmyQuest.SD_SetupMainEnemyReinforcements()
  kmyQuest.SD_CalculateMainBattleCounts()
  Actor player = Game.GetPlayer()
  If player.GetValue(CFSD01EvidenceTotal) >= LC088_Space_CFSD01EvidenceCountForSquadBeta.GetValue()
    Self.SetStage(21)
    Alias_SD_Allies_Beta.EnableAll(False)
  EndIf
  If player.GetValue(CFSD01EvidenceTotal) >= LC088_Space_CFSD01EvidenceCountForSquadGamma.GetValue()
    Self.SetStage(22)
    Alias_SD_Allies_Gamma.EnableAll(False)
  EndIf
  Alias_SD_Mines_Alpha_EnableMarker.TryToEnable()
  kmyQuest.RegisterForLoadScreenEvent()
  Alias_DefensiveBatteryAlphaMapMarker.TryToEnable()
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None))
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True)
  Self.SetStageNoWait(211)
EndFunction

Function Fragment_Stage_0211_Item_00()
  LC088_Key.Start()
EndFunction

Function Fragment_Stage_0220_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  LC082.UpdateVigilanceLocation("Shutdown")
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), False)
  If !Self.GetStageDone(7) && !Self.GetStageDone(8) && !Self.GetStageDone(9)
    Utility.Wait(2.0)
    kmyQuest.SD_UpdateAndMoveAllyGroup(1)
    kmyQuest.PlaySpaceScene(LC088_Space_SD_220_AlphaStart)
  EndIf
EndFunction

Function Fragment_Stage_0221_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(1)
EndFunction

Function Fragment_Stage_0226_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(226) && Self.GetStageDone(227)
    Self.SetStage(228)
  Else
    kmyQuest.SD_PlayBatteryPhaseCompleteScene(1)
  EndIf
EndFunction

Function Fragment_Stage_0227_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(226) && Self.GetStageDone(227)
    Self.SetStage(228)
  Else
    kmyQuest.SD_PlayBatteryDestroyedScene(1)
  EndIf
EndFunction

Function Fragment_Stage_0228_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_SD_228_AlphaComplete)
EndFunction

Function Fragment_Stage_0229_Item_00()
  Alias_DefensiveBatteryBetaMapMarker.TryToEnable()
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None))
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True)
  CF08_SysDef.SetStage(120)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If !Self.GetStageDone(8) && !Self.GetStageDone(9)
    Utility.Wait(2.0)
    kmyQuest.SD_UpdateAndMoveAllyGroup(2)
    kmyQuest.PlaySpaceScene(LC088_Space_SD_230_BetaStart)
  EndIf
EndFunction

Function Fragment_Stage_0231_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(2)
EndFunction

Function Fragment_Stage_0236_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(236) && Self.GetStageDone(237)
    Self.SetStage(238)
  Else
    kmyQuest.SD_PlayBatteryPhaseCompleteScene(2)
  EndIf
EndFunction

Function Fragment_Stage_0237_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(236) && Self.GetStageDone(237)
    Self.SetStage(238)
  Else
    kmyQuest.SD_PlayBatteryDestroyedScene(2)
  EndIf
EndFunction

Function Fragment_Stage_0238_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_SD_238_BetaComplete)
EndFunction

Function Fragment_Stage_0239_Item_00()
  Alias_DefensiveBatteryGammaMapMarker.TryToEnable()
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None))
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True)
  CF08_SysDef.SetStage(130)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If !Self.GetStageDone(9)
    Utility.Wait(2.0)
    kmyQuest.SD_UpdateAndMoveAllyGroup(3)
    kmyQuest.SetUpGammaShipsAll()
    kmyQuest.PlaySpaceScene(LC088_Space_SD_240_GammaStart)
  EndIf
EndFunction

Function Fragment_Stage_0241_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.UnblockIncidentalDialogue(3)
EndFunction

Function Fragment_Stage_0246_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(246) && Self.GetStageDone(247)
    Self.SetStage(248)
  Else
    kmyQuest.SD_PlayBatteryPhaseCompleteScene(3)
  EndIf
EndFunction

Function Fragment_Stage_0247_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(246) && Self.GetStageDone(247)
    Self.SetStage(248)
  Else
    kmyQuest.SD_PlayBatteryDestroyedScene(3)
  EndIf
EndFunction

Function Fragment_Stage_0248_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.Main_EVPAllNoWait(False)
  kmyQuest.PlaySpaceScene(LC088_Space_SD_248_GammaComplete)
EndFunction

Function Fragment_Stage_0249_Item_00()
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeySDArrivalMarker.GetRef())
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeySDArrivalMarker.GetRef())
  Alias_KeyMapMarker.TryToEnable()
  Alias_SuvorovSurfaceLocation.GetLocation().EnableSpaceTravel(Self as Quest, True)
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True)
  CF08_SysDef.SetStage(140)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SD_UpdateAndMoveAllyGroup(4)
  If Self.GetStageDone(33)
    Self.SetStage(261)
    Return 
  EndIf
  kmyQuest.PlaySpaceScene(LC088_Space_SD_260_MainBattleStart)
EndFunction

Function Fragment_Stage_0261_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  CF08_SysDef.SetStage(220)
  kmyQuest.Main_SetMusicOverrideActive(True)
  kmyQuest.Main_SetPlayerControlsEnabled(True)
  kmyQuest.Main_EVPAllNoWait(False)
  kmyQuest.UnblockIncidentalDialogue(4)
EndFunction

Function Fragment_Stage_0265_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_SD_265_VigilanceArrives01)
EndFunction

Function Fragment_Stage_0266_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.Main_EnableSDFleet(Alias_SD_Allies_Main_SysDefFleet)
  kmyQuest.Main_EVPAllNoWait(True)
  kmyQuest.PlaySpaceScene(LC088_Space_SD_266_VigilanceArrives02)
EndFunction

Function Fragment_Stage_0267_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_SD_267_VigilanceArrives03)
EndFunction

Function Fragment_Stage_0268_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.Main_EVPAllNoWait(False)
EndFunction

Function Fragment_Stage_0269_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Self.SetStage(268)
  If Self.GetStageDone(270)
    kmyQuest.PlaySpaceScene(LC088_Space_SD_280_CFDefendersDefeated)
  EndIf
EndFunction

Function Fragment_Stage_0270_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  If Self.GetStageDone(265)
    kmyQuest.PlaySpaceScene(LC088_Space_SD_280_CFDefendersDefeated)
  Else
    Self.SetStage(265)
  EndIf
EndFunction

Function Fragment_Stage_0271_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SD_SwitchKeyToSDDocking()
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)
  CF08_SysDef.SetStage(230)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.PlaySpaceScene(LC088_Space_SD_290_BoardKey)
EndFunction

Function Fragment_Stage_0291_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  CF08_SysDef.SetStage(310)
  kmyQuest.Main_SetMusicOverrideActive(False)
EndFunction

Function Fragment_Stage_0293_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SD_DisableAllyLeaderShips()
EndFunction

Function Fragment_Stage_0295_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)
  Alias_playerShip.TryToStopCombat()
EndFunction

Function Fragment_Stage_0299_Item_00()
  Alias_DefensiveBatteryAlphaMapMarker.TryToDisable()
  Alias_DefensiveBatteryBetaMapMarker.TryToDisable()
  Alias_DefensiveBatteryGammaMapMarker.TryToDisable()
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
  Alias_CF_Enemies_All.DisableAll(False)
  Alias_CF_Allies_All.DisableAll(False)
  Alias_SD_Enemies_All.DisableAll(False)
  Alias_SD_Allies_All.DisableAll(False)
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)
  If Self.GetStageDone(100)
    Self.SetStage(199)
  ElseIf Self.GetStageDone(200)
    Self.SetStage(299)
  EndIf
  kmyQuest.Cleanup()
  Self.Stop()
EndFunction
