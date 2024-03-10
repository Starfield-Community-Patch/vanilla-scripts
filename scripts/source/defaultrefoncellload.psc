ScriptName DefaultRefOnCellLoad Extends DefaultRefParent default
{ Sets quest stage when this reference's cell loads. }

;-- Functions ---------------------------------------

Event OnCellLoad()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
