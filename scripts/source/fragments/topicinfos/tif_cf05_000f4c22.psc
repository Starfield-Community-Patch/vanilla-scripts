ScriptName Fragments:TopicInfos:TIF_CF05_000F4C22 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF05_Alarm Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  akSpeaker.StartCombat(Game.GetPlayer() as ObjectReference, False)
  CF05_Alarm.SetStage(60)
EndFunction
