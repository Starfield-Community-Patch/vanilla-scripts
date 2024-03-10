ScriptName DefaultRefOnLoad Extends DefaultRefParent default
{ Sets quest stage when this reference loads. }

;-- Functions ---------------------------------------

Event OnLoad()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
