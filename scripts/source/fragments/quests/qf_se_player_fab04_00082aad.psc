ScriptName Fragments:Quests:QF_SE_Player_FAB04_00082AAD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
GlobalVariable Property PSE_Player_FAB04_RunOnce Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.SetValue(Aggression, 0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  PSE_Player_FAB04_RunOnce.SetValue(1.0)
EndFunction

Function Fragment_Stage_0275_Item_00()
  Quest __temp = Self as Quest
  se_fab04_mathcount kmyQuest = __temp as se_fab04_mathcount
  kmyQuest.RemoveShipParts()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
