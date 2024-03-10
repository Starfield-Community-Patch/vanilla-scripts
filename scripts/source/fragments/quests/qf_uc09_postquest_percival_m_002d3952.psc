ScriptName Fragments:Quests:QF_UC09_PostQuest_Percival_M_002D3952 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.Stop()
EndFunction
