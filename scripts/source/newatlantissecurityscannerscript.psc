ScriptName NewAtlantisSecurityScannerScript Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property SoundEventToPlay Auto Const
Quest Property PreReqQuest Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If PreReqQuest.IsRunning()
      SoundEventToPlay.PlayandWait(Self as ObjectReference, None, None)
      Self.Disable(False)
    EndIf
  EndIf
EndEvent
