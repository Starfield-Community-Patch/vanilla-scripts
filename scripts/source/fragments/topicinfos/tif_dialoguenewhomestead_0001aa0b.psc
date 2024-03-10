ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_0001AA0B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR05Misc Auto Const mandatory
Quest Property FFNewHomesteadR05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !FFNewHomesteadR05.IsRunning() && !FFNewHomesteadR05Misc.IsRunning()
    FFNewHomesteadR05Misc.Start()
  EndIf
EndFunction
