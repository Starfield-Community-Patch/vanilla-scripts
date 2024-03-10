ScriptName RAD02Script Extends Quest Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RAD02_InterviewCount Auto Const mandatory

;-- Functions ---------------------------------------

Function StoryCheck()
  RAD02_InterviewCount.Mod(1.0)
  If RAD02_InterviewCount.GetValue() >= 6.0
    Self.SetStage(8000)
  EndIf
EndFunction
