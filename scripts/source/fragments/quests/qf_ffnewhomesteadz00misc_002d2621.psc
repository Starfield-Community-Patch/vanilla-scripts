ScriptName Fragments:Quests:QF_FFNewHomesteadZ00Misc_002D2621 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
