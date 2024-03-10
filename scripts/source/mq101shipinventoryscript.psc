ScriptName MQ101ShipInventoryScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int HeliumCount = 10

;-- Properties --------------------------------------
Int Property PrereqStage = 680 Auto Const
Int Property TurnOffStage = 900 Auto Const
Int Property StageToSet = 690 Auto Const
MiscObject Property InorgCommonHelium3 Auto
Int Property HeliumStage = 680 Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(InorgCommonHelium3 as Form)
EndEvent

Event OnQuickContainerOpened()
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(PrereqStage) && !myQuest.GetStageDone(TurnOffStage)
    myQuest.SetStage(StageToSet)
  EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest myQuest = Self.GetOwningQuest()
  ObjectReference myRef = Self.GetRef()
  If akBaseItem == InorgCommonHelium3 as Form
    If myRef.GetItemCount(InorgCommonHelium3 as Form) >= HeliumCount
      myQuest.SetStage(HeliumStage)
      Self.RemoveInventoryEventFilter(InorgCommonHelium3 as Form)
    EndIf
  EndIf
EndEvent
