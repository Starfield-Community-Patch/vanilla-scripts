ScriptName UC01_LeechCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const mandatory
{ Stage to set once this collecting is cleared }

;-- Functions ---------------------------------------

Event OnObjectDestroyed(ObjectReference akSenderRef, ObjectReference akReference)
  Self.RemoveRef(akSenderRef)
  Int iCount = Self.GetCount()
  If iCount <= 0
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent
