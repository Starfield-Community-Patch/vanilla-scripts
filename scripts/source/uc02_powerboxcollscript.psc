ScriptName UC02_PowerBoxCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ShutdownStage = 650 Auto Const
{ If this stage has been set, ignore the additional pulls }
Int Property PrereqStage = 601 Auto Const
{ Only start pulling ref's out of this collection once the prereq stage has been set }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  uc02_questscript OQ = Self.GetOwningQuest() as uc02_questscript
  If OQ.GetStageDone(PrereqStage)
    Self.RemoveRef(akSenderRef)
    If !OQ.GetStageDone(ShutdownStage)
      OQ.UpdatePowerBoxCount(akSenderRef, Self as RefCollectionAlias)
    EndIf
  EndIf
EndEvent
