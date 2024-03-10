ScriptName SQ_StationTrafficManagerQuestScript Extends Quest
{ Station Traffic Manager quest script. }

;-- Variables ---------------------------------------
Int CONST_DockingEntryExitDistance = 100 Const
Int CONST_GravJumpExitDistance = 100 Const
Int CONST_InitializationFailsafe = 20 Const
Int CONST_MaxEntryExitZOffset = 1000 Const
Int CONST_MidEntryExitZOffset = 750 Const
Int CONST_MinEntryExitZOffset = 500 Const
Int CONST_NearDistance_Close = 0 Const
Int CONST_NearDistance_Long = 3 Const
Int CONST_NearDistance_Moderate = 2 Const
Int CONST_NearDistance_RandomFar = -3 Const
Int CONST_NearFacing_AwayLarge = 3 Const
Int CONST_NearFacing_AwaySmall = 2 Const
Int CONST_NearFacing_Random = -2 Const
Int CONST_NearFacing_TowardLarge = 1 Const
Int CONST_NearFacing_TowardSmall = 0 Const
Int CONST_NearPosition_Above = 3 Const
Int CONST_NearPosition_Below = 4 Const
Int CONST_NearPosition_DeadAhead = -1 Const
Int CONST_NearPosition_ForwardTight = 0 Const
Int CONST_NearPosition_ForwardWide = 1 Const
Int CONST_NearPosition_Random = -2 Const
Int CONST_PackageValue_Arriving = 4 Const
Int CONST_PackageValue_Departing = 3 Const
Int CONST_PackageValue_Docked = 2 Const
Int CONST_PackageValue_Docking = 1 Const
Int CONST_PackageValue_Patrol = 0 Const
Int CONST_SafeSpawnAttemptsMax = 5 Const
Int CONST_SafeSpawnDistanceFromPlayerShip = 400 Const
Int CONST_SpawningShutdownStage = 20 Const
Float combatTimestampElapsedDelay
GlobalVariable combatTimestampGlobal
Int dockingDelayMax
Int dockingDelayMin
Int initialShips
Int initialShipsMax
Int initialShipsMin
Float lastSpawnTimestamp
Int maxRefreshTime
Int maxShips
Int maxShipsInteractingWithStation
Int minRefreshTime
Int minSpawnDelay
Float percentEasy
Float percentHard
Float percentMedium
Int safeSpawnDistanceFromStation
sq_stationtrafficmanagersettingsscr settingsMarkerRef
spaceshipreference stationRef
Bool trafficManagerActive
Faction[] trafficShipFactions
FormList trafficShipList

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard TrafficManagerGuard

