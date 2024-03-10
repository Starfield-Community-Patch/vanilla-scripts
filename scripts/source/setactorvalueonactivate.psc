ScriptName SetActorValueOnActivate Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ActorValueToSet Auto Const mandatory
Keyword Property TargetLinkKeyword Auto Const mandatory

;-- State -------------------------------------------
Auto State Holding

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving")
    ObjectReference[] linkedrefs = Self.GetLinkedRefChain(TargetLinkKeyword, 100)
    Int index = 0
    While index < linkedrefs.Length
      ObjectReference target = linkedrefs[index]
      target.SetValue(ActorValueToSet, 1.0)
      (target as Actor).EvaluatePackage(False)
      index += 1
    EndWhile
  EndEvent
EndState

;-- State -------------------------------------------
State Moving

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Holding")
    ObjectReference[] linkedrefs = Self.GetLinkedRefChain(TargetLinkKeyword, 100)
    Int index = 0
    While index < linkedrefs.Length
      ObjectReference target = linkedrefs[index]
      target.SetValue(ActorValueToSet, 0.0)
      (target as Actor).EvaluatePackage(False)
      index += 1
    EndWhile
  EndEvent
EndState
