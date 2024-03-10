ScriptName DefaultRefOnRead Extends DefaultRefParent default
{ Sets quest stage when this reference has been read. }

;-- Functions ---------------------------------------

Event OnRead()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
