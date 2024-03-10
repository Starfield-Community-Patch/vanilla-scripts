ScriptName DefaultAliasOnLocationChange Extends DefaultAliasParent
{ Sets stage if a THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is either the New or Old location. }

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
  Bool Property CheckNewLocation = True Auto Const
  { if true (default), <LocationToCheck> is the New Location. If false, <LocationToCheck> is the Old Location }
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

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Location LocToCheck = akOldLoc
  Location OtherLocToCheck = akNewLoc
  If CheckNewLocation
    LocToCheck = akNewLoc
    OtherLocToCheck = akOldLoc
  EndIf
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, LocToCheck, OtherLocToCheck)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
