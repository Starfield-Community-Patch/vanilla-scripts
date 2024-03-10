ScriptName DefaultCounterIncrementOnActivate Extends ObjectReference default
{ Once this is activated (by the PLAYER) it increments the counter on it's LinkedRef's DefaultCounter script. }

;-- Variables ---------------------------------------
Bool decrementNext = False

;-- Properties --------------------------------------
Group Optional_Properties
  Keyword Property LinkedRefKeyword Auto Const
  { The keyword of the LinkedRef to the Counter. Defaults to the unnamed linkedref. }
  Bool Property ShouldToggle Auto Const
  { Optional; defaults to False. Should every other action decrement the counter instead of incrementing it? }
EndGroup


;-- State -------------------------------------------
State DoneWaiting
EndState

;-- State -------------------------------------------
Auto State WaitForActivate

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      If !ShouldToggle
        Self.GoToState("DoneWaiting")
      EndIf
      If ShouldToggle && decrementNext
        (Self.GetLinkedRef(LinkedRefKeyword) as defaultcounter).Decrement()
      Else
        (Self.GetLinkedRef(LinkedRefKeyword) as defaultcounter).Increment()
      EndIf
      If ShouldToggle
        decrementNext = !decrementNext
      EndIf
    EndIf
  EndEvent
EndState
