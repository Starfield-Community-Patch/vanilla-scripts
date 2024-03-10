ScriptName Fragments:Quests:QF_BE_SC04_Misc_002B5690 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Self.CompleteQuest()
  Self.Stop()
EndFunction
