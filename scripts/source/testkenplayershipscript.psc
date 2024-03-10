ScriptName TestKenPlayerShipScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShipAlias Auto
ReferenceAlias Property PirateShipAlias Auto
ReferenceAlias Property LandMarkerAlias Auto
Cell Property cellToSpawn Auto Const mandatory

;-- Functions ---------------------------------------

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  ; Empty function
EndEvent

Event SpaceshipReference.OnLocationChange(spaceshipreference akSender, Location akOldLoc, Location akNewLoc)
  ; Empty function
EndEvent

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer()
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnExitShipInterior")
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnSit")
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
  spaceshipreference newShip = Game.GetPlayer().GetCurrentShipRef()
  PlayerShipAlias.ForceRefTo(newShip as ObjectReference)
  Self.RegisterForRemoteEvent(newShip as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnEnterShipInterior(Actor akSender, ObjectReference akShip)
  If akShip == Game.GetPlayerHomeSpaceShip() as ObjectReference
    PlayerShipAlias.ForceRefTo(akShip)
  EndIf
EndEvent

Function SpawnShip()
  spaceshipreference playerShipRef = PlayerShipAlias.GetShipRef()
  Float[] placePosition = new Float[3]
  placePosition[0] = 0.0
  placePosition[1] = 100.0
  placePosition[2] = 0.0
  Form PirateShipBase = Game.GetForm(3718863)
  spaceshipreference myNewShip = playerShipRef.PlaceShipAtMe(PirateShipBase, 4, True, False, False, False, placePosition, PirateShipAlias as Alias, None, True)
EndFunction

Function SpawnShipOnLand()
  ObjectReference LandMarkerRef = LandMarkerAlias.GetReference()
  Float[] placePosition = new Float[3]
  placePosition[0] = 0.0
  placePosition[1] = 0.0
  placePosition[2] = 0.0
  Form PirateShipBase = Game.GetForm(260894)
  spaceshipreference myNewShip = LandMarkerRef.PlaceShipAtMe(PirateShipBase, 4, True, False, True, False, placePosition, PirateShipAlias as Alias, None, True)
EndFunction

Function SpawnCell()
  spaceshipreference playerShipRef = PlayerShipAlias.GetShipRef()
  Cell newCell = playerShipRef.PlaceCellAtMe(cellToSpawn, None, False, True, False, None)
EndFunction
