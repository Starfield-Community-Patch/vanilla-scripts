ScriptName Fragments:Quests:QF_MQ102_000114CD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ102_020_SentinelMoara Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Scene Property MQ102_023_ReturnLodge Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Scene Property MQ102_024_AddArtifact Auto Const mandatory
Scene Property MQ102_001_PlayerScene Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Scene Property MQ102_002_MASTScene Auto Const mandatory
Scene Property MQ102_012_SearchCluesScene Auto Const mandatory
Scene Property MQ102_014_JupiterScene Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
Quest Property MQ102SpaceEncounter02a Auto Const mandatory
Quest Property MQ102SpaceEncounter03 Auto Const mandatory
Scene Property MQ102_033_SaturnScene Auto Const mandatory
Scene Property MQ102_034_ApproachShipScene Auto Const mandatory
Scene Property MQ102_037_SarahWrapUp Auto Const mandatory
Scene Property MQ102_036_MoaraLockedUp Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Scene Property MQ102_007_SarahVenusScene Auto Const mandatory
Quest Property UC01 Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_FirstEncounterShip Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_MoaraShip Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_MoaraShipEnemies Auto Const mandatory
Quest Property MQ102xPostQuest Auto Const mandatory
ReferenceAlias Property Alias_Moara Auto Const mandatory
ObjectReference Property CydoniaBarSandboxMarker Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Scene Property MQ102_035_ShipDisabledScene Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipCaptiveMarker Auto Const mandatory
ObjectReference Property MQ102ArtifactSpawnMarker Auto Const mandatory
ReferenceAlias Property Alias_MQ102Artifact Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
Scene Property AudioLogs_MQ102_Pirate Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
Quest Property MoaraEliteCrewQuest Auto Const
Armor Property Spacesuit_Constellation_Helmet_01 Auto Const mandatory
Armor Property Spacesuit_Constellation_Backpack_01 Auto Const mandatory
Armor Property Spacesuit_Constellation_01 Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
ActorValue Property SpaceshipShieldHealth Auto Const mandatory
LocationAlias Property Alias_CityCydoniaLocation Auto Const mandatory
Quest Property TestGoToSpaceQuest Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipMarker Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Scene Property MQ102_008_VaruunScene02_Sarah Auto Const mandatory
Scene Property MQ102_008_VaruunScene01 Auto Const mandatory
Faction Property MQ102VaruunFaction Auto Const mandatory
Scene Property MQ102_012_MoaraSatelliteScene Auto Const mandatory
ReferenceAlias Property Alias_NovaMoaraLog Auto Const mandatory
Scene Property MQ102_014_MoonScene Auto Const mandatory
Scene Property MQ102_015_StaryardSarahComment01 Auto Const mandatory
Scene Property MQ102_016_StaryardSarahComment02 Auto Const mandatory
Scene Property MQ102_016_StaryardSarahComment03 Auto Const mandatory
Message Property Tutorial_ShipStealth_MSGBox Auto Const mandatory
Message Property Tutorial_Docking_MSGBox Auto Const mandatory
Message Property Tutorial_Boarding_MSGBox01 Auto Const mandatory
Message Property Tutorial_Boarding_MSGBox01_PC Auto Const mandatory
Message Property Tutorial_Boarding_MSGBox02 Auto Const mandatory
Scene Property MQ102_037_Moara Auto Const mandatory
ReferenceAlias Property Alias_MQ102ArtifactMoara Auto Const mandatory
Message Property MQ102SarahLockInMSG Auto Const mandatory
Message Property MQ102SarahLockInOverMSG Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipBoss Auto Const mandatory
ReferenceAlias Property Alias_SatelliteBeacon Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
wwiseevent Property QST_MQ102_Satellite_Activate_WEF Auto Const mandatory
Scene Property FFLodge01_Stage20_Noel_TourScene Auto Const mandatory
GlobalVariable Property MQ102_BlockNoelTour Auto Const mandatory
Quest Property FFLodge01_Actual Auto Const mandatory
Keyword Property CurrentInteractionLinkedRefKeyword Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
RefCollectionAlias Property DisembarkingCrew Auto Const
conditionform Property COM_Quest_SarahMorgan_Q01_SarahLockInCND Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Keyword Property COM_PreventStoryGateScenes Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipCockpitDoor Auto Const mandatory
Activator Property COM_MQ102_TxtReplace_QuestName_SarahMorgan Auto Const mandatory
Scene Property MQ102_033_NeptuneScene Auto Const mandatory
Quest Property MQ00 Auto Const mandatory
ReferenceAlias Property PlayerShipPassengerMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1635)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().additem(Credits as Form, 1000, False)
  Self.SetStage(10)
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  SQ_PlayerShip.ResetHomeShip(Frontier_ModularREF as spaceshipreference)
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  Self.SetStage(10)
  Self.SetStage(100)
  Self.SetStage(200)
  Self.SetStage(300)
  TestGoToSpaceQuest.SetStage(10)
  Utility.Wait(0.5)
  Alias_SarahMorgan.GetRef().moveto(Game.GetPlayer() as ObjectReference, 0.0, -2.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_Vasco.GetActorRef().EvaluatePackage(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("FollowerWarn")
EndFunction

Function Fragment_Stage_0096_Item_00()
  Message.ClearHelpMessages()
EndFunction

Function Fragment_Stage_0097_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(96)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Message.ClearHelpMessages()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0)
  (SQ_Companions as sq_companionsscript).LockInCompanion(SarahMorganREF as companionactorscript, True, MQ102SarahLockInMSG, COM_MQ102_TxtReplace_QuestName_SarahMorgan)
  SarahMorganREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  If !UC01.GetStageDone(100)
    MQ102_002_MASTScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  UC01.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_NovaMoaraLog.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Message.ClearHelpMessages()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  Self.SetObjectiveCompleted(10, True)
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0)
  (SQ_Companions as sq_companionsscript).LockInCompanion(SarahMorganREF as companionactorscript, True, MQ102SarahLockInMSG, COM_MQ102_TxtReplace_QuestName_SarahMorgan)
  SarahMorganREF.EvaluatePackage(False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0275_Item_00()
  Self.SetObjectiveDisplayed(32, True, False)
EndFunction

Function Fragment_Stage_0277_Item_00()
  Self.SetObjectiveCompleted(32, True)
EndFunction

Function Fragment_Stage_0285_Item_00()
  Game.GetPlayer().removeitem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0287_Item_00()
  Game.GetPlayer().removeitem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  mq102script kmyQuest = __temp as mq102script
  kmyQuest.BlockSpaceTravel()
  MQ102_007_SarahVenusScene.Start()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(41, True, False)
  Self.SetObjectiveDisplayed(32, False, False)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Alias_SarahMorgan.GetRef().moveto(PlayerShipPassengerMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(41, True)
  Self.SetObjectiveDisplayed(42, True, False)
  Self.SetObjectiveDisplayed(43, True, False)
  Tutorial_ShipStealth_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  kmyQuest.ShowHelpMessage("SpaceTarget")
EndFunction

Function Fragment_Stage_0410_Item_01()
  Quest __temp = Self as Quest
  mq102script kmyQuest = __temp as mq102script
  kmyQuest.UnBlockSpaceTravel()
EndFunction

Function Fragment_Stage_0415_Item_00()
  MQ102SpaceEncounter02a.Start()
  Game.GetPlayer().addtoFaction(MQ102VaruunFaction)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(41, True)
  Self.SetObjectiveDisplayed(42, True, False)
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(415)
    MQ102_008_VaruunScene02_Sarah.Start()
  Else
    MQ102_008_VaruunScene01.Start()
  EndIf
EndFunction

Function Fragment_Stage_0425_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("MQ102Satellite")
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveDisplayed(43, False, False)
  Game.GetPlayer().RemoveFromFaction(MQ102VaruunFaction)
EndFunction

Function Fragment_Stage_0490_Item_00()
  ObjectReference SatelliteREF = Alias_SatelliteBeacon.GetRef()
  SatelliteREF.BlockActivation(True, True)
  QST_MQ102_Satellite_Activate_WEF.Play(SatelliteREF, None, None)
  Message.ClearHelpMessages()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(42, True)
  Self.SetObjectiveCompleted(44, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(55, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Self.SetObjectiveDisplayed(43, False, False)
  MQ102_012_MoaraSatelliteScene.Start()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  mq102script kmyQuest = __temp as mq102script
  kmyQuest.BlockSpaceTravel()
  MQ102_012_MoaraSatelliteScene.Stop()
  MQ102_014_MoonScene.Start()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(61, True, False)
  Alias_NovaMoaraLog.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest
  mq102script kmyQuest = __temp as mq102script
  kmyQuest.UnBlockSpaceTravel()
  Self.SetObjectiveCompleted(61, True)
  Self.SetObjectiveDisplayed(65, True, False)
  Tutorial_Docking_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(65, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetObjectiveCompleted(61, True)
  Self.SetObjectiveCompleted(65, True)
  Self.SetObjectiveDisplayed(70, True, False)
  MQ102_015_StaryardSarahComment01.Start()
EndFunction

Function Fragment_Stage_0540_Item_00()
  MQ102_016_StaryardSarahComment02.Start()
EndFunction

Function Fragment_Stage_0590_Item_00()
  Self.SetObjectiveCompleted(61, True)
  Self.SetObjectiveCompleted(65, True)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0595_Item_00()
  MQ102_016_StaryardSarahComment03.Start()
EndFunction

Function Fragment_Stage_0600_Item_00()
  MQ102_033_SaturnScene.Start()
  Self.SetObjectiveDisplayed(85, False, False)
EndFunction

Function Fragment_Stage_0605_Item_00()
  ObjectReference ShipMarkerREF = Alias_MoaraShipMarker.GetRef()
  spaceshipreference MoaraShipREF = Alias_MoaraShip.GetShipReference()
  MoaraShipREF.moveto(ShipMarkerREF, 0.0, 0.0, 0.0, True, False)
  MoaraShipREF.Enable(False)
  MoaraShipREF.DamageValue(SpaceshipEngineHealth, 2.0)
  MoaraShipREF.EnablePartRepair(SpaceshipEngineHealth, False)
  MoaraShipREF.DamageValue(SpaceshipShieldHealth, 3.0)
  MoaraShipREF.EnablePartRepair(SpaceshipShieldHealth, False)
  MoaraShipREF.SetNoBleedoutRecovery(True)
EndFunction

Function Fragment_Stage_0607_Item_00()
  Self.SetStage(620)
  Self.SetStage(630)
  MQ102_033_NeptuneScene.Stop()
  MQ102_034_ApproachShipScene.Stop()
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(32, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(41, True)
  Self.SetObjectiveCompleted(42, True)
  Self.SetObjectiveDisplayed(43, False, False)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveCompleted(61, True)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
  MQ102_034_ApproachShipScene.Start()
  spaceshipreference MoaraShipREF = Alias_MoaraShip.GetShipReference()
  MoaraShipREF.SetValue(Aggression, 1.0)
  MoaraShipREF.addtoFaction(PlayerEnemyFaction)
  MoaraShipREF.StartCombat(Alias_PlayerShip.GetShipReference(), False)
  MoaraShipREF.EnablePartRepair(SpaceshipEngineHealth, False)
EndFunction

Function Fragment_Stage_0630_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
EndFunction

Function Fragment_Stage_0630_Item_01()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0640_Item_00()
  Tutorial_Boarding_MSGBox02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0640_Item_01()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
  MQ102_034_ApproachShipScene.Stop()
  MQ102_035_ShipDisabledScene.Start()
  Alias_Moara.GetActorRef().moveto(Alias_MoaraShipCaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Actor MoaraREF = Alias_Moara.GetActorRef()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
  MQ102_035_ShipDisabledScene.Stop()
  MoaraREF.moveto(Alias_MoaraShipCaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  MoaraREF.SetGhost(True)
  ObjectReference PlacementREF = Alias_MQ102ArtifactMoara.GetRef()
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(3, PlacementREF)
  Alias_MQ102Artifact.ForceRefTo(ArtifactREF)
  ArtifactREF.Enable(False)
  ArtifactREF.BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0652_Item_00()
  Self.SetStage(660)
EndFunction

Function Fragment_Stage_0655_Item_00()
  ObjectReference CockpitDoorREF = Alias_MoaraShipCockpitDoor.GetRef()
  CockpitDoorREF.SetOpen(True)
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveCompleted(130, True)
  MQ102_036_MoaraLockedUp.Start()
  Game.GetPlayer().StopCombatAlarm()
  spaceshipreference MoaraShipREF = Alias_MoaraShip.GetShipReference()
  MoaraShipREF.SetValue(Aggression, 0.0)
  MoaraShipREF.addtoFaction(PlayerAllyFaction)
  MoaraShipREF.RemoveFromFaction(PlayerEnemyFaction)
  MoaraShipREF.SetValue(DockingPermission, 0.0)
  MoaraShipREF.SetIgnoreFriendlyHits(True)
  ObjectReference CockpitDoorREF = Alias_MoaraShipCockpitDoor.GetRef()
  If Self.GetStageDone(670) || CockpitDoorREF.GetOpenState() <= 2
    Self.SetStage(680)
  Else
    Self.SetObjectiveDisplayed(140, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0670_Item_00()
  Self.SetObjectiveCompleted(140, True)
  If Self.GetStageDone(660)
    Self.SetStage(680)
  EndIf
EndFunction

Function Fragment_Stage_0680_Item_00()
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0805_Item_00()
  Self.SetObjectiveDisplayed(140, False, False)
  Self.SetObjectiveDisplayed(150, True, False)
  MQ102_037_Moara.Start()
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(155, True, False)
  Alias_MQ102Artifact.GetRef().BlockActivation(False, False)
  Actor MoaraREF = Alias_Moara.GetActorRef()
  MoaraREF.SetGhost(False)
EndFunction

Function Fragment_Stage_0820_Item_00()
  Self.SetObjectiveCompleted(155, True)
  Self.SetObjectiveDisplayed(160, True, False)
  MQ102_037_SarahWrapUp.Start()
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(3)
  ArmillaryMountSwapEnableMarker.DisableNoWait(False)
EndFunction

Function Fragment_Stage_0830_Item_00()
  MQ102_023_ReturnLodge.Start()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleInActive(SarahMorganREF, True, False, True)
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference)
  SarahMorganREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(170, True, False)
  MQ102_BlockNoelTour.SetValue(1.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  MQ102_023_ReturnLodge.Stop()
  MQ102_024_AddArtifact.Start()
  Self.SetObjectiveCompleted(170, True)
  Self.SetObjectiveDisplayed(180, True, False)
  If FFLodge01_Stage20_Noel_TourScene.IsPlaying()
    FFLodge01_Stage20_Noel_TourScene.Stop()
    FFLodge01_Actual.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_1010_Item_00()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(SarahMorganREF, True)
  (SarahMorganREF as companionactorscript).AllowStoryGatesAndRestartTimer()
EndFunction

Function Fragment_Stage_1110_Item_00()
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_1120_Item_00()
  Self.SetStage(1100)
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0)
  SarahMorganREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.CompleteAllObjectives()
  MQ103.SetStageNoWait(10)
  MQ104.SetStageNoWait(10)
  FFLodge01.SetStageNoWait(10)
  MQ102xPostQuest.Start()
  RAD02.SetStageNoWait(5)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  If COM_Quest_SarahMorgan_Q01_SarahLockInCND.IsTrue(SarahMorganREF as ObjectReference, None)
    
  Else
    (SQ_Companions as sq_companionsscript).LockInCompanion(SarahMorganREF as companionactorscript, False, MQ102SarahLockInOverMSG, None)
  EndIf
  Self.SetStage(1130)
  MQ102SpaceEncounter02a.Stop()
  MQ102SpaceEncounter03.Stop()
  Game.GetPlayer().RemoveFromFaction(MQ102VaruunFaction)
  Actor MoaraREF = Alias_Moara.GetActorRef()
  MoaraREF.moveto(CydoniaBarSandboxMarker, 0.0, 0.0, 0.0, True, False)
  MoaraREF.EvaluatePackage(False)
  MoaraREF.SetGhost(False)
  MoaraEliteCrewQuest.SetStage(1)
  MQ102_BlockNoelTour.SetValue(0.0)
  (MQ00 as mq00questscript).StartMQ104AFailsafeTimer()
  (MQ00 as mq00questscript).StartMQ104BFailsafeTimer()
EndFunction
