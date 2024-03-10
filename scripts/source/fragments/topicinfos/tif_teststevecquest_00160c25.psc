ScriptName Fragments:TopicInfos:TIF_TestSteveCQuest_00160C25 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Variable01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  akSpeaker.SetValue(Variable01, 0.0)
  akSpeaker.EvaluatePackage(False)
EndFunction
