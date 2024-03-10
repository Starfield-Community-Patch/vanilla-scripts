ScriptName Fragments:TopicInfos:TIF_UC08_0007E91A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC08_532_KaiserHadrian_FinalSampleSecure Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !UC08_532_KaiserHadrian_FinalSampleSecure.IsPlaying()
    UC08_532_KaiserHadrian_FinalSampleSecure.Start()
  EndIf
EndFunction
