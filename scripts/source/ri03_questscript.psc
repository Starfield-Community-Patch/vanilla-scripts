ScriptName RI03_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI03_SimonIntroCount Auto Const mandatory

;-- Functions ---------------------------------------

Function AddToSimonCount()
  Float fCurrentCount = RI03_SimonIntroCount.GetValue()
  RI03_SimonIntroCount.SetValue(fCurrentCount + 1.0)
EndFunction
