ScriptName Fragments:Quests:QF_FFRedMileR01Misc_002DFEDC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If !FC05.IsRunning()
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(100, False, False)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
