ScriptName UC08_RadarSwitches_CollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 526 Auto Const
{ Only process these activations once the player has reached the right point in the sequence }
Int Property ShutdownStage = 530 Auto Const
{ If the Queen's dead, don't sweat processing any more }
Int Property StageToSet = 529 Auto Const
{ Stage to set once all switches are thrown }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest()
  If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
    Self.RemoveRef(akSenderRef)
    If Self.GetCount() <= 0
      OQ.SetStage(StageToSet)
    EndIf
  EndIf
EndEvent
