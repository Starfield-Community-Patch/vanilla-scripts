ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_001933AD Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property ParadisoLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ParadisoLocationMiscPointer.SetStage(5)
EndFunction