;-- Properties --------------------------------------
Group AutofillProperties
  LocationAlias Property PlayerShipLocation Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property SettingsMarker Auto Const mandatory
  ReferenceAlias Property Starstation Auto Const mandatory
  RefCollectionAlias Property Ships Auto Const mandatory
  RefCollectionAlias Property StationShips Auto Const mandatory
  RefCollectionAlias Property TrafficShips Auto Const mandatory
  ActorValue Property SQ_TrafficManagerSCPackageValue Auto Const mandatory
  ActorValue Property SQ_TrafficManagerSCTimestampValue Auto Const mandatory
  Keyword Property LinkTrafficSystemStarstation Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function InitOnStartupStage()
  Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    trafficManagerActive = True
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
  settingsMarkerRef = SettingsMarker.GetRef() as sq_stationtrafficmanagersettingsscr
  stationRef = settingsMarkerRef.GetLinkedRef(LinkTrafficSystemStarstation) as spaceshipreference
  Starstation.ForceRefTo(stationRef as ObjectReference)
  maxRefreshTime = settingsMarkerRef.maxRefreshTime
  minRefreshTime = Math.Max(1.0, Math.Min(settingsMarkerRef.minRefreshTime as Float, maxRefreshTime as Float)) as Int
  minSpawnDelay = settingsMarkerRef.minSpawnDelay
  percentEasy = settingsMarkerRef.percentEasy
  percentMedium = settingsMarkerRef.percentMedium
  percentHard = settingsMarkerRef.percentHard
  trafficShipList = settingsMarkerRef.trafficShipList
  trafficShipFactions = settingsMarkerRef.trafficShipFactions
  maxShips = settingsMarkerRef.maxShips
  initialShipsMax = Math.Min(settingsMarkerRef.initialShipsMax as Float, maxShips as Float) as Int
  initialShipsMin = Math.Min(settingsMarkerRef.initialShipsMin as Float, initialShipsMax as Float) as Int
  initialShips = Utility.RandomInt(initialShipsMin, initialShipsMax)
  If stationRef != None
    maxShipsInteractingWithStation = Math.Min(settingsMarkerRef.maxShipsInteractingWithStation as Float, maxShips as Float) as Int
    dockingDelayMax = settingsMarkerRef.dockingDelayMax
    dockingDelayMin = Math.Min(settingsMarkerRef.dockingDelayMin as Float, dockingDelayMax as Float) as Int
    safeSpawnDistanceFromStation = settingsMarkerRef.safeSpawnDistanceFromStation
  EndIf
  combatTimestampGlobal = settingsMarkerRef.combatTimestampGlobal
  combatTimestampElapsedDelay = settingsMarkerRef.combatTimestampElapsedDelay
  If combatTimestampGlobal == None || combatTimestampGlobal.GetValue() <= 0.0 || combatTimestampGlobal.GetValue() + combatTimestampElapsedDelay < Utility.GetCurrentGameTime()
    Int I = 0
    While I < initialShips
      Self.SpawnShipTrafficNoWait(True)
      I += 1
    EndWhile
    Self.StartTimer(Utility.RandomFloat(minRefreshTime as Float, maxRefreshTime as Float), 0)
  EndIf
EndFunction

Event OnTimer(Int timerID)
  Int currentStationShips = StationShips.GetCount()
  If currentStationShips > 0
    Bool hasUndockedShip = False
    Float currentTime = Utility.GetCurrentRealTime()
    Int I = 0
    While !hasUndockedShip && I < StationShips.GetCount()
      spaceshipreference currentShip = StationShips.GetAt(I) as spaceshipreference
      Int currentShipPackageValue = currentShip.GetValue(SQ_TrafficManagerSCPackageValue) as Int
      If currentShipPackageValue != CONST_PackageValue_Docked
        
      Else
        Float currentShipDepartureTimeValue = currentShip.GetValue(SQ_TrafficManagerSCTimestampValue)
        If currentTime < (currentShipDepartureTimeValue - dockingDelayMax as Float)
          currentShip.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime() + dockingDelayMax as Float)
        ElseIf currentShipDepartureTimeValue > currentTime
          
        Else
          Self.MoveToDockingExitPoint(currentShip)
          hasUndockedShip = True
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
  If Self.GetStageDone(CONST_SpawningShutdownStage)
    If combatTimestampGlobal != None
      combatTimestampGlobal.SetValue(Utility.GetCurrentGameTime())
    EndIf
  ElseIf Ships.GetCount() < maxShips
    Float currenttime = Utility.GetCurrentRealTime()
    If currenttime < lastSpawnTimestamp
      lastSpawnTimestamp = 0.0
    ElseIf (lastSpawnTimestamp + minSpawnDelay as Float) > currenttime
      
    Else
      lastSpawnTimestamp = currenttime
      If currentStationShips < maxShipsInteractingWithStation
        Self.SpawnShipStationNoWait()
      Else
        Self.SpawnShipTrafficNoWait(False)
      EndIf
    EndIf
  EndIf
  Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If trafficManagerActive
      Self.StartTimer(Utility.RandomFloat(minRefreshTime as Float, maxRefreshTime as Float), 0)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
  If akNewLoc != PlayerShipLocation.GetLocation()
    Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      ObjectReference[] shipRefs = Ships.GetArray()
      Int I = 0
      While I < shipRefs.Length
        shipRefs[I].DisableNoWait(False)
        shipRefs[I].Delete()
        I += 1
      EndWhile
      settingsMarkerRef = None
      stationRef = None
      trafficManagerActive = False
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    Self.Stop()
  EndIf
