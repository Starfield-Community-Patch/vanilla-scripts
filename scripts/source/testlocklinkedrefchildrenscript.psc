ScriptName TestLockLinkedRefChildrenScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference[] linkedRefs = Self.GetRefsLinkedToMe(None, None)
  Int I = 0
  While I < linkedRefs.Length
    linkedRefs[I].Lock(True, False, True)
    I += 1
  EndWhile
EndEvent
