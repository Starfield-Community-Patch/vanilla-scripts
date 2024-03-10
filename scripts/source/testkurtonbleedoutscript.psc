ScriptName TestKurtOnBleedoutScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryEventKeyword Auto Const

;-- Functions ---------------------------------------

Event OnRecoverFromBleedout()
  ; Empty function
EndEvent

Event OnEnterBleedout()
  If StoryEventKeyword
    StoryEventKeyword.SendStoryEvent(None, Self as ObjectReference, None, 0, 0)
  EndIf
EndEvent
