ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_LyleBrewe_001C287F Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.Recruited()
EndFunction
