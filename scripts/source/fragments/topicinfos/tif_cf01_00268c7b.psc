ScriptName Fragments:TopicInfos:TIF_CF01_00268C7B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_CrimsonFleet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  PlayerKnows_CrimsonFleet.SetValue(1.0)
EndFunction
