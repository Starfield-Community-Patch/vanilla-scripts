ScriptName OutpostCargoLinkPackinScript Extends ObjectReference Const
{ passes on events to linked ref }

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
  outpostcargolinkmarkerscript myLinkedRef = Self.GetLinkedRef(None) as outpostcargolinkmarkerscript
  If myLinkedRef
    myLinkedRef.OnWorkshopCargoLinkChanged(akOldTarget, akNewTarget)
  EndIf
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
  outpostcargolinkmarkerscript myLinkedRef = Self.GetLinkedRef(None) as outpostcargolinkmarkerscript
  If myLinkedRef
    myLinkedRef.OnWorkshopObjectRemoved(akActionRef)
  EndIf
EndEvent
