ScriptName DR030_UnlockDoorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference doorRef = Self.GetLinkedRef(None)
  If doorRef != None
    If doorRef.IsLocked()
      doorRef.Unlock(False)
      doorRef.SetOpen(True)
    Else
      Int OpenState = doorRef.GetOpenState()
      If OpenState == 1
        doorRef.SetOpen(False)
      EndIf
      doorRef.SetOpen(False)
      doorRef.Lock(True, False, True)
    EndIf
  EndIf
EndEvent
