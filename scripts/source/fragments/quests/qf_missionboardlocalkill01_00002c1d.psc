ScriptName Fragments:Quests:QF_MissionBoardLocalKill01_00002C1D Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionbountyquestscript kmyQuest = __temp as missionbountyquestscript
  kmyQuest.MissionComplete()
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  missionbountyquestscript kmyQuest = __temp as missionbountyquestscript
  kmyQuest.MissionShutdown()
EndFunction
