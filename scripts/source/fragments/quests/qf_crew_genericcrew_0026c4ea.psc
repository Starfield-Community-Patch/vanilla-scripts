ScriptName Fragments:Quests:QF_CREW_GenericCrew_0026C4EA Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  crew_genericcrewquestscript kmyQuest = __temp as crew_genericcrewquestscript
  kmyQuest.SetCostMultAndUpdateCost(0.5)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  crew_genericcrewquestscript kmyQuest = __temp as crew_genericcrewquestscript
  kmyQuest.SetCostMultAndUpdateCost(1.0)
EndFunction
