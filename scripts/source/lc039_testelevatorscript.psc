ScriptName LC039_TestElevatorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference linkedDoor = Self.GetLinkedRef(None)
  linkedDoor.Activate(akActionRef, False)
EndEvent
