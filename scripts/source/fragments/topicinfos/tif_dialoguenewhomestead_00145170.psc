ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_00145170 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFNewHomesteadR04QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFNewHomesteadR04QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
