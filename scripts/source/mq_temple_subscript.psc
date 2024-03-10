ScriptName MQ_Temple_SubScript Extends Quest

;-- Structs -----------------------------------------
Struct imageSpaceData
  ImageSpaceModifier scanTempleImod
  Int distortionLevel = 1
  wwiseevent soundEvent
  Float requiredAngleExtent
  Float loopTime
EndStruct


;-- Variables ---------------------------------------
Float AngleDiff
Float DistanceDiff
Int currentImodIndex = -1
Float currentImodTime
ObjectReference currentTarget
Int iArtifactNumber
Actor playerRef
Int scanTempleTimerID = 1 Const
Float scanTempleTimerSeconds = 0.5 Const
Bool usingHandscanner = False

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CheckForTempleScanningGuard
Guard handscannerGuard

;-- Properties --------------------------------------
Group soundData
  String Property ArtifactPuzzle_TempleDistance = "ArtifactPuzzle_TempleDistance" Auto Const
EndGroup

ReferenceAlias Property PlayerShip Auto Const mandatory
LocationAlias Property PlanetWithTrait Auto Const mandatory
Keyword Property LocTypeMajorOrbital Auto Const mandatory
LocationAlias Property TempleLocation Auto Const mandatory
Int Property QuestInitStage = -1 Auto Const
Int Property LandingSetStage = 30 Auto Const
Int Property PowerReceivedStage = 60 Auto Const
Int Property PowerNumber = -1 Auto Const
ReferenceAlias Property TemplePowerTrigger Auto Const mandatory
ReferenceAlias Property AnomalyMapMarker Auto Const mandatory
ReferenceAlias Property TempleMapMarker Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ActorValue Property OutpostScannerMultiplier Auto Const mandatory
Keyword Property MQTempleQuestActive Auto Const mandatory
Keyword Property PlanetTrait26GravitationalAnomaly Auto Const mandatory
Quest Property MQ_TempleQuest_SpawnTemple Auto Const mandatory
Message Property MQ_TempleTutorial_DistanceMSG Auto Const mandatory
ReferenceAlias Property TempleStarbornMarker Auto Const
ActorBase Property LvlStarborn_Boss_Aggro Auto Const mandatory
ReferenceAlias Property TempleStarborn Auto Const
Quest Property MQ106 Auto Const mandatory
LocationAlias Property AnomalyLocation Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
mq_temple_subscript:imagespacedata[] Property TempleScanImods Auto Const
{ array of imod data, ordered from highest priority (index 0) to lowest - use first one where currentAnglePercent <= maxPercent }
Float Property MinAngle = 0.0 Auto Const
Float Property MaxAngle = 85.0 Auto Const
Float Property MinDistance = 300.0 Auto Const
Float Property MaxDistance = 1200.0 Auto Const
Float Property MaxScanEffectDistance = 5000.0 Auto Const
{ outside this distance, turn off temple scan effect }

;-- Functions ---------------------------------------

Event OnQuestInit()
  playerRef = Game.GetPlayer()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipLanding")
  Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnExitShipInterior")
  Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange")
  If PowerNumber == -1
    iArtifactNumber = (StarbornTempleQuest as starborntemplequestscript).CheckPlayerArtifactForPower()
    If iArtifactNumber == -1
      Self.Stop()
      Return 
    EndIf
  Else
    iArtifactNumber = PowerNumber
  EndIf
  If iArtifactNumber != -1
    Self.SetMapMarkerFlags(AnomalyMapMarker.GetRef())
    PlanetWithTrait.GetLocation().GetCurrentPlanet().GetLocation().AddKeyword(MQTempleQuestActive)
    (StarbornTempleQuest as starborntemplequestscript).SetPlayerFoundTemple(iArtifactNumber)
    If QuestInitStage > -1
      Self.SetStage(QuestInitStage)
    EndIf
  EndIf
EndEvent

