ScriptName BroadcastSpeakerActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkedRefBroadcastSpeaker Auto Const
{ Autofill }
ObjectReference[] Property SpeakerRefs Auto Const

;-- Functions ---------------------------------------

Function ToggleSpeakers(Bool ShouldTurnOn)
  Int I = 0
  While I < SpeakerRefs.Length
    If ShouldTurnOn
      Self.SetLinkedRef(SpeakerRefs[I], LinkedRefBroadcastSpeaker, True)
    Else
      Self.SetLinkedRef(None, LinkedRefBroadcastSpeaker, True)
    EndIf
    I += 1
  EndWhile
EndFunction
