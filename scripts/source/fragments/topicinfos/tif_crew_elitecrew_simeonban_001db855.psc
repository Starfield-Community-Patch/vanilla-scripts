ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_SimeonBan_001DB855 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.SpeechChallengeAttempted()
EndFunction
