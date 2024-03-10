ScriptName Fragments:Quests:QF_MB_Bounty05_UC_003303A5 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  missionquestscript kmyQuest = __temp as missionquestscript
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionquestscript kmyQuest = __temp as missionquestscript
  kmyQuest.MissionComplete()
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  missionquestscript kmyQuest = __temp as missionquestscript
  kmyQuest.MissionShutdown()
EndFunction
