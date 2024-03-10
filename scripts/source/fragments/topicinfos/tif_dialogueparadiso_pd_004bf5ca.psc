ScriptName Fragments:TopicInfos:TIF_DialogueParadiso_PD_004BF5CA Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_EnhanceSpecialVouchers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  PD_EnhanceSpecialVouchers.SetValue(1.0)
EndFunction
