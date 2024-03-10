ScriptName LC107HullBreachTriggerScript Extends ObjectReference
{ Script for the Hull Breach Triggers in LC107. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TriggerProperties
  Float Property MinTimeBeforeSubsequentBreach Auto Const
  Float Property MaxTimeBeforeSubsequentBreach Auto Const
EndGroup


;-- Functions ---------------------------------------

Function TriggerBreaches()
  ; Empty function
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Function TriggerBreaches()
    Self.GoToState("Done")
    lc107hullbreachscript[] linkedBreaches = Self.GetLinkedRefChain(None, 100) as lc107hullbreachscript[]
    Var[] akArgs = new Var[1]
    akArgs[0] = False as Var
    Float delayBeforeNextBreach = 0.0
    Int I = 0
    While I < linkedBreaches.Length
      If delayBeforeNextBreach > 0.0
        Utility.Wait(delayBeforeNextBreach)
      EndIf
      If linkedBreaches[I] != None
        linkedBreaches[I].CallFunctionNoWait("TriggerBreach", akArgs)
        If MinTimeBeforeSubsequentBreach > 0.0
          delayBeforeNextBreach = Utility.RandomFloat(MinTimeBeforeSubsequentBreach, MaxTimeBeforeSubsequentBreach)
        EndIf
      EndIf
      I += 1
    EndWhile
  EndFunction

  Event OnTriggerEnter(ObjectReference akTriggerRef)
    Self.TriggerBreaches()
  EndEvent
EndState
