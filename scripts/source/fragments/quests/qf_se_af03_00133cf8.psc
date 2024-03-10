ScriptName Fragments:Quests:QF_SE_AF03_00133CF8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Faction Property EclipticFaction Auto Const
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property CitizenShipFactionUC Auto Const mandatory
Faction Property CitizenShipFactionFreestar Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 3.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference currShip = Alias_HailingShip.GetShipRef()
  currShip.addtofaction(PlayerEnemyFaction)
  currShip.addtofaction(EclipticFaction)
  currShip.SetCrimeFaction(None)
  currShip.removefromfaction(CitizenShipFactionUC)
  currShip.removefromfaction(CitizenShipFactionFreestar)
  currShip.StartCombat(Alias_PlayerShip.GetShipReference(), False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
