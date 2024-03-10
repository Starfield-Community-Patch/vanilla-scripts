ScriptName DefaultAliasOnClose Extends DefaultAlias default
{ Sets quest stage when this reference is closed.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference opening THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Functions ---------------------------------------

Event OnClose(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