EndEvent

Function SpawnShipStationNoWait()
  Self.CallFunctionNoWait("SpawnShipStation", None)
EndFunction

Function SpawnShipStation()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  ObjectReference spawnMarker = settingsMarkerRef.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
  Bool safeSpawnLocationFound = False
  Int I = 0
  While !safeSpawnLocationFound && I < CONST_SafeSpawnAttemptsMax
    spawnMarker.MoveNear(stationRef as ObjectReference, CONST_NearPosition_Random, CONST_NearDistance_Moderate, CONST_NearFacing_TowardLarge)
    safeSpawnLocationFound = spawnMarker.GetDistance(playerShipRef as ObjectReference) > CONST_SafeSpawnDistanceFromPlayerShip as Float
    I += 1
  EndWhile
  spaceshipreference ship = Self.Private_SpawnShip(spawnMarker, True)
  If ship != None
    ship.EnableWithGravJumpNoWait()
    ship.SetLinkedRef(stationRef as ObjectReference, LinkTrafficSystemStarstation, False)
    Self.MoveToDockingEntryPoint(ship)
  EndIf
  spawnMarker.Delete()
EndFunction

Function SpawnShipTrafficNoWait(Bool isInitialShip)
  Var[] akArgs = new Var[1]
  akArgs[0] = isInitialShip as Var
  Self.CallFunctionNoWait("SpawnShipTraffic", akArgs)
EndFunction

Function SpawnShipTraffic(Bool isInitialShip)
  ObjectReference spawnMarker = settingsMarkerRef.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
  spawnMarker.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_Random, CONST_NearDistance_RandomFar, CONST_NearFacing_Random)
  If stationRef != None
    Bool safeSpawnLocationFound = spawnMarker.GetDistance(stationRef as ObjectReference) > safeSpawnDistanceFromStation as Float
    Int I = 0
    While !safeSpawnLocationFound && I < CONST_SafeSpawnAttemptsMax
      spawnMarker.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_Random, CONST_NearDistance_RandomFar, CONST_NearFacing_Random)
      safeSpawnLocationFound = spawnMarker.GetDistance(stationRef as ObjectReference) > safeSpawnDistanceFromStation as Float
      If isInitialShip && safeSpawnLocationFound
        safeSpawnLocationFound = !Game.GetPlayer().HasDetectionLOS(spawnMarker)
      EndIf
      I += 1
    EndWhile
  EndIf
  spaceshipreference ship = Self.Private_SpawnShip(spawnMarker, False)
  If ship != None
    ObjectReference patrolStartMarker = spawnMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
    ship.SetLinkedRef(patrolStartMarker, None, False)
    ObjectReference patrolTargetMarker = patrolStartMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
    patrolTargetMarker.MoveNear(patrolStartMarker, CONST_NearPosition_ForwardWide, CONST_NearDistance_Long, CONST_NearFacing_AwaySmall)
    patrolStartMarker.SetLinkedRef(patrolTargetMarker, None, False)
    Self.RegisterForDistanceLessThanEvent(ship as ScriptObject, patrolTargetMarker as ScriptObject, CONST_GravJumpExitDistance as Float, 0)
    ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime())
    If isInitialShip
      ship.EnableNoWait(False)
    Else
      ship.EnableWithGravJumpNoWait()
    EndIf
  EndIf
  spawnMarker.Delete()
EndFunction

