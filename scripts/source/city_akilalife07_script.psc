ScriptName City_AkilaLife07_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property AkilaLife06_DocPending Auto Const mandatory

;-- Functions ---------------------------------------

Function GotObject(Int nStage)
  AkilaLife06_DocPending.SetValue(1.0)
  If Self.GetStageDone(100)
    Self.SetObjectiveDisplayed(nStage, True, False)
  EndIf
  Self.SetStage(nStage)
EndFunction
