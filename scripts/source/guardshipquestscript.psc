ScriptName GuardShipQuestScript Extends Quest conditional
{ script for quests that handle guard ships in settled systems }

;-- Structs -----------------------------------------
Struct GuardshipType
  Faction crimeFaction
  spaceshipbase GuardShipBase
EndStruct

Struct PlanetData
  Location PlanetOrbitLocation
  ObjectReference MapMarker01
  ObjectReference MapMarker02
  ObjectReference MapMarker03
  ObjectReference MapMarker04
  ObjectReference MapMarker05
EndStruct


;-- Variables ---------------------------------------
Bool droppedContraband = False
Bool leftOrbit = False
Int reinforcementCurrent = 0
Int reinforcementTimerID = 1
Int reinforcementTotal = 0
Bool showingContrabandWarning = False

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard scanWarningGuard

;-- Properties --------------------------------------
Group ReinforcementGroup
  guardshipquestscript:guardshiptype[] Property GuardShipReinforcements Auto Const mandatory
  { used to create guard ship reinforcements during combat }
  ReferenceAlias[] Property ReinforcementSpawnPoints Auto Const mandatory
  { spawn points for reinforcements }
  RefCollectionAlias Property Reinforcements Auto Const mandatory
  { collection to put reinforcement ships into }
  Int Property minReinforcements = 1 Auto Const
  Int Property maxReinforcements = 3 Auto Const
  Float Property reinforcementDelayMin = 3.0 Auto Const
  Float Property reinforcementDelayMax = 15.0 Auto Const
EndGroup

Group VSTemp
  Quest Property MQ101 Auto Const
  Int Property MQ101AllowLandingStage = 1310 Auto Const
EndGroup

guardshipquestscript:planetdata[] Property SettledPlanets Auto Const
{ array of planets that have map markers that need to be managed by guard quests }
LocationAlias Property PlanetOrbitLocation Auto Const mandatory
{ location alias of this planet's orbit location }
LocationAlias Property PlanetLocation Auto Const mandatory
{ location alias of where the planet }
LocationAlias Property OldLocation Auto Const mandatory
{ location alias of where the ship is changing location from }
Keyword Property LocTypeMajorOrbital Auto Const mandatory
Keyword Property LocTypeSettlement Auto Const mandatory
Keyword Property LocTypeOrbit Auto Const mandatory
Keyword Property LocTypeStarSystem Auto Const mandatory
LocationRefType Property GuardShipRefType Auto Const mandatory
ReferenceAlias Property Playership Auto Const mandatory
{ player ship alias }
ReferenceAlias Property Ship01 Auto Const mandatory
{ guard ship alias }
ReferenceAlias Property Ship02 Auto Const mandatory
{ guard ship 2 alias }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ holds smuggling minigame }
GlobalVariable Property SQ_GuardShipsScanStatus Auto Const mandatory
Scene Property SQ_GuardShipsScene Auto Const mandatory
{ contraband scanning scene - need to stop it if contraband alarm is sent }
Int Property ContrabandDetectedStage = 25 Auto Const
{ stage to set if contraband is found }
Keyword Property Contraband Auto Const mandatory
{ keyword to watch for dropped contraband }
Keyword Property SpaceJettisonContainer Auto Const mandatory
{ keyword to check for space jettison container }

;-- Functions ---------------------------------------

Function debugAlarmStatus()
  ; Empty function
EndFunction

Event OnQuestStarted()
  Self.ClearScanStatus()
  Self.StartContrabandDropCheck(True)
  spaceshipreference ship01Ref = Ship01.GetShipRef()
  If ship01Ref
    If ship01Ref.IsDead()
      ship01Ref.Reset(None)
    EndIf
    Cell spaceCell = Ship01.GetRef().GetParentCell()
    If spaceCell
      spaceCell.Reset()
    EndIf
  EndIf
  spaceshipreference ship02Ref = Ship02.GetShipRef()
  If ship02Ref as Bool && ship02Ref.IsDead()
    ship02Ref.Reset(None)
  EndIf
  Location thePlanetLocation = PlanetLocation.GetLocation()
  planet thePlanet = thePlanetLocation.GetCurrentPlanet()
  Location theOldLocation = OldLocation.GetLocation()
  Location thePlanetOrbitLocation = PlanetOrbitLocation.GetLocation()
  planet theOldLocationPlanet = None
  If theOldLocation
    theOldLocationPlanet = theOldLocation.GetCurrentPlanet()
  EndIf
  Bool stopQuest = False
  If (theOldLocation as Bool && thePlanetOrbitLocation.IsSameLocation(theOldLocation, LocTypeOrbit)) && theOldLocation.HasRefType(GuardShipRefType)
    stopQuest = True
  ElseIf (theOldLocation as Bool && thePlanetLocation as Bool) && thePlanet == theOldLocationPlanet
    stopQuest = True
  EndIf
  If ship01Ref.IsDisabled()
    stopQuest = True
  EndIf
  If stopQuest
    Self.Stop()
  Else
    Self.CheckForShutdown(False)
    Actor playerRef = Game.GetPlayer()
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnLocationChange")
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnShipFarTravel")
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnShipGravJump")
    Self.AllowLanding(False)
    Self.ShowContrabandScanWarning(False)
  EndIf
  Self.RegisterForRemoteEvent(Ship01 as ScriptObject, "OnDeath")
