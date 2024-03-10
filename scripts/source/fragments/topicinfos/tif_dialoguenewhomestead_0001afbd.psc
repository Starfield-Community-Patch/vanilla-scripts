ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_0001AFBD Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR02Misc Auto Const mandatory
Quest Property FFNewHomesteadR02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !FFNewHomesteadR02.IsRunning() && !FFNewHomesteadR02Misc.IsRunning()
    FFNewHomesteadR02Misc.Start()
  EndIf
EndFunction
