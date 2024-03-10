ScriptName DefaultAliasParent Extends ReferenceAlias hidden
{ Master script for the DefaultAlias scripts.
<QuestToSetOrCheck> is THIS ReferenceAlias's GetOwningQuest()
<RefToCheck> is the reference activating/triggering/verbing THIS ReferenceAlias.
<LocationToCheck> is the current location of THIS ReferenceAlias's reference. }

;-- Variables ---------------------------------------

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
  { (Default: false) If true, only execute this script's functionality once }
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

Bool Property SkipBusyState = False Auto hidden

;-- Functions ---------------------------------------

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ; Empty function
EndFunction

Function CheckAndSetStageAndCallDoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If SkipBusyState == False
    Self.GotoState("Busy")
  EndIf
  ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck
  Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck
  Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther
  If RefToCheck == None
    RefToCheck = Self.GetReference()
  EndIf
  If LocationToCheck == None
    LocationToCheck = Self.TryToGetCurrentLocation()
  EndIf
  Quest QuestToSetOrCheck = Self.GetOwningQuest()
  ObjectReference CheckAliveActorOrShip = Self.GetReference()
  Bool isValid = defaultscriptfunctions.IsValidToSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, Self.GetPlayerOnly(), Self.GetReferencesToCheckAgainst(), Self.GetAliasesToCheckAgainst(), Self.GetFactionsToCheckAgainst(), LocationToCheck, LocationToCheckOther, Self.GetLocationsToCheckAgainst(), Self.GetLocationAliasesToCheckAgainst(), Self.GetLocationMatchIfChild(), CheckAliveActorOrShip, FailOnDeadActor, ConditionFormToTest)
  If isValid
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

  Function CheckAndSetStageAndCallDoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function
  EndFunction
EndState

;-- State -------------------------------------------
State Done

  Function CheckAndSetStageAndCallDoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function
  EndFunction
EndState
