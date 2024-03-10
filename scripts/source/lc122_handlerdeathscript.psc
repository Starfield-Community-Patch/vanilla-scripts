ScriptName LC122_HandlerDeathScript Extends Actor Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  If akKiller == Game.GetPlayer() as ObjectReference
    ObjectReference enableMarker = Self.GetLinkedRef(None)
    enableMarker.Disable(False)
  EndIf
EndEvent
