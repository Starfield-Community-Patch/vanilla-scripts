ScriptName UC08_AB_CollCleanUpScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CleanUpStage = 900 Auto Const
{ Once this stage is set, start cleaning up the NPCs }

;-- Functions ---------------------------------------

Event OnUnload(ObjectReference akSenderRef)
  If Self.GetOwningQuest().GetStageDone(CleanUpStage)
    akSenderRef.Disable(False)
  EndIf
EndEvent
