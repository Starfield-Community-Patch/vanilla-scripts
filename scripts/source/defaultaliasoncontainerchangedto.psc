ScriptName DefaultAliasOnContainerChangedTo Extends DefaultAlias default
{ Set stage when THIS object's container changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the container THIS object was moved to.
<LocationToCheck> is the current location of the container THIS object was moved to. }

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard EventGuard

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  Guard EventGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Location LocationToCheck = None
    If akOldContainer
      LocationToCheck = akOldContainer.GetCurrentLocation()
    EndIf
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akNewContainer, LocationToCheck, None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent
