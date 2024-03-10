ScriptName RL032_MovingPlatformButtonScript Extends ObjectReference

;-- Variables ---------------------------------------
movingplatformmasterscript movingPlatformMasterScriptRef

;-- Properties --------------------------------------
Int Property CurrentFloor = 1 Auto

;-- Functions ---------------------------------------

Event OnCellLoad()
  movingPlatformMasterScriptRef = Self.GetLinkedRef(None) as movingplatformmasterscript
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If movingPlatformMasterScriptRef.IsMoving()
    Return 
  EndIf
  If CurrentFloor == 1
    CurrentFloor = 0
    movingPlatformMasterScriptRef.ProcessFloorTravelRequest(0)
  ElseIf CurrentFloor == 0
    CurrentFloor = 1
    movingPlatformMasterScriptRef.ProcessFloorTravelRequest(1)
  EndIf
EndEvent
