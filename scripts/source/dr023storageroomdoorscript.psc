ScriptName DR023StorageRoomDoorScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property DR023_DoorLeftRotationHelper Auto Const mandatory
ObjectReference Property DR023_DoorRightRotationHelper Auto Const mandatory

;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Done")
    DR023_DoorLeftRotationHelper.SetAnimationVariableFloat("Position", 0.25)
    DR023_DoorLeftRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001)
    DR023_DoorLeftRotationHelper.PlayAnimation("Rotate_Short")
    DR023_DoorRightRotationHelper.SetAnimationVariableFloat("Position", 0.25)
    DR023_DoorRightRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001)
    DR023_DoorRightRotationHelper.PlayAnimation("Rotate_Short")
  EndEvent
EndState
