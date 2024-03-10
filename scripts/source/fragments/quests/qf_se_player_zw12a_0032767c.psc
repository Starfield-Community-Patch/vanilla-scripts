ScriptName Fragments:Quests:QF_SE_Player_ZW12a_0032767C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Faction Property PPlayerFriendFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  utility_fab_script kmyQuest = __temp as utility_fab_script
  spaceshipreference myShip = Alias_HailingShip.GetRef() as spaceshipreference
  kmyQuest.ShipAttackPlayer(myShip)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
