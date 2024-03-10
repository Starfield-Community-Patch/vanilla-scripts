ScriptName MQ_TutorialPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property Contraband Auto Const mandatory
Message Property Tutorial_ContrabandMSGBox Auto Const mandatory

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnAliasInit()
    ; Empty function
  EndEvent

  Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
    If akBaseItem.HasKeyword(Contraband)
      Self.GotoState("HasBeenTriggered")
      Tutorial_ContrabandMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.RemoveAllInventoryEventFilters()
    EndIf
  EndEvent

  Event OnAliasInit()
    Self.AddInventoryEventFilter(Contraband as Form)
  EndEvent
EndState
