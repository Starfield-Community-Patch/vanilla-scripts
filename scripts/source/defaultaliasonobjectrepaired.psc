ScriptName DefaultAliasOnObjectRepaired Extends DefaultAlias default
{ Default script that sets a stage when the alias is repaired.
 TODO - TTP 25225 - OnObjectRepaired compiles but isn't listed on the CS Wiki; it's unclear if it works or not.
 TODO - TTP-27113: Default Scripts: make a Reference version of DefaultAliasOnObjectRepaired

Sets stage when THIS Alias is repaired.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the repairing reference.
<LocationToCheck> is the current location of THIS Alias. }

;-- Functions ---------------------------------------

Event OnObjectRepaired(ObjectReference akSource)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akSource, Self.TryToGetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
