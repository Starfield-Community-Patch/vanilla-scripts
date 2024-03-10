ScriptName DefaultScriptFunctions Extends ScriptObject Const hidden

;-- Structs -----------------------------------------
Struct ParentScriptFunctionParams
  ObjectReference RefToCheck
  Location LocationToCheck
  Location LocationToCheckOther
EndStruct


;-- Functions ---------------------------------------

defaultscriptfunctions:parentscriptfunctionparams Function BuildParentScriptFunctionParams(ObjectReference RefToCheck, Location LocationToCheck, Location LocationToCheckOther) Global
  defaultscriptfunctions:parentscriptfunctionparams newParams = new defaultscriptfunctions:parentscriptfunctionparams
  newParams.RefToCheck = RefToCheck
  newParams.LocationToCheck = LocationToCheck
  newParams.LocationToCheckOther = LocationToCheckOther
  Return newParams
EndFunction

Bool Function TryToSetStage(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int StageToSet, Int PrereqStage, Int TurnOffStage, Int TurnOffStageDone, ObjectReference RefToCheck, Bool PlayerOnly, ObjectReference[] ReferencesToCheckAgainst, ReferenceAlias[] AliasesToCheckAgainst, Faction[] FactionsToCheckAgainst, Location LocationToCheck, Location LocationToCheckOther, Location[] LocationsToCheckAgainst, LocationAlias[] LocationAliasesToCheckAgainst, Bool LocationMatchIfChild, ObjectReference CheckAliveActorOrShip, Bool FailOnDeadActor, conditionform ConditionFormToTest) Global
  Bool returnVal = DefaultScriptFunctions.IsValidToSetStage(CallingObject, ShowNormalTrace, QuestToSet, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, PlayerOnly, ReferencesToCheckAgainst, AliasesToCheckAgainst, FactionsToCheckAgainst, LocationToCheck, LocationToCheckOther, LocationsToCheckAgainst, LocationAliasesToCheckAgainst, LocationMatchIfChild, CheckAliveActorOrShip, FailOnDeadActor, ConditionFormToTest)
  If returnVal
    DefaultScriptFunctions.SafeSetStage(CallingObject, ShowNormalTrace, QuestToSet, StageToSet)
  EndIf
  Return returnVal
EndFunction

Bool Function IsDead(ObjectReference ActorOrSpaceshipToTest) Global
  Actor actorRef = ActorOrSpaceshipToTest as Actor
  If actorRef
    Return actorRef.IsDead()
  Else
    spaceshipreference shipRef = ActorOrSpaceshipToTest as spaceshipreference
    If shipRef
      Return shipRef.IsDead()
    EndIf
  EndIf
  Return False
EndFunction

Bool Function IsValidToSetStage(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int StageToSet, Int PrereqStage, Int TurnOffStage, Int TurnOffStageDone, ObjectReference RefToCheck, Bool PlayerOnly, ObjectReference[] ReferencesToCheckAgainst, ReferenceAlias[] AliasesToCheckAgainst, Faction[] FactionsToCheckAgainst, Location LocationToCheck, Location LocationToCheckOther, Location[] LocationsToCheckAgainst, LocationAlias[] LocationAliasesToCheckAgainst, Bool LocationMatchIfChild, ObjectReference CheckAliveActorOrShip, Bool FailOnDeadActor, conditionform ConditionFormToTest) Global
  Bool returnVal = False
  returnVal = DefaultScriptFunctions.CheckForStages(CallingObject, ShowNormalTrace, QuestToSet, PrereqStage, TurnOffStage, TurnOffStageDone)
  If returnVal
    returnVal = DefaultScriptFunctions.CheckForConditionForm(CallingObject, ShowNormalTrace, ConditionFormToTest)
  EndIf
  If returnVal
    returnVal = DefaultScriptFunctions.CheckForAliveActor(CallingObject, ShowNormalTrace, CheckAliveActorOrShip, FailOnDeadActor)
  EndIf
  If returnVal
    returnVal = DefaultScriptFunctions.CheckForReferenceMatches(CallingObject, ShowNormalTrace, RefToCheck, PlayerOnly, ReferencesToCheckAgainst, AliasesToCheckAgainst, FactionsToCheckAgainst)
  EndIf
  If returnVal
    returnVal = DefaultScriptFunctions.CheckForLocationMatches(CallingObject, ShowNormalTrace, LocationToCheck, LocationToCheckOther, LocationsToCheckAgainst, LocationAliasesToCheckAgainst, LocationMatchIfChild)
  EndIf
  Return returnVal
EndFunction

