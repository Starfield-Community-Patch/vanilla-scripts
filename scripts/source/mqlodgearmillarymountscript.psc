ScriptName MQLodgeArmillaryMountScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ404 Auto Const mandatory
Int Property MQ404_PackUpStage = 110 Auto Const
Int Property MQ404_PackUpPrereqStage = 100 Auto Const
Message Property ArmillaryNoArtifactsAddedMSG Auto Const mandatory
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryPlaceArtifact Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer()
  If (akActionRef == PlayerREF as ObjectReference) && (MQ404.GetStageDone(MQ404_PackUpPrereqStage) == False || MQ404.GetStageDone(MQ404_PackUpStage))
    If PlayerREF.GetItemCount(ObjectTypeMQArtifact as Form) > 0
      WwiseEvent_AMBArtifactArmillaryPlaceArtifact.Play(Self as ObjectReference, None, None)
      armillaryscript ArmillaryREF = Self.GetLinkedRef(None) as armillaryscript
      ArmillaryREF.BuildArmillary(PlayerREF, None)
    Else
      ArmillaryNoArtifactsAddedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
EndEvent
