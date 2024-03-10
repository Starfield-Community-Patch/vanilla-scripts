ScriptName Fragments:Quests:QF_RIR06_YukoFollowUp_003BF88A Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.Stop()
EndFunction
