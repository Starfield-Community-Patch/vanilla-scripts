ScriptName Fragments:TopicInfos:TIF_MQ103_002786AE Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().removeitem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None)
EndFunction
