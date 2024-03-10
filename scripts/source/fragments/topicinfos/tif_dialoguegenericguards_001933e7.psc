ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_001933E7 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RedMileLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  RedMileLocationMiscPointer.SetStage(5)
EndFunction
