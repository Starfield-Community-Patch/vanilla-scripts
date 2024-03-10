ScriptName Fragments:TopicInfos:TIF_Dialogue1OfAKindUC07_001F436D Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_SirenXenoweapons Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  PlayerKnows_SirenXenoweapons.SetValue(1.0)
EndFunction
