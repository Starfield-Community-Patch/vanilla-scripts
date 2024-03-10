ScriptName DefaultSendStoryEventOnLoad Extends DefaultRefParent default
{ Calls SendStoryEvent on the specified keyword when this object loads.
<RefToCheck> is THIS object.
<LocationToCheck> is the current location of THIS object.

Story Manager Data will be:
Ref1: THIS trigger object
Location: <LocationToCheck> }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Keyword Property StoryEventKeyword Auto Const mandatory
  { The Keyword you want to call SendStoryEvent for. }
  Int Property Value1 = 0 Auto Const
  { Will be sent as the aiValue1 parameter of the SendStoryEventAndWait() function. }
  Int Property Value2 = 0 Auto Const
  { Will be sent as the aiValue1 parameter of the SendStoryEventAndWait() function. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

Event OnLoad()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Self as ObjectReference, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  Location akLoc = ParentScriptFunctionParams.LocationToCheck
  ObjectReference akRef1 = Self as ObjectReference
  Int aiValue1 = Value1
  Int aiValue2 = Value2
  Quest[] startedQuests = StoryEventKeyword.SendStoryEventAndWait(akLoc, akRef1, None, aiValue1, aiValue2)
  Bool success = startedQuests.Length > 0
EndFunction
