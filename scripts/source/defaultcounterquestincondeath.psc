ScriptName DefaultCounterQuestIncOnDeath Extends ReferenceAlias default hidden
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property CheckForOnDyingInstead = False Auto Const
  { If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later. }
  Bool Property SupportRespawning = False Auto Const
  { If true then this script will reset after incrementing in order to allow the next respawned actor that fills it to increment upon death as well. }
EndGroup


;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquest).Increment()
EndFunction

;-- State -------------------------------------------
State AlreadyDied
EndState

;-- State -------------------------------------------
Auto State WaitingForDeath

  Event OnDying(ObjectReference akKiller)
    If CheckForOnDyingInstead
      If !SupportRespawning
        Self.GoToState("AlreadyDied")
      EndIf
      Self.Increment()
    EndIf
  EndEvent

  Event OnDeath(ObjectReference akKiller)
    If !CheckForOnDyingInstead
      If !SupportRespawning
        Self.GoToState("AlreadyDied")
      EndIf
      Self.Increment()
    EndIf
  EndEvent
EndState
