ScriptName SetLinkedRefClosedOnActivate Extends ObjectReference Const
{ Used on doors to keep a paired door shut }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkedRefKeyword Auto Const
{ OPTIONAL: Keyword to check for on the Linked Ref }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference LinkedRef = Self.GetLinkedRef(LinkedRefKeyword)
  Int currOpenState = LinkedRef.GetOpenState()
  If currOpenState == 1 || currOpenState == 2
    LinkedRef.SetOpen(False)
  EndIf
EndEvent
