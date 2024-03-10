ScriptName Fragments:Quests:QF_OE_KMK_Starborn_HigherC_001EEE2C_9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(-1)
  Alias_MapMarker.TryToEnable()
EndFunction
