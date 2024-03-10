ScriptName EnableDisableOnItemRemoved Extends ObjectReference
{ Enables or disables this object's linked ref when an item is removed from this container. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Keyword Property LinkKeyword Auto Const
  { If set, enable or disable the link with this keyword. Defaults to NONE. }
  Bool Property ShouldEnable = True Auto Const
  { Default=TRUE. Should we disable or enable the linked ref? }
  Bool Property doOnce = True Auto Const
  { If set to TRUE (DEFAULT) then this will only run once. }
EndGroup


;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
    If ShouldEnable
      Self.GetLinkedRef(LinkKeyword).Enable(False)
    Else
      Self.GetLinkedRef(LinkKeyword).Disable(False)
    EndIf
    If doOnce == True
      Self.gotoState("Done")
      Self.RemoveInventoryEventFilter(None)
    EndIf
  EndEvent

  Event onLoad()
    Self.AddInventoryEventFilter(None)
  EndEvent
EndState
