ScriptName Fragments:Quests:QF_SE_Player_FAB10_00069F15 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_TourEscort Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
GlobalVariable Property PSE_Player_FAB10_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4.0)
  Alias_TourEscort.GetShipRef().SetValue(DockingPermission, 4.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  PSE_Player_FAB10_RunOnce.SetValue(1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(20.0)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
  oTarg = Alias_TourEscort.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_TourEscort.GetShipRef().AddToFaction(PPlayerEnemyFaction)
  Alias_HailingShip.GetShipRef().AddToFaction(PPlayerEnemyFaction)
  Alias_TourEscort.GetShipRef().StartCombat(Alias_playerShip.GetShipRef(), False)
  Alias_HailingShip.GetShipRef().StartCombat(Alias_playerShip.GetShipRef(), False)
EndFunction
