ScriptName DefaultActivateSelf Extends DefaultRef default
{ Activates itself when THIS object's OnTriggerEnter event fires.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Bool Property ActivatorIsRefToCheck = False Auto Const
  { (Default: false) If true, Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ObjectReference ActivatorRef = Self as ObjectReference
  If ActivatorIsRefToCheck
    ActivatorRef = ParentScriptFunctionParams.RefToCheck
  EndIf
  Self.Activate(ActivatorRef, False)
EndFunction
