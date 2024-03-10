ScriptName DR030_ElevatorDoorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference moveToMarker = Self.GetLinkedRef(None)
  If moveToMarker != None
    akActionRef.moveto(moveToMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndEvent
