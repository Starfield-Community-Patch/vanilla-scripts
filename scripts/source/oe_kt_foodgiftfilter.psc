ScriptName OE_KT_FoodGiftFilter Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  FormList Property ItemFilter Auto Const mandatory
  Int Property StageToSet Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(ItemFilter as Form)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akSourceContainer == Game.GetPlayer() as ObjectReference
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent
