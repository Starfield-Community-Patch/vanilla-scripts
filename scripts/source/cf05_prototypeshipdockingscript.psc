ScriptName CF05_PrototypeShipDockingScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property StateChangeMarker Auto Const mandatory
Location Property StationTheKeySpaceCellLocation Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Quest myQuest = Self.GetOwningQuest()
  Location currentLocation = Self.TryToGetCurrentLocation()
  spaceshipreference myShip = Self.GetShipRef()
  If myShip == akDocking && currentLocation == StationTheKeySpaceCellLocation
    StateChangeMarker.GetRef().EnableNoWait(False)
  EndIf
EndEvent

Event OnShipUndock(Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  Quest myQuest = Self.GetOwningQuest()
  Location currentLocation = Self.TryToGetCurrentLocation()
  spaceshipreference myShip = Self.GetShipRef()
  If myQuest.GetStageDone(1890) && !myQuest.GetStageDone(1900)
    myQuest.SetStage(1900)
  EndIf
  If myShip == akUndocking && currentLocation == StationTheKeySpaceCellLocation
    StateChangeMarker.GetRef().DisableNoWait(False)
  EndIf
EndEvent
