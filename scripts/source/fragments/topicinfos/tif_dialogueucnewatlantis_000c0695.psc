ScriptName Fragments:TopicInfos:TIF_DialogueUCNewAtlantis_000C0695 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property EvieFriendly Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  EvieFriendly.Mod(1.0)
EndFunction
