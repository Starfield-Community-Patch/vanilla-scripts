ScriptName DefaultRefAddFactionOnTriggerEnter Extends DefaultRef
{ Adds faction to linked ref and linked ref children when THIS object entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property DeleteWhenTriggeredSuccessfully = False Auto Const
  { (Default: false) If true, delete THIS object when triggered successfully. }
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
  Faction Property FactionToAdd Auto Const mandatory
  { faction to add to triggering actor }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100)
  Else
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
  EndIf
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  Actor actorRef = RefToDoThingWith as Actor
  If actorRef
    actorRef.AddToFaction(FactionToAdd)
  EndIf
  If DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith
    Self.Delete()
  EndIf
EndFunction
