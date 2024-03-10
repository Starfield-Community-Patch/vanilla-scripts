ScriptName DefaultCollectionAliasOnCombatListAdd Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members add something to their combat list.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference THIS RefCollection's members are adding to their combat list
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Functions ---------------------------------------

Event OnCombatListAdded(ObjectReference akSenderRef, Actor akTarget)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akTarget as ObjectReference, akSenderRef.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent
