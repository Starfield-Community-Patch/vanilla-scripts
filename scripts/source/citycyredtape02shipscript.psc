ScriptName CityCYRedTape02ShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
ActorValue Property ShipSystemGravDriveHealth Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  spaceshipreference myHurstShip = Self.GetShipReference()
  myHurstShip.EnablePartRepair(ShipSystemEngineHealth, False)
  myHurstShip.DamageValue(ShipSystemEngineHealth, 100000.0)
  myHurstShip.DamageValue(ShipSystemGravDriveHealth, 100000.0)
EndEvent
