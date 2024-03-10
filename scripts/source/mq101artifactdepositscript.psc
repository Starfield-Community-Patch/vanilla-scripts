ScriptName MQ101ArtifactDepositScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ101ArtifactMineralBedMSG Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Quest MyQuest = Self.GetOwningQuest()
  If Self.GetRef().GetCurrentDestructionStage() < 3
    MQ101ArtifactMineralBedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    MyQuest.SetStage(50)
  EndIf
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  Quest MyQuest = Self.GetOwningQuest()
  If aiCurrentStage >= 3
    MyQuest.SetStage(51)
  EndIf
EndEvent
