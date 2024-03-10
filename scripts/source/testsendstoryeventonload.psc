ScriptName TestSendStoryEventOnLoad Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryEventKeyword Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  StoryEventKeyword.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, Self.GetLinkedRef(None), 0, 0)
EndEvent
