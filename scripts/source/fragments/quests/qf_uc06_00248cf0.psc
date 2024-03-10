ScriptName Fragments:Quests:QF_UC06_00248CF0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NamelessAlias Auto Const mandatory
Scene Property UC06_400_OrlaseGreetingScene Auto Const mandatory
Scene Property UC06_500_OrlaseDeath Auto Const mandatory
ReferenceAlias Property Alias_OrlaseShip Auto Const mandatory
ReferenceAlias Property Alias_OrlaseID Auto Const mandatory
ObjectReference Property UC06_SpaceBattleTeleportMarker Auto Const mandatory
ObjectReference Property UC06_DebugMarker01 Auto Const mandatory
ObjectReference Property UC06_DebugMarker02 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
Quest Property TestMQ101HelperQuest Auto Const mandatory
Scene Property UC06_90_VaeVictis_Attract Auto Const mandatory
Scene Property UC06_420_OrlaseEngineDisabled Auto Const mandatory
Message Property UC06_Debug_DebrisField Auto Const mandatory
ObjectReference Property UC05_DebugMarker01 Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Message Property UC06_Debug_TroubleTravelingToDen Auto Const mandatory
Message Property UC06_Debug_TravelingToOrlase Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_Orlase Auto Const mandatory
Scene Property UC06_430_OrlaseBoardingScene Auto Const mandatory
Key Property UC06_OrlaseCabinKey Auto Const mandatory
Faction Property UC06_OrlaseFaction Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_KaiserIsARobot Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_VVSurvivedExecution Auto Const mandatory
Quest Property UC07_HadrianVVRevealQuest Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HowVVFoundResearchTeam Auto Const mandatory
Scene Property UC06_100_VaeVictisIntro Auto Const mandatory
Scene Property UC06_140_PlayerExitsVVChamber Auto Const mandatory
Quest Property UC07 Auto Const mandatory
ReferenceAlias Property Alias_OrlaseCabinDoor Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
ReferenceAlias Property Alias_FloorManager Auto Const mandatory
Scene Property UC06_560_VV_ApproachTransfer Auto Const mandatory
ReferenceAlias Property Alias_TransferSystemTrigger Auto Const mandatory
ReferenceAlias Property Alias_VaeVictis Auto Const mandatory
RefCollectionAlias Property Alias_EthereaMines Auto Const mandatory
RefCollectionAlias Property Alias_EthereaTurrets Auto Const mandatory
Scene Property UC06_95_SS7Guard_PlayerApproachesDoor Auto Const mandatory
ReferenceAlias Property Alias_VVChamberDoor Auto Const mandatory
Scene Property UC06_570_System_TransferAccepted Auto Const mandatory
ReferenceAlias Property Alias_ChiefYasin Auto Const mandatory
ReferenceAlias Property Alias_MacIntyre Auto Const mandatory
ReferenceAlias Property Alias_MacIntyreSlateLookMarker Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
wwiseevent Property QST_Orlase_Ship_HostileTransmission_WEF Auto Const mandatory
ReferenceAlias Property Alias_OrlaseCaptainLocker Auto Const mandatory
LeveledItem Property LL_BE_ShipCaptainsLockerLoot_Small Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(UC06_DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(105)
  UC06_90_VaeVictis_Attract.Stop()
  Self.SetStage(99)
  Self.SetStage(200)
  Game.GetPlayer().Moveto(UC06_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(105, True)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(99)
  Self.SetStage(105)
  UC06_90_VaeVictis_Attract.Stop()
  Alias_OrlaseShip.GetRef().Enable(False)
  Self.SetStage(200)
  Self.SetStage(300)
  Frontier_ModularREF.setlinkedref(None, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Moveto(UC06_SpaceBattleTeleportMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.Enable(False)
  Game.GetPlayer().Moveto(Frontier_ModularREF, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(0.100000001)
  Game.FadeOutGame(False, True, 0.0, 5.0, False)
  TestMQ101HelperQuest.SetStage(10)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(105, True)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(99)
  Self.SetStage(105)
  UC06_90_VaeVictis_Attract.Stop()
  Self.SetStage(550)
  Game.GetPlayer().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False)
  Game.GetPlayer().Moveto(UC06_DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(105, True)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(99)
  Self.SetStage(105)
  UC06_90_VaeVictis_Attract.Stop()
  Self.SetStage(120)
  Self.SetStage(133)
  Self.SetStage(200)
  Game.GetPlayer().Moveto(UC05_DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(105, True)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Alias_OrlaseShip.GetRef().DamageValue(Health, 1.0)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_OrlaseShip.GetRef().Moveto(Alias_playerShip.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Frontier_ModularREF.Moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
EndFunction

Function Fragment_Stage_0095_Item_00()
  UC06_95_SS7Guard_PlayerApproachesDoor.Start()
EndFunction

Function Fragment_Stage_0099_Item_00()
  Alias_VVChamberDoor.GetRef().Unlock(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  (Alias_FloorManager.GetRef() as loadelevatorfloorscript).SetAccessible(True)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0105_Item_00()
  UC06_90_VaeVictis_Attract.Start()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(105, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(105, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetObjectiveCompleted(105, True)
  Self.SetObjectiveDisplayed(110, True, False)
  UC06_100_VaeVictisIntro.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_NamelessAlias.Clear()
  Self.SetObjectiveCompleted(105, True)
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayedAtTop(120)
EndFunction

Function Fragment_Stage_0131_Item_00()
  Self.SetStage(135)
EndFunction

Function Fragment_Stage_0133_Item_00()
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0135_Item_00()
  UC_PlayerKnows_VVSurvivedExecution.SetValue(1.0)
EndFunction

Function Fragment_Stage_0136_Item_00()
  UC_PlayerKnows_HowVVFoundResearchTeam.SetValue(1.0)
EndFunction

Function Fragment_Stage_0140_Item_00()
  If !Self.GetStageDone(300)
    UC06_140_PlayerExitsVVChamber.Start()
  EndIf
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(105, True)
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(200, True, False)
  If !Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveDisplayed(150, True, False)
  EndIf
  Alias_ChiefYasin.GetRef().Enable(False)
  Alias_MacIntyre.GetRef().Moveto(Alias_MacIntyreSlateLookMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  uc06_questscript kmyQuest = __temp as uc06_questscript
  spaceshipreference OrlaseShipRef = Alias_OrlaseShip.GetShipRef()
  OrlaseShipRef.Enable(False)
  OrlaseShipRef.SetUnconscious(True)
  Alias_EthereaMines.EnableAll(False)
  kmyQuest.PrepTurrets()
  Alias_EthereaTurrets.EnableAll(False)
  kmyQuest.RegisterForShipItemCollection()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  MQ_TutorialQuest.SetStage(50)
EndFunction

Function Fragment_Stage_0350_Item_00()
  spaceshipreference OrlaseShipRef = Alias_OrlaseShip.GetShipRef()
  OrlaseShipRef.SetUnconscious(False)
  OrlaseShipRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  If !Self.GetStageDone(500)
    If !Self.IsObjectiveCompleted(150) && Self.IsObjectiveDisplayed(150)
      Self.SetObjectiveDisplayed(150, False, False)
    EndIf
    Self.SetObjectiveCompleted(300, True)
    Self.SetObjectiveDisplayedAtTop(400)
    Self.SetObjectiveDisplayed(401, True, False)
    UC06_400_OrlaseGreetingScene.Start()
    Alias_OrlaseShip.GetShipRef().EnablePartRepair(SpaceshipEngineHealth, False)
  EndIf
EndFunction

Function Fragment_Stage_0403_Item_00()
  Quest __temp = Self as Quest
  uc06_questscript kmyQuest = __temp as uc06_questscript
  QST_Orlase_Ship_HostileTransmission_WEF.Play(Game.GetPlayer() as ObjectReference, None, None)
  kmyQuest.DeployTurrets()
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If !Self.GetStageDone(500)
    Self.SetObjectiveCompleted(401, True)
    Self.SetObjectiveDisplayed(420, True, False)
  EndIf
  If !Self.GetStageDone(430) && !Self.GetStageDone(440)
    UC06_420_OrlaseEngineDisabled.Start()
  EndIf
EndFunction

Function Fragment_Stage_0430_Item_00()
  If !Self.GetStageDone(500)
    Self.SetObjectiveCompleted(420, True)
    Self.SetObjectiveDisplayed(430, True, False)
    Alias_Orlase.GetRef().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False)
    Alias_OrlaseCaptainLocker.GetRef().AddItem(LL_BE_ShipCaptainsLockerLoot_Small as Form, 1, False)
  EndIf
  UC06_430_OrlaseBoardingScene.Start()
EndFunction

Function Fragment_Stage_0440_Item_00()
  Quest __temp = Self as Quest
  uc06_questscript kmyQuest = __temp as uc06_questscript
  If !Self.IsObjectiveCompleted(150) && Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveDisplayed(150, False, False)
  EndIf
  Self.SetObjectiveDisplayed(430, False, False)
  Self.SetObjectiveDisplayed(400, False, False)
  Self.SetObjectiveDisplayed(500, True, False)
  spaceshipreference OrlaseShip = Alias_OrlaseShip.GetShipRef()
  If OrlaseShip.GetValue(SpaceshipCrew) > 0.0
    OrlaseShip.DamageValue(SpaceshipCrew, OrlaseShip.GetValue(SpaceshipCrew))
  EndIf
  kmyQuest.DisableTurrets()
EndFunction

Function Fragment_Stage_0441_Item_00()
  Alias_OrlaseCabinDoor.GetRef().Unlock(False)
  Alias_OrlaseCabinDoor.GetRef().SetOpen(True)
EndFunction

Function Fragment_Stage_0445_Item_00()
  If Self.GetStageDone(440)
    Self.SetObjectiveDisplayed(445, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0450_Item_00()
  If !Self.IsObjectiveCompleted(445) && Self.IsObjectiveDisplayed(445)
    Self.SetObjectiveDisplayed(445, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0451_Item_00()
  If Self.IsObjectiveDisplayed(445)
    Self.SetObjectiveCompleted(445, True)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  uc06_questscript kmyQuest = __temp as uc06_questscript
  If !Self.IsObjectiveCompleted(150) && Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveDisplayed(150, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(401) && Self.IsObjectiveDisplayed(401)
    Self.SetObjectiveDisplayed(401, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(420) && Self.IsObjectiveDisplayed(420)
    Self.SetObjectiveDisplayed(420, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(430) && Self.IsObjectiveDisplayed(430)
    Self.SetObjectiveDisplayed(430, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(445) && Self.IsObjectiveDisplayed(445)
    Self.SetObjectiveDisplayed(445, False, False)
  EndIf
  kmyQuest.DisableTurrets()
  If !Self.GetStageDone(550)
    Self.SetObjectiveCompleted(400, True)
    Self.SetObjectiveDisplayed(500, True, False)
    If !Self.GetStageDone(430) && !Self.GetStageDone(440)
      UC06_500_OrlaseDeath.Start()
    EndIf
    Alias_OrlaseShip.GetRef().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0550_Item_00()
  Game.GetPlayer().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(550, True, False)
EndFunction

Function Fragment_Stage_0553_Item_00()
  UC_PlayerKnows_KaiserIsARobot.SetValue(1.0)
EndFunction

Function Fragment_Stage_0560_Item_00()
  UC06_560_VV_ApproachTransfer.Start()
  Alias_TransferSystemTrigger.GetRef().Enable(False)
  Self.SetObjectiveCompleted(550, True)
  Self.SetObjectiveDisplayed(560, True, False)
EndFunction

Function Fragment_Stage_0570_Item_00()
  Alias_TransferSystemTrigger.GetRef().Disable(False)
  Game.GetPlayer().RemoveItem(Alias_OrlaseID.GetRef() as Form, 1, False, None)
  UC06_570_System_TransferAccepted.Start()
EndFunction

Function Fragment_Stage_0580_Item_00()
  Alias_VaeVictis.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(560, True)
  Self.SetObjectiveDisplayed(580, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  UC07_HadrianVVRevealQuest.Start()
  UC07.Start()
  Game.AddAchievement(12)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
