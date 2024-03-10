ScriptName DefaultRemoveLinkedActorsFromCaptive Extends ObjectReference hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property RemoveLinkedCaptiveKeyword Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnTriggerEnter(ObjectReference akActionRef)
    Self.GoToState("Done")
    Actor[] CaptiveActors = None
    CaptiveActors = Self.GetActorsLinkedToMe(RemoveLinkedCaptiveKeyword, None)
    Int maxSize = CaptiveActors.Length
    Int count = 0
    While count < maxSize
      Actor CaptiveActor = CaptiveActors[count]
      CaptiveActor.RemoveFromFaction(CaptiveFaction)
      CaptiveActor.EvaluatePackage(False)
      count += 1
    EndWhile
  EndEvent
EndState
