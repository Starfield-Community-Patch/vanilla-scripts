ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_00143B78 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFNewHomesteadR05QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFNewHomesteadR05QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
