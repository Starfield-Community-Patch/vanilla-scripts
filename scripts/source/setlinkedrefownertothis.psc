ScriptName SetLinkedRefOwnerToThis Extends Actor Const
{ Sets this actor's LinkedRef to be owned by this actor. }

;-- Functions ---------------------------------------

Event OnCellAttach()
  ObjectReference linkedRef = Self.GetLinkedRef(None)
  Actor actorSelf = Self as Actor
  linkedRef.SetActorRefOwner(actorSelf, False)
  actorSelf = linkedRef.GetActorRefOwner()
EndEvent
