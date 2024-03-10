ScriptName COM_Quest_SamCoe_ShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property PlayerShipInteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipModule Auto Const mandatory
ReferenceAlias Property LillianSceneMarker Auto Const mandatory
ReferenceAlias Property LillianHart Auto Const mandatory
Int Property LillianOnShipStage Auto Const mandatory
Int Property LillianOffShipStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == PlayerShipInteriorLocation.GetLocation()
    Alias_PlayerShipModule.RefillDependentAliases()
    Quest myQuest = Self.GetOwningQuest()
    If myQuest.GetStageDone(LillianOnShipStage) && !myQuest.GetStageDone(LillianOffShipStage)
      LillianHart.GetRef().MoveTo(LillianSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
EndEvent
