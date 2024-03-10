ScriptName Fragments:TopicInfos:TIF_Rad01_LIST_00192084 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Rad01_DialoguePhaseTracker Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Rad01_DialoguePhaseTracker.SetValue(4.0)
EndFunction
