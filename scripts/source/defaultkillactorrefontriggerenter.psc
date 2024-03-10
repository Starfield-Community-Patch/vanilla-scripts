ScriptName DefaultKillActorRefOnTriggerEnter Extends ObjectReference Const
{ Kills the selected reference when it enters this trigger, then disables/deletes the trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property ActorReferenceToKill Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == ActorReferenceToKill
    (akActionRef as Actor).Kill(None)
    Self.Disable(False)
    Self.Delete()
  EndIf
EndEvent
