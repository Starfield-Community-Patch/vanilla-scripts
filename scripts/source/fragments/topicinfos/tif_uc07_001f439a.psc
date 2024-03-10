ScriptName Fragments:TopicInfos:TIF_UC07_001F439A Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Quest myOQ = Self.GetOwningQuest()
  If !myOQ.GetStageDone(545)
    myOQ.SetStage(562)
  EndIf
EndFunction
