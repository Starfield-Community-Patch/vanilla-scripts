ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_001933D7 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property NewHomesteadLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  NewHomesteadLocationMiscPointer.SetStage(5)
EndFunction
