ScriptName OutpostStarstationActorScript Extends Actor

;-- Variables ---------------------------------------
Bool initialized = False
ObjectReference myOutpostObject
spaceshipreference orbitalShip
spaceshipreference orbitalStarstation

;-- Properties --------------------------------------
Keyword Property SQ_OutpostCreateStarstationStoryEvent Auto Const mandatory
{ used to create orbital marker }
Keyword Property LinkOutpostStarstationObject Auto Const mandatory
{ used to link actor to outpost functional proxy }
spaceshipbase Property OutpostStarstationShip01 Auto Const mandatory
{ use to create defense ships in orbit }
ObjectReference Property myLandingMarker Auto hidden
{ landing marker, set by Initialize }
sq_outpostcreatestarstationscript Property SQ_OutpostCreateStarstation Auto hidden
{ quest that holds orbital marker data }
ActorValue Property SpaceshipRegistration Auto Const mandatory
{ to register the starstation }
ActorValue Property PowerGenerated Auto Const mandatory
{ outpost stat }
ActorValue Property OutpostStarstationShips Auto Const mandatory
{ create ships in orbit to match this }
ActorValue Property OutpostScannerMultiplier Auto Const mandatory
{ outpost stat }
ActorValue Property OutpostScannerRadius Auto Const mandatory
{ outpost stat }
Float Property OutpostScannerMultBase = 5.0 Auto Const
{ this is what the outpost OutpostScannerMultiplier will be set to if the starstation OutpostScannerMultiplier > 0 }
Float Property OutpostScannerRadiusMax = 1000.0 Auto Const
{ outpost scanner radius can't exceed this no matter what value is on the starstation }

;-- Functions ---------------------------------------

Function Initialize(ObjectReference landingMarkerRef)
  If initialized == False
    myLandingMarker = landingMarkerRef
    myOutpostObject = myLandingMarker.GetLinkedRef(LinkOutpostStarstationObject)
    sq_outpostcreatestarstationscript[] createOrbitalQuests = SQ_OutpostCreateStarstationStoryEvent.SendStoryEventAndWait(None, myLandingMarker, None, 0, 0) as sq_outpostcreatestarstationscript[]
    If createOrbitalQuests.Length > 0
      SQ_OutpostCreateStarstation = createOrbitalQuests[0]
      While SQ_OutpostCreateStarstation.IsStarting()
        Utility.wait(0.5)
      EndWhile
      Self.CreateStarstation()
      initialized = True
    EndIf
  EndIf
EndFunction

Function Cleanup()
  If SQ_OutpostCreateStarstation
    SQ_OutpostCreateStarstation.Stop()
  EndIf
EndFunction

Function ModifyStarstation()
  If initialized
    ObjectReference myOrbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalMarker.GetRef()
    myOrbitMarker.ShowHangarMenu(0, Self as Actor, orbitalStarstation, False)
  EndIf
EndFunction

Function CreateStarstation()
  orbitalStarstation = SQ_OutpostCreateStarstation.Starstation.GetShipRef()
  ObjectReference myOrbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalMarker.GetRef()
  If orbitalStarstation
    orbitalStarstation.SetActorRefOwner(Self as Actor, False)
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerModifiedShip")
    sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript
    SQ_PlayerShip.AddPlayerOwnedShip(orbitalStarstation)
    orbitalStarstation.SetValue(SpaceshipRegistration, 1.0)
    Self.UpdateStarstationStats()
  EndIf
EndFunction

Event Actor.OnPlayerModifiedShip(Actor akSender, spaceshipreference akShip)
  If akShip == orbitalStarstation
    Self.UpdateStarstationStats()
  EndIf
EndEvent

Function UpdateStarstationStats()
  If orbitalStarstation
    Float powerStat = orbitalStarstation.GetValue(PowerGenerated)
    myOutpostObject.SetValue(PowerGenerated, powerStat)
    Float scanStat = orbitalStarstation.GetValue(OutpostScannerRadius)
    If scanStat > 0.0
      myOutpostObject.SetValue(OutpostScannerMultiplier, OutpostScannerMultBase)
      scanStat = Math.Min(scanStat, OutpostScannerRadiusMax)
      myOutpostObject.SetValue(OutpostScannerRadius, scanStat)
    Else
      myOutpostObject.SetValue(OutpostScannerMultiplier, 1.0)
      myOutpostObject.SetValue(OutpostScannerRadius, 0.0)
    EndIf
    Int shipsStat = orbitalStarstation.GetValueInt(OutpostStarstationShips)
    Int currentShipCount = SQ_OutpostCreateStarstation.Ships.GetCount()
    If shipsStat > currentShipCount
      Int numberToCreate = shipsStat - currentShipCount
      ObjectReference orbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalPatrolStart.GetRef()
      While numberToCreate > 0
        spaceshipreference newShip = orbitMarker.PlaceShipAtMe(OutpostStarstationShip01 as Form, 4, True, False, False, True, None, None, None, True)
        SQ_OutpostCreateStarstation.Ships.AddRef(newShip as ObjectReference)
        numberToCreate -= 1
      EndWhile
    ElseIf shipsStat < currentShipCount
      Int numberToDelete = currentShipCount - shipsStat
      While numberToDelete > 0
        ObjectReference shipToDelete = SQ_OutpostCreateStarstation.Ships.GetAt(0)
        SQ_OutpostCreateStarstation.Ships.RemoveRef(shipToDelete)
        shipToDelete.DisableNoWait(False)
        numberToDelete -= 1
      EndWhile
    EndIf
  EndIf
EndFunction

Function TestShowHangarMenu()
  myLandingMarker.ShowHangarMenu(0, Self as Actor, None, False)
EndFunction
