ScriptName DefaultRefEnableLinkedRefOnTrigger Extends DefaultRefOnTriggerEnter default
{ Enable or disable the specified linked ref when THIS object is triggered.
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
  { The Keyword of the LinkedRef you want to enable when THIS object is triggered. }
  Bool Property ShouldEnable = True Auto Const
  { If true (default) linkedref will be enabled. If false, linked ref will be disabled. }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100)
  Else
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
  EndIf
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If ShouldEnable
    RefToDoThingWith.Enable(False)
  Else
    RefToDoThingWith.Disable(False)
  EndIf
  Parent.DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith, LastRefToDoThingWith)
EndFunction
