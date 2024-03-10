ScriptName Fragments:Quests:QF_OE_KMK_NPCsVsCreatures01_0008AEDE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(-1)
  Alias_MapMarker.TryToEnable()
EndFunction
