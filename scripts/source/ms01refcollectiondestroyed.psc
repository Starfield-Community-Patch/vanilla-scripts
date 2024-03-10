ScriptName MS01RefCollectionDestroyed Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akSenderRef, ObjectReference akDestroyer)
  If Self.GetCount() <= 1
    Self.GetOwningQuest().SetStage(StageToSet)
  Else
    Self.RemoveRef(akSenderRef)
  EndIf
EndEvent
