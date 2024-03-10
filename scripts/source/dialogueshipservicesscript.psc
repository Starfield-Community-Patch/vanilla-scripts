ScriptName DialogueShipServicesScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ autofill }
GlobalVariable Property ShipServicesFuelCurrent Auto Const mandatory
{ will be current fuel on player's ship }
GlobalVariable Property ShipServicesFuelAmount Auto Const mandatory
{ will be amount of fuel player needs to buy to top up }
GlobalVariable Property ShipServicesFuelCost Auto Const mandatory
{ will be cost of fuel amount needed }
ActorValue Property SpaceshipGravJumpFuel Auto Const mandatory
{ AV on ship that tracks fuel amount/capacity }
MiscObject Property InorgCommonHelium3 Auto Const mandatory
{ use to get price }
Float Property FuelCostMult = 1.0 Auto Const
{ multiplier on base value of He3 }
ActorValue Property Health Auto Const mandatory
{ autofill }
GlobalVariable Property ShipServicesRepairCost Auto Const mandatory
{ will be cost to fully repair ship }

;-- Functions ---------------------------------------

Function UpdateFuelGlobals()
  Float fuelCostPerUnit = InorgCommonHelium3.GetGoldValue() as Float
  spaceshipreference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
  Float fuelCurrent = 0.0
  Float fuelAmount = 0.0
  Float fuelCost = 0.0
  If playerShipRef
    fuelCurrent = playerShipRef.GetValue(SpaceshipGravJumpFuel)
    fuelAmount = playerShipRef.GetBaseValue(SpaceshipGravJumpFuel) - fuelCurrent
    fuelCost = Math.Round(fuelAmount * fuelCostPerUnit) as Float
  EndIf
  ShipServicesFuelCurrent.SetValue(fuelCurrent)
  ShipServicesFuelAmount.SetValue(fuelAmount)
  ShipServicesFuelCost.SetValue(fuelCost)
  Self.UpdateCurrentInstanceGlobal(ShipServicesFuelCurrent)
  Self.UpdateCurrentInstanceGlobal(ShipServicesFuelAmount)
  Self.UpdateCurrentInstanceGlobal(ShipServicesFuelCost)
EndFunction

Function RefuelPlayerShip()
  spaceshipreference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
  If playerShipRef
    Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, ShipServicesFuelCost.GetValueInt(), False, None)
    playerShipRef.RestoreValue(SpaceshipGravJumpFuel, ShipServicesFuelAmount.GetValue())
    Self.UpdateFuelGlobals()
  EndIf
EndFunction

Function RepairPlayerShip()
  spaceshipreference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
  If playerShipRef
    Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, ShipServicesRepairCost.GetValueInt(), False, None)
    playerShipRef.RestoreValue(Health, 99999.0)
  EndIf
EndFunction
