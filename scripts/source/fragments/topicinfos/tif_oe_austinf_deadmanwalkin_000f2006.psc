ScriptName Fragments:TopicInfos:TIF_OE_AustinF_DeadManWalkin_000F2006 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ENV_AFFL_Infection_LungInfection_2 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  ENV_AFFL_Infection_LungInfection_2.Cast(akSpeaker as ObjectReference, Game.getplayer() as ObjectReference)
EndFunction
