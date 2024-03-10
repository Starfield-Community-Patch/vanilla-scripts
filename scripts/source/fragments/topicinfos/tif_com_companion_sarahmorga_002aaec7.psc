ScriptName Fragments:TopicInfos:TIF_COM_Companion_SarahMorga_002AAEC7 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.CommitmentDesired(True)
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
