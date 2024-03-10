ScriptName Fragments:TopicInfos:TIF_UC08_001C543A Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  uc08questscript kmyQuest = Self.GetOwningQuest() as uc08questscript
  kmyQuest.ToggleFollowerState(-1)
EndFunction
