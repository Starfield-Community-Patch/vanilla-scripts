ScriptName Fragments:Quests:QF_OE_KMK_Creatures03_000FE270 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
