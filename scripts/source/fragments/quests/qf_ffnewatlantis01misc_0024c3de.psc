ScriptName Fragments:Quests:QF_FFNewAtlantis01Misc_0024C3DE Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
