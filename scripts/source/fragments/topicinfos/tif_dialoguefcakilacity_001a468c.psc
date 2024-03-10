ScriptName Fragments:TopicInfos:TIF_DialogueFCAkilaCity_001A468C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property EleosLocationMiscPointer Auto Const mandatory
Quest Property MS02 Auto Const mandatory
Quest Property MS02_Intro Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !MS02.GetStageDone(100) && !MS02.GetStageDone(9000) && !MS02_Intro.GetStageDone(100)
    MS02_Intro.SetStage(100)
  EndIf
EndFunction
