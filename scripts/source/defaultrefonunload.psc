ScriptName DefaultRefOnUnload Extends DefaultRefParent default
{ Sets quest stage when this reference unloads. }

;-- Functions ---------------------------------------

Event OnUnload()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
