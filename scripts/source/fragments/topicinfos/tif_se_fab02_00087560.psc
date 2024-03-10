ScriptName Fragments:TopicInfos:TIF_SE_FAB02_00087560 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property Aid_MedPack Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None)
EndFunction
