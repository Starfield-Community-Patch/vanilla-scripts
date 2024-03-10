ScriptName SQ_ActorRolesScript Extends Quest
{ Parent script for SQ_CompanionsScript, SQ_CrewScript, and SQ_FollowersScript }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Log_Names
  String Property MainLogName Auto Const mandatory
  String Property SubLogName Auto Const mandatory
EndGroup

Group Related_Quests_Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_preventrecalcscript Property SQ_PreventRecalc Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
EndGroup

Group Role_Available
  Alias Property Alias_Available Auto Const mandatory
  { can be a ReferenceAlias or a RefCollectionAlias, will hold actor(s) who are available to fill this role (ie could be made active through dialogue, etc.) }
  ActorValue Property AV_Available Auto Const mandatory
  { the actorvalue that will signify that the actor is available to fill this role (ie could be made active through dialogue, etc.) }
  Message Property AvailableMessage Auto Const mandatory
  { message to show when the actor is made available to fill this role (ie has been made available through dialogue, etc.) }
  Message Property NotAvailableMessage Auto Const mandatory
  { message to show when the actor is made no longer available to fill this role (ie has been made not available through dialogue, etc.) }
EndGroup

Group Role_Active
  Alias Property Alias_Active Auto Const mandatory
  { can be a ReferenceAlias or a RefCollectionAlias, will hold actor(s) who are actively filling this role (ie has been made active through dialogue, etc.) }
  ActorValue Property AV_Active Auto Const mandatory
  { the actorvalue that will signify that the actor is actively filling this role (ie has been made active through dialogue, etc.) }
  Message Property ActiveMessage Auto Const mandatory
  { message to show when the actor fills this role (ie has been made active through dialogue, etc.) }
  Message Property NotActiveMessage Auto Const mandatory
  { message to show when the actor no longer fills this role (ie has been made inactive through dialogue, etc.) }
EndGroup

Group TextReplacementAlias
  ReferenceAlias Property Alias_MessageTextReplaceActor Auto Const mandatory
  { alias to be temporarily forced into for using text replacement in messages }
  ReferenceAlias Property Alias_MessageTextReplaceRef Auto Const mandatory
  { alias to be temporarily forced into for using text replacement in messages }
  Keyword Property SQ_ActorRoles_SuppressMessages Auto Const mandatory
  { autofill; if keyword is on actor, it will suppress any messages about them in ShowTextReplacedMessage() }
EndGroup


;-- Functions ---------------------------------------

Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
  ; Empty function
EndFunction

Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
  ; Empty function
EndFunction

Function _CustomSetRoleInactive(Actor ActorToUpdate)
  ; Empty function
EndFunction

Function _CustomSetRoleUnavaliable(Actor ActorToUpdate)
  ; Empty function
EndFunction

Function SetRoleAvailable(Actor ActorToUpdate, Bool DisplayMessageIfChanged)
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Available, True)
  Self._UpdateActorValue(ActorToUpdate, AV_Available, True)
  If DisplayMessageIfChanged && changed
    Self.ShowTextReplacedMessage(ActorToUpdate, AvailableMessage, False, None, 0.0, 0.0)
  EndIf
  Self._CustomSetRoleAvaliable(ActorToUpdate)
  ActorToUpdate.EvaluatePackage(False)
EndFunction

Function SetRoleUnavailable(Actor ActorToUpdate, Bool DisplayMessageIfChanged)
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Available, False)
  Self._UpdateActorValue(ActorToUpdate, AV_Available, False)
  If DisplayMessageIfChanged && changed
    Self.ShowTextReplacedMessage(ActorToUpdate, NotAvailableMessage, False, None, 0.0, 0.0)
  EndIf
  Self._CustomSetRoleUnavaliable(ActorToUpdate)
  SQ_PreventRecalc.RemoveRef(ActorToUpdate as ObjectReference)
  ActorToUpdate.EvaluatePackage(False)
EndFunction

