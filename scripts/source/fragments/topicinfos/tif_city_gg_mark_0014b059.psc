ScriptName Fragments:TopicInfos:TIF_City_GG_Mark_0014B059 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Quest OQ = Self.GetOwningQuest()
  OQ.SetStage(960)
  OQ.SetStage(963)
  OQ.SetStage(980)
EndFunction
