ScriptName Fragments:Quests:QF_DebugGoToSpaceQuest_0029C659 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewGameShipMarkerREF Auto Const mandatory
Quest Property TestMQ101HelperQuest Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
Keyword Property CurrentInteractionLinkedRefKeyword Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ObjectReference Property JemisonArrivalMarker Auto Const mandatory
spaceshipbase Property TestMaxLandable01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Frontier_ModularREF.moveto(NewGameShipMarkerREF, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  inputenablelayer MyEnableLayer = inputenablelayer.Create()
  MyEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
  Frontier_ModularREF.moveto(NewGameShipMarkerREF, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.Enable(False)
  Utility.Wait(0.100000001)
  PlayerREF.moveto(Frontier_ModularREF, 0.0, 0.0, 0.0, True, False)
  SQ_PlayerShip.ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  SQ_PlayerShip.HandleShipTakeOff(True, False)
  Utility.Wait(0.100000001)
  Game.FadeOutGame(False, True, 0.0, 5.0, False)
  TestMQ101HelperQuest.SetStage(10)
  MyEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  MyEnableLayer = None
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(5)
  SQ_PlayerShip.debugInitializeHomeShip(Frontier_ModularREF as spaceshipreference)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(10)
  Utility.Wait(20.0)
  Frontier_ModularREF.SetLinkedRef(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.SetLinkedRef(NewAtlantisShipLandingMarker, CurrentInteractionLinkedRefKeyword, True)
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  inputenablelayer MyEnableLayer = inputenablelayer.Create()
  MyEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
  spaceshipreference maxShip = NewGameShipMarkerREF.PlaceShipAtMe(TestMaxLandable01 as Form, 4, True, False, False, True, None, None, None, True)
  PlayerREF.moveto(maxShip as ObjectReference, 0.0, 0.0, 0.0, True, False)
  SQ_PlayerShip.ResetHomeShip(maxShip)
  SQ_PlayerShip.HandleShipTakeOff(True, False)
  Utility.Wait(0.100000001)
  Game.FadeOutGame(False, True, 0.0, 5.0, False)
  TestMQ101HelperQuest.SetStage(10)
  MyEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  MyEnableLayer.Delete()
EndFunction
