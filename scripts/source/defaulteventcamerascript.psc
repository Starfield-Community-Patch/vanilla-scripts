ScriptName DefaultEventCameraScript Extends ObjectReference conditional

;-- Variables ---------------------------------------
Float Camera_Angle conditional
Float Camera_Move conditional

;-- Properties --------------------------------------
GlobalVariable Property CameraAngle Auto Const
{ Prefixed with "EC_Angle" }
GlobalVariable Property CameraMove Auto Const
{ Prefixed with "EC_Move" }
camerashot Property CameraShotToPlay Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  Camera_Angle = CameraAngle.GetValue()
  Camera_Move = CameraMove.GetValue()
EndEvent

Function Play()
  Game.PlayEventCamera(CameraShotToPlay, Self as ObjectReference)
EndFunction
