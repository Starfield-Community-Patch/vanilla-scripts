ScriptName DefaultCollectionAliasOnOpen Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members are opened.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference opening a ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akSenderRef, ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, akSenderRef.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent
