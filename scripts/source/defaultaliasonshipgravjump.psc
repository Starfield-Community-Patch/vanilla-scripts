ScriptName DefaultAliasOnShipGravJump Extends DefaultAliasParent default
{ Sets stage when THIS Alias Grav Jumps.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------
Location startingLocation

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
  Bool Property SetStageWhenJumpingComplete = True Auto Const
  { If true (default) stage will be set when Jump is complete; if false, stage will be set when jump begins. }
  Bool Property SetStageIfJumpingFails = False Auto Const
  { (Default: false) if true, stage will be set if Jump fails; if false, stage will be set if Jump does not fail. }
  Bool Property CheckDestinationLocation = True Auto Const
  { if true (default), <LocationToCheck> is the destination Location. If false, <LocationToCheck> is the starting location }
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

Event OnShipGravJump(Location aDestination, Int aState)
  If aState == 0
    startingLocation = Self.TryToGetCurrentLocation()
  EndIf
  Bool shouldSetStage = False
  If SetStageWhenJumpingComplete == True && aState == 2 || SetStageWhenJumpingComplete == False && aState == 0 || SetStageIfJumpingFails && aState == 3
    shouldSetStage = True
  EndIf
  If shouldSetStage
    Location locationToCheck = None
    If CheckDestinationLocation
      locationToCheck = aDestination
    Else
      locationToCheck = startingLocation
    EndIf
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, locationToCheck, None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndIf
EndEvent
