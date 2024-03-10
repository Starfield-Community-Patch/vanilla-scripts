ScriptName DefaultContainerAddRefsOnLoad Extends ObjectReference default
{ On cell load, find all of the refs linked to or from this container with LinkAddItem, and add those items to the container. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  Keyword Property LinkAddItem Auto Const mandatory
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCellLoad()
    Self.GoToState("Done")
    ObjectReference[] linkedRefs = Self.GetLinkedRefChain(LinkAddItem, 100)
    Int I = 0
    While I < linkedRefs.Length
      Self.AddItem(linkedRefs[I] as Form, 1, False)
      I += 1
    EndWhile
    ObjectReference[] refsLinkedToMe = Self.GetRefsLinkedToMe(LinkAddItem, None)
    I = 0
    While I < refsLinkedToMe.Length
      Self.AddItem(refsLinkedToMe[I] as Form, 1, False)
      I += 1
    EndWhile
  EndEvent
EndState
