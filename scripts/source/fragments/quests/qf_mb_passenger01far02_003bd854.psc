ScriptName Fragments:Quests:QF_MB_Passenger01Far02_003BD854 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.StopQuestTimer()
  Self.SetObjectiveCompleted(10, True)
EndFunction
