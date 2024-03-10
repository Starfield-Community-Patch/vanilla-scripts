ScriptName Fragments:TopicInfos:TIF_City_GG_Mark_0018BBD7 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Quest OQ = Self.GetOwningQuest()
  OQ.SetStage(963)
  OQ.SetStage(965)
  OQ.SetStage(990)
EndFunction
