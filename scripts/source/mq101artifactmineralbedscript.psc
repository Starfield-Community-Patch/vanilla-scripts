ScriptName MQ101ArtifactMineralBedScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
ObjectReference[] TriggeredRefArray
Int TriggeredRefArrayIndex = -1

;-- Properties --------------------------------------
ReferenceAlias Property ArtifactDeposit Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDestructionStageChanged(ObjectReference akSenderRef, Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage >= 3
    If TriggeredRefArray == None
      TriggeredRefArray = new ObjectReference[Self.GetCount()]
      TriggeredRefArrayIndex = 0
    EndIf
    If TriggeredRefArray.find(akSenderRef, 0) < 0
      TriggeredRefArray[TriggeredRefArrayIndex] = akSenderRef
      TriggeredRefArrayIndex += 1
    EndIf
    If TriggeredRefArrayIndex >= TriggeredRefArray.Length
      Self.GetOwningQuest().SetStage(42)
      (ArtifactDeposit.GetRef() as buriedartifact).PickupEnabled = True
    EndIf
  EndIf
EndEvent
