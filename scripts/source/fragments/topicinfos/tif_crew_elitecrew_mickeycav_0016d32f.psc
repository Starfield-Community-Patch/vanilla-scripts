ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_MickeyCav_0016D32F Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.SpeechChallengeAttempted()
EndFunction
