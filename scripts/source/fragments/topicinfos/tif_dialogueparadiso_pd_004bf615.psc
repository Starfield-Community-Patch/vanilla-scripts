ScriptName Fragments:TopicInfos:TIF_DialogueParadiso_PD_004BF615 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_PlayerHasHotelRoomDiscount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  PD_PlayerHasHotelRoomDiscount.SetValue(1.0)
EndFunction
