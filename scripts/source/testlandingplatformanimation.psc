ScriptName TestLandingPlatformAnimation Extends ObjectReference
{ Test script for animating the landing platform in New Atlantis. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PlatformRef Auto Const
String Property sAnimEvent Auto Const
String Property sWakeAnimEvent Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.IsDisabled()
    If Self.Is3DLoaded()
      If !Self.RegisterForAnimationEvent(Self as ObjectReference, sWakeAnimEvent)
        
      EndIf
    EndIf
  EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == sWakeAnimEvent
    Self.RegisterForAnimationEvent(Self as ObjectReference, sAnimEvent)
  EndIf
  If asEventName == sAnimEvent
    PlatformRef.PlayAnimation("Stage2")
  EndIf
EndEvent
