ScriptName SQ_TrafficManagerScript Extends Quest
{ Quest script for Traffic Manager }

;-- Variables ---------------------------------------
spaceshipreference[] AllShips
Int CheckStateTimerID = 1 Const
Bool IsEntering
Float MaxRefreshTime
Float MinRefreshTime
FormList TrafficShiplist
Int despawnDist = 500 Const
Int maxShips
Float percentMaxSpeed = 1.0 Const

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_EnterPoints Auto Const mandatory
{ RC of markers that represent where ships are entering and leaving the planet's atmosphere }
RefCollectionAlias Property Alias_HoldPoints Auto Const mandatory
{ RC of markers that represent where ships might hold and park in the middle of the space }
RefCollectionAlias Property Alias_ExitPoints Auto Const mandatory
{ RC of markers that represent where ships are entering and leaving the planet's gravity well via grav jump }
RefCollectionAlias Property Alias_ShipsTransitNoWaitEntering Auto Const mandatory
RefCollectionAlias Property Alias_ShipsTransitNoWaitExiting Auto Const mandatory
{ RCs to hold ships that are going to fly straight through without waiting. Different group for different behaviors }
ReferenceAlias Property Alias_Settings Auto Const mandatory
{ Object in the cell that holds all of the settings }
ReferenceAlias Property PlayerShip Auto Const mandatory
{ PlayerShip Alias }
LocationAlias Property PlayerShipLocation Auto Const mandatory
Keyword Property LinkKeywordHold Auto Const mandatory
{ Keyword to define the hold point the ships are linked to, referred to by it's package }
Keyword Property LinkKeywordDestination Auto Const mandatory
{ Keyword to define the destination the ships are linked to, referred to by it's package }
Keyword Property SQ_TrafficManager_ToDelete Auto Const mandatory
{ Keyword to mark ships that are disabled and ready to be deleted }

;-- Functions ---------------------------------------

Event OnQuestinit()
  ObjectReference SettingsMarker = Alias_Settings.GetRef()
  sq_trafficmanagersettingsscript SettingsScript = SettingsMarker as sq_trafficmanagersettingsscript
  maxShips = SettingsScript.maxShips
  TrafficShiplist = SettingsScript.TrafficShiplist
  MinRefreshTime = SettingsScript.MinRefreshTime
  MaxRefreshTime = SettingsScript.MaxRefreshTime
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
  AllShips = new spaceshipreference[0]
  ObjectReference[] myObjectRefs = Alias_ShipsTransitNoWaitEntering.GetArray()
  spaceshipreference[] myShipRefs = myObjectRefs as spaceshipreference[]
  Int I = 0
  While I < myShipRefs.Length
    AllShips.add(myShipRefs[I], 1)
    I += 1
  EndWhile
  myObjectRefs = Alias_ShipsTransitNoWaitExiting.GetArray()
  myShipRefs = myObjectRefs as spaceshipreference[]
  I = 0
  While I < myShipRefs.Length
    AllShips.add(myShipRefs[I], 1)
    I += 1
  EndWhile
  Self.CheckState()
EndEvent

Function SpawnShip()
  spaceshipreference newShip = None
  ObjectReference DestinationLink = None
  If IsEntering == True
    Int tempSpawnPoint = Utility.RandomInt(0, Alias_ExitPoints.GetCount() - 1)
    Int tempDestinationPoint = Utility.RandomInt(0, Alias_EnterPoints.GetCount() - 1)
    ObjectReference spawnMarkerRef = Alias_ExitPoints.GetAt(tempSpawnPoint)
    DestinationLink = Alias_EnterPoints.GetAt(tempDestinationPoint)
    newShip = spawnMarkerRef.PlaceShipAtMe(TrafficShiplist.GetAt(Utility.RandomInt(0, TrafficShiplist.GetSize() - 1)), 4, False, False, True, True, None, None, None, True)
    newShip.EnableWithGravJump()
    Alias_ShipsTransitNoWaitEntering.AddRef(newShip as ObjectReference)
    IsEntering = False
  ElseIf IsEntering == False
    Int tempspawnpoint = Utility.RandomInt(0, Alias_EnterPoints.GetCount() - 1)
    Int tempdestinationpoint = Utility.RandomInt(0, Alias_ExitPoints.GetCount() - 1)
    ObjectReference spawnmarkerref = Alias_EnterPoints.GetAt(tempspawnpoint)
    DestinationLink = Alias_ExitPoints.GetAt(tempdestinationpoint)
    newShip = spawnmarkerref.PlaceShipAtMe(TrafficShiplist.GetAt(Utility.RandomInt(0, TrafficShiplist.GetSize() - 1)), 4, False, False, True, True, None, None, None, True)
    newShip.EnableWithGravJump()
    Alias_ShipsTransitNoWaitExiting.AddRef(newShip as ObjectReference)
    IsEntering = True
  EndIf
  newShip.SetLinkedRef(DestinationLink, LinkKeywordDestination, False)
  newShip.SetForwardVelocity(percentMaxSpeed)
  AllShips.add(newShip, 1)
EndFunction

Function CheckState()
  Int I = AllShips.Length - 1
  While I >= 0
    spaceshipreference currentShip = AllShips[I]
    If currentShip.HasKeyword(SQ_TrafficManager_ToDelete)
      AllShips.remove(I, 1)
      currentShip.Disable(False)
    EndIf
    If currentShip.GetDistance(currentShip.GetLinkedRef(LinkKeywordDestination)) < despawnDist as Float
      If currentShip.GetLinkedRef(LinkKeywordHold) != None
        Alias_HoldPoints.AddRef(currentShip.GetLinkedRef(LinkKeywordHold))
      EndIf
      If Alias_ShipsTransitNoWaitExiting.Find(currentShip as ObjectReference) >= 0
        Alias_ShipsTransitNoWaitExiting.RemoveRef(currentShip as ObjectReference)
        currentShip.DisableWithGravJumpNoWait()
        currentShip.AddKeyword(SQ_TrafficManager_ToDelete)
      ElseIf Alias_ShipsTransitNoWaitEntering.Find(currentShip as ObjectReference) >= 0
        Alias_ShipsTransitNoWaitEntering.RemoveRef(currentShip as ObjectReference)
        currentShip.DisableWithTakeOffOrLandingNoWait()
        currentShip.AddKeyword(SQ_TrafficManager_ToDelete)
      EndIf
    EndIf
    I -= 1
  EndWhile
  If AllShips.Length < maxShips
    Self.SpawnShip()
  EndIf
  Float TimerDuration = Utility.RandomFloat(MinRefreshTime, MaxRefreshTime)
  Self.StartTimer(TimerDuration, CheckStateTimerID)
EndFunction

Event OnTimer(Int timerID)
  If timerID == CheckStateTimerID
    Self.CheckState()
  EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
  If akNewLoc != PlayerShipLocation.GetLocation()
    Int I = AllShips.Length - 1
    While I >= 0
      spaceshipreference currentShip = AllShips[I]
      currentShip.SetLinkedRef(None, LinkKeywordDestination, False)
      currentShip.DisableNoWait(False)
      I -= 1
    EndWhile
    AllShips.clear()
    Self.Stop()
  EndIf
EndEvent
