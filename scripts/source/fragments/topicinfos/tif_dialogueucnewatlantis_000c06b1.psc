ScriptName Fragments:TopicInfos:TIF_DialogueUCNewAtlantis_000C06B1 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property EvieAngry Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  EvieAngry.Mod(1.0)
EndFunction
