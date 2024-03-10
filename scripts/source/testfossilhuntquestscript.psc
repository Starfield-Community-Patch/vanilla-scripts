ScriptName TestFossilHuntQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LocTypeFossilTarget Auto Const mandatory
{ keyword on location we're looking for }
LocationAlias Property FossilPlanetLocation Auto Const mandatory
{ planet we're looking for fossil on }
LocationAlias Property FossilOverlayLocation Auto Const mandatory
{ overlay the player needs to enter to complete objective }
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property FossilScanStage = 50 Auto Const
Int Property FossilCollectStage = 100 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipScan")
EndEvent

Event ReferenceAlias.OnShipScan(ReferenceAlias akSource, Location aPlanet, ObjectReference[] aMarkersArray)
  If aPlanet == FossilPlanetLocation.GetLocation()
    Self.SetStage(FossilScanStage)
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipScan")
  EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() || (akSender as ObjectReference == PlayerShip.GetRef())
    If akNewLoc.HasKeyword(LocTypeFossilTarget) && FossilPlanetLocation.GetLocation().IsChild(akNewLoc) && akNewLoc == FossilOverlayLocation.GetLocation()
      Self.SetStage(FossilCollectStage)
      Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
    EndIf
  EndIf
EndEvent
