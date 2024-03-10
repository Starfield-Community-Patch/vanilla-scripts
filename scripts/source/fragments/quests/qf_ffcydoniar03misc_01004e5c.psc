ScriptName Fragments:Quests:QF_FFCydoniaR03Misc_01004E5C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFCydoniaR03QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  FFCydoniaR03QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
