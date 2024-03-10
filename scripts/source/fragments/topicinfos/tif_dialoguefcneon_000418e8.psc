ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_000418E8 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Sleepcrate_Quest Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Sleepcrate_Quest.SetStage(10)
EndFunction
