ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_00027B78 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR04Misc Auto Const mandatory
Quest Property FFNewHomesteadR04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFNewHomesteadR04Misc.SetStage(100)
EndFunction
