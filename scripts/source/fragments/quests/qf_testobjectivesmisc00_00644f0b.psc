ScriptName Fragments:Quests:QF_TestObjectivesMisc00_00644F0B Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0051_Item_00()
  Self.SetObjectiveCompleted(40, True)
EndFunction

Function Fragment_Stage_0052_Item_00()
  Self.SetObjectiveCompleted(50, True)
EndFunction

Function Fragment_Stage_0053_Item_00()
  Self.SetObjectiveCompleted(60, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
EndFunction
