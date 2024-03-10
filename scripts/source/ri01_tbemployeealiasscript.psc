ScriptName RI01_TBEmployeeAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  Quest OwningQuest = Self.GetOwningQuest()
  If OwningQuest.GetStageDone(iPreReqStage)
    OwningQuest.SetStage(iStageToSet)
    Self.Clear()
  EndIf
EndEvent
