ScriptName Fragments:TopicInfos:TIF_COM_Companion_Andreja_001E9F6B Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.CommitmentDesired(False)
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction
