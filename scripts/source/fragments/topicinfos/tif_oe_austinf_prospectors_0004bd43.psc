ScriptName Fragments:TopicInfos:TIF_OE_AustinF_Prospectors_0004BD43 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  akSpeaker.AddToFaction(PlayerEnemyFaction)
EndFunction
