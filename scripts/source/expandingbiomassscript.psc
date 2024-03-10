ScriptName ExpandingBiomassScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] actorsInAwarenessVolumes
ObjectReference[] awarenessVolumes
Int detectedActorCount = 0
Bool hasAwarenessVolumes = False
Int hitCount = 0
Float maxScale
Float minScale
Float restingScale
Float scaleReductionPerHit = 0.100000001
Bool shouldDamageContract = False
Bool shouldExpandToMax = False
Bool shouldReturnToRest = False
Float waitAfterDamageSeconds = 0.25
Float waitSeconds = 0.01

;-- Properties --------------------------------------
Float Property initialScaleMultiplier = 1.0 Auto Const
Float Property minScaleMultiplier = 0.5 Auto Const
Float Property maxScaleMultiplier = 2.0 Auto Const
Float Property expandingSpeed = 0.01 Auto Const
Float Property contractingSpeed = 0.01 Auto Const
Float Property damageContractingSpeed = 0.050000001 Auto Const
Float Property detectionDistance = 15.0 Auto Const
Keyword Property RL039_AwarenessVolume Auto Const
Keyword Property RL039_BlobTarget Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Self.RegisterForCustomEvent(Self as ScriptObject, "expandingbiomassscript_ContractBlobEvent")
  restingScale = Self.GetScale()
  minScale = restingScale * minScaleMultiplier
  maxScale = restingScale * maxScaleMultiplier
  Self.SetScale(restingScale * initialScaleMultiplier)
  awarenessVolumes = Self.GetRefsLinkedToMe(RL039_AwarenessVolume, None)
  If awarenessVolumes.Length > 0
    hasAwarenessVolumes = True
    actorsInAwarenessVolumes = new ObjectReference[0]
    Int I = 0
    While I < awarenessVolumes.Length
      ObjectReference awarenessVolume = awarenessVolumes[I]
      Self.RegisterForRemoteEvent(awarenessVolume as ScriptObject, "OnTriggerEnter")
      Self.RegisterForRemoteEvent(awarenessVolume as ScriptObject, "OnTriggerLeave")
      I += 1
    EndWhile
  Else
    Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self as ScriptObject, detectionDistance, 0)
  EndIf
  ObjectReference[] initialBlobTargets = Self.GetRefsLinkedToMe(RL039_BlobTarget, None)
  If initialBlobTargets.Length > 0
    Int i = 0
    While i < initialBlobTargets.Length
      ObjectReference initialBlobTarget = initialBlobTargets[i]
      Float distance = Self.GetDistance(initialBlobTarget)
      If distance < detectionDistance
        Self.RegisterForDistanceGreaterThanEvent(initialBlobTarget as ScriptObject, Self as ScriptObject, detectionDistance, 0)
        detectedActorCount += 1
      Else
        Self.RegisterForDistanceLessThanEvent(initialBlobTarget as ScriptObject, Self as ScriptObject, detectionDistance, 0)
      EndIf
      i += 1
    EndWhile
    If detectedActorCount > 0
      shouldReturnToRest = False
      Self.ExpandBlob()
    EndIf
  EndIf
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  If akActionRef is Actor
    Int index = actorsInAwarenessVolumes.find(akActionRef, 0)
    If index < 0
      actorsInAwarenessVolumes.add(akActionRef, 1)
      Float distance = Self.GetDistance(akActionRef)
      If distance < detectionDistance
        Self.DetectActor(akActionRef)
      EndIf
    EndIf
  EndIf
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
  If akActionRef is Actor
    Int index = actorsInAwarenessVolumes.find(akActionRef, 0)
    If index >= 0
      actorsInAwarenessVolumes.remove(index, 1)
      Self.UndetectActor(akActionRef, False)
    EndIf
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.DetectActor(akObj1)
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.UndetectActor(akObj1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Self.TakeHits(1)
EndEvent

Function TakeHits(Int count)
  hitCount += count
  If !shouldDamageContract
    Self.SendCustomEvent("expandingbiomassscript_ContractBlobEvent", None)
  EndIf
EndFunction

Event ExpandingBiomassScript.ContractBlobEvent(ExpandingBiomassScript akSender, Var[] akArgs)
  Self.ContractBlobOnDamage()
EndEvent

Function DetectActor(ObjectReference akActor)
  Self.RegisterForDistanceGreaterThanEvent(akActor as ScriptObject, Self as ScriptObject, detectionDistance, 0)
  detectedActorCount += 1
  If detectedActorCount == 1
    shouldReturnToRest = False
    Self.ExpandBlob()
  EndIf
EndFunction

Function UndetectActor(ObjectReference akActor, Bool registerForDistanceEvents)
  If registerForDistanceEvents
    Self.RegisterForDistanceLessThanEvent(akActor as ScriptObject, Self as ScriptObject, detectionDistance, 0)
  Else
    Self.UnregisterForDistanceEvents(akActor as ScriptObject, Self as ScriptObject, -1)
  EndIf
  detectedActorCount -= 1
  If detectedActorCount < 0
    detectedActorCount == 0
  EndIf
  If detectedActorCount == 0
    shouldExpandToMax = False
    Self.ReturnToRest()
  EndIf
EndFunction

Bool Function IsReferenceInAwarenessVolumes(ObjectReference reference)
  Int I = 0
  While I < awarenessVolumes.Length
    ObjectReference awarenessVolume = awarenessVolumes[I]
    If awarenessVolume.IsInTrigger(reference)
      Return True
    EndIf
    I += 1
  EndWhile
  Return False
EndFunction

Function ExpandBlob()
  shouldExpandToMax = True
  While shouldExpandToMax && !shouldDamageContract
    Float currentScale = Self.GetScale()
    Float nextScale = currentScale + expandingSpeed
    Bool expansionComplete = False
    If nextScale > maxScale
      nextScale = maxScale
      expansionComplete = True
    EndIf
    Self.SetScale(nextScale)
    If expansionComplete
      shouldExpandToMax = False
    Else
      Utility.Wait(waitSeconds)
    EndIf
  EndWhile
EndFunction

Function ReturnToRest()
  shouldReturnToRest = True
  Float currentScale = Self.GetScale()
  Float speed = expandingSpeed
  Int direction = 1
  If currentScale > restingScale
    speed = -contractingSpeed
    direction = -1
  EndIf
  While shouldReturnToRest && !shouldDamageContract
    currentScale = Self.GetScale()
    Float nextScale = currentScale + speed
    Bool returnComplete = False
    If direction == 1
      If nextScale > restingScale
        nextScale = restingScale
        returnComplete = True
      EndIf
    ElseIf direction == -1
      If nextScale < restingScale
        nextScale = restingScale
        returnComplete = True
      EndIf
    EndIf
    Self.SetScale(nextScale)
    If returnComplete
      shouldReturnToRest = False
    Else
      Utility.Wait(waitSeconds)
    EndIf
  EndWhile
EndFunction

Function ContractBlobOnDamage()
  shouldDamageContract = True
  Bool minScaleReached = False
  While hitCount > 0 && !minScaleReached
    Float currentScale = Self.GetScale()
    Float targetScale = Math.Clamp(currentScale - scaleReductionPerHit, minScale, currentScale)
    Bool hitContractionComplete = False
    While !hitContractionComplete
      currentScale = Self.GetScale()
      Float nextScale = Math.Clamp(currentScale - damageContractingSpeed, minScale, currentScale)
      If nextScale == minScale
        hitContractionComplete = True
        minScaleReached = True
      ElseIf nextScale == targetScale
        hitContractionComplete = True
      EndIf
      Self.SetScale(nextScale)
      If hitContractionComplete
        hitCount -= 1
      Else
        Utility.Wait(waitSeconds)
      EndIf
    EndWhile
  EndWhile
  Utility.Wait(waitAfterDamageSeconds)
  shouldDamageContract = False
  If detectedActorCount > 0
    Self.ExpandBlob()
  ElseIf Self.GetScale() != restingScale
    Self.ReturnToRest()
  EndIf
EndFunction
