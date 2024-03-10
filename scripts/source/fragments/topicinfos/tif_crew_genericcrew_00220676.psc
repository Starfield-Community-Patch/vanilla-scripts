ScriptName Fragments:TopicInfos:TIF_CREW_GenericCrew_00220676 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  crew_genericcrewquestscript kmyQuest = Self.GetOwningQuest() as crew_genericcrewquestscript
  kmyQuest.Recruited()
EndFunction
