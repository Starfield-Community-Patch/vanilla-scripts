ScriptName Fragments:Quests:QF_SE_DB_04_005F18BF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_DB_04_100a_Hailing Auto Const mandatory
Scene Property SE_DB_04_200_LastWarning Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
{ The faction that is the enemy of the player }
Faction Property PlayerFriendFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.AddToFaction(PlayerFriendFaction)
EndFunction

Function Fragment_Stage_0050_Item_00()
  SE_DB_04_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  SE_DB_04_200_LastWarning.Start()
EndFunction

Function Fragment_Stage_0250_Item_00()
  SE_DB_04_200_LastWarning.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.AddToFaction(PlayerEnemyFaction)
  oTarg.RemoveFromFaction(PlayerFriendFaction)
EndFunction
