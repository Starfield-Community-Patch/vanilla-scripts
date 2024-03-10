ScriptName Fragments:Quests:QF_SE_Player_FAB24_0003BD73 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_EscortShip Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
spaceshipbase Property EncShip_Hopetech_A_Watchdog01_Template Auto Const
LeveledItem Property LL_Food_Unpackaged Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().AddItem(LL_Food_Unpackaged as Form, 1, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
  oTarg = Alias_EscortShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_HailingShip.GetShipRef().AddToFaction(PPlayerEnemyFaction)
  Alias_EscortShip.GetShipRef().AddToFaction(PPlayerEnemyFaction)
  Alias_EscortShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef(), False)
  Alias_HailingShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef(), False)
  Utility.Wait(5.0)
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