Function SetRoleActive(Actor ActorToUpdate, Bool DisplayMessageIfChanged, Bool AlsoSetAvailable, Float MessageFloat1, Float MessageFloat2)
  Actor priorActor = None
  If Alias_Active is ReferenceAlias
    priorActor = Self.GetActiveActor()
  EndIf
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Active, True)
  Self._UpdateActorValue(ActorToUpdate, AV_Active, True)
  If DisplayMessageIfChanged && changed
    Self.ShowTextReplacedMessage(ActorToUpdate, ActiveMessage, False, None, MessageFloat1, MessageFloat2)
  EndIf
  If AlsoSetAvailable
    Self.SetRoleAvailable(ActorToUpdate, False)
  EndIf
  Self._CustomSetRoleActive(ActorToUpdate, priorActor)
  ActorToUpdate.EvaluatePackage(False)
EndFunction

Function SetRoleInactive(Actor ActorToUpdate, Bool DisplayMessageIfChanged, Bool AlsoSetUnavailable, Bool AlsoDisplayUnavailableMessage)
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Active, False)
  Self._UpdateActorValue(ActorToUpdate, AV_Active, False)
  If DisplayMessageIfChanged && changed
    Self.ShowTextReplacedMessage(ActorToUpdate, NotActiveMessage, False, None, 0.0, 0.0)
  EndIf
  If AlsoSetUnavailable
    Self.SetRoleUnavailable(ActorToUpdate, AlsoDisplayUnavailableMessage)
  EndIf
  Self._CustomSetRoleInactive(ActorToUpdate)
  ActorToUpdate.EvaluatePackage(False)
EndFunction

Actor Function GetActiveActor()
  Return Self._GetRoleActor(Alias_Active)
EndFunction

Actor[] Function GetActiveActors()
  Return Self._GetRoleActors(Alias_Active)
EndFunction

Actor[] Function GetActiveActorsWithKeyword(Keyword KeywordToFind)
  Actor[] actorsToReturn = new Actor[0]
  Actor[] activeActors = Self.GetActiveActors()
  Int I = 0
  While I < activeActors.Length
    If activeActors[I].HasKeyword(KeywordToFind)
      actorsToReturn.add(activeActors[I], 1)
    EndIf
    I += 1
  EndWhile
  Return actorsToReturn
EndFunction

Actor Function GetAvailableActor()
  Return Self._GetRoleActor(Alias_Available)
EndFunction

Actor[] Function GetAvailableActors()
  Return Self._GetRoleActors(Alias_Available)
EndFunction

Actor Function _GetRoleActor(Alias RoleAlias)
  Return Self._GetRoleActors(RoleAlias)[0]
EndFunction

Actor[] Function _GetRoleActors(Alias RoleAlias)
  Actor[] roleActors = new Actor[0]
  ReferenceAlias refAlias = RoleAlias as ReferenceAlias
  If refAlias
    roleActors.add(refAlias.GetActorReference(), 1)
  Else
    roleActors = (RoleAlias as RefCollectionAlias).GetActorArray()
  EndIf
  Return roleActors
EndFunction

Bool Function IsRole(Actor ActorToCheck, Bool IncludeAvailable)
  Return Self.IsRoleActive(ActorToCheck) || IncludeAvailable && Self.IsRoleAvailable(ActorToCheck)
EndFunction

Bool Function IsRoleActive(Actor ActorToCheck)
  Return Self._CheckRole(ActorToCheck, Alias_Active)
EndFunction

Bool Function IsRoleAvailable(Actor ActorToCheck)
  Return Self._CheckRole(ActorToCheck, Alias_Available)
EndFunction

Bool Function _CheckRole(Actor ActorToCheck, Alias AliasToCheck)
  ReferenceAlias refAlias = AliasToCheck as ReferenceAlias
  If refAlias as Bool && (refAlias.GetReference() == ActorToCheck as ObjectReference)
    Return True
  Else
    RefCollectionAlias RefCollection = AliasToCheck as RefCollectionAlias
    If RefCollection as Bool && (AliasToCheck as RefCollectionAlias).Find(ActorToCheck as ObjectReference) >= 0
      Return True
    EndIf
  EndIf
  Return False
