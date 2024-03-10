ScriptName Fragments:TopicInfos:TIF_BF04_0001BDCF Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BF_Info_Bayu Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  BF_Info_Bayu.SetValue(1.0)
EndFunction
