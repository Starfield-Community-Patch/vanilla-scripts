ScriptName POI012RotateHelper Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Self.SetAnimationVariableFloat("Speed", 0.01)
  Self.PlayAnimation("RotateCW_Loop")
EndEvent
