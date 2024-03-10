ScriptName Fragments:Quests:QF_TestRemoveEquipment_0005ABAB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Armor Property Spacesuit_Mark1_Helmet_White Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().RemoveItem(Spacesuit_Mark1_Helmet_White as Form, 1, True, None)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().EquipItem(Spacesuit_Mark1_Helmet_White as Form, False, True)
EndFunction
