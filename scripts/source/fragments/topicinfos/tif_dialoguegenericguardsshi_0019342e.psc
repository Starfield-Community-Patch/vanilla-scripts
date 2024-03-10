ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuardsShi_0019342E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RedMileLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  RedMileLocationMiscPointer.SetStage(5)
EndFunction
