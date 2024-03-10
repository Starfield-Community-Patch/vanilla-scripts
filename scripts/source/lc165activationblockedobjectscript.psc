ScriptName LC165ActivationBlockedObjectScript Extends ObjectReference
{ Blocks activation on load, optionally hiding activation text and displaying a message on activation. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property ShouldHideActivationText = False Auto Const
Message Property MessageToDisplayOnActivation Auto Const
Int Property RedisplayDelay = 3 Auto Const

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
State WaitingForActivation

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Busy")
    MessageToDisplayOnActivation.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Utility.Wait(RedisplayDelay as Float)
    Self.GoToState("WaitingForActivation")
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingToForLoad

  Event OnCellLoad()
    Self.BlockActivation(True, ShouldHideActivationText)
    If MessageToDisplayOnActivation != None
      Self.GoToState("WaitingForActivation")
    Else
      Self.GoToState("Done")
    EndIf
  EndEvent
EndState
