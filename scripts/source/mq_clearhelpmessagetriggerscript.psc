ScriptName MQ_ClearHelpMessageTriggerScript Extends ObjectReference

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnTriggerEnter(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.GotoState("HasBeenTriggered")
      Message.ClearHelpMessages()
      Self.Disable(False)
    EndIf
  EndEvent
EndState
