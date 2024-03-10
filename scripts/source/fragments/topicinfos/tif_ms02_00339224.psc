ScriptName Fragments:TopicInfos:TIF_MS02_00339224 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.FadeOutGame(True, True, 1.0, 1.0, True)
EndFunction
