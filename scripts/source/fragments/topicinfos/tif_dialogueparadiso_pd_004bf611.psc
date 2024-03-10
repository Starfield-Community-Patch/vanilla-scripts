ScriptName Fragments:TopicInfos:TIF_DialogueParadiso_PD_004BF611 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_VisitationCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  PD_VisitationCount.SetValue(1.0)
EndFunction
