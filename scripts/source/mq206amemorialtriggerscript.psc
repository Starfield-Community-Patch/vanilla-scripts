ScriptName MQ206AMemorialTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ206A_004_Casket Auto Const mandatory

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.GotoState("HasBeenTriggered")
      MQ206A_004_Casket.Start()
      Utility.Wait(3.0)
      Self.GotoState("WaitingForPlayer")
    EndIf
  EndEvent
EndState
