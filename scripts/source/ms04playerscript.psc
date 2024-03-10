ScriptName MS04PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property Slate1 Auto Const
Book Property Slate02 Auto Const
FormList Property MS04SlateFilter Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(MS04SlateFilter as Form)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == Slate1 as Form
    Self.GetOwningQuest().SetStage(355)
  EndIf
  If akBaseItem == Slate02 as Form
    Self.GetOwningQuest().SetStage(360)
  EndIf
EndEvent
