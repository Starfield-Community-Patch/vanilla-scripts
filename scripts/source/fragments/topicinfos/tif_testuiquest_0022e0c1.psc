ScriptName Fragments:TopicInfos:TIF_TestUIQuest_0022E0C1 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  akSpeakerRef.ShowHangarMenu(0, akSpeaker, None, False)
EndFunction
