ScriptName RAD06PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property ResourceToLookFor Auto
Int Property QuantityToLookFor Auto

;-- Functions ---------------------------------------

Function RefreshFilter()
  Self.AddInventoryEventFilter(ResourceToLookFor as Form)
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == ResourceToLookFor as Form
    If Self.GetRef().GetItemCount(ResourceToLookFor as Form) >= QuantityToLookFor
      Self.GetOwningQuest().SetStage(200)
    EndIf
  EndIf
EndEvent