Function SetMapMarkerFlags(ObjectReference akMapMarker)
  akMapMarker.Enable(False)
  akMapMarker.AddToMapScanned(True)
  akMapMarker.SetMarkerVisibleOnStarMap(True)
  akMapMarker.SetRequiresScanning(False)
  akMapMarker.EnableFastTravel(True)
EndFunction

Function TempleDiscovered()
  Self.SetMapMarkerFlags(TempleMapMarker.GetRef())
  AnomalyMapMarker.GetRef().Disable(False)
  Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
EndFunction

Function PowerReceived()
  Guard CheckForTempleScanningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.StopTempleScanning()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSource, Bool abComplete)
  If abComplete
    If TempleLocation.GetLocation() == None
      Self.RefillTemple()
    EndIf
    Self.CheckForTempleScanning()
  EndIf
EndEvent

Function RefillTemple()
  Location landingLocation = PlayerShip.GetRef().GetCurrentLocation()
  Location planetLocation = PlanetWithTrait.GetLocation()
  If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
    TempleLocation.RefillAlias()
    TempleLocation.RefillDependentAliases()
    Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
    (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(iArtifactNumber, TempleLocation.GetLocation())
  EndIf
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  ObjectReference ScanTarget = TempleMapMarker.GetRef()
  If akSender == Game.GetPlayer() && ScanTarget != None && Self.GetStageDone(PowerReceivedStage) == False
    Self.CheckForTempleScanning()
  EndIf
EndEvent

Event Actor.OnExitShipInterior(Actor akSource, ObjectReference akShip)
  If Self.GetStageDone(LandingSetStage) == False
    Location landingLocation = akShip.GetCurrentLocation()
    Location planetLocation = PlanetWithTrait.GetLocation()
    If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
      Self.SetStage(LandingSetStage)
    EndIf
  EndIf
EndEvent

Function CheckForTempleScanning()
  Guard CheckForTempleScanningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference ScanTarget = TempleMapMarker.GetRef()
    If ScanTarget != None && Self.GetStageDone(PowerReceivedStage) == False
      Location TemplePlanetLocation = PlanetWithTrait.GetLocation()
      spaceshipreference playerShipRef = PlayerShip.GetShipRef()
      Location playerCurrentLocation = playerRef.GetCurrentLocation()
      Location landingLocation = playerShipRef.GetCurrentLocation()
      Bool onTargetPlanet = playerCurrentLocation.IsSameLocation(TemplePlanetLocation, LocTypeMajorOrbital) || landingLocation.IsSameLocation(TemplePlanetLocation, LocTypeMajorOrbital)
      Bool nearTemple = playerRef.GetDistance(ScanTarget) < MaxScanEffectDistance || playerShipRef.GetDistance(ScanTarget) < MaxScanEffectDistance
      If onTargetPlanet && nearTemple
        Self.StartTempleScanning(ScanTarget)
      Else
        Self.StopTempleScanning()
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(sbpowercollectionactivatorscript akSender, Var[] akArgs)
  If (akSender as ObjectReference == TemplePowerTrigger.GetRef()) && Self.GetStageDone(PowerReceivedStage) == False
    Self.SetStage(PowerReceivedStage)
    (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredPower(iArtifactNumber)
  EndIf
EndEvent

Event MQSpawnTempleScript.TempleSpawnedEvent(mqspawntemplescript akSender, Var[] akArgs)
  Location myLocation = akArgs[0] as Location
  ObjectReference myMapMarker = akArgs[1] as ObjectReference
  Self.UnRegisterForCustomEvent(akSender as ScriptObject, "mqspawntemplescript_TempleSpawnedEvent")
  TempleLocation.ForceLocationTo(myLocation)
  TempleLocation.RefillDependentAliases()
  Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(iArtifactNumber, TempleLocation.GetLocation())
EndEvent

Function SpawnStarborn()
  If MQ106.IsCompleted() || MQ401_SkipMQ.GetValueInt() >= 1
    Actor StarbornREF = TempleStarbornMarker.GetRef().PlaceActorAtMe(LvlStarborn_Boss_Aggro, 4, None, False, False, True, None, True)
    MUSGenesisStingerStarbornAppearB.Add()
    TempleStarborn.ForceRefTo(StarbornREF as ObjectReference)
    (StarbornTempleQuest as starborntemplequestscript).RenameTempleStarborn(iArtifactNumber, StarbornREF)
  EndIf
EndFunction

Function StartTempleScanning(ObjectReference targetRef)
  DistanceDiff = MaxDistance - MinDistance
  AngleDiff = MaxAngle - MinAngle
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu")
  currentTarget = targetRef
EndFunction

Function StopTempleScanning()
  Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu")
  currentTarget = None
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == scanTempleTimerID
    Self.UpdateTempleScan()
  EndIf
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "MonocleMenu"
    Guard handscannerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      usingHandscanner = abOpening
      If abOpening
        Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndEvent

Function UpdateTempleScan()
  If usingHandscanner && currentTarget as Bool
    Float zAngle = Game.GetCameraHeadingAngle(currentTarget)
    Float currentMaxImodAngle = Self.GetAngleExtent()
    If Math.abs(zAngle) <= MaxAngle
      Self.UpdateImod(zAngle, currentMaxImodAngle)
    Else
      Self.RemoveAllImods()
    EndIf
    Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID)
  Else
    Self.RemoveAllImods()
  EndIf
EndFunction

Float Function GetAngleExtent()
  Float distance = Self.GetClampedDistance()
  Float distanceMult = (distance - MinDistance) / DistanceDiff
  Float angleExtent = MinAngle + distanceMult * AngleDiff
  Return angleExtent
EndFunction

Float Function GetClampedDistance()
  Float distance = Math.Clamp(playerRef.GetDistance(currentTarget), MinDistance, MaxDistance)
  Return distance
EndFunction

Function UpdateImod(Float currentAngle, Float currentMaxImodAngle)
  Bool foundValidImod = False
  Int I = 0
  While I < TempleScanImods.Length
    mq_temple_subscript:imagespacedata theData = TempleScanImods[I]
    If foundValidImod
      If theData.scanTempleImod
        theData.scanTempleImod.Remove()
      EndIf
    ElseIf currentMaxImodAngle <= theData.requiredAngleExtent && Math.abs(currentAngle) <= theData.requiredAngleExtent
      foundValidImod = True
      Float distance = Self.GetClampedDistance()
      If currentImodIndex != I
        currentImodIndex = I
        Game.SetHandscannerDistortionLevel(theData.distortionLevel)
        If theData.scanTempleImod
          theData.scanTempleImod.Apply(1.0)
        EndIf
        If theData.soundEvent
          theData.soundEvent.PlayWithRTPC(playerRef as ObjectReference, ArtifactPuzzle_TempleDistance, distance)
        EndIf
        currentImodTime = 0.0
      ElseIf currentImodTime >= theData.loopTime
        If theData.scanTempleImod
          theData.scanTempleImod.Apply(1.0)
        EndIf
        If theData.soundEvent
          theData.soundEvent.PlayWithRTPC(playerRef as ObjectReference, ArtifactPuzzle_TempleDistance, distance)
        EndIf
        currentImodTime = 0.0
      Else
        currentImodTime += scanTempleTimerSeconds
      EndIf
    EndIf
    I += 1
  EndWhile
  If foundValidImod == False
    currentImodIndex = 0
    Game.SetHandscannerDistortionLevel(0)
  EndIf
EndFunction

Function RemoveAllImods()
  Game.SetHandscannerDistortionLevel(0)
  currentImodIndex = -1
  currentImodTime = 0.0
  Int I = 0
  While I < TempleScanImods.Length
    If TempleScanImods[I].scanTempleImod
      TempleScanImods[I].scanTempleImod.Remove()
    EndIf
    I += 1
  EndWhile
EndFunction

Function RefillAnomalyOE()
  AnomalyLocation.RefillAlias()
  AnomalyMapMarker.RefillAlias()
  Self.SetMapMarkerFlags(AnomalyMapMarker.GetRef())
EndFunction
