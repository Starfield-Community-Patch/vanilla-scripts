ScriptName TestEnableDisableRefOnTrigger Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property enableLinkedRef Auto Const
Bool Property useLinkedRefChain Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference
    Return 
  EndIf
  ObjectReference[] linkRefs = None
  If useLinkedRefChain
    linkRefs = Self.GetLinkedRefChain(None, 100)
  Else
    linkRefs = new ObjectReference[1]
    linkRefs[0] = Self.GetLinkedRef(None)
  EndIf
  Int I = 0
  While I < linkRefs.Length
    If enableLinkedRef
      linkRefs[I].Enable(False)
    Else
      linkRefs[I].Disable(False)
    EndIf
    I += 1
  EndWhile
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference
    Return 
  EndIf
  ObjectReference[] linkRefs = None
  If useLinkedRefChain
    linkRefs = Self.GetLinkedRefChain(None, 100)
  Else
    linkRefs = new ObjectReference[1]
    linkRefs[0] = Self.GetLinkedRef(None)
  EndIf
  Int I = 0
  While I < linkRefs.Length
    If enableLinkedRef
      linkRefs[I].Disable(False)
    Else
      linkRefs[I].Enable(False)
    EndIf
    I += 1
  EndWhile
EndEvent
