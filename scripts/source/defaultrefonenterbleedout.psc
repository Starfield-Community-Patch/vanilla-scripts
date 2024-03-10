ScriptName DefaultRefOnEnterBleedout Extends DefaultActorParent default
{ Sets stage when THIS actor enters bleedout. }

;-- Functions ---------------------------------------

Event OnEnterBleedout()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Game.GetPlayer() as ObjectReference, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
