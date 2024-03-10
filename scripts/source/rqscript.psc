ScriptName RQScript Extends Quest
{ Parent script that can be used directly or extended by other Random Quest scripts as required. }

;-- Variables ---------------------------------------
Int DialogueAV_LastHello = -1
rescript REScriptIns
Form previouslyRandomlySpawnedForm
planet questPlanet

;-- Properties --------------------------------------
Group Autofill
  sq_groups_questscript Property SQ_Groups Auto Const mandatory
  GlobalVariable Property RQ_Debug_SummonShipOnStart Auto Const mandatory
  ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
  ActorValue Property RQ_AV_PrimaryObjectiveFail Auto Const mandatory
  ActorValue Property RQ_AV_PrimaryObjectiveSuccess Auto Const mandatory
  ActorValue Property RQ_AV_Hello Auto Const mandatory
  ActorValue Property RQ_AV_SecondaryObjectiveKnown Auto Const mandatory
  ActorValue Property RQ_AV_SecondaryObjectiveFail Auto Const mandatory
  ActorValue Property RQ_AV_SecondaryObjectiveSuccess Auto Const mandatory
  ActorValue Property RQ_AV_EnemyGroup Auto Const mandatory
  ActorValue Property RQ_AV_Dungeon_LocTheme Auto Const mandatory
  rq_parentscript Property RQ_Parent Auto Const mandatory
  GlobalVariable Property RQ_Hello_NoneValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Calm_PreAcceptValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Calm_PostAcceptValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Calm_SuccessValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Calm_FailureValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Stressed_PreAcceptValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Stressed_PostAcceptValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Stressed_SuccessValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_Stressed_FailureValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_AboardShipValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_DepartingShipValue Auto Const mandatory
EndGroup

Group Dialogue_Variable_Handling
{ Calls to "SetDialogueAV_xxx()" functions will set AVs on DialogueAliases so we can conditionalize dialogue "imported" via "Use Dialogue Subtype" }
  Alias[] Property DialogueAliases Auto Const mandatory
  { Aliases in here will have actorvalues set on them via calls to "SetDialogueAV()" usually in quest stages. }
  ReferenceAlias Property RepresentativeEnemyAlias Auto Const
  { An alias holding a representative of the "enemy group" of the quest (ex: the Boss of a dungeon)
	This will be used to set the RQ_AV_EnemyGroup on DialogueAliases }
  LocationAlias Property DungeonLocationAlias Auto Const
  { An alias holding the dungeon location for the quest, if any. This is used to set the RQ_AV_Dungeon_LocTheme on DialogueAliases }
  GlobalVariable Property DialogueAV_Initial_Hello Auto Const mandatory
  { The initial Hello state for Actors in this RQ. }
  LocationAlias[] Property OwnedLocations Auto Const
  { An array holding any locations that should get ownership passed along by the starting quest (for settlement RQs) }
EndGroup

Group Quest_Giver_Handling
  ReferenceAlias Property Alias_ForcedPrimary Auto Const mandatory
  { An alias that represents the first NPC in a group spoken to at the outset of a quest. Filled by the Greeting scene. }
  ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
  { An alias that represents the Quest Giver. Assigned at runtime when the quest is initialized, and when ForcedPrimary (the first NPC the player decides to speak to) is assigned.
	  Used to refer back to this NPC after the Greeting Scene. }
  RefCollectionAlias Property RefCollectionToPromoteQuestGiverFromOnSpawn Auto Const
  { if not none, when the SpawnEvent comes from the DefaultGroupSpawnQuestEvent, the first actor in this RefCollection will be promoted to the Alias_QuestGiver and Alias_ForcedPrimary alias }
EndGroup

Group Locks_And_Keys
  Alias[] Property ObjectsToLock Auto Const
  Alias[] Property ObjectsToPutKeysIn Auto Const
  { will randonly put keys to ObjectsToLock in containers of ObjectsToPutKeysIn }
  RefCollectionAlias Property PlacedKeys Auto Const
  { will hold refs to keys that were created and placed }
