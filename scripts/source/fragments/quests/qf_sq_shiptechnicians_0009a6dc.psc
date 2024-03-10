ScriptName Fragments:Quests:QF_SQ_ShipTechnicians_0009A6DC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_ShipTechnicians Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_ShipTechnicians.EvaluateAll()
EndFunction
