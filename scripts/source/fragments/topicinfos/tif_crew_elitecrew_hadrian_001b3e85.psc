ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_Hadrian_001B3E85 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property HadrianKnowsGlobal Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  HadrianKnowsGlobal.SetValue(1.0)
EndFunction
