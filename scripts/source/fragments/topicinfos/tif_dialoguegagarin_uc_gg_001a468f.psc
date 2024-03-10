ScriptName Fragments:TopicInfos:TIF_DialogueGagarin_UC_GG_001A468F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property EleosLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  EleosLocationMiscPointer.SetStage(5)
EndFunction
