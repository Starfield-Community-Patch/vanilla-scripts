ScriptName LocationAlias Extends Alias Native hidden

;-- Functions ---------------------------------------

Function Clear() Native

Function ForceLocationTo(Location akNewLocation) Native

Location Function GetLocation() Native

Function ClearAndRefillAlias()
  Self.Clear()
  Self.RefillAlias()
EndFunction
