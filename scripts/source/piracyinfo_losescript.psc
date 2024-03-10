ScriptName PiracyInfo_LoseScript Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  spaceshipreference shipRef = akSpeakerRef as spaceshipreference
  (Self.GetOwningQuest() as dialoguegenericpiracyshipqscript).PiracyFail(shipRef)
EndEvent
