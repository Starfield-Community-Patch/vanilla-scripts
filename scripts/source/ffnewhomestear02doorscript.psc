ScriptName FFNewHomesteaR02DoorScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PreReqStage Auto Const mandatory
ReferenceAlias Property Tourist01 Auto Const mandatory
ReferenceAlias Property Tourist02 Auto Const mandatory
ReferenceAlias Property Tourist03 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Tourist01.GetRef() || akActionRef == Tourist02.GetRef() || akActionRef == Tourist03.GetRef()
    Quest OwningQuest = Self.GetOwningQuest()
    If OwningQuest.GetStageDone(PreReqStage)
      akActionRef.Disable(False)
    EndIf
  EndIf
EndEvent
