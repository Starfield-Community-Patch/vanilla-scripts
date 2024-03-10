ScriptName OutpostContainerScript Extends ObjectReference
{ put this on containers that we want to update linked containers when the player modifies inventory }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForEvents(True)
EndEvent

Event OnUnload()
  Self.RegisterForEvents(False)
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  Self.RegisterForEvents(False)
EndEvent

Function RegisterForEvents(Bool bRegister)
  If bRegister
    Self.RegisterForMenuOpenCloseEvent("ContainerMenu")
    Self.AddInventoryEventFilter(None)
    Self.gotoState("ready")
  Else
    Self.UnregisterForMenuOpenCloseEvent("ContainerMenu")
    Self.RemoveAllInventoryEventFilters()
  EndIf
EndFunction

;-- State -------------------------------------------
State busy

  Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
    ; Empty function
  EndEvent

  Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
    ; Empty function
  EndEvent

  Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
    If abOpening == False
      Self.MoveContainerContentToUnfilledContainers()
      Self.gotoState("ready")
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
Auto State ready

  Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
    If akDestContainer == Game.GetPlayer() as ObjectReference
      Self.gotoState("busy")
      Self.MoveContainerContentToUnfilledContainers()
      Self.gotoState("ready")
    EndIf
  EndEvent

  Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
    If abOpening
      Self.gotoState("busy")
    EndIf
  EndEvent

  Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
    If akSourceContainer == Game.GetPlayer() as ObjectReference
      Self.gotoState("busy")
      Self.MoveContainerContentToUnfilledContainers()
      Self.gotoState("ready")
    EndIf
  EndEvent
EndState
