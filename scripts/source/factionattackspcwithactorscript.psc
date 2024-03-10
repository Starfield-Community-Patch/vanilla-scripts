ScriptName FactionAttacksPCWithActorScript Extends Actor conditional
{ If the Actor enters a given location then the specified faction goes temporarily hostile to the player }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property pLocation Auto
Faction Property pFactionToGoHostile Auto conditional
Message Property pMessage Auto conditional

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == pLocation
    pMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    pFactionToGoHostile.SetPlayerEnemy(True)
  EndIf
EndEvent
