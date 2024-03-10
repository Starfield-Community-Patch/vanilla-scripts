ScriptName RI05_OnTriggerEnterRefCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const mandatory
Int Property PreReqStage Auto Const mandatory
MagicEffect Property ArtifactPowerVoidForm_Effect Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer()
  If (akActionRef == PlayerRef as ObjectReference) && !PlayerRef.HasMagicEffect(ArtifactPowerVoidForm_Effect)
    Quest OwningQuest = Self.GetOwningQuest()
    If OwningQuest.GetStageDone(PreReqStage)
      OwningQuest.SetStage(StageToSet)
    EndIf
  EndIf
EndEvent
