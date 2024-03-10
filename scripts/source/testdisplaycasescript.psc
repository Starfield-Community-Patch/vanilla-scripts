ScriptName TestDisplayCaseScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function
EndEvent

Function testGetItemCount()
  ; Empty function
EndFunction

Event OnLoad()
  Self.AddInventoryEventFilter(None)
EndEvent
