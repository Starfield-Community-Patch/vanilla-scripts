ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuardsShi_0019342D Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property ParadisoLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ParadisoLocationMiscPointer.SetStage(5)
EndFunction
