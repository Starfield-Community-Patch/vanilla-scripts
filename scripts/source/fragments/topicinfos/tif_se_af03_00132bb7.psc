ScriptName Fragments:TopicInfos:TIF_SE_AF03_00132BB7 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
GlobalVariable Property SE_AF03_CreditsRansomLarge Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.getplayer().removeitem(Credits as Form, SE_AF03_CreditsRansomLarge.getvalueint(), False, None)
EndFunction
