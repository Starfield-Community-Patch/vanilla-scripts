ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_Hadrian_001B3E13 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property HadrianECQuest Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  HadrianECQuest.SetStage(450)
EndFunction