EndFunction

Bool Function _UpdateAlias(Actor ActorToUpdate, Alias AliasToUpdate, Bool PutIntoAlias)
  Bool changed = False
  RefCollectionAlias refCol = AliasToUpdate as RefCollectionAlias
  If refCol
    If PutIntoAlias
      changed = Self.AddRefWithReturn(refCol, ActorToUpdate as ObjectReference)
    Else
      changed = Self.RemoveREfWithReturn(refCol, ActorToUpdate as ObjectReference)
    EndIf
  Else
    ReferenceAlias refAlias = AliasToUpdate as ReferenceAlias
    If PutIntoAlias
      changed = Self.ForceRefWithReturn(refAlias, ActorToUpdate as ObjectReference)
    ElseIf refAlias.GetReference() == ActorToUpdate as ObjectReference
      changed = True
      refAlias.Clear()
    EndIf
  EndIf
  Return changed
EndFunction

Function _UpdateActorValue(Actor ActorToUpdate, ActorValue ActorValueToUpdate, Bool TurnOn)
  SQ_PreventRecalc.AddRef(ActorToUpdate as ObjectReference)
  Int value = 0
  If TurnOn
    value = 1
  EndIf
  ActorToUpdate.SetValue(ActorValueToUpdate, value as Float)
EndFunction

Function ShowTextReplacedMessage(Actor MessageTextReplaceActor, Message MessageToShow, Bool ShowAsHelpMessage, ObjectReference MessageTextReplaceRef, Float afArg1, Float afArg2)
  If MessageTextReplaceActor != None
    If MessageTextReplaceActor.HasKeyword(SQ_ActorRoles_SuppressMessages)
      
    Else
      Alias_MessageTextReplaceActor.ForceRefTo(MessageTextReplaceActor as ObjectReference)
      Alias_MessageTextReplaceRef.ForceRefTo(MessageTextReplaceRef)
      If ShowAsHelpMessage
        Float HelpMessageDuration = 3.0
        Float HelpMessageInterval = 3.0
        Int HelpMessageMaxTimes = 1
        String HelpMessageContext = ""
        Int HelpMessagePriority = 0
        MessageToShow.ShowAsHelpMessage("None", HelpMessageDuration, HelpMessageInterval, HelpMessageMaxTimes, HelpMessageContext, HelpMessagePriority, None)
      Else
        MessageToShow.Show(afArg1, afArg2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
      Alias_MessageTextReplaceActor.Clear()
    EndIf
  EndIf
EndFunction

Bool Function AddRefWithReturn(RefCollectionAlias refCol, ObjectReference RefToAddIfNotAlreadyPresent)
  Bool found = refCol.Find(RefToAddIfNotAlreadyPresent) >= 0
  If !found
    refCol.AddRef(RefToAddIfNotAlreadyPresent)
  EndIf
  Return !found
EndFunction

Bool Function RemoveREfWithReturn(RefCollectionAlias refCol, ObjectReference RefToRemoveIfPossible)
  Bool found = refCol.Find(RefToRemoveIfPossible) >= 0
  If found
    refCol.RemoveRef(RefToRemoveIfPossible)
  EndIf
  Return found
EndFunction

Bool Function ForceRefWithReturn(ReferenceAlias refAlias, ObjectReference RefToForceIfNotAlreadyPresent)
  Bool success = refAlias.GetReference() == RefToForceIfNotAlreadyPresent
  success = !success
  If success
    refAlias.ForceRefTo(RefToForceIfNotAlreadyPresent)
  EndIf
  Return success
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Bool returnVal = Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
  returnVal = returnVal && Debug.TraceLog(CallingObject, asTextToPrint, "ActorRoles", SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
  Return returnVal
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Bool returnVal = false
  returnVal = returnVal && false
  Return returnVal
EndFunction
