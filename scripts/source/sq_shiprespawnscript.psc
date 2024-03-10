ScriptName SQ_ShipRespawnScript Extends Quest

;-- Variables ---------------------------------------
Int respawnAliasTimerID = 1 Const
ReferenceAlias[] respawnAliases
Int respawnShipTimerID = 2 Const
spaceshipreference[] respawnShips

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard respawnArrayGuard

;-- Properties --------------------------------------
ReferenceAlias Property ShipRespawnPoint Auto Const mandatory
{ where to respawn ships }
RefCollectionAlias Property ShipRespawnCollection Auto Const
{ OPTIONAL - if respawning ships in a ref collection }
Float Property respawnTimeSeconds = 120.0 Auto Const
{ how long between respawn tries }
ActorValue Property SpaceshipCrew Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    respawnAliases = new ReferenceAlias[0]
    respawnShips = new spaceshipreference[0]
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Function HandleShipDeath(ReferenceAlias shipAlias)
  If Self.AllowRespawn()
    Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Self.RespawnShip(shipAlias.GetShipRef(), shipAlias)
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Else
    Self.AddToRespawnArray(shipAlias)
  EndIf
EndFunction

Function HandleShipDeathCollection(spaceshipreference shipRef)
  If Self.AllowRespawn()
    Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Self.RespawnShip(shipRef, None)
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Else
    Self.AddToRespawnShipArray(shipRef)
  EndIf
EndFunction

Bool Function AllowRespawn()
  Bool bAllowRespawn = False
  ObjectReference respawnMarker = ShipRespawnPoint.GetRef()
  If respawnMarker
    planet respawnPlanet = respawnMarker.GetCurrentPlanet()
    spaceshipreference playerShipRef = Game.GetPlayer().GetCurrentShipRef()
    If playerShipRef == None || playerShipRef.IsInSpace() == False || playerShipRef.GetCurrentPlanet() != respawnPlanet
      bAllowRespawn = True
    EndIf
  EndIf
  Return bAllowRespawn
EndFunction

Function RespawnShip(spaceshipreference shipRef, ReferenceAlias shipAlias)
  ObjectReference respawnMarker = ShipRespawnPoint.GetRef()
  If respawnMarker as Bool && shipRef as Bool
    spaceshipbase baseShip = shipRef.GetBaseObject() as spaceshipbase
    If baseShip
      spaceshipreference newShipRef = respawnMarker.PlaceShipAtMe(baseShip as Form, 4, True, False, False, True, None, None, None, True)
      If shipAlias
        shipAlias.ForceRefTo(newShipRef as ObjectReference)
      Else
        ShipRespawnCollection.RemoveRef(shipRef as ObjectReference)
        ShipRespawnCollection.AddRef(newShipRef as ObjectReference)
      EndIf
      Int index = respawnAliases.find(shipAlias, 0)
      If index > -1
        respawnAliases.remove(index, 1)
      EndIf
      index = respawnShips.find(shipRef, 0)
      If index > -1
        respawnShips.remove(index, 1)
      EndIf
    EndIf
  EndIf
EndFunction

Function AddToRespawnArray(ReferenceAlias shipAlias)
  Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If respawnAliases.find(shipAlias, 0) < 0
      respawnAliases.add(shipAlias, 1)
      Self.StartTimer(respawnTimeSeconds, respawnAliasTimerID)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function AddToRespawnShipArray(spaceshipreference shipRef)
  Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If respawnShips.find(shipRef, 0) < 0
      respawnShips.add(shipRef, 1)
      Self.StartTimer(respawnTimeSeconds, respawnShipTimerID)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == respawnAliasTimerID || aiTimerID == respawnShipTimerID
    If Self.AllowRespawn()
      Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
        If aiTimerID == respawnAliasTimerID
          Int I = respawnAliases.Length - 1
          While I > -1
            Self.RespawnShip(respawnAliases[I].GetShipRef(), respawnAliases[I])
            I -= 1
          EndWhile
        ElseIf aiTimerID == respawnShipTimerID
          Int i = respawnShips.Length - 1
          While i > -1
            Self.RespawnShip(respawnShips[i], None)
            i -= 1
          EndWhile
        EndIf
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    Else
      Self.StartTimer(respawnTimeSeconds, aiTimerID)
    EndIf
  EndIf
EndEvent
