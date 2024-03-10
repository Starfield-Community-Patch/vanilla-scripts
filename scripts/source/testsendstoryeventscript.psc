ScriptName TestSendStoryEventScript Extends ObjectReference Const
{ testing if a ref is being initialized or loaded }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property TestKurtPCMKeyword Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  TestKurtPCMKeyword.SendStoryEvent(None, None, None, 0, 0)
EndEvent

Event OnLoad()
  TestKurtPCMKeyword.SendStoryEvent(None, None, None, 0, 0)
EndEvent
