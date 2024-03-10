ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_MarikaBor_001E2906 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.SpeechChallengeAttempted()
EndFunction
