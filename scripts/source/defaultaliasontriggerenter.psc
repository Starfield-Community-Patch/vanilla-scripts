ScriptName DefaultAliasOnTriggerEnter Extends DefaultAlias default
{ Sets stage when THIS Alias entered.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference triggering THIS Alias.
<LocationToCheck> is the current location of THIS Alias. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property DeleteWhenTriggeredSuccessfully = True Auto Const
  { If true (default), delete THIS object when triggered successfully }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  SkipBusyState = True
  If PrereqStage > -1
    Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
  EndIf
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

Event Quest.OnStageSet(Quest akSource, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage
    ObjectReference myTrigger = Self.GetRef()
    If myTrigger
      ObjectReference[] refs = myTrigger.GetAllRefsInTrigger()
      Int I = 0
      While I < refs.Length
        Self.OnTriggerEnter(refs[I])
        I += 1
      EndWhile
    EndIf
  EndIf
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith
    Self.TryToDelete()
  EndIf
EndFunction
