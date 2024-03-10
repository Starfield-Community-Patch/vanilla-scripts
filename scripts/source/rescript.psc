ScriptName REScript Extends Quest
{ Extends Quest. Used for Random Encounter quests, has common properties, functions, etc. }

;-- Structs -----------------------------------------
Struct DeadCount
  Int groupSize
  Int stageToSet
  String description
  Int currentCount
EndStruct


;-- Variables ---------------------------------------
customlogs:logdatum[] logs
Int startupTimerID = 99 Const
Float startupTimerLength = 30.0 Const

;-- Properties --------------------------------------
Group Registration
  ReferenceAlias[] Property RegisteredAliases Auto hidden
  { leave empty - this will get filled in at runtime }
  RefCollectionAlias[] Property RegisteredCollectionAliases Auto hidden
  { leave empty - this will get filled in at runtime }
  Bool Property StopQuestWhenAliasesUnloaded = False Auto
  { Default = true, once all the aliases are unloaded, the quest should stop }
  Bool Property StopQuestWhenAliasesDead = False Auto
  { Default = false, once all the aliases are dead, the quest should stop }
  Bool Property StopQuestWhenPlayerLeavesPlanet = True Auto
  { Default = true, once player is not on planet, quest should stop }
  Int Property StopStage = -1 Auto Const
  { optional - if left at -1, Stop will be called on the quest; otherwise, this stage will be set when the quest wants to "Stop"
		this is for special cases where you actually need the quest to stay running }
EndGroup

Group Cooldown
  GlobalVariable Property CooldownTimestamp Auto Const
  { OPTIONAL - if provided, this will be set with the timestamp of gameDaysPassed + cooldownHours when the player encounters this RE }
  Float Property cooldownHours = 24.0 Auto
  { how many hours to add to current time when CooldownTimestamp is set? }
  Bool Property setCooldownOnLoad = True Auto Const
  { default - set cooldown when trigger loads 
		if you set this to false, quest will need to call SetCooldown() from a quest stage }
EndGroup

Group Timers
  Int[] Property TimerStages Auto Const
  { quest stages when the timer with ID matching the array index is received
	for example, if you start timer 0, the stage in TimerStages[0] will be set when that timer expires }
  Bool Property SetResetTimer = True Auto Const
  { Should this quest set the Reset Timer on the RETriggerScript }
EndGroup

