ScriptName RI07_IDCardReadersScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory
Int Property iTurnOffStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterForCustomEvent((akSenderRef as idcardreader) as ScriptObject, "idcardreader_IDReaderActivatedFailure")
EndEvent

Event IDCardReader.IDReaderActivatedFailure(idcardreader akSender, Var[] kargs)
  Quest CurrentQuest = Self.GetOwningQuest()
  If CurrentQuest.GetStageDone(iPreReqStage) && !CurrentQuest.GetStageDone(iTurnOffStage)
    CurrentQuest.SetStage(iStageToSet)
  EndIf
EndEvent
