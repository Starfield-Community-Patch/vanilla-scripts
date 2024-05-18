ScriptName ScriptObject Native hidden

;-- Functions ---------------------------------------

Function AddInventoryEventFilter(Form akFilter) Native

Var Function CallFunction(String asFuncName, Var[] aParams) Native

Function CallFunctionNoWait(String asFuncName, Var[] aParams) Native

Function CancelTimer(Int aiTimerID) Native

Function CancelTimerGameTime(Int aiTimerID) Native

ScriptObject Function CastAs(String asScriptName) Native

Var Function GetPropertyValue(String asPropertyName) Native

Bool Function IsBoundGameObjectAvailable() Native

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  ; Empty function
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
  ; Empty function
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  ; Empty function
EndEvent

Event OnAffinityEventSent(affinityevent akAffinityEvent, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  ; Empty function
EndEvent

Event OnAnimationEventUnregistered(ObjectReference akSource, String asEventName)
  ; Empty function
EndEvent

Event OnBeginState(String asOldState)
  ; Empty function
EndEvent

Event OnChallengeCompleted(ObjectReference akOwner, challenge akChallenge)
  ; Empty function
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  ; Empty function
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  ; Empty function
EndEvent

Event OnEndState(String asNewState)
  ; Empty function
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
  ; Empty function
EndEvent

Function OnGameplayOptionChanged(gameplayoption[] aChangedOptions)
  ; Empty function
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  ; Empty function
EndEvent

Event OnInit()
  ; Empty function
EndEvent

Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
  ; Empty function
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  ; Empty function
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  ; Empty function
EndEvent

Event OnPlanetSiteSelectEvent(Location aSite)
  ; Empty function
EndEvent

Function OnPlayerFastTravel()
  ; Empty function
EndFunction

Event OnPlayerSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime, ObjectReference akBed)
  ; Empty function
EndEvent

Event OnPlayerSleepStop(Bool abInterrupted, ObjectReference akBed)
  ; Empty function
EndEvent

Event OnPlayerTeleport()
  ; Empty function
EndEvent

Event OnPlayerWaitStart(Float afWaitStartTime, Float afDesiredWaitEndTime)
  ; Empty function
EndEvent

Event OnPlayerWaitStop(Bool abInterrupted)
  ; Empty function
EndEvent

Event OnRadiationDamage(ObjectReference akTarget, Bool abIngested)
  ; Empty function
EndEvent

Event OnStarmapTargetSelectEvent(Location aSite)
  ; Empty function
EndEvent

Event OnTimer(Int aiTimerID)
  ; Empty function
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  ; Empty function
EndEvent

Event OnTrackedStatsEvent(String arStatName, Int aiStatValue)
  ; Empty function
EndEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
  ; Empty function
EndEvent

Function PauseTimer(Int aiTimerID, Bool abPause) Native

Function PauseTimerGameTime(Int aiTimerID, Bool abPause) Native

Function RegisterForActorValueChangedEvent(ObjectReference akObjRef, ActorValue akActorValue) Native

Function RegisterForActorValueGreaterThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function RegisterForActorValueLessThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function RegisterForAffinityEvent(affinityevent akAffinityEvent) Native

Bool Function RegisterForAnimationEvent(ObjectReference akSender, String asEventName) Native

Function RegisterForChallengeEvents() Native

Function RegisterForCustomEvent(ScriptObject akSender, String asEventName) Native

Function RegisterForDetectionLOSGain(Actor akViewer, ObjectReference akTarget) Native

Function RegisterForDetectionLOSLost(Actor akViewer, ObjectReference akTarget) Native

Function RegisterForDirectLOSGain(ObjectReference akViewer, ObjectReference akTarget, String asViewerNode, String asTargetNode) Native

Function RegisterForDirectLOSLost(ObjectReference akViewer, ObjectReference akTarget, String asViewerNode, String asTargetNode) Native

Function RegisterForDistanceGreaterThanEvent(ScriptObject akObj1, ScriptObject akObj2, Float afDistance, Int aiEventID) Native

Function RegisterForDistanceLessThanEvent(ScriptObject akObj1, ScriptObject akObj2, Float afDistance, Int aiEventID) Native

Function RegisterForGameplayOptionChangedEvent() Native

Function RegisterForHitEvent(ScriptObject akTarget, ScriptObject akAggressorFilter, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch) Native

Function RegisterForMagicEffectApplyEvent(ScriptObject akTarget, ScriptObject akCasterFilter, Form akEffectFilter, Bool abMatch) Native

Function RegisterForMenuOpenCloseEvent(String asMenuName) Native

Function RegisterForPlanetSiteSelectEvent() Native

Function RegisterForPlayerSleep() Native

Function RegisterForPlayerTeleport() Native

Function RegisterForPlayerWait() Native

Function RegisterForRadiationDamageEvent(ScriptObject akTarget) Native

Bool Function RegisterForRemoteEvent(ScriptObject akEventSource, String asEventName) Native

Function RegisterForStarmapTargetSelectEvent() Native

