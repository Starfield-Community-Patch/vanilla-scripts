ScriptName MissionDestinationFinderScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
missionparentscript Property MissionParent Auto Const mandatory
{ mission parent quest }
Keyword Property LocTypeMajorOrbital Auto Const mandatory
Keyword Property MissionBoardReserved Auto Const mandatory
{ used to tag "reserved" mission board refs }
LocationAlias Property SourcePlanet Auto Const mandatory
{ source planet location }
LocationAlias[] Property DestinationLocations Auto Const mandatory
{ array of destination locations }
RefCollectionAlias[] Property DestinationRefCollections Auto Const mandatory
{ array of collections holding destination ref }

;-- Functions ---------------------------------------

Bool Function FindMatchingDestination(missionparentscript:missionlocreftype[] cargoTypes, RefCollectionAlias SourceCollection, ReferenceAlias SourceAlias, ReferenceAlias DestinationAlias, LocationAlias DestinationLocationAlias)
  Bool foundValidDestination = False
  Form[] sourceMarkers = new Form[0]
  Int j = 0
  While j < SourceCollection.GetCount()
    ObjectReference sourceRef = SourceCollection.GetAt(j)
    If sourceRef.HasKeyword(MissionBoardReserved) == False
      sourceMarkers.add(sourceRef.GetBaseObject(), 1)
    EndIf
    j += 1
  EndWhile
  Int I = cargoTypes.Length - 1
  While I > -1
    If sourceMarkers.find(cargoTypes[I].cargoSourceBase, 0) < 0
      cargoTypes.remove(I, 1)
    EndIf
    I -= 1
  EndWhile
  If cargoTypes.Length > 0
    ObjectReference[] destinationRefs = new ObjectReference[0]
    Form[] destinationMarkers = new Form[0]
    Location sourcePlanetLocation = SourcePlanet.GetLocation()
    I = 0
    While I < DestinationLocations.Length
      Location theLocation = DestinationLocations[I].GetLocation()
      If theLocation as Bool && theLocation.IsSameLocation(sourcePlanetLocation, LocTypeMajorOrbital) == False
        RefCollectionAlias theCollection = DestinationRefCollections[I]
        If theLocation as Bool && theCollection.GetCount() > 0
          Int k = 0
          While k < theCollection.GetCount()
            destinationRefs.add(theCollection.GetAt(k), 1)
            k += 1
          EndWhile
        EndIf
      EndIf
      I += 1
    EndWhile
    j = 0
    While j < destinationRefs.Length
      ObjectReference destinationRef = destinationRefs[j]
      If destinationRef.HasKeyword(MissionBoardReserved) == False
        destinationMarkers.add(destinationRef.GetBaseObject(), 1)
      EndIf
      j += 1
    EndWhile
    I = destinationMarkers.Length - 1
    While I > -1
      Int cargoTypesIndex = cargoTypes.findstruct("cargoDestinationBase", destinationMarkers[I], 0)
      If cargoTypesIndex < 0
        destinationRefs.remove(I, 1)
        destinationMarkers.remove(I, 1)
      EndIf
      I -= 1
    EndWhile
    If destinationMarkers.Length > 0
      Self.DebugShowDestinationMarkers(destinationRefs)
      Int destinationRefIndex = Utility.RandomInt(0, destinationRefs.Length - 1)
      ObjectReference destinationref = destinationRefs[destinationRefIndex]
      If destinationref
        I = 0
        Location destinationLocation = None
        While I < DestinationRefCollections.Length && destinationLocation == None
          If DestinationRefCollections[I].Find(destinationref) > -1
            destinationLocation = DestinationLocations[I].GetLocation()
          EndIf
          I += 1
        EndWhile
        If destinationref as Bool && destinationLocation as Bool
          foundValidDestination = True
          DestinationAlias.ForceRefTo(destinationref)
          DestinationLocationAlias.ForceLocationTo(destinationLocation)
          Form destinationMarker = destinationMarkers[destinationRefIndex]
          Int cargoTypeIndex = cargoTypes.findstruct("cargoDestinationBase", destinationMarker, 0)
          Int sourceIndex = sourceMarkers.find(cargoTypes[cargoTypeIndex].cargoSourceBase, 0)
          Form sourceMarker = sourceMarkers[sourceIndex]
          j = 0
          ObjectReference sourceref = None
          While j < SourceCollection.GetCount() && sourceref == None
            ObjectReference collectionRef = SourceCollection.GetAt(j)
            If collectionRef.GetBaseObject() == sourceMarker
              sourceref = collectionRef
            EndIf
            j += 1
          EndWhile
          If sourceref
            SourceAlias.ForceRefTo(sourceref)
          EndIf
        EndIf
      EndIf
    EndIf
  EndIf
  Return foundValidDestination
EndFunction

Function DebugShowDestinationMarkers(ObjectReference[] destinationRefs)
  Int I = 0
  While I < destinationRefs.Length
    ObjectReference theRef = destinationRefs[I]
    I += 1
  EndWhile
EndFunction