Group Traces_Settings
{ Trace Severity adjusts how many things are output to the log: ... Genesis\Build\PC\Logs\Script\User }
  Bool Property ShowTraces = True Auto Const
  { If set to FALSE, all other Trace options are ignored. }
  Bool Property TerseLog = True Auto Const
  { If set to TRUE, minimizes the output to the log for each printed line. }
  Bool Property DebugMode = True Auto Const
  { When True = DebugMode Active. Adds verbose and thorough debugging traces when other Trace settings permit them.
	e.g. if you have Traces turned off for Objects, DebugMode wouldn't display extra Debug data about Objects even if DebugMode was on. }
EndGroup

Group Log_Names
  String Property LocalScriptName = "REScript" Auto
  { This should remain as-is for log purposes. This is used to provide you with a more succinct log print-out. }
  String Property MainLogName = "OverlayEncounters" Auto Const
  { OPTIONAL: Modify with your specific OE Name, if desired. This is the name of your log in Genesis\Build\PC\Logs\Script\User }
  String Property SubLogName = "Warnings" Auto Const
  { OPTIONAL: Leave as Warnings -- this appends to the MainLogName with its own file for serious issues. }
EndGroup

reparentscript Property RE_Parent Auto Const mandatory
{ MANDATORY: All RExx quests must set this property. Pointer to REParentScript on REParent Quest }
retriggerscript Property myTrigger Auto hidden
{ The trigger associated with this RE. }
ReferenceAlias Property MapMarker Auto Const
{ OPTIONAL: map marker }
rescript:deadcount[] Property DeadCountGroups Auto
{ OPTIONAL: used to track dead counts of multiple groups for quest purposes
  If using, set up this array with the data for each group:
	groupSize: total number of actors in group
	stageToSet: quest stage to set when dead count reaches groupSize
	description: Optional - description of each group }
Bool Property bFinishedOnStoryEvent = False Auto hidden

;-- Functions ---------------------------------------

Function RegisterAlias(ReferenceAlias newAlias)
  If !RegisteredAliases
    RegisteredAliases = new ReferenceAlias[0]
  EndIf
  RegisteredAliases.add(newAlias, 1)
EndFunction

Function RegisterCollectionAlias(RefCollectionAlias newCollectionAlias)
  If !RegisteredCollectionAliases
    RegisteredCollectionAliases = new RefCollectionAlias[0]
  EndIf
  RegisteredCollectionAliases.add(newCollectionAlias, 1)
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  myTrigger = akRef1 as retriggerscript
  Self.SetTrigger(myTrigger)
  bFinishedOnStoryEvent = True
EndEvent

Event OnQuestStarted()
  If Self as oescript
    LocalScriptName = "oescript"
  EndIf
  Self.DefineCustomLogs()
  Int failsafeCounter = 20
  While bFinishedOnStoryEvent == False && failsafeCounter > 0
    Utility.wait(0.100000001)
    failsafeCounter -= 1
  EndWhile
  Self.StartTimer(startupTimerLength, startupTimerID)
  RE_Parent.UpdateGlobalCooldown()
  If (setCooldownOnLoad && myTrigger as Bool) && myTrigger.Is3DLoaded()
    Self.SetCooldown()
  EndIf
EndEvent

Function SetTrigger(retriggerscript akTrigger)
  myTrigger = akTrigger
  If myTrigger
    myTrigger.QuestStarted(Self)
    If setCooldownOnLoad
      Self.RegisterForRemoteEvent(myTrigger as ScriptObject, "OnLoad")
    EndIf
  EndIf
EndFunction

Function SetCooldown()
  If CooldownTimestamp
    Float currentGameTime = Utility.GetCurrentGameTime()
    Float cooldownDays = cooldownHours / 24.0
    CooldownTimestamp.SetValue(currentGameTime + cooldownDays)
  EndIf
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSource)
  If setCooldownOnLoad
    Self.SetCooldown()
  EndIf
EndEvent

