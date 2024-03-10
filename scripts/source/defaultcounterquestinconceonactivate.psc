ScriptName DefaultCounterQuestIncOnceOnActivate Extends ReferenceAlias default hidden
{ Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuest script }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquest).Increment()
EndFunction

;-- State -------------------------------------------
State DoneWaiting
EndState

;-- State -------------------------------------------
Auto State WaitForActivate

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.GoToState("DoneWaiting")
      Self.Increment()
    EndIf
  EndEvent
EndState
