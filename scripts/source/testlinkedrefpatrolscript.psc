ScriptName TestLinkedRefPatrolScript Extends Actor

;-- Variables ---------------------------------------
ObjectReference currentPoint

;-- Properties --------------------------------------
Float Property Speed = 500.0 Auto Const
Float Property SplineMagnitude = 100.0 Auto Const
Float Property TurnSpeed = 10.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.SetMotionType(Self.Motion_Keyframed, True)
  currentPoint = Self.GetLinkedRef(None)
  Self.SplineTranslateToRef(currentPoint, SplineMagnitude, Speed, TurnSpeed)
EndEvent

Event OnTranslationAlmostComplete()
  currentPoint = currentPoint.GetLinkedRef(None)
  Self.SplineTranslateToRef(currentPoint, SplineMagnitude, Speed, TurnSpeed)
EndEvent