Function RegisterForTrackedStatsEvent(String asStat, Int aiThreshold) Native

Function RegisterForTutorialEvent(String asEventName) Native

Function RemoveAllInventoryEventFilters() Native

Function RemoveInventoryEventFilter(Form akFilter) Native

Function SendCustomEvent(String asEvent, Var[] akArgs) Native

Function SetPropertyValue(String asPropertyName, Var aValue) Native

Function SetPropertyValueNoWait(String asPropertyName, Var aValue) Native

Function StartTimer(Float afInterval, Int aiTimerID) Native

Function StartTimerGameTime(Float afInterval, Int aiTimerID) Native

Function UnregisterForActorValueChangedEvent(ObjectReference akObjRef, ActorValue akActorValue) Native

Function UnregisterForActorValueGreaterThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function UnregisterForActorValueLessThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function UnregisterForAffinityEvent(affinityevent akAffinityEvent) Native

Function UnregisterForAllActorValueEvents() Native

Function UnregisterForAllAffinityEvents() Native

Function UnregisterForAllCustomEvents() Native

Function UnregisterForAllEvents() Native

Function UnregisterForAllHitEvents(ScriptObject akTarget) Native

Function UnregisterForAllMagicEffectApplyEvents(ScriptObject akTarget) Native

Function UnregisterForAllMenuOpenCloseEvents() Native

Function UnregisterForAllRadiationDamageEvents() Native

Function UnregisterForAllRemoteEvents() Native

Function UnregisterForAllTrackedStatsEvents() Native

Function UnregisterForAnimationEvent(ObjectReference akSender, String asEventName) Native

Function UnregisterForChallengeEvents() Native

Function UnregisterForCustomEvent(ScriptObject akSender, String asEventName) Native

Function UnregisterForDistanceEvents(ScriptObject akObj1, ScriptObject akObj2, Int aiEventID) Native

Function UnregisterForGameplayOptionChangedEvent() Native

Function UnregisterForHitEvent(ScriptObject akTarget, ScriptObject akAggressorFilter, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch) Native

Function UnregisterForLOS(ObjectReference akViewer, ObjectReference akTarget) Native

Function UnregisterForMagicEffectApplyEvent(ScriptObject akTarget, ScriptObject akCasterFilter, Form akEffectFilter, Bool abMatch) Native

Function UnregisterForMenuOpenCloseEvent(String asMenuName) Native

Function UnregisterForPlanetSiteSelectEvent() Native

Function UnregisterForPlayerSleep() Native

Function UnregisterForPlayerTeleport() Native

Function UnregisterForPlayerWait() Native

Function UnregisterForRadiationDamageEvent(ScriptObject akTarget) Native

Function UnregisterForRemoteEvent(ScriptObject akEventSource, String asEventName) Native

Function UnregisterForStarmapTargetSelectEvent() Native

Function UnregisterForTrackedStatsEvent(String asStat) Native

Function UnregisterForTrackedStatsEventThreshold(String asStat, Int aiThreshold) Native

Function UnregisterForTutorialEvent(String asEventName) Native

; Fixup hacks for native ScriptObject::GotoState/GetState
String Function GetState()
  Return __state
EndFunction

; Fixup hacks for native ScriptObject::GotoState/GetState
Function GotoState(String asNewState)
  String soldState = __state
  Self.OnEndState(asNewState)
  __state = asNewState
  Self.OnBeginState(soldState)
EndFunction

Function RegisterForHitEventAggressorRefArray(ScriptObject akTarget, ObjectReference[] akAggressorFilterRefArray, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch)
  Int I = 0
  While I < akAggressorFilterRefArray.Length
    Self.RegisterForHitEvent(akTarget, akAggressorFilterRefArray[I] as ScriptObject, akSourceFilter, akProjectileFilter, aiPowerFilter, aiSneakFilter, aiBashFilter, aiBlockFilter, abMatch)
    I += 1
  EndWhile
EndFunction

Function RegisterForHitEventAggressorRefAliasArray(ScriptObject akTarget, ReferenceAlias[] akAggressorFilterRefAliasArray, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch)
  Int I = 0
  While I < akAggressorFilterRefAliasArray.Length
    Self.RegisterForHitEvent(akTarget, akAggressorFilterRefAliasArray[I] as ScriptObject, akSourceFilter, akProjectileFilter, aiPowerFilter, aiSneakFilter, aiBashFilter, aiBlockFilter, abMatch)
    I += 1
  EndWhile
EndFunction

Function RegisterForHitEventAggressorFactionArray(ScriptObject akTarget, Faction[] akAggressorFilterFactionArray, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch)
  Int I = 0
  While I < akAggressorFilterFactionArray.Length
    Self.RegisterForHitEvent(akTarget, akAggressorFilterFactionArray[I] as ScriptObject, akSourceFilter, akProjectileFilter, aiPowerFilter, aiSneakFilter, aiBashFilter, aiBlockFilter, abMatch)
    I += 1
  EndWhile
EndFunction
