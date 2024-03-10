ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_0019334E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property EleosLocationMiscPointer Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  EleosLocationMiscPointer.SetStage(5)
EndFunction