spaceshipreference Function Private_SpawnShip(ObjectReference spawnMarker, Bool isStationShip)
  Int aiMod = 0
  Float aiModRoll = Utility.RandomFloat(0.0, 1.0)
  If aiModRoll < percentEasy
    aiMod = 0
  ElseIf aiModRoll < percentEasy + percentMedium
    aiMod = 1
  Else
    aiMod = 2
  EndIf
  spaceshipbase shipBase = trafficShipList.GetAt(Utility.RandomInt(0, trafficShipList.GetSize() - 1)) as spaceshipbase
  If shipBase == None
    Return None
  Else
    spaceshipreference spawnedShip = None
    Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If trafficManagerActive
        spawnedShip = spawnMarker.PlaceShipAtMe(shipBase as Form, aiMod, False, False, True, True, None, None, None, True)
        Ships.AddRef(spawnedShip as ObjectReference)
        If isStationShip
          StationShips.AddRef(spawnedShip as ObjectReference)
        Else
          TrafficShips.AddRef(spawnedShip as ObjectReference)
        EndIf
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    If spawnedShip != None
      If trafficShipFactions != None
        Int I = 0
        While I < trafficShipFactions.Length
          spawnedShip.AddToFaction(trafficShipFactions[I])
          I += 1
        EndWhile
      EndIf
    EndIf
    Return spawnedShip
  EndIf
EndFunction

Float[] Function GetLocalPositionOfObjectToTarget(ObjectReference aObject, ObjectReference aTarget)
  Float[] objectPos = aObject.GetSpacePosition()
  Float[] targetXF_CS = aTarget.GetSpaceTransform()
  Float deltaX_CS = objectPos[0] - targetXF_CS[0]
  Float deltaY_CS = objectPos[1] - targetXF_CS[1]
  Float deltaZ_CS = objectPos[2] - targetXF_CS[2]
  objectPos[0] = deltaX_CS * targetXF_CS[3] + deltaY_CS * targetXF_CS[4] + deltaZ_CS * targetXF_CS[5]
  objectPos[1] = deltaX_CS * targetXF_CS[6] + deltaY_CS * targetXF_CS[7] + deltaZ_CS * targetXF_CS[8]
  objectPos[2] = deltaX_CS * targetXF_CS[9] + deltaY_CS * targetXF_CS[10] + deltaZ_CS * targetXF_CS[11]
  Return objectPos
EndFunction

ObjectReference Function CreateMarkerAtNearestEnterExitPoint(spaceshipreference aShip, spaceshipreference aStation)
  Float[] ship_LS = Self.GetLocalPositionOfObjectToTarget(aShip as ObjectReference, aStation as ObjectReference)
  Float distanceXY = Math.Sqrt(ship_LS[0] * ship_LS[0] + ship_LS[1] * ship_LS[1])
  Float halfStationWidth = 0.5 * aStation.GetWidth()
  Float halfStationLength = 0.5 * aStation.GetLength()
  Float halfStationHeight = 0.5 * aStation.GetHeight()
  Float stationCircleRadius = Math.Sqrt(halfStationLength * halfStationLength + halfStationWidth * halfStationWidth)
  Float clampedDistanceXY = Math.Min(distanceXY, stationCircleRadius)
  Float[] offsets = new Float[6]
  offsets[0] = clampedDistanceXY * ship_LS[0] / distanceXY
  offsets[1] = clampedDistanceXY * ship_LS[1] / distanceXY
  Float minApproachZOffset = halfStationHeight + Utility.RandomFloat(CONST_MinEntryExitZOffset as Float, CONST_MidEntryExitZOffset as Float)
  Float maxApproachZOffset = halfStationHeight + Utility.RandomFloat(CONST_MidEntryExitZOffset as Float, CONST_MaxEntryExitZOffset as Float)
  If ship_LS[2] >= 0.0
    offsets[2] = Math.Clamp(ship_LS[2], minApproachZOffset, maxApproachZOffset)
  Else
    offsets[2] = Math.Clamp(ship_LS[2], -maxApproachZOffset, -minApproachZOffset)
  EndIf
  ObjectReference newMarker = stationRef.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True)
  Float[] newMarker_LS = Self.GetLocalPositionOfObjectToTarget(newMarker, aStation as ObjectReference)
  Return newMarker
EndFunction

Event SpaceshipReference.OnShipDock(spaceshipreference ship, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If abComplete && akParent == stationRef
    Float dockingTime = Utility.RandomFloat(dockingDelayMin as Float, dockingDelayMax as Float)
    ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentGameTime() + dockingTime)
    ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Docked as Float)
    ship.EvaluatePackage(False)
  EndIf
