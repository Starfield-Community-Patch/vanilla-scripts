ScriptName Fragments:Quests:QF_City_CY_StartUp01_00222E40 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Gustavo Auto Const mandatory
RefCollectionAlias Property Alias_Mercs Auto Const mandatory
Faction Property CityCYStartup01HostileFaction Auto Const mandatory
ReferenceAlias Property Alias_ErickCydoniaMarker Auto Const mandatory
ReferenceAlias Property Alias_Erick Auto Const mandatory
ReferenceAlias Property Alias_Jane Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship Auto Const mandatory
Quest Property ErickEliteCrewQuest Auto Const
ReferenceAlias Property Alias_SCMapMarker Auto Const mandatory
Faction Property CityCYStartup01NeutralFaction Auto Const mandatory
Faction Property CityCYStartup01FriendFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property City_CY_Startup01_Convince_Foreknowledge_AV Auto Const mandatory
Faction Property Vendor_City_CY_JanesFaction01 Auto Const mandatory
Faction Property Vendor_City_CY_JanesFaction02 Auto Const mandatory
ReferenceAlias Property Alias_JaneContainer02 Auto Const mandatory
Keyword Property VendorContainerKeyword01 Auto Const mandatory
Perk Property City_CY_Startup01_VendorDiscount Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_Gustavo.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Jane.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_Ship.GetRef().Enable(False)
  Alias_SCMapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
  spaceshipreference myJaneShip = Alias_Ship.GetShipReference()
  myJaneShip.RemoveFromFaction(CityCYStartup01NeutralFaction)
  myJaneShip.AddtoFaction(CityCYStartup01FriendFaction)
  myJaneShip.SetValue(DockingPermission, 1.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.IsObjectiveCompleted(200)
    Self.SetObjectiveFailed(200, True)
  EndIf
  Self.SetObjectiveCompleted(250, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Actor ErickRef = Alias_Erick.GetActorRef()
  ErickRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.GetStageDone(350)
    Alias_Gustavo.GetActorRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0330_Item_00()
  Alias_Gustavo.GetActorRef().EvaluatePackage(False)
  Self.SetStage(400)
  Game.GetPlayer().SetValue(City_CY_Startup01_Convince_Foreknowledge_AV, 1.0)
EndFunction

Function Fragment_Stage_0340_Item_00()
  Alias_Gustavo.GetActorRef().EvaluatePackage(False)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(301)
    Self.SetObjectiveCompleted(300, True)
  Else
    Self.SetObjectiveFailed(300, True)
  EndIf
  Self.SetObjectiveDisplayed(350, True, False)
  Actor myPlayer = Game.GetPlayer()
  Actor myGustavo = Alias_Gustavo.GetActorRef()
  myGustavo.RemoveFromFaction(CityCYStartup01NeutralFaction)
  myGustavo.RemoveFromFaction(CityCYStartup01FriendFaction)
  myGustavo.AddtoFaction(CityCYStartup01HostileFaction)
  myGustavo.EvaluatePackage(False)
  myGustavo.StartCombat(myPlayer as ObjectReference, False)
  Alias_Mercs.RemoveFromFaction(CityCYStartup01NeutralFaction)
  Alias_Mercs.RemoveFromFaction(CityCYStartup01FriendFaction)
  Alias_Mercs.AddtoFaction(CityCYStartup01HostileFaction)
  Alias_Mercs.EvaluateAll()
  Alias_Mercs.StartCombatAll(myPlayer as ObjectReference)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  If Self.GetStageDone(370)
    Self.SetObjectiveCompleted(350, True)
    Self.SetStage(400)
    Alias_Ship.GetShipRef().SetValue(SpaceshipCrew, 0.0)
    If Self.GetStageDone(410)
      kmyQuest.RemovePassengerActor(Alias_Erick.GetActorRef())
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0370_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  If Self.GetStageDone(360)
    Self.SetObjectiveCompleted(350, True)
    Self.SetStage(400)
    Alias_Ship.GetShipRef().SetValue(SpaceshipCrew, 0.0)
    If Self.GetStageDone(410)
      kmyQuest.RemovePassengerActor(Alias_Erick.GetActorRef())
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.IsObjectiveDisplayed(300)
    Self.SetObjectiveCompleted(300, True)
  EndIf
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Actor ErickRef = Alias_Erick.GetActorRef()
  ErickRef.EvaluatePackage(False)
  If Self.GetStageDone(340)
    ErickRef.EvaluatePackage(False)
    kmyQuest.AddPassenger(Alias_Erick)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Erick.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0510_Item_00()
  If !Self.GetStageDone(340) && !Self.GetStageDone(360)
    Alias_Erick.GetRef().MoveTo(Alias_ErickCydoniaMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0520_Item_00()
  Alias_Erick.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Game.GetPlayer().AddPerk(City_CY_Startup01_VendorDiscount, False)
  Alias_Jane.GetRef().SetLinkedRef(Alias_JaneContainer02.GetRef(), VendorContainerKeyword01, True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Alias_SCMapMarker.GetRef().Disable(False)
  If Self.GetStageDone(340)
    ErickEliteCrewQuest.SetStage(1)
  EndIf
  Self.Stop()
EndFunction
