ScriptName Fragments:Quests:QF_OE_AustinF_PredatorsAttac_0004BD8A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Predators_FactionA_Herd Auto Const mandatory
RefCollectionAlias Property Alias_Corpses Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_Corpses.EnableAll(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Predators_FactionA_Herd.EnableAll(False)
EndFunction
