ScriptName TestTutorialScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestTutorialMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  TestTutorialMessage.ShowAsHelpMessage("Jump", 30.0, 30.0, 1, "", 0, None)
EndEvent
