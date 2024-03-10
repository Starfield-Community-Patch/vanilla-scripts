ScriptName Fragments:Quests:QF_FFDenZ01_001E7941 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(15, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(15)
    Self.SetObjectiveCompleted(15, True)
  EndIf
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
