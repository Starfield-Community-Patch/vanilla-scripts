ScriptName PlayBinkOverLoadScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property DestinationMarker Auto

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.Activate(Self as ObjectReference, False)
EndEvent
