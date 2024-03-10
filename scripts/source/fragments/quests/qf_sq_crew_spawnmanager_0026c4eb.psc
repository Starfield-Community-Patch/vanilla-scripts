ScriptName Fragments:Quests:QF_SQ_Crew_SpawnManager_0026C4EB Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  sq_crew_spawnmanagerscript kmyQuest = __temp as sq_crew_spawnmanagerscript
  kmyQuest.RollToEnableRefs()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  sq_crew_spawnmanagerscript kmyQuest = __temp as sq_crew_spawnmanagerscript
  Self.Stop()
EndFunction
