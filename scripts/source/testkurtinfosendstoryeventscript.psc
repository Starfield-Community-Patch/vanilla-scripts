ScriptName TestKurtInfoSendStoryEventScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryEventKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  StoryEventKeyword.SendStoryEvent(None, akSpeakerRef, None, 0, 0)
EndEvent
