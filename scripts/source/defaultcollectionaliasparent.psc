ScriptName DefaultCollectionAliasParent Extends RefCollectionAlias
{ Master script for the DefaultCollection scripts.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating/triggering/verbing each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------
ObjectReference[] TriggeredRefArray

;-- Properties --------------------------------------
Group Quest_Properties
  Int Property StageToSet = -1 Auto Const
  { MANDATORY *if* you are setting a quest stage; this is that stage. }
  Int Property PrereqStage = -1 Auto Const
  { <QuestToSetOrCheck> must have this specific stage set for this script's functionality to execute }
  Int Property TurnOffStage = -1 Auto Const
  { If <QuestToSetOrCheck>'s stage >= TurnOffStage, this script's functionality is ignored }
  Int Property TurnOffStageDone = -1 Auto Const
  { If <QuestToSetOrCheck>'s TurnOffStage has been specifically set , this script's functionality is ignored }
EndGroup

Group Script_Specific_Properties
  Bool Property xxxPlaceHolderForEmptyGroupxxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group RefCollection_Handling_Properties
  Bool Property OnFirstRef = False Auto Const
  { if true (default) script functionality will exectute when ANY ref in THIS refcollection is affected.
If false, script requires ALL refs in THIS recollection to be affected. }
  Int Property CountRemainingRequired = 0 Auto Const
  { exectute script functionality when all BUT this many refs are affected.
For example, to set a stage when all but three actors are killed, set this to 3 on the OnDeath script.
NOTE: this is IGNORED if OnFirstRef == True }
  GlobalVariable Property TotalRefCountGlobal Auto Const
  { This Global will be updated as each reference is affected - it will represent the TOTAL number of references in THIS refcollection }
  GlobalVariable Property AffectedRefCountGlobal Auto Const
  { This Global will be updated as each reference is affected - it will represent a count of the refs CURRENTLY in THIS refcollection *who have been affected.* }
  Bool Property UpdateCurrentInstanceCountGlobals = True Auto Const
  { Calls UpdateCurrentInstanceGlobal for TotalRefCountGlobal and AffectedRefCountGlobal at start up and AffectedRefCountGlobal when changed. }
  Bool Property ClearDisabledRefsOnInit = False Auto Const
  { if TRUE will clear disabled refs OnAliasInit }
EndGroup

Group RefToCheck_Optional_Properties
  Bool Property xxxPlaceHolderForEmptyGroup_RefToCheckxxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group LocationToCheck_Optional_Properties
  Bool Property xxxPlaceHolderForEmptyGroup_LocationToCheckxxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Optional_Properties
  Bool Property DoOnce = False Auto Const
  { (Default: false) If true, only execute this script's functionality once. 
NOTE: This must be false if you want to use AdditionalStageToSetWhenAllRefsAffected }
  conditionform Property ConditionFormToTest Auto Const
  { If set, this condition form must be true for script to excecute it's functionality }
EndGroup

Group Actor_Only_Properties
{ These properties only matter if THIS object is an Actor }
  Bool Property FailOnDeadActor = False Auto Const
  { (Default: false). If true, and if THIS object is an actor and is dead, ignore this script's functionality. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup

Bool Property SkipBusyState = True Auto hidden

;-- Functions ---------------------------------------

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ; Empty function
EndFunction

Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  ; Empty function
EndFunction

Event OnAliasInit()
  If ClearDisabledRefsOnInit
    Int disabledCount = Self.RemoveDisabled()
  EndIf
  If TotalRefCountGlobal != None
    TotalRefCountGlobal.SetValue(Self.GetCount() as Float)
  EndIf
  Self.UpdateInstanceGlobals()
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If TotalRefCountGlobal != None
    TotalRefCountGlobal.SetValue(Self.GetCount() as Float)
  EndIf
  Self.UpdateInstanceGlobals()
EndEvent

Event OnAliasShutdown()
  TriggeredRefArray.clear()
EndEvent

Bool Function AddTriggeredRefAndCheckTriggeredArray(ObjectReference TriggeredRef)
  Bool returnVal = OnFirstRef
  If returnVal == False
    If TriggeredRefArray == None
      TriggeredRefArray = new ObjectReference[0]
    EndIf
    If TriggeredRefArray.find(TriggeredRef, 0) < 0
      TriggeredRefArray.add(TriggeredRef, 1)
    EndIf
    Int I = 0
    Int iMax = Self.GetCount()
    Int countFound = 0
    While I < iMax
      If TriggeredRefArray.find(Self.GetAt(I), 0) >= 0
        countFound += 1
      EndIf
      I += 1
    EndWhile
    If TotalRefCountGlobal != None
      TotalRefCountGlobal.SetValue(iMax as Float)
    EndIf
    If AffectedRefCountGlobal != None
      AffectedRefCountGlobal.SetValue(countFound as Float)
    EndIf
    Self.UpdateInstanceGlobals()
    If countFound >= 1 && OnFirstRef || countFound + CountRemainingRequired >= iMax
      returnVal = True
    EndIf
  EndIf
  Return returnVal
EndFunction

Function UpdateInstanceGlobals()
  If UpdateCurrentInstanceCountGlobals
    If TotalRefCountGlobal != None
      Self.GetOwningQuest().UpdateCurrentInstanceGlobal(TotalRefCountGlobal)
    EndIf
    If AffectedRefCountGlobal != None
      Self.GetOwningQuest().UpdateCurrentInstanceGlobal(AffectedRefCountGlobal)
    EndIf
  EndIf
EndFunction

Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If SkipBusyState == False
    Self.GotoState("Busy")
  EndIf
  ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck
  Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck
  Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther
  If RefToCheck == None
    RefToCheck = RefCollectionMemberRef
  EndIf
  If LocationToCheck == None
    LocationToCheck = RefCollectionMemberRef.GetCurrentLocation()
  EndIf
  Quest QuestToSetOrCheck = Self.GetOwningQuest()
  Bool isValid = defaultscriptfunctions.IsValidToSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, Self.GetPlayerOnly(), Self.GetReferencesToCheckAgainst(), Self.GetAliasesToCheckAgainst(), Self.GetFactionsToCheckAgainst(), LocationToCheck, LocationToCheckOther, Self.GetLocationsToCheckAgainst(), Self.GetLocationAliasesToCheckAgainst(), Self.GetLocationMatchIfChild(), RefCollectionMemberRef, FailOnDeadActor, ConditionFormToTest)
  If isValid
    Self.DoSpecificThingForEachValidRef(RefCollectionMemberRef, ParentScriptFunctionParams)
    If Self.AddTriggeredRefAndCheckTriggeredArray(RefCollectionMemberRef)
      defaultscriptfunctions.SafeSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet)
      ObjectReference[] refsToDoThingsWith = Self.GetRefsToDoSpecificThingsWith()
      If refsToDoThingsWith
        Int I = 0
        Int iMax = refsToDoThingsWith.Length
        While I < iMax
          Bool isLastRef = !(I < iMax)
          Self.DoSpecificThing(ParentScriptFunctionParams, refsToDoThingsWith[I], isLastRef)
          I += 1
        EndWhile
      Else
        Self.DoSpecificThing(ParentScriptFunctionParams, None, True)
      EndIf
    EndIf
    If DoOnce
      Self.GotoState("Done")
    EndIf
  EndIf
  If Self.GetState() == "Busy"
    Self.GotoState("")
  EndIf
EndFunction

Function RegisterOnHitFilters()
  If Self.GetPlayerOnly()
    Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  Else
    Self.RegisterForHitEventAggressorRefArray(Self as ScriptObject, Self.GetReferencesToCheckAgainst(), None, None, -1, -1, -1, -1, True)
    Self.RegisterForHitEventAggressorRefAliasArray(Self as ScriptObject, Self.GetAliasesToCheckAgainst(), None, None, -1, -1, -1, -1, True)
    Self.RegisterForHitEventAggressorFactionArray(Self as ScriptObject, Self.GetFactionsToCheckAgainst(), None, None, -1, -1, -1, -1, True)
  EndIf
EndFunction

Bool Function GetPlayerOnly()
  Return False
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return None
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return None
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return None
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return None
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return None
EndFunction

Bool Function GetLocationMatchIfChild()
  Return False
EndFunction

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  Return None
EndFunction

;-- State -------------------------------------------
State Busy

  Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function
  EndFunction

  Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function
  EndFunction
EndState

;-- State -------------------------------------------
State Done

  Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function
  EndFunction

  Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function
  EndFunction
EndState
