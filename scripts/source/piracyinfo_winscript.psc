ScriptName PiracyInfo_WinScript Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  spaceshipreference shipRef = akSpeakerRef as spaceshipreference
  (Self.GetOwningQuest() as dialoguegenericpiracyshipqscript).PiracySuccess(shipRef)
EndEvent
