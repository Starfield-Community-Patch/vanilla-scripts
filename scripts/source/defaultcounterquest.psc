ScriptName DefaultCounterQuest Extends DefaultQuest default hidden
{ A simple counter. Place on an Quest, then increment with another script (such as DefaultCounterQuestIncOnDeath, or DefaultCounterQuestIncOnceOnActivate). When the target value is reached (or, optionally, exceeded), the counter sets a Quest Stage.

NOT YET REIMPLEMENTED.
Sorry for the inconvenience.
`TTP-27118: Default Script: reimplement DefaultCounterQuest`
Please alert Jon Paul Duvall and we'll try to make this a priority.
Thanks! :) }

;-- Variables ---------------------------------------
Int count

;-- Properties --------------------------------------
Group Optional_Properties
  Int Property TargetValue = 0 Auto
  { The needed value to trigger this script's functionality. }
EndGroup


;-- Functions ---------------------------------------

Function Increment()
  ; Empty function
EndFunction

Function Decrement()
  count -= 1
EndFunction

;-- State -------------------------------------------
Auto State AllowCounting

  Function Decrement()
    count -= 1
  EndFunction

  Function Increment()
    count += 1
    If count >= TargetValue
      Self.GoToState("StopCounting")
      defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, Self as Quest, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None)
    EndIf
  EndFunction
EndState

;-- State -------------------------------------------
State StopCounting
EndState
