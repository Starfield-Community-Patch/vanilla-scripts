ScriptName DefaultCollectionAliasOnActivate Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members are activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property ShouldDisableAfterSuccessfulActivation = False Auto Const
  { (Default: false) If true, disable after being successfully activated }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, akSenderRef.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent

Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If ShouldDisableAfterSuccessfulActivation
    RefCollectionMemberRef.Disable(False)
  EndIf
EndFunction
