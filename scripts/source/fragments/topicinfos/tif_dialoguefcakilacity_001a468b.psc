ScriptName Fragments:TopicInfos:TIF_DialogueFCAkilaCity_001A468B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property EleosLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  EleosLocationMiscPointer.SetStage(5)
EndFunction
