ScriptName DR029ElevatorAvoidanceScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    movingplatformmasterscript movingPlatform = Self.GetLinkedRef(None) as movingplatformmasterscript
    If movingPlatform != None
      If movingPlatform.IsInteriorDoorClosing()
        Float doorOpenSeconds = movingPlatform.GetDoorOpenSeconds()
        Utility.Wait(doorOpenSeconds)
      EndIf
      If movingPlatform.IsMoving() && movingPlatform.GetCurrentDirection() < 0
        movingPlatform.CancelTravelAndReturnToOriginFloor()
      EndIf
    EndIf
  EndIf
EndEvent
