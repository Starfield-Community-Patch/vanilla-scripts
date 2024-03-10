ScriptName MissionGetAllPlanetsScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
LocationAlias[] Property AllPlanets Auto Const mandatory
{ array of all planet location aliases }

;-- Functions ---------------------------------------

Int Function DebugGetPlanetCount()
  Int planetCount = 0
  Int I = 0
  While I < AllPlanets.Length
    Location thePlanet = AllPlanets[I].GetLocation()
    If thePlanet
      planetCount += 1
    EndIf
    I += 1
  EndWhile
  Debug.trace((Self as String + " DebugGetPlanetCount: ") + planetCount as String, 0)
  Return planetCount
EndFunction

Int Function GetSystemTraitValue()
  Int totalTraitValue = 0
  Int I = 0
  While I < AllPlanets.Length
    Location thePlanetLocation = AllPlanets[I].GetLocation()
    If thePlanetLocation
      planet thePlanet = thePlanetLocation.GetCurrentPlanet()
      Int planetTraitValue = SQ_Parent.GetPlanetTraitValue(thePlanet)
      totalTraitValue += planetTraitValue
    EndIf
    I += 1
  EndWhile
  Return totalTraitValue
EndFunction
