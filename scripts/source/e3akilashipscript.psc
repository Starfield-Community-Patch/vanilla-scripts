ScriptName E3AkilaShipScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property AkilaLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
spaceshipbase Property DefaultShip Auto Const mandatory

;-- Functions ---------------------------------------

Function SpawnAkilaShip(spaceshipbase ShiptoSpawn, Int shipTakeOffTimer, Bool StartLanded)
  If ShiptoSpawn == None
    ShiptoSpawn = DefaultShip
  EndIf
  spaceshipreference SpaceshipREF = AkilaLandingMarker.PlaceShipAtMe(ShiptoSpawn as Form, 4, True, False, True, True, None, None, None, True)
  If StartLanded
    SpaceshipREF.SetLinkedRef(AkilaLandingMarker, None, True)
  Else
    SpaceshipREF.SetLinkedRef(AkilaLandingMarker, SpaceshipEnabledLandingLink, True)
  EndIf
  SpaceshipREF.EnableNoWait(False)
  While SpaceshipREF.IsLanded() == False
    Utility.Wait(0.5)
  EndWhile
  If shipTakeOffTimer == 0
    shipTakeOffTimer = 5
  EndIf
  Utility.Wait(shipTakeOffTimer as Float)
  SpaceshipREF.TakeOff()
EndFunction
