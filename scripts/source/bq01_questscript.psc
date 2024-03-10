ScriptName BQ01_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property MapMarker_Temple Auto Const mandatory
  LocationAlias Property Location_Temple Auto Const mandatory
  LocationAlias Property Location_TemplePlanet Auto Const mandatory
  Keyword Property MQTempleQuestActive Auto Const mandatory
  Keyword Property BQ01_Keyword_TempleLocation Auto Const mandatory
  Quest Property MQ_TempleQuest_SpawnTemple Auto Const mandatory
  Quest Property StarbornTempleQuest Auto Const mandatory
  inputenablelayer Property BQ01_EnableLayer Auto
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Location TemplePlanetLocation = Location_TemplePlanet.GetLocation().GetCurrentPlanet().GetLocation()
  Location TempleLocation = Location_Temple.GetLocation()
  TemplePlanetLocation.AddKeyword(MQTempleQuestActive)
  TempleLocation.AddKeyword(BQ01_Keyword_TempleLocation)
EndEvent

Function SetMapMarkerFlags(ObjectReference akMapMarker)
  akMapMarker.Enable(False)
  akMapMarker.AddtoMapScanned(True)
  akMapMarker.SetMarkerVisibleOnStarMap(True)
  akMapMarker.SetRequiresScanning(False)
  akMapMarker.EnableFastTravel(True)
EndFunction

Function TempleDiscovered()
  Self.SetMapMarkerFlags(MapMarker_Temple.GetRef())
  Int iArtifactNumber = (StarbornTempleQuest as starborntemplequestscript).FindSigmaArtifactBarrett()
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(iArtifactNumber, Location_Temple.GetLocation())
EndFunction
