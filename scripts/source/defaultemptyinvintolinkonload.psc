ScriptName DefaultEmptyInvIntoLinkOnLoad Extends ObjectReference default
{ Removes items from self and puts them into Linked Ref OnLoad() }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State WaitForLoad

  Event OnLoad()
    Self.GoToState("Done")
    Self.RemoveAllItems(Self.GetLinkedRef(None), False, False)
  EndEvent
EndState
