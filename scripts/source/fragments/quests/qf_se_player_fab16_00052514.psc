ScriptName Fragments:Quests:QF_SE_Player_FAB16_00052514 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Faction Property PPlayerFriendFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  (Alias_HailingShip.GetRef() as spaceshipreference).RemoveFromFaction(PPlayerFriendFaction)
  (Alias_HailingShip.GetRef() as spaceshipreference).StartCombat(Alias_playerShip.GetRef() as spaceshipreference, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
