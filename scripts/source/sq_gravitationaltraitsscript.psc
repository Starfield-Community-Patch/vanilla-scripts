ScriptName SQ_GravitationalTraitsScript Extends Quest
{ quest script to randomize gravitational anomaly traits }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PlanetTrait26GravitationalAnomaly Auto Const mandatory
Keyword Property PlanetTrait26GravitationalAnomaly_Close Auto Const mandatory
LocationAlias[] Property OldPlanets Auto Const
{ list of planet location aliases - remove the trait from all of these }
LocationAlias[] Property NewPlanets Auto Const
{ list of planet location aliases - put the trait on all of these }
LocationAlias[] Property ClosePlanets Auto Const
{ List of location aliases for the designated "closer" planets }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Int I = 0
  While I < OldPlanets.Length
    Location thePlanetLocation = OldPlanets[I].GetLocation()
    If thePlanetLocation
      thePlanetLocation.RemoveKeyword(PlanetTrait26GravitationalAnomaly)
    EndIf
    I += 1
  EndWhile
  I = 0
  While I < NewPlanets.Length
    Location theplanetlocation = NewPlanets[I].GetLocation()
    If theplanetlocation
      theplanetlocation.AddKeyword(PlanetTrait26GravitationalAnomaly)
    EndIf
    I += 1
  EndWhile
  I = 0
  While I < ClosePlanets.Length
    Location theplanetlocation = ClosePlanets[I].GetLocation()
    If theplanetlocation
      theplanetlocation.AddKeyword(PlanetTrait26GravitationalAnomaly_Close)
    EndIf
    I += 1
  EndWhile
EndEvent
