ScriptName DefaultActivateLinkedRefOnTrigger Extends DefaultRef default
{ Activates the specified linked ref when THIS object is entered.
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
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
  Bool Property ActivatorIsRefToCheck = True Auto Const
  { If true (default), Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object. }
  Bool Property ActivateOnTriggerEnter = True Auto Const
  { if true, will send activation OnTriggerEnter }
  Bool Property ActivateOnTriggerLeave = False Auto Const
  { if true, will send activation OnTriggerLeave }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If ActivateOnTriggerEnter
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If ActivateOnTriggerLeave
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndIf
EndEvent

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100)
  Else
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
  EndIf
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ObjectReference ActivatorRef = Self as ObjectReference
  If ActivatorIsRefToCheck
    ActivatorRef = ParentScriptFunctionParams.RefToCheck
  EndIf
  RefToDoThingWith.Activate(ActivatorRef, False)
EndFunction