EndEvent

Event OnQuestShutdown()
  Self.ClearScanStatus()
  Self.HideContrabandScanWarning(True, False)
EndEvent

Bool Function IsInAnySettlement(Location locationToCheck, guardshipquestscript:planetdata thePlanetData)
  Bool bInAnySettlement = False
  If thePlanetData
    bInAnySettlement = Self.IsInSettlement(thePlanetData.MapMarker01, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker02, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker03, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker04, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker05, locationToCheck)
  EndIf
  Return bInAnySettlement
EndFunction

Bool Function IsInSettlement(ObjectReference settlementRef, Location locationToCheck)
  Bool returnVal = False
  If settlementRef as Bool && locationToCheck as Bool
    Location settlementLocation = settlementRef.GetCurrentLocation()
    returnVal = locationToCheck.IsSameLocation(settlementLocation, LocTypeSettlement)
  EndIf
  Return returnVal
EndFunction

guardshipquestscript:planetdata Function GetPlanetData()
  guardshipquestscript:planetdata thePlanetData = None
  Location myPlanetOrbitLocation = PlanetOrbitLocation.GetLocation()
  If myPlanetOrbitLocation
    Int myPlanetIndex = SettledPlanets.findstruct("PlanetOrbitLocation", myPlanetOrbitLocation, 0)
    If myPlanetIndex > -1
      thePlanetData = SettledPlanets[myPlanetIndex]
    EndIf
  EndIf
  Return thePlanetData
EndFunction

Function AllowLanding(Bool bAllowLanding)
  guardshipquestscript:planetdata thePlanetData = Self.GetPlanetData()
  If thePlanetData
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker01)
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker02)
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker03)
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker04)
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker05)
  EndIf
EndFunction

Function AllowLandingAtMarker(Bool bAllowLanding, ObjectReference markerRef)
  If markerRef
    markerRef.EnableFastTravel(bAllowLanding)
  EndIf
EndFunction

Function ScanForContraband()
  spaceshipreference guardShipRef = Ship01.GetShipRef()
  spaceshipreference playerShipRef = Playership.GetShipRef()
  If playerShipRef
    If guardShipRef == None || leftOrbit || guardShipRef.Is3DLoaded() == False && playerShipRef.IsInSpace() == False
      SQ_GuardShipsScene.Stop()
      Self.HideContrabandScanWarning(True, False)
    Else
      Int contrabandStatus = playerShipRef.CheckContrabandStatus(True)
      If contrabandStatus < 0 && droppedContraband == False
        Self.HideContrabandScanWarning(False, True)
        SQ_GuardShipsScanStatus.SetValueInt(1)
      ElseIf contrabandStatus > 0 || droppedContraband
        SQ_GuardShipsScanStatus.SetValueInt(0)
        Self.HideContrabandScanWarning(False, False)
        Self.SendSmugglingAlarm()
      Else
        Bool scanStatus = SQ_Parent.SmugglingMinigame(playerShipRef, Ship01.GetShipRef())
        SQ_GuardShipsScanStatus.SetValueInt(scanStatus as Int)
        Self.HideContrabandScanWarning(False, scanStatus)
        If scanStatus
          
        Else
          Self.SendSmugglingAlarm()
        EndIf
      EndIf
    EndIf
  EndIf
  Self.StartContrabandDropCheck(False)
EndFunction

Function SendSmugglingAlarm()
  Ship01.TryToSendSmugglingAlarm()
  SQ_GuardShipsScene.Stop()
  Self.SetStage(ContrabandDetectedStage)
EndFunction

Function ClearScanStatus()
  SQ_GuardShipsScanStatus.SetValue(-1.0)
EndFunction

Function ShowContrabandScanWarning(Bool abScanInProgress)
  Guard scanWarningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    showingContrabandWarning = True
    spaceshipreference playerShipRef = Playership.GetShipRef()
    spaceshipreference guardShipRef = Ship01.GetShipRef()
    If playerShipRef as Bool && guardShipRef as Bool
      Float evasionChance = SQ_Parent.GetSmugglingChance(playerShipRef, guardShipRef)
      If droppedContraband
        evasionChance = 0.0
      EndIf
      Game.ShowContrabandScanWarning(evasionChance as Int, abScanInProgress)
    EndIf
    If abScanInProgress == False
      leftOrbit = False
      SQ_GuardShipsScene.Start()
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function HideContrabandScanWarning(Bool abSkipCompletionAnim, Bool abWasDetectionEvaded)
  Guard scanWarningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If showingContrabandWarning
      showingContrabandWarning = False
      Game.HideContrabandScanWarning(abSkipCompletionAnim, abWasDetectionEvaded)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event ReferenceAlias.OnDeath(ReferenceAlias akSource, ObjectReference akKiller)
  Self.StartReinforcementTimer()
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == reinforcementTimerID
    Self.SpawnReinforcements()
  EndIf
