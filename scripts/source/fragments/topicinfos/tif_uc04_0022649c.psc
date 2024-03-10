ScriptName Fragments:TopicInfos:TIF_UC04_0022649C Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  uc04_questscript kmyQuest = Self.GetOwningQuest() as uc04_questscript
  kmyQuest.ToggleMarineFollowers(-1)
EndFunction
