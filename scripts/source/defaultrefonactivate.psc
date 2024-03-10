ScriptName DefaultRefOnActivate Extends DefaultRef default
{ Sets stage if a reference is activated.
<RefToCheck> is the reference activating THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
