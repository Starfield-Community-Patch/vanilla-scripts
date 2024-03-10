ScriptName Fragments:TopicInfos:TIF_RI03_0023C735 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ri03_questscript kmyQuest = Self.GetOwningQuest() as ri03_questscript
  kmyQuest.AddToSimonCount()
EndFunction
