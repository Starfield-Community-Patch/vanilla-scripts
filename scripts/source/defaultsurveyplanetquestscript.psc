ScriptName DefaultSurveyPlanetQuestScript Extends Quest default
{ script to set a stage when a specified planet has been surveyed }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
{ should point to SQ_PlayerShip, PlayerShip alias }
LocationAlias Property TargetSystemLocation Auto Const
LocationAlias Property TargetPlanetLocation Auto Const
Keyword Property LocTypeMajorOrbital Auto Const mandatory
{ used to check if something is a planet or moon }
Int Property SurveyCompleteStage = -1 Auto Const mandatory
{ stage to set when planet survey is complete }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerPlanetSurveyComplete")
EndEvent

Event Actor.OnPlayerPlanetSurveyComplete(Actor akSource, planet akPlanet)
  spaceshipreference playershipRef = PlayerShip.GetShipRef()
  Location currentLocation = playershipRef.GetCurrentLocation()
  If currentLocation.IsSameLocation(TargetPlanetLocation.GetLocation(), LocTypeMajorOrbital) && Self.GetStageDone(SurveyCompleteStage) == False
    Self.SetStage(SurveyCompleteStage)
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerPlanetSurveyComplete")
  EndIf
EndEvent
