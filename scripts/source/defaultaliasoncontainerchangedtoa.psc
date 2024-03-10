ScriptName DefaultAliasOnContainerChangedToA Extends DefaultAlias default
{ Set stage when THIS object's container changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the container THIS object was moved to.
<LocationToCheck> is the current location of the container THIS object was moved to. }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akNewContainer, akOldContainer.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
