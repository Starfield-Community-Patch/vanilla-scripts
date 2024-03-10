ScriptName HKDelayInitialHavokActivation Extends ObjectReference Const
{ Disables havok and then enables again after a delay.  Used for constrained attach refs linked to elevators. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property fHavokDelayTime = 0.5 Auto Const
{ Seconds to wait before starting havok. }

;-- Functions ---------------------------------------

Event onLoad()
  If Self.Is3DLoaded()
    Self.setMotionType(Self.Motion_Keyframed, True)
    Utility.wait(fHavokDelayTime)
    Self.setMotionType(Self.Motion_Dynamic, True)
    Self.SetPosition(Self.GetPositionX(), Self.GetPositionY(), Self.GetPositionZ())
  EndIf
EndEvent
