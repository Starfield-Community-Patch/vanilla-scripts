ScriptName MQSpawnTempleScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property TempleLocationPlaced Auto Const mandatory
ReferenceAlias Property TemplePlacedMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Var[] kargs = new Var[2]
  kargs[0] = TempleLocationPlaced.GetLocation() as Var
  kargs[1] = TemplePlacedMapMarker.GetRef() as Var
  Self.SendCustomEvent("mqspawntemplescript_TempleSpawnedEvent", kargs)
  Self.Stop()
  Self.Reset()
EndEvent
