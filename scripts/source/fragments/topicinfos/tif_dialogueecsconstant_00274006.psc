ScriptName Fragments:TopicInfos:TIF_DialogueECSConstant_00274006 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFConstantR02MiscQuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFConstantR02MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
