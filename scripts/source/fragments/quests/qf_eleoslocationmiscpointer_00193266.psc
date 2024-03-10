ScriptName Fragments:Quests:QF_EleosLocationMiscPointer_00193266 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(5, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(5, True)
  Self.SetStage(1000)
EndFunction
