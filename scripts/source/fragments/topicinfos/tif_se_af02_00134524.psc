ScriptName Fragments:TopicInfos:TIF_SE_AF02_00134524 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
GlobalVariable Property SE_AF02_CreditCount Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.getplayer().removeitem(Credits as Form, SE_AF02_CreditCount.getvalue() as Int, False, None)
EndFunction
