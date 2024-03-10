ScriptName Fragments:Quests:QF_FFLodge04_00180481 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(40)
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  fflodge04questscript kmyQuest = __temp as fflodge04questscript
  kmyQuest.EnablePlaque()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop()
EndFunction
