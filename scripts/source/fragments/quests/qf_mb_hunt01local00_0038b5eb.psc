ScriptName Fragments:Quests:QF_MB_Hunt01Local00_0038B5EB Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionhuntquestscript kmyQuest = __temp as missionhuntquestscript
  kmyQuest.MissionComplete()
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  missionhuntquestscript kmyQuest = __temp as missionhuntquestscript
  kmyQuest.MissionShutdown()
EndFunction
