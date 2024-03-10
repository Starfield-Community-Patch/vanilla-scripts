ScriptName DefaultEnableDisableOnDeathScript Extends DefaultActorParent default
{ Enables/Disables THIS actor's linked ref, when THIS actor dies.
<RefToCheck> is the killer of THIS actor's reference.
<LocationToCheck> is the current location of THIS actor's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property UseOnDyingInstead = False Auto Const
  { (Default: false) If true, stage will be set when OnDying() event is sent. If false, stage will be sent with OnDeath() event is sent. }
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
  Bool Property EnableLinkedRef = True Auto Const
  { If true (default), enable THIS actor's linkedref when THIS actor dies. If false, disable THIS actor's linked ref when THIS actor dies. }
EndGroup

Group RefToCheck_Optional_Properties
  Bool Property PlayerOnly = False Auto Const
  { If true, <RefToCheck> must be player and all other <RefToCheck> properties will be IGNORED. }
  ObjectReference[] Property ReferencesToCheckAgainst Auto Const
  { <RefToCheck> must be one of these references. IGNORED if PlayerOnly is true. }
  ReferenceAlias[] Property AliasesToCheckAgainst Auto Const
  { <RefToCheck> must be one in one of these references. IGNORED if PlayerOnly is true. }
  Faction[] Property FactionsToCheckAgainst Auto Const
  { <RefToCheck> must be in one of these factions. IGNORED if PlayerOnly is true. }
EndGroup

Group LocationToCheck_Optional_Properties
  Location[] Property LocationsToCheckAgainst Auto Const
  { <LocationToCheck> must be one of these references }
  LocationAlias[] Property LocationAliasesToCheckAgainst Auto Const
  { <LocationToCheck> must be in one of these location aliases }
  Bool Property LocationMatchIfChild = False Auto Const
  { (Default: false) If true, <LocationToCheck> may be a child of locations in LocationsToCheck or LocationAliasesToCheck }
EndGroup


;-- Functions ---------------------------------------

Bool Function GetPlayerOnly()
  Return PlayerOnly
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return ReferencesToCheckAgainst
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return AliasesToCheckAgainst
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return FactionsToCheckAgainst
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return LocationsToCheckAgainst
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return LocationAliasesToCheckAgainst
EndFunction

Bool Function GetLocationMatchIfChild()
  Return LocationMatchIfChild
EndFunction

Event OnDeath(ObjectReference akKiller)
  If UseOnDyingInstead == False
    Self.DeathComplete(akKiller)
  EndIf
EndEvent

Event OnDying(ObjectReference akKiller)
  If UseOnDyingInstead == True
    Self.DeathComplete(akKiller)
  EndIf
EndEvent

Function DeathComplete(ObjectReference akKiller)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akKiller, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If EnableLinkedRef
    Self.GetLinkedRef(LinkedRefKeyword).Enable(False)
  Else
    Self.GetLinkedRef(LinkedRefKeyword).Enable(False)
  EndIf
EndFunction