Function SafeSetStage(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int StageToSet) Global
  If QuestToSet as Bool && StageToSet > -1
    QuestToSet.setStage(StageToSet)
  EndIf
EndFunction

Bool Function CheckForStages(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int PrereqStage, Int TurnOffStage, Int TurnOffStageDone) Global
  Bool returnVal = True
  If QuestToSet != None
    If PrereqStage > -1 && QuestToSet.GetStagedone(PrereqStage) == False
      returnVal = False
    ElseIf TurnOffStage > -1 && QuestToSet.GetStage() >= TurnOffStage
      returnVal = False
    ElseIf TurnOffStageDone > -1 && QuestToSet.GetStagedone(TurnOffStageDone) == True
      returnVal = False
    EndIf
  EndIf
  Return returnVal
EndFunction

Bool Function CheckForConditionForm(ScriptObject CallingObject, Bool ShowNormalTrace, conditionform ConditionFormToTest) Global
  Bool returnVal = (ConditionFormToTest as Bool == False) || ConditionFormToTest.IsTrue(None, None)
  Return returnVal
EndFunction

Bool Function CheckForAliveActor(ScriptObject CallingObject, Bool ShowNormalTrace, ObjectReference CheckAliveActorOrShip, Bool FailOnDeadActor) Global
  Bool returnVal = FailOnDeadActor == False || CheckAliveActorOrShip == None || DefaultScriptFunctions.IsDead(CheckAliveActorOrShip) == False
  Return returnVal
EndFunction

Bool Function CheckForReferenceMatches(ScriptObject CallingObject, Bool ShowNormalTrace, ObjectReference RefToCheck, Bool PlayerOnly, ObjectReference[] ReferencesToCheckAgainst, ReferenceAlias[] AliasesToCheckAgainst, Faction[] FactionsToCheckAgainst) Global
  Bool returnVal = False
  If PlayerOnly
    If (RefToCheck == Game.GetPlayer() as ObjectReference) || (RefToCheck == Game.GetPlayer().GetSpaceShip() as ObjectReference)
      returnVal = True
    EndIf
  ElseIf ReferencesToCheckAgainst.Length > 0 || AliasesToCheckAgainst.Length > 0 || FactionsToCheckAgainst.Length > 0
    If commonarrayfunctions.CheckObjectReferenceAgainstArray(RefToCheck, ReferencesToCheckAgainst, False) || commonarrayfunctions.CheckObjectReferenceAgainstReferenceAliasArray(RefToCheck, AliasesToCheckAgainst, False) || commonarrayfunctions.CheckActorAgainstFactionArray(RefToCheck as Actor, FactionsToCheckAgainst, False)
      returnVal = True
    EndIf
  Else
    returnVal = True
  EndIf
  Return returnVal
EndFunction

Bool Function CheckForLocationMatches(ScriptObject CallingObject, Bool ShowNormalTrace, Location LocationToCheck, Location LocationToCheckOther, Location[] LocationsToCheckAgainst, LocationAlias[] LocationAliasesToCheckAgainst, Bool LocationMatchIfChild) Global
  Bool returnVal = False
  If LocationsToCheckAgainst.Length > 0 || LocationAliasesToCheckAgainst.Length > 0
    If commonarrayfunctions.CheckLocationAgainstArray(LocationToCheck, LocationsToCheckAgainst, LocationToCheckOther, False, LocationMatchIfChild) || commonarrayfunctions.CheckLocationAgainstLocationAliasArray(LocationToCheck, LocationAliasesToCheckAgainst, LocationToCheckOther, False, LocationMatchIfChild)
      returnVal = True
    EndIf
  Else
    returnVal = True
  EndIf
  Return returnVal
EndFunction

Function Trace(ScriptObject CallingObject, String TextToPrint, Bool ShowNormalTrace, String CustomLog) Global
  Debug.TraceLog(CallingObject, TextToPrint, "DefaultScripts", "", 0, False, False, False, True)
  If CustomLog != ""
    Debug.TraceLog(CallingObject, TextToPrint, CustomLog, "", 0, False, False, False, True)
  EndIf
  If ShowNormalTrace
    Debug.Trace((" " + CallingObject as String) + ": " + TextToPrint, 0)
  EndIf
EndFunction

Function warning(ScriptObject CallingObject, String TextToPrint, String CustomLog) Global
  Debug.TraceLog(CallingObject, TextToPrint, "DefaultScripts", "", 0, False, True, False, True)
  If CustomLog != ""
    Debug.TraceLog(CallingObject, TextToPrint, CustomLog, "", 0, False, True, False, True)
  EndIf
EndFunction
