ScriptName Fragments:TopicInfos:TIF_CF05_000F4C10 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CF05_SpeechScenario_GuardPassedKeyword Auto Const mandatory
Quest Property CF05_Guard_SpeechChallenge01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  akSpeaker.AddKeyword(CF05_SpeechScenario_GuardPassedKeyword)
EndFunction

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  CF05_Guard_SpeechChallenge01.Stop()
EndFunction
