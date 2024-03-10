ScriptName LC051RotationHelperFan Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference DamageTrigger
ObjectReference FanRotationHelper

;-- Properties --------------------------------------
Float Property Speed Auto
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const
wwiseevent Property WwiseEvent_OBJ_HugeFanBlades_Off Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  DamageTrigger = Self.GetLinkedRef(LinkCustom01)
  FanRotationHelper = Self.GetLinkedRef(LinkCustom02)
  FanRotationHelper.SetAnimationVariableFloat("Speed", Speed)
  FanRotationHelper.PlayAnimation("RotateCW_Loop")
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Self.StopFanRotation()
EndEvent

Function StopFanRotation()
  FanRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001)
  FanRotationHelper.PlayAnimation("Rotate_long")
  DamageTrigger.Disable(False)
  WwiseEvent_OBJ_HugeFanBlades_Off.play(Game.GetPlayer() as ObjectReference, None, None)
  Self.GetLinkedRef(LinkCustom03).Disable(False)
  Self.GetLinkedRef(LinkCustom04).Disable(False)
EndFunction
