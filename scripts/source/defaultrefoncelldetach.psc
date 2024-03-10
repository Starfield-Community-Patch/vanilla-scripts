ScriptName DefaultRefOnCellDetach Extends DefaultRefParent default
{ Sets quest stage when this reference's cell detaches. }

;-- Functions ---------------------------------------

Event OnCellDetach()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
