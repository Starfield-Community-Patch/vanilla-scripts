ScriptName Fragments:TopicInfos:TIF_UC08_0020619F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC08_475_HadrianKaiser_Analysis Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !UC08_475_HadrianKaiser_Analysis.IsPlaying()
    UC08_475_HadrianKaiser_Analysis.Start()
  EndIf
EndFunction
