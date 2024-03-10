ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_0033A8DD Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property pNeon_VoliiHotel_RentCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  pNeon_VoliiHotel_RentCount.Mod(1.0)
EndFunction
