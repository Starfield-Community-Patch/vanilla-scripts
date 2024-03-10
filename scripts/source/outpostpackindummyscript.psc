ScriptName OutpostPackinDummyScript Extends ObjectReference Const
{ passes events along to linked ref }

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  outposteventhandlerparent myEventRef = Self.GetLinkedRef(None) as outposteventhandlerparent
  If myEventRef
    myEventRef.HandleOnWorkshopObjectPlaced(akReference)
  EndIf
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  outposteventhandlerparent myEventRef = Self.GetLinkedRef(None) as outposteventhandlerparent
  If myEventRef
    myEventRef.HandleOnWorkshopObjectRemoved(akReference)
  EndIf
EndEvent
