ScriptName TestRefrMoveScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MoveToRef Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.SplineTranslateToRef(MoveToRef, 100.0, 500.0, 10.0)
EndEvent
