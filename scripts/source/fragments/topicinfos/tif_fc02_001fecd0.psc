ScriptName Fragments:TopicInfos:TIF_FC02_001FECD0 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Emma Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Emma.GetActorRef().EvaluatePackage(False)
EndFunction
