ScriptName SQ_TreasureMap_CreateMapScript Extends Quest
{ script to place and clean up treasure map into a container }

;-- Variables ---------------------------------------
Location locationToCheck
ObjectReference treasureMapRef

;-- Properties --------------------------------------
ReferenceAlias Property MapContainer Auto Const mandatory
{ put the treasure map in this }
LocationAlias Property MapLocation Auto Const mandatory
{ watch for player to leave this location - shut down quest and remove treasure map }
Form Property TreasureMap Auto Const mandatory
{ treasure map to place - usually a leveled list }
Keyword Property LocTypeSettlement Auto Const mandatory
{ used to get settlement parent location, if any }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference containerRef = MapContainer.GetRef()
  treasureMapRef = containerRef.PlaceAtMe(TreasureMap, 1, False, False, True, None, None, True)
  containerRef.AddItem(treasureMapRef as Form, 1, False)
  locationToCheck = MapLocation.GetLocation()
  Location[] settlementLocations = locationToCheck.GetParentLocations(LocTypeSettlement)
  If settlementLocations.Length > 0
    locationToCheck = settlementLocations[0]
  EndIf
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(treasureMapRef as ScriptObject, "OnContainerChanged")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() && akOldLoc == locationToCheck && (akNewLoc == None || akNewLoc.IsSameLocation(akOldLoc, LocTypeSettlement) == False)
    Self.Stop()
  EndIf
EndEvent

Event ObjectReference.OnContainerChanged(ObjectReference akSource, ObjectReference akNewContainer, ObjectReference akOldContainer)
  If akSource == treasureMapRef
    Self.Stop()
  EndIf
EndEvent

Event OnQuestShutdown()
  ObjectReference containerRef = MapContainer.GetRef()
  If treasureMapRef as Bool && containerRef as Bool
    containerRef.RemoveItem(treasureMapRef as Form, 1, False, None)
  EndIf
EndEvent
