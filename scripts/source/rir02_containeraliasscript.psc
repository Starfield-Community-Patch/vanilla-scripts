ScriptName RIR02_ContainerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RIR02_ConfidentialFiles Auto Const mandatory
Int Property iPlantFilesStage = 200 Auto Const
Int Property iReturnToImogeneStage = 300 Auto Const
Int Property iCompletionStage = 10000 Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(RIR02_ConfidentialFiles as Form)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest MyQuest = Self.GetOwningQuest()
  If !MyQuest.GetStageDone(iReturnToImogeneStage)
    MyQuest.SetStage(iReturnToImogeneStage)
  Else
    MyQuest.SetObjectiveCompleted(iPlantFilesStage, True)
    MyQuest.SetObjectiveDisplayed(iReturnToImogeneStage, True, False)
  EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Quest MyQuest = Self.GetOwningQuest()
  If !MyQuest.GetStageDone(iCompletionStage)
    MyQuest.SetObjectiveDisplayed(iReturnToImogeneStage, False, False)
    MyQuest.SetObjectiveCompleted(iPlantFilesStage, False)
    MyQuest.SetObjectiveDisplayed(iPlantFilesStage, True, True)
  EndIf
EndEvent
