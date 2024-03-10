ScriptName Fragments:Quests:QF_TestUIQuest_00058D78 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction
