ScriptName Fragments:TopicInfos:TIF_FFNeonZ08_0002C334 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property TLUnlock Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  TLUnlock.Mod(1.0)
EndFunction
