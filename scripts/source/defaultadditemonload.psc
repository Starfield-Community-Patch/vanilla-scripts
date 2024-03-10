ScriptName DefaultAddItemOnLoad Extends ObjectReference default
{ Placed on an Object Reference (preferably an actor or container) that will add the selected item OnLoad() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Form Property ItemToAdd Auto Const
{ Base object to add to this reference. }
Int Property Count = 1 Auto Const
{ Default = 1: Number of this item to add. }

;-- State -------------------------------------------
State DoneWaiting
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    Self.GoToState("DoneWaiting")
    Self.Additem(ItemToAdd, Count, False)
  EndEvent
EndState
