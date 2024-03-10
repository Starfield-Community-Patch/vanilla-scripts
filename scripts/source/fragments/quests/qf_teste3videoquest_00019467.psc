ScriptName Fragments:Quests:QF_TestE3VideoQuest_00019467 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
spaceshipreference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property MQ101KreetShipLandingMarkerREF005 Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
GlobalVariable Property TestE3VideoGlobal Auto Const mandatory
ObjectReference Property NewGameShipMarkerREF Auto Const mandatory
Keyword Property AnimLandingKreet Auto Const mandatory
ObjectReference Property TestKreetRoof Auto Const mandatory
ObjectReference Property LC003_RoofMarker001 Auto Const mandatory
ObjectReference Property KreetPirateShip02 Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property LC003PirateBossFaction Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
ObjectReference Property KreetLandingMarker02 Auto Const mandatory
Keyword Property AnimLandingKreetPirates Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor01 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor02 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor03 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor04 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor05 Auto Const mandatory
ReferenceAlias Property Alias_VigilancePatrolMarker01 Auto Const mandatory
ReferenceAlias Property Alias_VigilancePatrolMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Story14Actor Auto Const mandatory
Scene Property E3Story14 Auto Const mandatory
Scene Property TestE3Story14 Auto Const mandatory
Furniture Property ShipLandingMarker_80m_Large Auto Const mandatory
Keyword Property AnimTakeOffE3 Auto Const mandatory
GlobalVariable Property TestE3TakeoffGlobal Auto Const mandatory
Scene Property E3Ending11 Auto Const mandatory
ReferenceAlias Property Alias_Ending11LandingPad Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor07 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor07Marker Auto Const mandatory
ReferenceAlias Property Alias_LandingPad Auto Const mandatory
ReferenceAlias Property Alias_Frontier Auto Const mandatory
Form Property Constellation_Frontier Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Frontier_ModularREF.Disable(False)
  Utility.Wait(0.25)
  Frontier_ModularREF.moveto(MQ101KreetShipLandingMarkerREF005, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(MQ101KreetShipLandingMarkerREF005, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_01()
  MQ101KreetShipLandingMarkerREF005.addKeyword(AnimLandingKreet)
  Utility.Wait(0.100000001)
  Frontier_ModularREF.moveto(MQ101KreetShipLandingMarkerREF005, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(MQ101KreetShipLandingMarkerREF005, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF)
  TestE3VideoGlobal.SetValueInt(1)
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(670)
  Utility.Wait(0.100000001)
  MQ101.SetStage(690)
  Game.GetPlayer().moveto(TestKreetRoof, 0.0, 0.0, 0.0, True, False)
  LC003_RoofMarker001.Enable(False)
  KreetLandingMarker02.addKeyword(AnimLandingKreetPirates)
EndFunction

Function Fragment_Stage_0030_Item_00()
  KreetPirateShip02.Enable(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_VigilanceActor01.GetRef().EnableNoWait(False)
  Alias_VigilanceActor02.GetRef().EnableNoWait(False)
  Alias_VigilanceActor03.GetRef().EnableNoWait(False)
  Alias_VigilanceActor04.GetRef().EnableNoWait(False)
  Alias_VigilanceActor05.GetRef().EnableNoWait(False)
  Alias_VigilancePatrolMarker01.GetRef().EnableNoWait(False)
  Alias_VigilancePatrolMarker02.GetRef().EnableNoWait(False)
  Actor VigRef = Alias_VigilanceActor07.GetActorRef()
  VigRef.moveto(Alias_VigilanceActor07Marker.GetRef(), 0.0, 0.0, 0.0, True, False)
  VigRef.Kill(None)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Story14Actor.GetRef().Enable(False)
  E3Story14.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  E3Ending11.Stop()
  ObjectReference LandingMarkerREF = None
  If Alias_Ending11LandingPad.GetRef() == None
    LandingMarkerREF = Game.GetPlayer().PlaceAtMe(ShipLandingMarker_80m_Large as Form, 1, False, False, True, None, None, True)
    LandingMarkerREF.addKeyword(AnimTakeOffE3)
    Alias_Ending11LandingPad.ForceRefTo(LandingMarkerREF)
  Else
    LandingMarkerREF = Alias_Ending11LandingPad.GetRef()
  EndIf
  TestE3TakeoffGlobal.SetValueInt(1)
  Utility.Wait(1.0)
  spaceshipreference FrontierShipREF = LandingMarkerREF.PlaceShipAtMe(Constellation_Frontier, 4, True, False, False, True, None, None, None, True)
  Alias_Frontier.ForceRefTo(FrontierShipREF as ObjectReference)
  Utility.Wait(1.0)
  E3Ending11.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  ObjectReference LandingMarkerREF = None
  LandingMarkerREF = Game.GetPlayer().PlaceAtMe(ShipLandingMarker_80m_Large as Form, 1, False, False, True, None, None, True)
  LandingMarkerREF.addKeyword(AnimTakeOffE3)
  Alias_Ending11LandingPad.ForceRefTo(LandingMarkerREF)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_Frontier.GetRef().Disable(False)
  Alias_Frontier.GetRef().Delete()
  Alias_Frontier.Clear()
EndFunction
