ScriptName Fragments:TopicInfos:TIF_DialogueCydonia_000DBCEA Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFCydoniaR03MiscQuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  FFCydoniaR03MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
