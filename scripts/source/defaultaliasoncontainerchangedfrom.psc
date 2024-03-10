ScriptName DefaultAliasOnContainerChangedFrom Extends DefaultAlias default
{ Set stage when THIS Alias's container changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the container THIS object was removed from.
<LocationToCheck> is the current location of the container THIS object was removed from. }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  Location LocationToCheck = None
  If akOldContainer
    LocationToCheck = akOldContainer.GetCurrentLocation()
  EndIf
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akOldContainer, LocationToCheck, None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
