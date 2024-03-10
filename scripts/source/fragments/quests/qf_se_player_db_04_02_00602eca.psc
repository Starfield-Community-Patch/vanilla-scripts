ScriptName Fragments:Quests:QF_SE_Player_DB_04_02_00602ECA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
Faction Property PlayerFriendFaction Auto Const
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_HailingShip2 Auto Const
ReferenceAlias Property Alias_HailingShip3 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference HailingShip1 = Alias_HailingShip.GetRef() as spaceshipreference
  HailingShip1.AddToFaction(PlayerFriendFaction)
  spaceshipreference HailingShip2 = Alias_HailingShip2.GetRef() as spaceshipreference
  HailingShip2.AddToFaction(PlayerFriendFaction)
  spaceshipreference HailingShip3 = Alias_HailingShip3.GetRef() as spaceshipreference
  HailingShip3.AddToFaction(PlayerFriendFaction)
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference HailingShip = Alias_HailingShip.GetRef() as spaceshipreference
  HailingShip.DisableWithGravJump()
  spaceshipreference HailingShip2 = Alias_HailingShip2.GetRef() as spaceshipreference
  HailingShip2.DisableWithGravJump()
  spaceshipreference HailingShip3 = Alias_HailingShip3.GetRef() as spaceshipreference
  HailingShip3.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.AddToFaction(PlayerEnemyFaction)
  oTarg.RemoveFromFaction(PlayerFriendFaction)
  spaceshipreference HailingShip2 = Alias_HailingShip.GetRef() as spaceshipreference
  HailingShip2.AddToFaction(PlayerEnemyFaction)
  HailingShip2.RemoveFromFaction(PlayerFriendFaction)
  spaceshipreference HailingShip3 = Alias_HailingShip.GetRef() as spaceshipreference
  HailingShip3.AddToFaction(PlayerEnemyFaction)
  HailingShip3.RemoveFromFaction(PlayerFriendFaction)
EndFunction
