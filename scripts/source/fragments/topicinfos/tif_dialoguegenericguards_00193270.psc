ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_00193270 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property GagarinLocationMiscPointer Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  GagarinLocationMiscPointer.SetStage(5)
EndFunction