EndEvent

Function MoveToDockingEntryPoint(spaceshipreference ship)
  ObjectReference enterMarker = Self.CreateMarkerAtNearestEnterExitPoint(ship, stationRef)
  ship.SetLinkedRef(enterMarker, None, False)
  ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime())
  ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Arriving as Float)
  ship.EvaluatePackage(False)
  Self.RegisterForDistanceLessThanEvent(ship as ScriptObject, ship.GetLinkedRef(None) as ScriptObject, CONST_DockingEntryExitDistance as Float, 0)
EndFunction

Function MoveToDockingExitPoint(spaceshipreference ship)
  ObjectReference exitMarker = Self.CreateMarkerAtNearestEnterExitPoint(ship, stationRef)
  Float[] shipToExitMarker_LS = Self.GetLocalPositionOfObjectToTarget(ship as ObjectReference, exitMarker)
  Float[] offsets = new Float[6]
  offsets[0] = shipToExitMarker_LS[0]
  offsets[1] = shipToExitMarker_LS[1]
  offsets[2] = shipToExitMarker_LS[2]
  ObjectReference turnMarker = exitMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True)
  ObjectReference gravJumpMarker = exitMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
  Float[] exitMarkerToStation_LS = Self.GetLocalPositionOfObjectToTarget(exitMarker, stationRef as ObjectReference)
  If exitMarkerToStation_LS[2] < 0.0
    gravJumpMarker.MoveNear(stationRef as ObjectReference, CONST_NearPosition_Below, CONST_NearDistance_Long, CONST_NearFacing_AwayLarge)
  Else
    gravJumpMarker.MoveNear(stationRef as ObjectReference, CONST_NearPosition_Above, CONST_NearDistance_Long, CONST_NearFacing_AwayLarge)
  EndIf
  exitMarker.SetLinkedRef(gravJumpMarker, None, False)
  turnMarker.SetLinkedRef(exitMarker, None, False)
  ship.SetLinkedRef(turnMarker, None, False)
  ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime())
  ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Departing as Float)
  ship.EvaluatePackage(False)
  Self.RegisterForDistanceLessThanEvent(ship as ScriptObject, gravJumpMarker as ScriptObject, CONST_GravJumpExitDistance as Float, 0)
EndFunction

Function DockShipStation(spaceshipreference ship)
  Self.RegisterForRemoteEvent(ship as ScriptObject, "OnShipDock")
  ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Docking as Float)
  ship.EvaluatePackage(False)
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  spaceshipreference ship = None
  If akObj1 is spaceshipreference
    ship = akObj1 as spaceshipreference
  Else
    ship = akObj2 as spaceshipreference
  EndIf
  Float transitTime = Utility.GetCurrentRealTime() - ship.GetValue(SQ_TrafficManagerSCTimestampValue)
  If ship.GetValue(SQ_TrafficManagerSCPackageValue) == CONST_PackageValue_Arriving as Float
    Self.DockShipStation(ship)
  Else
    If ship.GetValue(SQ_TrafficManagerSCPackageValue) == CONST_PackageValue_Patrol as Float
      
    EndIf
    ship.DisableWithGravJump()
    Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If trafficManagerActive
        Ships.RemoveRef(ship as ObjectReference)
        StationShips.RemoveRef(ship as ObjectReference)
        TrafficShips.RemoveRef(ship as ObjectReference)
        ObjectReference[] shipLinkedRefs = ship.GetLinkedRefChain(None, 100)
        Int I = 0
        While I < shipLinkedRefs.Length
          If shipLinkedRefs[I] != None
            shipLinkedRefs[I].Delete()
          EndIf
          I += 1
        EndWhile
        ship.Delete()
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndEvent

Function DEBUG_MoveNearPlayer(spaceshipreference ship)
  ship.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_DeadAhead, CONST_NearDistance_Close, CONST_NearFacing_AwayLarge)
EndFunction
