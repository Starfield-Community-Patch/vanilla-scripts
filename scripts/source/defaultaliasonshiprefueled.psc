ScriptName DefaultAliasOnShipRefueled Extends DefaultAliasParent default
{ Sets stage when THIS Alias refuels.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group LocationToCheck_Optional_Properties
  Location[] Property LocationsToCheckAgainst Auto Const
  { <LocationToCheck> must be one of these references }
  LocationAlias[] Property LocationAliasesToCheckAgainst Auto Const
  { <LocationToCheck> must be in one of these location aliases }
  Bool Property LocationMatchIfChild = False Auto Const
  { (Default: false) If true, <LocationToCheck> may be a child of locations in LocationsToCheck or LocationAliasesToCheck }
EndGroup

Group Script_Specific_Properties
  ActorValue Property SpaceshipGravJumpFuel Auto Const mandatory
  { The actor value which holds current/max fuel value for ships }
  Bool Property RequireFullyRefueled = False Auto Const
  { If true (default), stage will be set when fueling is complete, only if completely refueled; if false, stage will be set when fueling completes, regardless of much fuel was added. }
EndGroup


;-- Functions ---------------------------------------

Location[] Function GetLocationsToCheckAgainst()
  Return LocationsToCheckAgainst
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return LocationAliasesToCheckAgainst
EndFunction

Bool Function GetLocationMatchIfChild()
  Return LocationMatchIfChild
EndFunction

Event OnShipRefueled(Int aFuelAdded)
  If aFuelAdded > 0
    If RequireFullyRefueled == False
      Self.RefuelSuccessful()
    Else
      ObjectReference shipRef = Self.GetRef()
      Float currentFuel = shipRef.GetValue(SpaceshipGravJumpFuel)
      If currentFuel >= shipRef.GetBaseValue(SpaceshipGravJumpFuel)
        Self.RefuelSuccessful()
      EndIf
    EndIf
  EndIf
EndEvent

Function RefuelSuccessful()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, Self.TryToGetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndFunction
