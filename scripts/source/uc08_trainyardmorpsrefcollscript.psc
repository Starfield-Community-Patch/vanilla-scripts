ScriptName UC08_TrainyardMorpsRefCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 381 Auto Const
{ Looking for this stage before we start setting anything }
Int Property StagetoSet = 382 Auto Const
{ Set this stage once this ref collection is empty. It's possible this could get emptied before the prereq is set. That handling is managed on stage 381. }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef)
  Quest OQ = Self.GetOwningQuest()
  If OQ.GetStageDone(PrereqStage) && Self.GetCount() <= 0
    OQ.SetStage(StagetoSet)
  EndIf
EndEvent
