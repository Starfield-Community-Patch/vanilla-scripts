ScriptName Fragments:Quests:QF_DialogueCrucible_002955D8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HH_Holmes Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0135_Item_00()
  Int n = 0
EndFunction

Function Fragment_Stage_0165_Item_00()
  Alias_HH_Holmes.GetRef().Disable(False)
EndFunction
