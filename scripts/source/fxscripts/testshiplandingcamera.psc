ScriptName FXScripts:TestShipLandingCamera Extends ObjectReference
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
ObjectReference ObjRef
String sLandingEvent = "Land"
String sTakeoffEvent = "TakeOff"

;-- Properties --------------------------------------
ObjectReference Property GroundCameraMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  ObjRef = Self as ObjectReference
EndEvent

Event OnLoad()
  If Self.Is3DLoaded()
    Self.RegisterForAnimationEvent(ObjRef, sLandingEvent)
    Self.RegisterForAnimationEvent(ObjRef, sTakeoffEvent)
  EndIf
EndEvent

Event OnUnLoad()
  Self.UnRegisterForAnimationEvent(ObjRef, sLandingEvent)
  Self.UnRegisterForAnimationEvent(ObjRef, sTakeoffEvent)
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == sLandingEvent
    GroundCameraMarker.PlayAnimation(sLandingEvent)
  EndIf
  If asEventName == sTakeoffEvent
    GroundCameraMarker.PlayAnimation(sTakeoffEvent)
  EndIf
EndEvent
