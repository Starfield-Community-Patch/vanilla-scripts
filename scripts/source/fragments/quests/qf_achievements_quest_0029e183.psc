ScriptName Fragments:Quests:QF_Achievements_Quest_0029E183 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  achievements_trackedstatsscript kmyQuest = __temp as achievements_trackedstatsscript
  kmyQuest.RegisterTrackedStats()
EndFunction
