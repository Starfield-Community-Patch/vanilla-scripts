ScriptName Fragments:TopicInfos:TIF_SE_AF03_00133CEB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
GlobalVariable Property SE_AF03_CreditsRansomSmall Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.getplayer().removeitem(Credits as Form, SE_AF03_CreditsRansomSmall.getvalueint(), False, None)
EndFunction
