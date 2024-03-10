ScriptName Fragments:TopicInfos:TIF_Rad01_LIST_0013E0BC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Rad01_DialoguePhaseTracker Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Rad01_DialoguePhaseTracker.SetValue(1.0)
EndFunction
