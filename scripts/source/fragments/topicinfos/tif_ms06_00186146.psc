ScriptName Fragments:TopicInfos:TIF_MS06_00186146 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ms06_questscript kmyQuest = Self.GetOwningQuest() as ms06_questscript
  kmyQuest.SetChoice(2)
EndFunction
