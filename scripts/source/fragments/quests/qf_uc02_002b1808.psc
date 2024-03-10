ScriptName Fragments:Quests:QF_UC02_002B1808 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property PUC02_DEBUG_CollectShipUpgrades Auto Const mandatory
Scene Property UC02_090_HerathAttractScene Auto Const mandatory
Scene Property UC02_300_HadrianAttractScene Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
Quest Property UC02_TrackerQuest Auto Const mandatory
ObjectReference Property DebugMarker01 Auto Const
ObjectReference Property DebugMarker02 Auto Const
Scene Property UC02_700a_HeadingToTerrormorph Auto Const mandatory
Explosion Property CarExplosion Auto Const
ObjectReference Property DebugMarker03 Auto Const
ReferenceAlias Property Alias_ExplosionSource Auto Const mandatory
Scene Property UC02_700_TerrormorphDead Auto Const mandatory
ObjectReference Property DebugMarker04 Auto Const
Scene Property UC02_600_HadrianRadioScene Auto Const mandatory
LeveledItem Property TestVSWeapons Auto Const mandatory
Message Property UC02_DEBUG_HadrianCantMove Auto Const
Quest Property UC03 Auto Const mandatory
ReferenceAlias Property Alias_Antennas Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Scene Property UC02_610_PlayerTunedTrackingSystem Auto Const mandatory
ObjectReference Property DebugMarker05 Auto Const
ReferenceAlias Property Alias_SignalTerminal Auto Const mandatory
ReferenceAlias Property Alias_FuelTankObj Auto Const mandatory
ReferenceAlias Property Alias_LurePathingTarget Auto Const mandatory
RefCollectionAlias Property Alias_PowerBoxes Auto Const mandatory
GlobalVariable Property UC02_PowerBoxesTotal Auto Const mandatory
GlobalVariable Property UC02_PowerBoxesActivated Auto Const mandatory
Scene Property UC02_301_HadrianAttractScene Auto Const mandatory
GlobalVariable Property UC_PlayerKnowsHadriansPast Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Scene Property UC02_700b_TerrormorphKilled_CompanionResponse Auto Const mandatory
ReferenceAlias Property Alias_ShipTech Auto Const mandatory
GlobalVariable Property UC02_HadrianKnowsPlayerIsVanguard Auto Const mandatory
Scene Property UC02_607_TanksPrimed Auto Const mandatory
ObjectReference Property TerrTeleMarker Auto Const
Message Property UC02_DEBUG_CombatPolish Auto Const mandatory
ReferenceAlias Property Alias_HadrianGenetag Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCellSample Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Message Property UC02_DEBUG_TrackingTerminalBusted Auto Const mandatory
Quest Property UC02_ScannerQuest Auto Const mandatory
GlobalVariable Property UC02_RewardCredits Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ObjectReference Property UC02_DebugMarker07 Auto Const mandatory
ObjectReference Property UC02_HadrianMarker_Scene750 Auto Const mandatory
Quest Property UC01 Auto Const mandatory
LeveledItem Property LL_UC01_VanguardNewRecruitKit Auto Const mandatory
Quest Property CF01 Auto Const mandatory
GlobalVariable Property DialogueCydonia_RedEyes Auto Const mandatory
GlobalVariable Property UC02_UCShipComponentsUnlocked Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphTempFriendAlias Auto Const mandatory
Perk Property BackgroundSoldier Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
Perk Property BackgroundCombatMedic Auto Const mandatory
Armor Property Spacesuit_UCVanguard_Helmet_Armored Auto Const mandatory
Armor Property Spacesuit_UCVanguard_LightArmored Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_Londinion Auto Const mandatory
wwiseevent Property NPC_Terrormorph_Scream_WEF Auto Const mandatory
Weather Property WeatherThunderstormC01H050D015 Auto Const mandatory
ReferenceAlias Property Alias_PlayerTerrormorphFriendAlias Auto Const mandatory
ReferenceAlias Property Alias_HadrianShipEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_NATarmacShipEnableMarker Auto Const mandatory
ObjectReference Property UC03_TerrormorphSpawn_Spaceport Auto Const mandatory
ReferenceAlias Property Alias_ChiefHerath Auto Const mandatory
ObjectReference Property UC02_ChiefHerath_TeleportMarker Auto Const mandatory
ReferenceAlias Property Alias_ObjMarker200 Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphPreyFriendAlias Auto Const mandatory
ReferenceAlias Property Alias_RevealCritter Auto Const mandatory
ReferenceAlias Property Alias_TauCetiWeatherTrigger Auto Const mandatory
RefCollectionAlias Property Alias_SecurityBldgDoors Auto Const mandatory
LeveledItem Property LL_Spacesuit_UCVanguard_LightArmored_FullSet_AnyQuality Auto Const mandatory
ReferenceAlias Property Alias_SecurityOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_SecurityOfficeDoorCollision Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0210_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0001_Item_00()
  UC01.Start()
  UC01.SetStage(1000)
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  Game.GetPlayer().MoveTo(DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.MoveTo(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  Self.SetStage(19)
EndFunction

Function Fragment_Stage_0002_Item_00()
  UC01.Start()
  UC01.SetStage(1000)
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Game.GetPlayer().MoveTo(DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(19)
EndFunction

Function Fragment_Stage_0003_Item_00()
  UC01.Start()
  UC01.SetStage(1000)
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Self.SetStage(300)
  UC02_300_HadrianAttractScene.Stop()
  Self.SetStage(310)
  Game.GetPlayer().MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(19)
EndFunction

Function Fragment_Stage_0004_Item_00()
  UC01.Start()
  UC01.SetStage(1000)
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Self.SetStage(300)
  UC02_300_HadrianAttractScene.Stop()
  Self.SetStage(310)
  Self.SetStage(410)
  Self.SetStage(420)
  Self.SetStage(500)
  Game.GetPlayer().MoveTo(DebugMarker04, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(19)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Game.GetPlayer().MoveTo(DebugMarker05, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(19)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(310)
  Self.SetStage(410)
  Self.SetStage(420)
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(607)
  Game.GetPlayer().MoveTo(DebugMarker04, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  UC02_600_HadrianRadioScene.Stop()
  UC02_300_HadrianAttractScene.Stop()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(19)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  UC01.SetStage(1000)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(310)
  Self.SetStage(410)
  Self.SetStage(420)
  Self.SetStage(500)
  Self.SetStage(700)
  Self.SetStage(740)
  Self.SetStage(750)
  Game.GetPlayer().MoveTo(UC02_DebugMarker07, 0.0, 0.0, 0.0, True, False)
  Alias_Hadrian.GetRef().MoveTo(UC02_HadrianMarker_Scene750, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  UC02_600_HadrianRadioScene.Stop()
  UC02_300_HadrianAttractScene.Stop()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(500, True)
  Self.SetStage(19)
EndFunction

Function Fragment_Stage_0019_Item_00()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddPerk(BackgroundSoldier, False)
  PlayACT.AddPerk(BackgroundCombatMedic, False)
  PlayACT.AddPerk(BackgroundXenobiologist, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  DialogueCydonia_RedEyes.SetValue(1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
  Alias_NATarmacShipEnableMarker.GetRef().Enable(False)
  Alias_ChiefHerath.GetRef().MoveTo(UC02_ChiefHerath_TeleportMarker, 0.0, 0.0, 0.0, True, False)
  Alias_ShipTech.GetRef().MoveTo(UC02_ChiefHerath_TeleportMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0105_Item_00()
  UC02_090_HerathAttractScene.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_ShipTech.GetActorRef().EvaluatePackage(False)
  Alias_ChiefHerath.GetActorRef().EvaluatePackage(False)
  UC02_090_HerathAttractScene.Stop()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0129_Item_00()
  PUC02_DEBUG_CollectShipUpgrades.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Hadrian.GetRef().Enable(False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  ObjectReference PlayShip = Alias_PlayerShip.GetRef()
  PlayShip.AddItem(Alias_Antennas.GetRef() as Form, 1, False)
  PlayShip.AddItem(LL_UC01_VanguardNewRecruitKit as Form, 1, False)
  Alias_HadrianShipEnableMarker.GetRef().Enable(False)
  Alias_TauCetiWeatherTrigger.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  NPC_Terrormorph_Scream_WEF.Play(Alias_ObjMarker200.GetRef(), None, None)
  Utility.Wait(3.0)
  If !Self.GetStageDone(302)
    Self.SetObjectiveCompleted(200, True)
    Self.SetObjectiveDisplayed(250, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.GetStageDone(301)
    Self.SetObjectiveCompleted(200, True)
    Self.SetObjectiveCompleted(250, True)
    Self.SetObjectiveDisplayed(300, True, False)
    UC02_300_HadrianAttractScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.GetStageDone(300)
    Self.SetObjectiveCompleted(200, True)
    Self.SetObjectiveCompleted(250, True)
    Self.SetObjectiveDisplayed(300, True, False)
    UC02_301_HadrianAttractScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0302_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0407_Item_00()
  UC_PlayerKnowsHadriansPast.SetValue(1.0)
EndFunction

Function Fragment_Stage_0412_Item_00()
  Self.SetStage(410)
  Self.SetStage(703)
  If !Self.GetStageDone(705)
    Self.SetObjectiveCompleted(300, True)
    Self.SetObjectiveDisplayed(699, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0440_Item_00()
  UC02_HadrianKnowsPlayerIsVanguard.SetValue(1.0)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(420, True, False)
  Self.SetStage(422)
EndFunction

Function Fragment_Stage_0550_Item_00()
  If Self.GetStageDone(500)
    Self.SetStage(599)
  EndIf
EndFunction

Function Fragment_Stage_0599_Item_00()
  If !Self.GetStageDone(700)
    Self.SetObjectiveDisplayedAtTop(500)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  uc02_questscript kmyQuest = __temp as uc02_questscript
  If Self.GetStageDone(500) && !Self.GetStageDone(700)
    Self.SetObjectiveCompleted(420, True)
    Self.SetObjectiveDisplayed(430, True, False)
    UC02_600_HadrianRadioScene.Start()
  EndIf
  Alias_Terrormorph.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0601_Item_00()
  Quest __temp = Self as Quest
  uc02_questscript kmyQuest = __temp as uc02_questscript
  kmyQuest.SetUpPowerboxObjective()
  Self.SetObjectiveCompleted(605, True)
  Self.SetObjectiveCompleted(607, True)
  If !Self.GetStageDone(700)
    Self.SetObjectiveDisplayed(601, True, False)
  EndIf
  If UC02_ScannerQuest.IsRunning()
    (UC02_ScannerQuest as uc02_scannerquestscript).DisplayDistanceMessage()
  EndIf
EndFunction

Function Fragment_Stage_0605_Item_00()
  Self.SetObjectiveCompleted(420, True)
  Self.SetObjectiveCompleted(430, True)
  Self.SetObjectiveDisplayed(605, True, False)
EndFunction

Function Fragment_Stage_0606_Item_00()
  If !Self.GetStageDone(630) && !Self.GetStageDone(700)
    Alias_TerrormorphTempFriendAlias.ForceRefTo(Alias_Terrormorph.GetRef())
  EndIf
EndFunction

Function Fragment_Stage_0607_Item_00()
  Quest __temp = Self as Quest
  uc02_questscript kmyQuest = __temp as uc02_questscript
  kmyQuest.SealSecurityBldgDoors(True)
  Actor TerREF = Alias_Terrormorph.GetActorRef()
  TerREF.SetGhost(True)
  TerREF.Enable(False)
  TerREF.EvaluatePackage(False)
  UC02_600_HadrianRadioScene.Stop()
  UC02_607_TanksPrimed.Start()
  Self.SetObjectiveCompleted(605, True)
  Self.SetObjectiveDisplayed(607, True, False)
EndFunction

Function Fragment_Stage_0608_Item_00()
  Alias_Terrormorph.GetActorRef().EvaluatePackage(False)
  Alias_SecurityOfficeEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0609_Item_00()
  Quest __temp = Self as Quest
  uc02_questscript kmyQuest = __temp as uc02_questscript
  Actor TerREF = Alias_Terrormorph.GetActorRef()
  TerREF.SetGhost(False)
  TerREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_SignalTerminal.GetRef().Unlock(False)
  Self.SetObjectiveDisplayed(610, True, False)
EndFunction

Function Fragment_Stage_0611_Item_00()
  Alias_RevealCritter.GetActorRef().Kill(None)
EndFunction

Function Fragment_Stage_0612_Item_00()
  Quest __temp = Self as Quest
  uc02_questscript kmyQuest = __temp as uc02_questscript
  kmyQuest.SealSecurityBldgDoors(False)
EndFunction

Function Fragment_Stage_0615_Item_00()
  Quest __temp = Self as Quest
  uc02_questscript kmyQuest = __temp as uc02_questscript
  If !Alias_FuelTankObj.GetRef().IsDisabled()
    Self.SetObjectiveDisplayed(615, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0620_Item_00()
  If !Self.GetStageDone(700)
    UC02_607_TanksPrimed.Start()
  EndIf
  Self.SetObjectiveCompleted(610, True)
EndFunction

Function Fragment_Stage_0630_Item_00()
  Quest __temp = Self as Quest
  uc02_questscript kmyQuest = __temp as uc02_questscript
  Actor TerREF = Alias_Terrormorph.GetActorRef()
  TerREF.SetGhost(False)
  TerREF.EvaluatePackage(False)
  Alias_TerrormorphTempFriendAlias.Clear()
  Alias_PlayerTerrormorphFriendAlias.Clear()
  Alias_TerrormorphPreyFriendAlias.Clear()
  Self.SetStage(599)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(601, True)
EndFunction

Function Fragment_Stage_0655_Item_00()
  Self.SetObjectiveCompleted(615, True)
EndFunction

Function Fragment_Stage_0700_Item_00()
  UC02_TrackerQuest.SetStage(1000)
  UC02_607_TanksPrimed.Stop()
  Self.SetObjectiveCompleted(500, True)
  If Self.GetStageDone(500)
    Self.SetObjectiveDisplayed(699, True, False)
  EndIf
  If !Self.IsObjectiveCompleted(420)
    Self.SetObjectiveDisplayed(420, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(601)
    Self.SetObjectiveDisplayed(601, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(602)
    Self.SetObjectiveDisplayed(602, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(605)
    Self.SetObjectiveDisplayed(605, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(610)
    Self.SetObjectiveDisplayed(610, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(615)
    Self.SetObjectiveDisplayed(615, False, False)
  EndIf
  UC02_700b_TerrormorphKilled_CompanionResponse.Start()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0705_Item_00()
  If Self.GetStageDone(500) || Self.GetStageDone(412)
    Self.SetObjectiveCompleted(699, True)
    Self.SetObjectiveDisplayed(700, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(710, True, False)
EndFunction

Function Fragment_Stage_0740_Item_00()
  Game.GetPlayer().RemoveItem(Alias_TerrormorphCellSample.GetRef() as Form, 1, False, Alias_Hadrian.GetRef())
  Self.SetStage(710)
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(710, True, False)
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(710, True)
  Self.SetObjectiveDisplayed(750, True, False)
EndFunction

Function Fragment_Stage_0752_Item_00()
  UC_PlayerKnows_Londinion.SetValue(1.0)
EndFunction

Function Fragment_Stage_0770_Item_00()
  Game.GetPlayer().AddItem(Alias_HadrianGenetag.GetRef() as Form, 1, False)
  Alias_TauCetiWeatherTrigger.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  PlayREF.AddItem(Alias_TerrormorphCellSample.GetRef() as Form, 1, False)
  PlayREF.AddItem(Credits as Form, UC02_RewardCredits.GetValueInt(), False)
  Self.SetObjectiveCompleted(750, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Alias_NATarmacShipEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0801_Item_00()
  Alias_Hadrian.GetRef().Disable(False)
  Alias_HadrianShipEnableMarker.GetRef().Enable(False)
  Alias_SecurityOfficeEnableMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0860_Item_00()
  CF01.SetStage(205)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  UC03.Start()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddItem(LL_Spacesuit_UCVanguard_LightArmored_FullSet_AnyQuality as Form, 1, False)
  ObjectReference PlayShip = Alias_PlayerShip.GetRef()
  PlayShip.RemoveItem(Alias_Antennas.GetRef() as Form, 1, False, None)
  uc03questscript NextQuest = UC03 as uc03questscript
  NextQuest.TerrormorphCellSample.ForceRefTo(Alias_TerrormorphCellSample.GetRef())
  NextQuest.HadrianGenetag.ForceRefTo(Alias_HadrianGenetag.GetRef())
  UC02_UCShipComponentsUnlocked.SetValue(1.0)
  Game.AddAchievement(11)
  Alias_TauCetiWeatherTrigger.GetRef().Disable(False)
  Self.Stop()
EndFunction
