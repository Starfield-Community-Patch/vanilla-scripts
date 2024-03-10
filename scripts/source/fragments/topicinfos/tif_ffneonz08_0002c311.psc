ScriptName Fragments:TopicInfos:TIF_FFNeonZ08_0002C311 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property TLQuestion2 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  TLQuestion2.Mod(1.0)
EndFunction
