ScriptName Fragments:TopicInfos:TIF_DialogueECSConstant_0052C768 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFConstantR02MiscQuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFConstantR02MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
