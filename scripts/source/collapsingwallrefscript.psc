ScriptName CollapsingWallRefScript Extends ObjectReference
{ Script for collapsing wall panels, doors that can only be opened, not closed. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property HideActivationText = False Auto Const
{ Default=True. If True, when the collapsing wall initializes, block its activation text. }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnLoad()
    Self.BlockActivation(True, HideActivationText)
    Self.GoToState("Waiting")
  EndEvent
EndState

;-- State -------------------------------------------
State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Done")
    Self.Activate(akActionRef, True)
    Self.BlockActivation(True, True)
  EndEvent
EndState
