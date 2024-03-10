ScriptName City_NA_Well01_LightScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Myself Auto
Quest Property City_NA_Well01 Auto Const mandatory
GlobalVariable Property MyGlobal Auto

;-- Functions ---------------------------------------

Function SwapState()
  Myself = Self.GetReference()
  If MyGlobal.GetValueInt() == 0
    MyGlobal.SetValue(1.0)
    Myself.PlayAnimation("Play01")
  Else
    MyGlobal.SetValue(0.0)
    Myself.PlayAnimation("Play02")
  EndIf
EndFunction
