ScriptName TestPatrolScript Extends ObjectReference

;-- Variables ---------------------------------------
Int currentPatrolPoint

;-- Properties --------------------------------------
Float Property Speed Auto Const
ObjectReference[] Property PatrolMarkers Auto Const mandatory
Float Property SplineMagnitude Auto Const
Float Property TurnSpeed = 10.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  currentPatrolPoint = 0
  Self.SplineTranslateToRef(PatrolMarkers[currentPatrolPoint], 200.0, Speed, 10.0)
EndEvent

Event OnTranslationAlmostComplete()
  currentPatrolPoint += 1
  If currentPatrolPoint >= PatrolMarkers.Length
    currentPatrolPoint = 0
  EndIf
  Self.SplineTranslateToRef(PatrolMarkers[currentPatrolPoint], SplineMagnitude, Speed, TurnSpeed)
EndEvent
