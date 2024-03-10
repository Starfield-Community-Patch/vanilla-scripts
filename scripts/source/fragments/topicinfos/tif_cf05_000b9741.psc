ScriptName Fragments:TopicInfos:TIF_CF05_000B9741 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CF05_CommandBayGuardAccess Auto Const mandatory
Scene Property CF05_1026_EnsignAccessScene Auto Const mandatory
Quest Property CF05_Guard_SpeechChallenge01 Auto Const mandatory
Scene Property CF05_1025_EnsignAccessScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  CF05_CommandBayGuardAccess.ForceRefTo(akSpeaker as ObjectReference)
EndFunction

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  CF05_1026_EnsignAccessScene.Stop()
  CF05_Guard_SpeechChallenge01.Start()
  CF05_1026_EnsignAccessScene.Start()
EndFunction
