ScriptName Fragments:Quests:QF_MB_BountySpace01Far_001EF957 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  missionbountyspacescript kmyQuest = __temp as missionbountyspacescript
  kmyQuest.MissionComplete()
EndFunction