ScriptName Fragments:Quests:QF_FFConstantR02Misc_00211126 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFConstantR02 Auto Const mandatory
Keyword Property FFConstantR02QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  FFConstantR02QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
