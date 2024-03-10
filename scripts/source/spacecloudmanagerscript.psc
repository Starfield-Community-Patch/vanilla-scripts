ScriptName SpaceCloudManagerScript Extends ObjectReference
{ Parent script for Space Cloud Manager Objects.
When placed in a cell with space cloud hazards, a manager handles adding or removing effects from ships under the influence of the cloud.
This allows us to do things like add or remove perks, or periodically cast scripted spells, which the hazard system doesn't normally support. }

;-- Variables ---------------------------------------
Int CONST_FarTravelStateDeparture = 0 Const
Int CONST_GravJumpStateAnimStarted = 1 Const
Float CONST_HazardValueMax = 100000.0 Const
Float CONST_SpaceCloudHazardTimerDelay = 0.25 Const
Int CONST_SpaceCloudHazardTimerID = 1 Const
Bool spaceTransitionInProgress

;-- Properties --------------------------------------
Group RequiredProperties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { SQ_PlayerShip's PlayerShip alias. }
  ActorValue Property UpdateTimestampValue Auto Const
  { Actor value used to timestamp when each ship was last updated by this script. }
EndGroup

Group GeneralProperties
  RefCollectionAlias Property PotentialTargets Auto Const
  { Optional. RefCollection of ships that may be affected in addition to the player's ship.
	NPC ships not in this collection will not be affected.
	Space clouds are not generic-- you have to know in advance which ships might end up in the cell. }
  ActorValue Property HazardValue Auto Const
  { Optional.
	If set, apply our effects only to to ships where this value is <0.
	If not set, apply our effects to all target ships. }
  Bool Property ShouldOverrideConditionsForNPCShips = False Auto Const
  { Default=False. Should we apply our effects to all NPC ships in the PotentialTargets array, ignoring the Docked and Dead states? }
EndGroup


;-- Functions ---------------------------------------

Function ApplyCloudEffect(spaceshipreference target, Float currentTime)
  ; Empty function
EndFunction

Function RemoveCloudEffect(spaceshipreference target)
  ; Empty function
EndFunction

Event OnLoad()
  Self.StartTimer(0.0, CONST_SpaceCloudHazardTimerID)
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipFarTravel")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump")
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSource, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  If aState == CONST_FarTravelStateDeparture
    spaceTransitionInProgress = True
  Else
    spaceTransitionInProgress = False
  EndIf
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSource, Location aDestination, Int aState)
  If aState == CONST_GravJumpStateAnimStarted
    spaceTransitionInProgress = True
  Else
    spaceTransitionInProgress = False
  EndIf
EndEvent

Event OnTimer(Int timerID)
  If timerID == CONST_SpaceCloudHazardTimerID
    spaceshipreference[] potentialTargetRefs = None
    If PotentialTargets != None
      potentialTargetRefs = PotentialTargets.GetArray() as spaceshipreference[]
    EndIf
    If potentialTargetRefs == None
      potentialTargetRefs = new spaceshipreference[0]
    EndIf
    potentialTargetRefs.insert(PlayerShip.GetShipRef(), 0)
    If Self.Is3DLoaded()
      Float currentTime = Utility.GetCurrentRealTime()
      Int I = 0
      While I < potentialTargetRefs.Length
        If potentialTargetRefs[I] != None
          Self.TryToApplyCloudEffect(potentialTargetRefs[I], currentTime)
        EndIf
        I += 1
      EndWhile
      Self.StartTimer(CONST_SpaceCloudHazardTimerDelay, CONST_SpaceCloudHazardTimerID)
    Else
      Int i = 0
      While i < potentialTargetRefs.Length
        If potentialTargetRefs[i] != None
          Self.TryToClearCloudEffect(potentialTargetRefs[i])
        EndIf
        i += 1
      EndWhile
    EndIf
  EndIf
EndEvent

Function TryToApplyCloudEffect(spaceshipreference target, Float currentTime)
  If !spaceTransitionInProgress && target.IsEnabled() && (ShouldOverrideConditionsForNPCShips && target != PlayerShip.GetShipRef() || !target.IsDead() && !target.IsDocked())
    If HazardValue != None && target == PlayerShip.GetShipRef()
      
    EndIf
    If HazardValue == None || target.GetValue(HazardValue) < 0.0
      Self.ApplyCloudEffect(target, currentTime)
      If HazardValue != None
        target.RestoreValue(HazardValue, CONST_HazardValueMax)
      EndIf
      target.SetValue(UpdateTimestampValue, currentTime)
    ElseIf target.GetValue(UpdateTimestampValue) > 0.0
      Self.RemoveCloudEffect(target)
      target.SetValue(UpdateTimestampValue, 0.0)
    EndIf
  EndIf
EndFunction

Function TryToClearCloudEffect(spaceshipreference target)
  Self.RemoveCloudEffect(target)
  If HazardValue != None
    target.RestoreValue(HazardValue, CONST_HazardValueMax)
  EndIf
  target.SetValue(UpdateTimestampValue, 0.0)
EndFunction
