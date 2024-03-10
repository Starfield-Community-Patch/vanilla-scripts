ScriptName SetLinkedActorValueOnActivate Extends ObjectReference Const
{ Sets a specific actor value on the linked reference chain to a specific value on activate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ActorValueToSet Auto Const mandatory
Keyword Property LinkCustom01 Auto Const
Float Property NewValue = 1.0 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference[] linkedrefs = Self.GetLinkedRefChain(LinkCustom01, 100)
  Int index = 0
  While index < linkedrefs.Length
    ObjectReference target = linkedrefs[index]
    target.SetValue(ActorValueToSet, NewValue)
    (target as Actor).EvaluatePackage(False)
    index += 1
  EndWhile
EndEvent
