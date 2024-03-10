ScriptName SE_AF07Script Extends Quest

;-- Variables ---------------------------------------
Int currSpawned

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property EnemyShip Auto Const mandatory
spaceshipbase Property LvlShip_Ecliptic_A_Fighter Auto Const mandatory
Scene Property SE_AF07_001_SpawnScene Auto Const mandatory

;-- Functions ---------------------------------------

Function StartWaves()
  spaceshipreference currShip = EnemyShip.GetShipRef()
  currShip.EnableWithGravJump()
  SE_AF07_001_SpawnScene.start()
  Self.StartTimer(Utility.RandomInt(15, 20) as Float, 0)
EndFunction

Event OnTimer(Int aiTimerID)
  spaceshipreference ship = PlayerShip.GetShipRef()
  spaceshipreference enemyShipRef = ship.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter as Form, ship.CONST_NearPosition_ForwardWide, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct, 4, True, False, False, True, None)
  currSpawned += 1
  spaceshipreference enemyShipRef02 = ship.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter as Form, ship.CONST_NearPosition_ForwardWide, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct, 4, True, False, False, True, None)
EndEvent
