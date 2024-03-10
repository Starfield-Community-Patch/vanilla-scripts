ScriptName Fragments:TopicInfos:TIF_DialogueFCAkilaCity_001AF74F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property City_AC_LowHouseDonation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemoveItem(Credits as Form, City_AC_LowHouseDonation.GetValue() as Int, False, None)
EndFunction
