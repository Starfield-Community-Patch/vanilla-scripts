ScriptName UC08_FuelTankScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 590 Auto Const
{ Stage to set when the proper switch is thrown }
Int Property PrereqStage = 570 Auto Const
{ Only set the stage if we're at the right part of the quest }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest()
  If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(StageToSet)
    OQ.SetStage(StageToSet)
  EndIf
EndEvent
