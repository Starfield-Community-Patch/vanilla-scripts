ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_002DFF43 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFRedMileR01QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFRedMileR01QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
