ScriptName FXScripts:CameraShakeOnAnimEvent Extends ObjectReference Const
{ Shake the camera on an animation event }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String[] Property sAnimEventList Auto Const mandatory
Float Property fCameraShake = 1.0 Auto Const
Float Property fCameraShakeDuration = 1.0 Auto Const

;-- Functions ---------------------------------------

Function ShakeAndRumble(Float fShakeAmount, Float fShakeTime)
  Game.ShakeCamera(None, fShakeAmount, fShakeTime)
  Game.ShakeController(fShakeAmount, fShakeAmount, fShakeTime)
EndFunction

Event OnLoad()
  If Self.Is3DLoaded()
    Int I = 0
    While I < sAnimEventList.Length
      Self.RegisterForAnimationEvent(Self as ObjectReference, sAnimEventList[I])
      I += 1
    EndWhile
  EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If sAnimEventList.find(asEventName, 0) < 0
    Return 
  Else
    Self.ShakeAndRumble(fCameraShake, fCameraShakeDuration)
  EndIf
EndEvent

Event OnUnLoad()
  Int I = 0
  While I < sAnimEventList.Length
    Self.UnRegisterForAnimationEvent(Self as ObjectReference, sAnimEventList[I])
    I += 1
  EndWhile
EndEvent
