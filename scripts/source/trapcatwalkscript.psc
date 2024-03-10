ScriptName TrapCatwalkScript Extends ObjectReference
{ Breakable Catwalk trap script, catwalk breaks when it it hit by enough damage to exceed a threshold. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkNavCutPrimitive Auto Const mandatory

;-- Functions ---------------------------------------

Event OnReset()
  Self.ClearDestruction()
EndEvent

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnDestroyed(ObjectReference akDestroyer)
    Self.GoToState("Done")
    Self.GetLinkedRef(LinkNavCutPrimitive).Enable(False)
  EndEvent
EndState
