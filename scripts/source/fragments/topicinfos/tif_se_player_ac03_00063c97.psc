ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063C97 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Aluminum Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().AddItem(Aluminum as Form, 10, False)
EndFunction
