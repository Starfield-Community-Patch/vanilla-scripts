ScriptName Fragments:Quests:QF_City_NA_Aquilus01Misc_00253F58 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
