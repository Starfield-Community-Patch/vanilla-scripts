ScriptName Fragments:TopicInfos:TIF_FFNeonZ08_0005E843 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFNeonZ08_FrankiePayment Auto Const
MiscObject Property Credits Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemoveItem(Credits as Form, FFNeonZ08_FrankiePayment.GetValue() as Int, False, None)
EndFunction
