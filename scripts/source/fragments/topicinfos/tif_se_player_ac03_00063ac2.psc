ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063AC2 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Platinum Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemoveItem(Platinum as Form, 5, False, None)
EndFunction
