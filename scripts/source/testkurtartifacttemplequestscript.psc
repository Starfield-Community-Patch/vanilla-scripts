ScriptName TestKurtArtifactTempleQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
LocationAlias Property PlanetWithTrait Auto Const mandatory
Keyword Property LocTypeMajorOrbital Auto Const mandatory
LocationAlias Property TempleLocation Auto Const mandatory
Int Property LandingSetStage = 30 Auto Const
Int Property PowerSetStage = 50 Auto Const
ReferenceAlias Property TemplePowerTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipLanding")
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnExitShipInterior")
  Self.RegisterForRemoteEvent(TemplePowerTrigger as ScriptObject, "OnAliasChanged")
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSource, Bool abComplete)
  If abComplete
    Self.RefillTemple()
  EndIf
EndEvent

Function RefillTemple()
  Location landingLocation = PlayerShip.GetRef().GetCurrentLocation()
  Location planetLocation = PlanetWithTrait.GetLocation()
  If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
    TempleLocation.RefillAlias()
    TempleLocation.RefillDependentAliases()
  EndIf
EndFunction

Event Actor.OnExitShipInterior(Actor akSource, ObjectReference akShip)
  Location landingLocation = akShip.GetCurrentLocation()
  Location planetLocation = PlanetWithTrait.GetLocation()
  If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
    Self.SetStage(LandingSetStage)
  EndIf
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
EndEvent

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(sbpowercollectionactivatorscript akSender, Var[] akArgs)
  If (akSender as ObjectReference == TemplePowerTrigger.GetRef()) && Self.GetStageDone(PowerSetStage) == False
    Self.SetStage(PowerSetStage)
  EndIf
EndEvent
