ScriptName TriggerAmbushOnDoorOpen Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  defaultrefambushtrigger2 ambushTriggerVolume = Self.GetLinkedRef(None) as defaultrefambushtrigger2
  ambushTriggerVolume.TriggerAmbush()
EndEvent
