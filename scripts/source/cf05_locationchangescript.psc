ScriptName CF05_LocationChangeScript Extends ReferenceAlias
{ Prevent player from destroying a quest essential ship while also keeping them from being invicible while piloting it }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property CF05_Location_PrototypeInterior Auto Const mandatory
ReferenceAlias Property CF05_PrototypeShip Auto Const mandatory
Int Property StageToCheck Auto Const mandatory
Quest Property CF05 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If CF05.GetStageDone(StageToCheck)
    If akNewLoc == CF05_Location_PrototypeInterior.GetLocation()
      CF05_PrototypeShip.GetShipRef().SetEssential(False)
    Else
      CF05_PrototypeShip.GetShipRef().SetEssential(True)
    EndIf
  EndIf
EndEvent
