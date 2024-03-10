ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuardsShi_001933E9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property EleosLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  EleosLocationMiscPointer.SetStage(5)
EndFunction
