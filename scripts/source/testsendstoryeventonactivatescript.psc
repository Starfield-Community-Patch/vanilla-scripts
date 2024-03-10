ScriptName TestSendStoryEventOnActivateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryEventKeyword Auto Const mandatory
GlobalVariable Property GlobalToSet Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    GlobalToSet.SetValue(1.0)
    StoryEventKeyword.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, 0, 0)
    GlobalToSet.SetValue(0.0)
  EndIf
EndEvent