Function StartTimerForTimerStage(Float timerSeconds, Int aiTimerID)
  Self.StartTimer(timerSeconds, aiTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID
    Self.RegisterForCustomEvent(RE_Parent as ScriptObject, "reparentscript_RECheckForCleanup")
  Else
    Self.CheckForTimerStage(aiTimerID)
  EndIf
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  Self.CheckForTimerStage(aiTimerID)
EndEvent

Function CheckForTimerStage(Int aiTimerID)
  If (Self.IsRunning() && TimerStages as Bool) && aiTimerID < TimerStages.Length
    Self.SetStage(TimerStages[aiTimerID])
  EndIf
EndFunction

Event REParentScript.RECheckForCleanup(reparentscript akSender, Var[] akArgs)
  Self.CheckForCleanup()
EndEvent

Function CheckForCleanup()
  Bool shouldShutDown = False
  If StopQuestWhenPlayerLeavesPlanet
    If myTrigger as Bool && myTrigger.GetCurrentPlanet() != Game.GetPlayer().GetCurrentPlanet()
      shouldShutDown = True
    EndIf
  EndIf
  If shouldShutDown == False && (StopQuestWhenAliasesUnloaded || StopQuestWhenAliasesDead)
    Int iDeadCount = 0
    Int iUnloadedCount = 0
    Int iCollectionIndex = 0
    Int iCollectionRefCount = 0
    Int registeredRefCollectionCount = RegisteredCollectionAliases.Length
    While iCollectionIndex < registeredRefCollectionCount
      RefCollectionAlias registeredCollection = RegisteredCollectionAliases[iCollectionIndex]
      Int I = 0
      iCollectionRefCount += registeredCollection.GetCount()
      While I < registeredCollection.GetCount()
        ObjectReference myRef = RegisteredCollectionAliases[iCollectionIndex].GetAt(I)
        Actor myActor = myRef as Actor
        spaceshipreference myShip = myRef as spaceshipreference
        If myActor
          If myActor.IsDead() || myActor.IsInFaction(RE_Parent.REIgnoreForCleanup)
            iDeadCount += 1
          EndIf
        ElseIf myShip
          If myShip.IsDead() || myShip.IsInFaction(RE_Parent.REIgnoreForCleanup)
            iDeadCount += 1
          EndIf
        EndIf
        If !myRef.Is3DLoaded() || (myActor as Bool && myActor.IsInFaction(RE_Parent.REIgnoreForCleanup)) || (myShip as Bool && myShip.IsInFaction(RE_Parent.REIgnoreForCleanup))
          iUnloadedCount += 1
        EndIf
        I += 1
      EndWhile
      iCollectionIndex += 1
    EndWhile
    Int iAliasIndex = 0
    Int registeredAliasCount = RegisteredAliases.Length
    While iAliasIndex < registeredAliasCount
      ObjectReference myref = RegisteredAliases[iAliasIndex].GetRef()
      Actor myactor = myref as Actor
      spaceshipreference myship = myref as spaceshipreference
      If myactor
        If myactor.IsDead() || myactor.IsInFaction(RE_Parent.REIgnoreForCleanup)
          iDeadCount += 1
        EndIf
      ElseIf myship
        If myship.IsDead() || myship.IsInFaction(RE_Parent.REIgnoreForCleanup)
          iDeadCount += 1
        EndIf
      EndIf
      If !myref.Is3DLoaded() || (myactor as Bool && myactor.IsInFaction(RE_Parent.REIgnoreForCleanup)) || (myship as Bool && myship.IsInFaction(RE_Parent.REIgnoreForCleanup))
        iUnloadedCount += 1
      EndIf
      iAliasIndex += 1
    EndWhile
    Int registeredRefCount = registeredAliasCount + iCollectionRefCount
    If StopQuestWhenAliasesDead && iDeadCount >= registeredRefCount
      shouldShutDown = True
    EndIf
    If StopQuestWhenAliasesUnloaded && iUnloadedCount >= registeredRefCount
      shouldShutDown = True
    EndIf
  EndIf
  If shouldShutDown
    Self.Shutdown()
  EndIf
EndFunction

Function Shutdown()
  If StopStage > -1
    Self.SetStage(StopStage)
  Else
    Self.Stop()
  EndIf
EndFunction

Function IncrementDeadCount(Int aiGroupIndex)
  DeadCountGroups[aiGroupIndex].currentCount = DeadCountGroups[aiGroupIndex].currentCount + 1
  If DeadCountGroups[aiGroupIndex].currentCount >= DeadCountGroups[aiGroupIndex].groupSize
    Self.SetStage(DeadCountGroups[aiGroupIndex].stageToSet)
  EndIf
EndFunction

Function SetDeadCounts(Int index, Int newValue)
  DeadCountGroups[index].groupSize = newValue
  If DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize
    Self.SetStage(DeadCountGroups[index].stageToSet)
  EndIf
EndFunction

Function AdjustDeadCounts(Int index, Int newValue)
  DeadCountGroups[index].groupSize = DeadCountGroups[index].groupSize + newValue
  If DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize
    Self.SetStage(DeadCountGroups[index].stageToSet)
  EndIf
EndFunction

Function UpdateDeadCountGroupSize(Int groupIndex, Int newSize)
  DeadCountGroups[groupIndex].groupSize = newSize
EndFunction

Function EnableMapMarker()
  If MapMarker
    MapMarker.TryToEnable()
  EndIf
EndFunction

Function DefineCustomLogs()
  logs = new customlogs:logdatum[0]
  customlogs.AddCustomLog(logs, MainLogName, SubLogName, !TerseLog, True, LocalScriptName, DebugMode)
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  customlogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity)
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  customlogs.warning(logs, CallingObject, asTextToPrint)
EndFunction
