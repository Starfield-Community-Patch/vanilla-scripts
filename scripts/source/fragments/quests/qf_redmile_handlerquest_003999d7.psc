ScriptName Fragments:Quests:QF_RedMile_HandlerQuest_003999D7 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  redmilehandlerquestscript kmyQuest = __temp as redmilehandlerquestscript
  kmyQuest.RespawnCreatures(0)
EndFunction
