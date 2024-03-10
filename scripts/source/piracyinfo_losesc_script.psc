ScriptName PiracyInfo_LoseSC_Script Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  spaceshipreference shipRef = akSpeakerRef as spaceshipreference
  (Self.GetOwningQuest() as dialoguegenericpiracyshipqscript).PiracyLoseSpeechChallenge(shipRef)
EndEvent
