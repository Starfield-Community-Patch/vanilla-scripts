ScriptName HerdControlScript Extends ObjectReference
{ Handles an array of actors to act like a herd and flee to the same spot }

;-- Variables ---------------------------------------
Bool busy = False
ObjectReference currentFallback
ObjectReference currentFleeToMarker
Float fAggression = 2.0
Float fConfidence = 4.0
ObjectReference[] fleeToMarkers
ObjectReference fleeToMasterMarker
ObjectReference[] herdRefs
Bool needNewFallback = False
ObjectReference tempFleeToMarker
Float timer = 20.0
Int timerID = 0

;-- Properties --------------------------------------
Group Required_Properties
  Keyword Property HerdKeyword Auto mandatory
  { default: DMP_TypeHerd - will find all references with this keyword }
  Static Property HerdMarker Auto mandatory
  { default: xMarkerHerd - used to fill array of markers the fleeToMasterMarker can be moved to }
EndGroup

Group Optional_Properties
  Bool Property HaveFallback = False Auto
  { default:FALSE - set to true if you want an actor to stay behind and fight when rest flee }
  Float Property FindRadius = 100.0 Auto
  { default:100m - used as radius for finding all references to fill herdRefs array and fleeToMarkers array }
EndGroup

Group Autofill_Properties
  Keyword Property DMP_FleeTo Auto
  { Keyword to link to the marker the group flees to }
  ActorValue Property DMP_Herd Auto
  { used in actor's combat interrupt package }
  ActorValue Property Aggression Auto
  ActorValue Property Suspicious Auto
  ActorValue Property Confidence Auto
EndGroup


;-- Functions ---------------------------------------

Event OnReset()
  ; Empty function
EndEvent

Event OnLoad()
  herdRefs = Self.FindAllReferencesWithKeyword(HerdKeyword as Form, FindRadius)
  fleeToMarkers = Self.FindAllReferencesofType(HerdMarker as Form, FindRadius)
  If fleeToMarkers.Length > 0
    currentFleeToMarker = herdRefs[0]
  EndIf
  If herdRefs.Length > 0
    fleeToMasterMarker = Self.GetLinkedRef(DMP_FleeTo)
    Int I = 0
    While I < herdRefs.Length
      If (herdRefs[I] as Actor).isDead() == False
        If HaveFallback == True && currentFallback == None
          currentFallback = herdRefs[I]
        EndIf
        Self.RegisterForRemoteEvent((herdRefs[I] as Actor) as ScriptObject, "OnCombatStateChanged")
        I += 1
      EndIf
    EndWhile
  EndIf
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState != 0 && busy == False
    busy = True
    Int I = 0
    While I < herdRefs.Length
      Self.UnregisterForRemoteEvent((herdRefs[I] as Actor) as ScriptObject, "OnCombatStateChanged")
      I += 1
    EndWhile
    I = 0
    tempFleeToMarker = None
    While I < fleeToMarkers.Length
      If fleeToMarkers[I] != currentFleeToMarker
        If tempFleeToMarker == None
          tempFleeToMarker = fleeToMarkers[I]
        ElseIf fleeToMarkers[I].getDistance(akTarget) > tempFleeToMarker.getDistance(akTarget)
          tempFleeToMarker = fleeToMarkers[I]
        EndIf
      EndIf
      I += 1
    EndWhile
    currentFleeToMarker = tempFleeToMarker
    fleeToMasterMarker.moveto(currentFleeToMarker, 0.0, 0.0, 0.0, True, False)
    If HaveFallback == True
      If (currentFallback as Actor).isDead() == True
        needNewFallback = True
      Else
        (currentFallback as Actor).SetValue(Aggression, fAggression)
        (currentFallback as Actor).SetValue(Confidence, fConfidence)
        (currentFallback as Actor).startCombat((akTarget as Actor) as ObjectReference, False)
      EndIf
    EndIf
    I = 0
    While I < herdRefs.Length
      If (herdRefs[I] as Actor).isDead() == False
        (herdRefs[I] as Actor).SetValue(Suspicious, 2.0)
        If needNewFallback == True
          needNewFallback = False
          currentFallback = herdRefs[I]
          (currentFallback as Actor).SetValue(Aggression, fAggression)
          (currentFallback as Actor).SetValue(Confidence, fConfidence)
          (currentFallback as Actor).startCombat((akTarget as Actor) as ObjectReference, False)
        EndIf
        If (herdRefs[I] as Actor).getValue(DMP_Herd) == 0.0 || (herdRefs[I] as Actor).getValue(DMP_Herd) == 2.0
          (herdRefs[I] as Actor).SetValue(DMP_Herd, 1.0)
        Else
          (herdRefs[I] as Actor).SetValue(DMP_Herd, 2.0)
        EndIf
        (herdRefs[I] as Actor).EvaluatePackage(False)
      EndIf
      I += 1
    EndWhile
    Self.StartTimer(timer, timerID)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == timerID
    busy = False
  EndIf
  Int I = 0
  While I < herdRefs.Length
    Self.RegisterForRemoteEvent((herdRefs[I] as Actor) as ScriptObject, "OnCombatStateChanged")
    I += 1
  EndWhile
EndEvent
