ScriptName DefaultStartQuestOnTriggerEnter Extends DefaultRefOnTriggerEnter default
{ Starts a quest when THIS reference's trigger is entered.
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
  Quest Property QuestToStart Auto Const mandatory
  { Quest that we want to start }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  QuestToStart.Start()
  Parent.DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith, LastRefToDoThingWith)
EndFunction
