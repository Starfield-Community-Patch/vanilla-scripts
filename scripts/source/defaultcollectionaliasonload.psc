ScriptName DefaultCollectionAliasOnLoad Extends DefaultCollectionAliasParent default
{ Sets stage when THIS RefCollection's members load.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSender)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
  Self.CheckAndSetStageAndCallDoSpecificThing(akSender, ParentScriptFunctionParams)
EndEvent
