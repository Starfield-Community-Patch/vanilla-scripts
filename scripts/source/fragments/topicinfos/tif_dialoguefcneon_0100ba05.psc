ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_0100BA05 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Neon_VoliiHotel_RentCount Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Neon_VoliiHotel_RentCount.Mod(1.0)
EndFunction
