ScriptName Fragments:Quests:QF_SE_Player_FAB01_00089858 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
GlobalVariable Property SE_FAB01_PlayerReward Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest
  se_fab04_mathcount kmyQuest = __temp as se_fab04_mathcount
  kmyQuest.RemoveShipParts()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, SE_FAB01_PlayerReward.GetValueInt(), False)
  Utility.Wait(30.0)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest
  se_fab04_mathcount kmyQuest = __temp as se_fab04_mathcount
  kmyQuest.CountShipParts()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
