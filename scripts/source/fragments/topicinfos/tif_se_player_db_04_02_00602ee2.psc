ScriptName Fragments:TopicInfos:TIF_SE_Player_DB_04_02_00602EE2 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
Form Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().removeitem(Credits, NPCDemandMoney_Medium.GetValueInt(), False, None)
EndFunction
