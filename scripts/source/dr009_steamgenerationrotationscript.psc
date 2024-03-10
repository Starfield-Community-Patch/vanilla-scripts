ScriptName DR009_SteamGenerationRotationScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property level0Speed Auto Const
Float Property level1Speed Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference[] rotationHelpers = Self.GetLinkedRefChain(None, 100)
  Self.PlayRotationAnimation(rotationHelpers[0], level0Speed)
  Self.PlayRotationAnimation(rotationHelpers[1], level1Speed)
EndEvent

Function PlayRotationAnimation(ObjectReference roationHelper, Float speed)
  roationHelper.SetAnimationVariableFloat("speed", speed)
  roationHelper.PlayAnimation("RotateCW_Loop")
EndFunction
