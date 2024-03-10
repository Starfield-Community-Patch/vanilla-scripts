ScriptName Fragments:TopicInfos:TIF_City_GG_Mark_0014B054 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Quest OQ = Self.GetOwningQuest()
  OQ.SetStage(960)
  OQ.SetStage(970)
EndFunction