EndEvent

Function StartReinforcementTimer()
  Self.StartTimer(Utility.RandomFloat(reinforcementDelayMin, reinforcementDelayMax), reinforcementTimerID)
EndFunction

Function SpawnReinforcements()
  If reinforcementTotal == 0
    reinforcementTotal = Utility.RandomInt(minReinforcements, maxReinforcements)
  EndIf
  If reinforcementCurrent < reinforcementTotal
    reinforcementCurrent += 1
    spaceshipreference guardShipRef = Ship01.GetShipRef()
    If guardShipRef
      Faction crimeFaction = guardShipRef.GetCrimeFaction()
      If crimeFaction
        Int I = 0
        spaceshipbase reinforcementToSpawn = None
        While I < GuardShipReinforcements.Length && reinforcementToSpawn == None
          guardshipquestscript:guardshiptype theType = GuardShipReinforcements[I]
          If theType.crimeFaction == crimeFaction
            reinforcementToSpawn = theType.GuardShipBase
          EndIf
          I += 1
        EndWhile
        If reinforcementToSpawn
          I = Utility.RandomInt(0, ReinforcementSpawnPoints.Length - 1)
          ObjectReference spawnPoint = ReinforcementSpawnPoints[I].GetRef()
          If spawnPoint
            spaceshipreference newShipRef = spawnPoint.PlaceShipAtMe(reinforcementToSpawn as Form, 4, True, False, False, True, None, Reinforcements as Alias, None, True)
          EndIf
          If reinforcementCurrent < reinforcementTotal
            Self.StartReinforcementTimer()
          Else
            Self.AllowLanding(True)
          EndIf
        EndIf
      EndIf
    EndIf
  EndIf
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer()
    Self.CheckForShutdown(True)
  EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Playership && akOldLoc != akNewLoc
    Self.CheckForShutdown(True)
  EndIf
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSender, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  If akSender == Playership && aState == 0 && aArrivalLocation != aDepartureLocation
    leftOrbit = True
  EndIf
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, Int aState)
  If akSender == Playership && aState == 1
    leftOrbit = True
  EndIf
EndEvent

Function CheckForShutdown(Bool allowRestartContrabandScene)
  Guard scanWarningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Location guardShipLocation = PlanetLocation.GetLocation()
    ObjectReference playerShipRef = Playership.GetRef()
    Location currentLocation = playerShipRef.GetCurrentLocation()
    Location guardShipCurrentLocation = Ship01.GetShipRef().GetCurrentLocation()
    If currentLocation == None
      currentLocation = Game.GetPlayer().GetCurrentLocation()
    EndIf
    If currentLocation
      Bool moonCheck = False
      If currentLocation != guardShipCurrentLocation && currentLocation.IsSameLocation(guardShipLocation, LocTypeMajorOrbital)
        Location[] currentLocationParentPlanets = currentLocation.GetParentLocations(LocTypeMajorOrbital)
        Location[] guardShipLocationParentPlanets = guardShipLocation.GetParentLocations(LocTypeMajorOrbital)
        If currentLocationParentPlanets.Length > 1
          If currentLocationParentPlanets.find(guardShipLocation, 0) > -1 || guardShipLocationParentPlanets.Length > 0 && currentLocationParentPlanets.find(guardShipLocationParentPlanets[0], 0) > -1
            moonCheck = True
          EndIf
        ElseIf guardShipLocationParentPlanets.Length > 0 && currentLocationParentPlanets.Length > 0
          If guardShipLocationParentPlanets.find(currentLocationParentPlanets[0], 0)
            moonCheck = True
          EndIf
        EndIf
      EndIf
      If moonCheck || currentLocation.IsSameLocation(guardShipLocation, LocTypeMajorOrbital) == False
        Self.AllowLanding(True)
        Self.Stop()
      ElseIf playerShipRef.IsInSpace() && SQ_GuardShipsScanStatus.GetValueInt() < 1 && SQ_GuardShipsScene.IsPlaying() == False
        If allowRestartContrabandScene
          Self.ShowContrabandScanWarning(False)
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StartContrabandDropCheck(Bool bStart)
  If bStart
    Self.AddInventoryEventFilter(Contraband as Form)
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnItemRemoved")
  Else
    Self.UnregisterForRemoteEvent(Playership as ScriptObject, "OnItemRemoved")
  EndIf
EndFunction

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  If aiTransferReason == 3 || (akDestContainer as Bool && akDestContainer.HasKeyword(SpaceJettisonContainer))
    droppedContraband = True
  EndIf
EndEvent
