ScriptName MQ101FuelBinScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FuelObject Auto
Int Property FuelNeeded Auto
ActorValue Property SpaceshipGravJumpFuel Auto

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(FuelObject as Form)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == FuelObject as Form
    If Self.GetRef().GetItemCount(FuelObject as Form) >= FuelNeeded || (Self.GetRef().GetCurrentShipRef().GetValue(SpaceshipGravJumpFuel) as Int >= FuelNeeded)
      Self.GetOwningQuest().SetStage(900)
    EndIf
  EndIf
EndEvent
