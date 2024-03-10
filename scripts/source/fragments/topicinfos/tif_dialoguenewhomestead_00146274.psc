ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_00146274 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFNewHomesteadR02QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFNewHomesteadR02QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
