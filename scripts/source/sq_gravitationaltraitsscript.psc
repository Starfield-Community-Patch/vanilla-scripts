ScriptName SQ_GravitationalTraitsScript Extends Quest
{ quest script to randomize gravitational anomaly traits }

;-- Structs -----------------------------------------
Struct PlanetAliasFill
  LocationAlias AnyPlanetLocationAlias
  LocationAlias ClosePlanetLocationAlias
  LocationAlias TargetPlanetLocationAlias
EndStruct

Struct PlanetLocationLookup
  Location PlanetLocation
  Int Index
EndStruct


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
sq_gravitationaltraitsscript:planetaliasfill[] Property PlanetAliasFillLookup Auto Const mandatory
{ List of planet location aliases used to associate the fill method with the target of the fill. }

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

Bool Function ArePlanetLocationsDuped()
  Int I = 0
  Location[] knownLocations = new Location[0]
  While I < NewPlanets.Length
    Location loc = NewPlanets[I].GetLocation()
    If loc
      If knownLocations.find(loc, 0) >= 0
        Return True
      Else
        knownLocations.add(loc, 1)
      EndIf
    EndIf
    I += 1
  EndWhile
  Return False
EndFunction

Location Function RefillPlanetLocationDirect(sq_gravitationaltraitsscript:planetaliasfill planetAliasToFill)
  planetAliasToFill.TargetPlanetLocationAlias.RefillAlias()
  Location newLoc = planetAliasToFill.TargetPlanetLocationAlias.GetLocation()
  If newLoc
    newLoc.AddKeyword(PlanetTrait26GravitationalAnomaly)
  EndIf
  Return newLoc
EndFunction

Location Function RefillPlanetLocationFromAliases(sq_gravitationaltraitsscript:planetaliasfill planetAliasToFill)
  Location anyLoc = None
  Location closeLoc = None
  If planetAliasToFill.AnyPlanetLocationAlias
    planetAliasToFill.AnyPlanetLocationAlias.RefillAlias()
    anyLoc = planetAliasToFill.AnyPlanetLocationAlias.GetLocation()
  EndIf
  If planetAliasToFill.ClosePlanetLocationAlias
    planetAliasToFill.ClosePlanetLocationAlias.RefillAlias()
    closeLoc = planetAliasToFill.ClosePlanetLocationAlias.GetLocation()
  EndIf
  Location newLoc = None
  If closeLoc as Bool || anyLoc as Bool
    newLoc = planetAliasToFill.TargetPlanetLocationAlias.GetLocation()
  EndIf
  If newLoc
    newLoc.AddKeyword(PlanetTrait26GravitationalAnomaly)
  EndIf
  Return newLoc
EndFunction

Location Function RefillPlanetLocationDupe(sq_gravitationaltraitsscript:planetaliasfill dupe)
  Location newLoc = None
  If !dupe.AnyPlanetLocationAlias && !dupe.ClosePlanetLocationAlias
    newLoc = Self.RefillPlanetLocationDirect(dupe)
  Else
    newLoc = Self.RefillPlanetLocationFromAliases(dupe)
  EndIf
  Return newLoc
EndFunction

Function CheckAndRefillPlanetDupes()
  Int I = PlanetAliasFillLookup.Length - 1
  sq_gravitationaltraitsscript:planetlocationlookup[] knownLocations = new sq_gravitationaltraitsscript:planetlocationlookup[0]
  While I >= 0
    Location loc = PlanetAliasFillLookup[I].TargetPlanetLocationAlias.GetLocation()
    If loc
      Int dupedIndex = knownLocations.findstruct("PlanetLocation", loc, 0)
      If dupedIndex >= 0
        Location newLoc = None
        newLoc = Self.RefillPlanetLocationDupe(PlanetAliasFillLookup[I])
        If !newLoc
          newLoc = Self.RefillPlanetLocationDupe(PlanetAliasFillLookup[knownLocations[dupedIndex].Index])
        EndIf
        If newLoc
          sq_gravitationaltraitsscript:planetlocationlookup newPlanetLocLookup = new sq_gravitationaltraitsscript:planetlocationlookup
          newPlanetLocLookup.PlanetLocation = loc
          newPlanetLocLookup.Index = I
          knownLocations.add(newPlanetLocLookup, 1)
        EndIf
      Else
        sq_gravitationaltraitsscript:planetlocationlookup newplanetloclookup = new sq_gravitationaltraitsscript:planetlocationlookup
        newplanetloclookup.PlanetLocation = loc
        newplanetloclookup.Index = I
        knownLocations.add(newplanetloclookup, 1)
      EndIf
    EndIf
    I -= 1
  EndWhile
EndFunction
