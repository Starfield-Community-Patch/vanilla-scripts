ScriptName Fragments:TopicInfos:TIF_UC04_00226482 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  uc04_questscript kmyQuest = Self.GetOwningQuest() as uc04_questscript
  Self.GetOwningQuest().SetStage(810)
  kmyQuest.ToggleMarineFollowers(-1)
EndFunction
