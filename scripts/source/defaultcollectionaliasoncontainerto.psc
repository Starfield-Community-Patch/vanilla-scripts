ScriptName DefaultCollectionAliasOnContainerTo Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members' container(s) change.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the PLAYER.
<LocationToCheck> is the current location of the container the object was moved to. }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akNewContainer, akOldContainer.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent
