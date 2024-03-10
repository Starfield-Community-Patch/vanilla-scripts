ScriptName LC012_OpenDoor Extends ObjectReference Const
{ Opens linked door on trigger enter }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.GetLinkedRef(None).SetOpen(True)
  Self.Disable(False)
EndEvent
