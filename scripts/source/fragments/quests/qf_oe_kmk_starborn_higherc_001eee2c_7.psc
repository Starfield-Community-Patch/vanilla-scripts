ScriptName Fragments:Quests:QF_OE_KMK_Starborn_HigherC_001EEE2C_7 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(-1)
EndFunction
