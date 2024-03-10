ScriptName FFCydoniaZ07PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FFCydoniaZ07_HeartOfMarsTitanium Auto Const mandatory
ReferenceAlias Property HeartOfMarsInv Auto Const mandatory

;-- Functions ---------------------------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == FFCydoniaZ07_HeartOfMarsTitanium as Form
    HeartOfMarsInv.ForceRefTo(akItemReference)
  EndIf
EndEvent

Event OnAliasInit()
  Self.AddInventoryEventFilter(FFCydoniaZ07_HeartOfMarsTitanium as Form)
EndEvent
