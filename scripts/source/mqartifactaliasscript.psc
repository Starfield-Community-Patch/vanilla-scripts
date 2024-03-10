ScriptName MQArtifactAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ_ArtifactDepositMSG Auto Const mandatory
Int Property StageToSet Auto Const
wwiseevent Property WwiseEvent_AMBArtifactVision Auto Const mandatory
Quest Property MQ00 Auto Const mandatory
ReferenceAlias Property SoundMarker01 Auto Const
ReferenceAlias Property SoundMarker02 Auto Const
ReferenceAlias Property FloaterMarker01 Auto Const

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      ObjectReference myRef = Self.GetRef()
      If myRef.GetCurrentDestructionStage() < 3
        MQ_ArtifactDepositMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Else
        Self.GotoState("HasBeenTriggered")
        SoundMarker01.GetRef().DisableNoWait(False)
        SoundMarker02.GetRef().DisableNoWait(False)
        Game.FadeOutGame(True, True, 0.0, 0.5, True)
        Utility.Wait(0.5)
        (MQ00 as mq00questscript).PlayArtifactVision()
        myRef.Disable(False)
        FloaterMarker01.GetRef().DisableNoWait(False)
        Game.FadeOutGame(False, True, 0.0, 0.5, False)
        Self.GetOwningQuest().SetStage(StageToSet)
      EndIf
    EndIf
  EndEvent
EndState
