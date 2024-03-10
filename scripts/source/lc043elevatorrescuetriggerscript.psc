ScriptName LC043ElevatorRescueTriggerScript Extends ObjectReference Const
{ Script for the elevator triggers in LC043. }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef.GetEditorLocation() != akActionRef.GetCurrentLocation()
    akActionRef.MoveToMyEditorLocation()
  EndIf
EndEvent
