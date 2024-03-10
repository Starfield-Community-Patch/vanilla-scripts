ScriptName POIBB005TurbineScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Blades Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(0.200000003)
  Blades.SetAnimationVariableFloat("Speed", 0.25)
  Blades.PlayAnimation("RotateCW_Loop")
EndEvent
