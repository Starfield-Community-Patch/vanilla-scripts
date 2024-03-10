ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuardsShi_0019340B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property NewHomesteadLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  NewHomesteadLocationMiscPointer.SetStage(5)
EndFunction
