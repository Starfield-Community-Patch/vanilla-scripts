ScriptName LC056BossRoomExitDoorScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property DoorLeftRotationHelper Auto Const mandatory
ObjectReference Property DoorRightRotationHelper Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  DoorLeftRotationHelper.SetAnimationVariableFloat("Position", 0.25)
  DoorLeftRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001)
  DoorLeftRotationHelper.PlayAnimation("Rotate_Short")
  DoorRightRotationHelper.SetAnimationVariableFloat("Position", 0.25)
  DoorRightRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001)
  DoorRightRotationHelper.PlayAnimation("Rotate_Short")
EndEvent
