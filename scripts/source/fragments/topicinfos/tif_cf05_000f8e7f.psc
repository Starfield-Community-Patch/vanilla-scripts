ScriptName Fragments:TopicInfos:TIF_CF05_000F8E7F Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  akSpeaker.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction
