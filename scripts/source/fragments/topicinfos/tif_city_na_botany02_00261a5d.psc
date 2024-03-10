ScriptName Fragments:TopicInfos:TIF_City_NA_Botany02_00261A5D Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.getplayer().additem(Credits as Form, 1000, False)
EndFunction
