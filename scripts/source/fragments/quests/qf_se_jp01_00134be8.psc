ScriptName Fragments:Quests:QF_SE_JP01_00134BE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ActorValue Property Aggression Auto Const
ReferenceAlias Property Alias_AttackingShip01 Auto Const mandatory
ReferenceAlias Property Alias_AttackingShip02 Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  utility_fab_script kmyQuest = __temp as utility_fab_script
  kmyQuest.ShipAttackPlayer(Alias_HailingShip.GetShipReference())
  Alias_AttackingShip01.GetShipReference().EnableWithGravJump()
  Alias_AttackingShip01.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference(), False)
  Alias_AttackingShip02.GetShipReference().EnableWithGravJump()
  Alias_AttackingShip02.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference(), False)
EndFunction
