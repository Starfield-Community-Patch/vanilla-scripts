ScriptName CityCYRedTape01PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property InorgCommonIron Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerForResourceTracking(Bool bRegister)
  If bRegister
    Self.AddInventoryEventFilter(InorgCommonIron as Form)
    Self.RunCheckResources()
  Else
    Self.RemoveInventoryEventFilter(InorgCommonIron as Form)
  EndIf
EndFunction

Function RunCheckResources()
  Quest myQuest = Self.GetOwningQuest()
  citycyredtape01questscript myQIScript = myQuest as citycyredtape01questscript
  myQIScript.ResourceCheck()
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.RunCheckResources()
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Self.RunCheckResources()
EndEvent
