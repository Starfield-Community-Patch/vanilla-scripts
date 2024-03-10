ScriptName Fragments:TopicInfos:TIF_UC07_0020B806 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_Ecliptic Auto Const mandatory
GlobalVariable Property PlayerKnows_SirenXenoweapons Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  PlayerKnows_Ecliptic.SetValue(1.0)
  PlayerKnows_SirenXenoweapons.SetValue(1.0)
EndFunction
