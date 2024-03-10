ScriptName Fragments:Quests:QF_City_CY_RedTape02_00237491 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_CY_RedTape03 Auto Const mandatory
MiscObject Property City_CY_RedTape02_Package Auto Const mandatory
ReferenceAlias Property Alias_Package Auto Const mandatory
Book Property City_CY_RedTape02_HurstNote Auto Const mandatory
ReferenceAlias Property Alias_Peter Auto Const mandatory
Key Property City_CY_RedTape02_PeterPassword Auto Const mandatory
ReferenceAlias Property Alias_PirateShip Auto Const mandatory
Faction Property CityCYRedTape02PirateNeutralFaction Auto Const mandatory
Faction Property PirateFaction Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property CydoniaShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_SpaceMarker Auto Const mandatory
RefCollectionAlias Property Alias_PirateShips Auto Const mandatory
Faction Property CityCYRedTape02CrimsonFleetNeutralFaction Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property CityCYRedTape02CrimsonFleetFriendFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
GlobalVariable Property City_CY_RedTape02HurstBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Perk Property BackgroundBountyHunter Auto Const mandatory
Perk Property BackgroundSpaceCowboy Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Perk Property Chemistry Auto Const mandatory
Quest Property City_CY_RedTape02_Blackmail Auto Const mandatory
ActorValue Property City_CY_RedTape02_ForeknowledgeAV Auto Const mandatory
Scene Property City_CY_RedTape02_0500_InitiateHailingScene Auto Const mandatory
Perk Property StarshipEngineering Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.MoveTo(Alias_Peter.GetRef(), 0.0, 0.0, 0.0, True, False)
  myPlayer.AddPerk(BackgroundIndustrialist, False)
  myPlayer.AddPerk(FactionCrimsonFleetPerk, False)
  myPlayer.AddPerk(BackgroundBountyHunter, False)
  myPlayer.AddPerk(BackgroundSpaceCowboy, False)
  myPlayer.AddPerk(StarshipEngineering, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_PirateShip.GetRef().Enable(False)
  Frontier_ModularREF.MoveTo(CydoniaShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.SetLinkedRef(CydoniaShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  Frontier_ModularREF.SetLinkedRef(None, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.MoveTo(Alias_SpaceMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.Enable(False)
  Game.GetPlayer().MoveTo(Frontier_ModularREF, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(0.100000001)
  Game.FadeOutGame(False, True, 0.0, 5.0, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(300)
  Self.SetStage(400)
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(2)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_PirateShip.GetRef().Enable(False)
  Alias_MapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  Utility.Wait(5.0)
  City_CY_RedTape02_0500_InitiateHailingScene.Start()
EndFunction

Function Fragment_Stage_0550_Item_00()
  spaceshipreference myHurstShip = Alias_PirateShip.GetShipReference()
  myHurstShip.SetValue(DockingPermission, 4.0)
  myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)
  myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetFriendFaction)
  myHurstShip.AddToFaction(CrimsonFleetFaction)
  Self.SetObjectiveCompleted(500, True)
  If !Self.IsObjectiveCompleted(610) && Self.IsObjectiveDisplayed(610)
    Self.SetObjectiveFailed(500, True)
  EndIf
  If Self.IsObjectiveDisplayed(620)
    Self.SetObjectiveCompleted(620, True)
  EndIf
  If !Self.GetStageDone(650)
    Self.SetObjectiveDisplayed(550, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  spaceshipreference myHurstShip = Alias_PirateShip.GetShipReference()
  myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)
  myHurstShip.AddToFaction(CityCYRedTape02CrimsonFleetFriendFaction)
  myHurstShip.SetValue(DockingPermission, 1.0)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Self.SetObjectiveDisplayed(650, True, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(610, True, False)
EndFunction

Function Fragment_Stage_0615_Item_00()
  Self.SetObjectiveCompleted(610, True)
  If !Self.GetStageDone(620)
    Self.SetObjectiveDisplayed(620, True, False)
    Self.SetStage(650)
  EndIf
EndFunction

Function Fragment_Stage_0616_Item_00()
  Self.SetObjectiveCompleted(610, True)
EndFunction

Function Fragment_Stage_0620_Item_00()
  If !Self.GetStageDone(615)
    Self.SetObjectiveDisplayed(620, True, False)
    Self.SetStage(650)
  EndIf
EndFunction

Function Fragment_Stage_0630_Item_00()
  If Self.GetStageDone(640)
    Self.SetStage(645)
  EndIf
EndFunction

Function Fragment_Stage_0640_Item_00()
  If Self.GetStageDone(630)
    Self.SetStage(645)
  EndIf
EndFunction

Function Fragment_Stage_0645_Item_00()
  Self.SetObjectiveCompleted(620, True)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveDisplayed(550, False, False)
  Self.SetObjectiveDisplayed(650, True, False)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0660_Item_00()
  If !Self.IsObjectiveCompleted(500) && Self.IsObjectiveDisplayed(500)
    Self.SetObjectiveFailed(500, True)
    Self.SetStage(700)
  EndIf
  If !Self.IsObjectiveCompleted(550) && Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveCompleted(550, True)
    Self.SetStage(700)
  EndIf
  If !Self.IsObjectiveCompleted(650) && Self.IsObjectiveDisplayed(650)
    Self.SetObjectiveCompleted(650, True)
  EndIf
  If !Self.IsObjectiveCompleted(620) && Self.IsObjectiveDisplayed(620)
    Self.SetObjectiveFailed(620, True)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.IsObjectiveCompleted(550) && Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveCompleted(550, True)
  EndIf
  If !Self.IsObjectiveCompleted(600) && Self.IsObjectiveDisplayed(600)
    Self.SetObjectiveFailed(600, True)
  EndIf
  If !Self.IsObjectiveCompleted(610) && Self.IsObjectiveDisplayed(610)
    Self.SetObjectiveFailed(610, True)
  EndIf
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_0703_Item_00()
  If !Self.IsObjectiveCompleted(620) && Self.IsObjectiveDisplayed(620)
    Self.SetObjectiveFailed(620, True)
  EndIf
  If !Self.IsObjectiveCompleted(650) && Self.IsObjectiveDisplayed(650)
    Self.SetObjectiveFailed(650, True)
  EndIf
EndFunction

Function Fragment_Stage_0704_Item_00()
  If Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveFailed(550, True)
  EndIf
  If Self.IsObjectiveDisplayed(650)
    Self.SetObjectiveFailed(650, True)
  EndIf
EndFunction

Function Fragment_Stage_0720_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_RedTape02_HurstNote as Form, 1, False, None)
  Self.SetStage(900)
  City_CY_RedTape02_Blackmail.SetStage(900)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, City_CY_RedTape02HurstBribe.GetValue() as Int, False, None)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Game.GetPlayer().AddAliasedItem(City_CY_RedTape02_Package as Form, Alias_Package as Alias, 1, False)
  Alias_MapMarker.GetRef().Disable(False)
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  City_CY_RedTape03.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.RemoveItem(City_CY_RedTape02_Package as Form, 1, False, None)
  myPlayer.AddItem(City_CY_RedTape02_PeterPassword as Form, 1, False)
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Game.GetPlayer().SetValue(City_CY_RedTape02_ForeknowledgeAV, 1.0)
  Self.SetObjectiveCompleted(1000, True)
  Self.Stop()
EndFunction
