ScriptName Fragments:Quests:QF_SE_KT03_000277A4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0)
EndFunction

Function Fragment_Stage_0006_Item_00()
  spaceshipreference myShip = Alias_HailingShip.GetShipRef()
  myShip.SetValue(DockingPermission, 4.0)
  myShip.AddtoFaction(PlayerEnemyFaction)
  myShip.SetValue(Aggression, 1.0)
  Self.SetObjectiveSkipped(10)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
  Alias_MapMarker.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
