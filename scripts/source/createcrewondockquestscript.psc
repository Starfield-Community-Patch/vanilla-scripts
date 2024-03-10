ScriptName CreateCrewOnDockQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property CrewCollection Auto Const
{ collection of crew actors }
ReferenceAlias[] Property CrewMarkers Auto Const
{ array of marker aliases for all crew }
ReferenceAlias[] Property CrewAliases Auto Const
{ array of ref aliases for individual crew actors }
ActorValue Property SpaceshipCrew Auto Const
{ tracks number of crew on a ship }
ReferenceAlias Property Ship Auto Const
ReferenceAlias Property PilotChair Auto Const

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference shipRef = Ship.GetRef()
  Self.RegisterForRemoteEvent((shipRef as spaceshipreference) as ScriptObject, "OnShipUndock")
  Int crewValue = shipRef.GetValue(SpaceshipCrew) as Int
  crewValue += -1
  Int I = 0
  While I < crewValue && I < CrewCollection.GetCount()
    Actor theCrew = CrewCollection.GetAt(I) as Actor
    If I < CrewMarkers.Length
      ObjectReference theMarker = CrewMarkers[I].GetRef()
      If theMarker
        theCrew.MoveTo(theMarker, 0.0, 0.0, 0.0, True, False)
        CrewAliases[I].ForceRefTo(theCrew as ObjectReference)
      EndIf
    EndIf
    theCrew.Enable(False)
    I += 1
  EndWhile
  ObjectReference pilotChairRef = PilotChair.GetRef()
  If pilotChairRef
    pilotChairRef.BlockActivation(True, False)
  EndIf
EndEvent

Event SpaceshipReference.OnShipUndock(spaceshipreference akSource, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  Self.Stop()
EndEvent

Function testShip()
  ObjectReference shipRef = Ship.GetRef()
EndFunction