EndGroup

Group Shutdown
  Alias[] Property ShutdownAliases Auto Const mandatory
  { Aliases that will be considered when determining shutdown logic }
  Int Property ShutdownStageRequired_Stage = 100 Auto Const
  { Prior to this stage being set, quest will shutdown when player leaves the planet.
	  After this stage is set, quest won't shutdown until ShutdownAllowed_Stage is set. }
  Int Property ShutdownAllowed_Stage Auto Const mandatory
  { Automated system (defined by ShutdownOn_ property below) will shutdown the quest only if this stage has been set. }
  Bool Property ShutdownAllowed_UnloadedOrDeadAlisaes = True Auto Const
  { If true (default), automated system (defined by ShutdownOn_ property) will shutdown the quest only if refs in ShutdownAliases have no 3d or are dead. }
  Bool Property ShutdownOn_LocationChange = True Auto Const
  { if true (default), will attempt to shut down when player changes locations }
  Bool Property AlsoCallShutDownOnREScript = True Auto Const
  { if true (default), when shutting down, will cast self as REScript and call the Shutdown() function on it }
EndGroup


;-- Functions ---------------------------------------

Function OnAliasChangedSpecific(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  ; Empty function
EndFunction

Function OnQuestGiverSet(ObjectReference akQuestGiver)
  ; Empty function
EndFunction

Function QuestStartedSpecific()
  ; Empty function
EndFunction

Event OnQuestStarted()
  REScriptIns = (Self as Quest) as rescript
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript
  If DefaultGroupSpawnQuestScriptIns
    Self.RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns as ScriptObject, "defaultgroupspawnquestscript_SpawnGroupDoneEvent")
  Else
    Self.InitializeNPCs()
  EndIf
  If ShutdownOn_LocationChange
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
    questPlanet = Game.GetPlayer().GetCurrentPlanet()
  EndIf
  Self.LockObjectsAndPlaceKeys()
  If RepresentativeEnemyAlias
    Self.SetDialogueAV_EnemyGroup()
  EndIf
  Self.RegisterForRemoteEvent(Alias_ForcedPrimary as ScriptObject, "OnAliasChanged")
  If RepresentativeEnemyAlias
    Self.RegisterForRemoteEvent(RepresentativeEnemyAlias as ScriptObject, "OnAliasChanged")
  EndIf
  Int I = 0
  While I < DialogueAliases.Length
    ReferenceAlias currentRefAlias = DialogueAliases[I] as ReferenceAlias
    RefCollectionAlias currentRefColAlias = DialogueAliases[I] as RefCollectionAlias
    If currentRefAlias
      Self.RegisterForRemoteEvent(currentRefAlias as ScriptObject, "OnAliasChanged")
    ElseIf currentRefColAlias
      Self.RegisterForRemoteEvent(currentRefColAlias as ScriptObject, "OnAliasChanged")
    EndIf
    I += 1
  EndWhile
  Self.QuestStartedSpecific()
EndEvent

Function SetLocationOwnership(Faction owningFaction)
  If owningFaction as Bool && OwnedLocations.Length > 0
    Int I = 0
    While I < OwnedLocations.Length
      Location ownedLocation = OwnedLocations[I].GetLocation()
      If ownedLocation
        ownedLocation.SetFactionOwner(owningFaction)
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  If RQ_Debug_SummonShipOnStart.GetValue() == 1.0
    (Game.GetPlayer() as debugplayersummonshipscript).DebugSummonShip()
  EndIf
EndEvent

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(defaultgroupspawnquestscript akSender, Var[] akArgs)
  defaultgroupspawnquestscript:spawngroupdoneeventargs spawnArgs = akArgs[0] as defaultgroupspawnquestscript:spawngroupdoneeventargs
  Int spawnGroupID = spawnArgs.SpawnGroupNumber
  sq_groupscript spawnedGroup = spawnArgs.spawnedGroup
  Self.InitializeNPCs()
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript
  Faction owningFaction = DefaultGroupSpawnQuestScriptIns.GetGroupOwnershipFaction(spawnGroupID)
  If owningFaction
    Self.SetLocationOwnership(owningFaction)
  EndIf
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If abRemove == False
    If akSender == RepresentativeEnemyAlias || DialogueAliases.find(akSender as Alias, 0) >= 0
      Self.SetDialogueAV_EnemyGroup()
    EndIf
    If akSender == Alias_ForcedPrimary
      Alias_QuestGiver.ForceRefTo(akObject)
      Self.OnQuestGiverSet(akObject)
    EndIf
    Self.SetDialogueAV_InitialHello()
  EndIf
  Self.OnAliasChangedSpecific(akSender, akObject, abRemove)
EndEvent

Function InitializeNPCs()
  If RefCollectionToPromoteQuestGiverFromOnSpawn
    If Alias_QuestGiver.GetActorRef() == None
      ObjectReference initialQuestGiverRef = RefCollectionToPromoteQuestGiverFromOnSpawn.GetAt(0)
      Alias_QuestGiver.ForceRefTo(initialQuestGiverRef)
    EndIf
  EndIf
EndFunction

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  If abRemove == False
    Self.SetDialogueAV_EnemyGroup()
  EndIf
  Self.SetDialogueAV_InitialHello()
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer()
    Self.CheckForShutdown(akNewLoc)
  EndIf
EndEvent

Function CheckForShutdown(Location akNewLoc)
  If Self.GetStageDone(ShutdownAllowed_Stage) && Self.ShutDownCheckAliases()
    Self.Shutdown()
  ElseIf (ShutdownStageRequired_Stage > -1 && Self.GetStageDone(ShutdownStageRequired_Stage) == False && questPlanet as Bool) && akNewLoc as Bool
    If Game.GetPlayer().GetCurrentPlanet() != questPlanet
      Self.Shutdown()
    EndIf
  EndIf
EndFunction

Function LockObjectsAndPlaceKeys()
  ObjectReference[] refsToLock = commonarrayfunctions.GetReferencesFromAliasArray(ObjectsToLock)
  ObjectReference[] refsToPutKeysIn = commonarrayfunctions.GetReferencesFromAliasArray(ObjectsToPutKeysIn)
  Int I = 0
  While I < refsToLock.Length
    ObjectReference currentRefToLock = refsToLock[I]
    Key keyToPlace = currentRefToLock.GetKey()
    If keyToPlace
      Int iRandom = Utility.RandomInt(0, refsToPutKeysIn.Length - 1)
      ObjectReference randomRef = refsToPutKeysIn[iRandom]
      ObjectReference keyRef = randomRef.PlaceAtMe(keyToPlace as Form, 1, False, True, True, None, None, True)
      randomRef.AddItem(keyRef as Form, 1, False)
      PlacedKeys.addREf(keyRef)
      keyRef.Enable(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function DebugMoveToKey(Int KeysIndex)
  Game.GetPlayer().MoveTo(PlacedKeys.GetAt(KeysIndex), 0.0, 0.0, 0.0, True, False)
EndFunction

Function SetDialogueAV(ActorValue AV, Int value)
  Int I = 0
  While I < DialogueAliases.Length
    ReferenceAlias refAlias = DialogueAliases[I] as ReferenceAlias
    RefCollectionAlias refColAlias = DialogueAliases[I] as RefCollectionAlias
    If refAlias
      refAlias.TryToSetValue(AV, value as Float)
    ElseIf refColAlias
      refColAlias.SetValue(AV, value as Float)
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetDialogueAV_Hello(Int value)
  DialogueAV_LastHello = value
  Self.SetDialogueAV(RQ_AV_Hello, value)
EndFunction

Function SetDialogueAV_PrimaryObjectiveKnown()
  Self.SetDialogueAV(RQ_AV_PrimaryObjectiveKnown, 1)
EndFunction

Function SetDialogueAV_PrimaryObjectiveFail()
  Self.SetDialogueAV(RQ_AV_PrimaryObjectiveFail, 1)
EndFunction

Function SetDialogueAV_PrimaryObjectiveSuccess()
  Self.SetDialogueAV(RQ_AV_PrimaryObjectiveSuccess, 1)
EndFunction

Function SetDialogueAV_SecondaryObjectiveKnown()
  Self.SetDialogueAV(RQ_AV_SecondaryObjectiveKnown, 1)
EndFunction

Function SetDialogueAV_SecondaryObjectiveFail()
  Self.SetDialogueAV(RQ_AV_SecondaryObjectiveFail, 1)
EndFunction

Function SetDialogueAV_SecondaryObjectiveSuccess()
  Self.SetDialogueAV(RQ_AV_SecondaryObjectiveSuccess, 1)
EndFunction

Function SetDialogueAV_InitialHello()
  If DialogueAV_LastHello == -1
    Self.SetDialogueAV_Hello(DialogueAV_Initial_Hello.GetValueInt())
  Else
    Self.SetDialogueAV_Hello(DialogueAV_LastHello)
  EndIf
EndFunction

Function SetDialogueAV_Hello_None()
  Self.SetDialogueAV_Hello(RQ_Hello_NoneValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Calm_PreAccept()
  Self.SetDialogueAV_Hello(RQ_Hello_Calm_PreAcceptValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Calm_PostAccept()
  Self.SetDialogueAV_Hello(RQ_Hello_Calm_PostAcceptValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Calm_Success()
  Self.SetDialogueAV_Hello(RQ_Hello_Calm_SuccessValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Calm_Failure()
  Self.SetDialogueAV_Hello(RQ_Hello_Calm_FailureValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Stressed_PreAccept()
  Self.SetDialogueAV_Hello(RQ_Hello_Stressed_PreAcceptValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Stressed_PostAccept()
  Self.SetDialogueAV_Hello(RQ_Hello_Stressed_PostAcceptValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Stressed_Success()
  Self.SetDialogueAV_Hello(RQ_Hello_Stressed_SuccessValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_Stressed_Failure()
  Self.SetDialogueAV_Hello(RQ_Hello_Stressed_FailureValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_AboardShip()
  Self.SetDialogueAV_Hello(RQ_Hello_AboardShipValue.GetValueInt())
EndFunction

Function SetDialogueAV_Hello_DepartingShip()
  Self.SetDialogueAV_Hello(RQ_Hello_DepartingShipValue.GetValueInt())
EndFunction

Function SetDialogueAV_EnemyGroup()
  If RepresentativeEnemyAlias
    Actor enemyActor = RepresentativeEnemyAlias.GetActorReference()
    If enemyActor
      Self.SetDialogueAV(RQ_AV_EnemyGroup, SQ_Groups.GetGroupFactionIDValueByActor(enemyActor, False))
    EndIf
  EndIf
EndFunction

Bool Function ShutDownCheckAliases()
  Bool returnVal = True
  If ShutdownAllowed_UnloadedOrDeadAlisaes
    ReferenceAlias[] refAliasArray = commonarrayfunctions.GetReferenceAliasesFromAliasArray(ShutdownAliases)
    RefCollectionAlias[] refColAliasArray = commonarrayfunctions.GetRefCollectionAliasesFromAliasArray(ShutdownAliases)
    Int count = commonarrayfunctions.GetCountLoadedAndAliveStateFromAliasArray(refAliasArray, True, True)
    If count == 0
      Int I = 0
      While count == 0 && I < refColAliasArray.Length
        count += refColAliasArray[I].GetCountAliveAnd3DLoaded()
        I += 1
      EndWhile
    EndIf
    If count > 0
      returnVal = False
    EndIf
  EndIf
  Return returnVal
EndFunction

Function Shutdown()
  If AlsoCallShutDownOnREScript && REScriptIns as Bool
    REScriptIns.Shutdown()
  EndIf
  Self.Stop()
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
