ScriptName Fragments:TopicInfos:TIF_RAD06_00136FFB Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  rad06script kmyQuest = Self.GetOwningQuest() as rad06script
  kmyQuest.CargoHoldResourceCheck()
EndFunction
