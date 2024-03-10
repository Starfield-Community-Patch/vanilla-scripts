ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_0021D3F0 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR05Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFNewHomesteadR05Misc.Start()
EndFunction
