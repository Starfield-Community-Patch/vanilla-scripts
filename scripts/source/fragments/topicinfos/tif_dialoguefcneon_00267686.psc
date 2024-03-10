ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_00267686 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  fcneon_kosmosorgresourcesscript kmyQuest = Self.GetOwningQuest() as fcneon_kosmosorgresourcesscript
  kmyQuest.SellResource(kmyQuest.RESOURCETYPE_SOLVENT)
EndFunction
