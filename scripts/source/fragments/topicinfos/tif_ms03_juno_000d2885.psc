ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D2885 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.StopDialogueCamera(False, False)
EndFunction
