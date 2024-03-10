ScriptName ENV_Hazard_InteractionActivator Extends ObjectReference Const

;-- Functions ---------------------------------------

Function PlaceObject(Form FormToSpawn, ObjectReference RefToSpawnNear)
  If RefToSpawnNear == None
    RefToSpawnNear = Game.GetPlayer() as ObjectReference
  EndIf
  ObjectReference[] childrenRefs = Self.GetRefsLinkedToMe(None, None)
  ObjectReference closestRef = Self.GetClosestFromRefArray(RefToSpawnNear, childrenRefs)
  closestRef.PlaceAtMe(FormToSpawn, 1, False, False, True, None, None, False)
  Self.Disable(False)
EndFunction

ObjectReference Function GetClosestFromRefArray(ObjectReference SubjectRef, ObjectReference[] TargetsArray)
  ObjectReference closestRef = None
  Float closestDistance = 0.0
  Int I = 0
  While I < TargetsArray.Length
    ObjectReference currentTargetRef = TargetsArray[I]
    If closestRef == None
      closestRef = currentTargetRef
      closestDistance = closestRef.GetDistance(SubjectRef)
    ElseIf currentTargetRef.GetDistance(SubjectRef) < closestDistance
      closestRef = currentTargetRef
      closestDistance = closestRef.GetDistance(SubjectRef)
    EndIf
    I += 1
  EndWhile
  Return closestRef
EndFunction
