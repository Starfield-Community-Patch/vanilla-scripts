ScriptName Fragments:TopicInfos:TIF_SE_AF02_00134526 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_AF02_CreditCount Auto Const
GlobalVariable Property SE_AF02_CreditsLarge Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  SE_AF02_CreditCount.setvalue(SE_AF02_CreditsLarge.getvalue())
EndFunction
