ScriptName RETriggerScript Extends ObjectReference conditional
{ Extends ObjectReference, used to trigger a Wilderness Encounter radiant quest/scene. }

;-- Variables ---------------------------------------
Float TriggerResetTimer = 0.0
Bool keywordsInitialized = False
customlogs:logdatum[] logs

;-- Properties --------------------------------------
Bool Property TriggerOnLoad = True Auto
{ BASEOBJECT: Should this triggerbox be triggered when it loads instead of when the player enters it?
  	depends on EncounterType - see below }
Keyword Property EncounterType Auto Const mandatory
{ BASEOBJECT property - Encounter type keyword to be sent by this trigger
	OVERLAY: triggered OnLoad, with markers inherited by the Overlay itself.
	SCENE: triggered OnLoad, with mainly a static group of markers near the trigger
	TRAVEL: triggered OnTrigger, with widely separated markers (which must not be visible from the trigger)
	CAMP: triggered OnLoad, with markers and static camp clutter
	ASSAULT: triggered OnLoad, building with defensive markers plus distant markers for attackers to spawn at }
Keyword[] Property TriggerKeywords Auto
{ Add keywords you want to add to this trigger.
	Filter for: OETrigger }
reparentscript Property REParent Auto Const mandatory
{ BASEOBJECT property - REParent quest, used to send cleanup custom event }
Int Property EventNum = -1 Auto
{ REFERENCE property OPTIONAL: Used to start specific encounters - sent as aiValue1 }
Bool Property EventNumClearedAfterSpawning = True Auto
{ REFERENCE property OPTIONAL: default = TRUE; if EventNum is used to spawn a specific encounter, should this be cleared so the next time this trigger activates it picks a random one? }
Float Property DaysUntilReset = -1.0 Auto Const
{ REFERENCE property OPTIONAL: if set, Trigger will not allow additional keyword events to fire until game hours specified has passed

Hours and minutes expressed as GameDaysPassed:
Hour: 1/24 = .04167
Minute: 1/(24*60) = .0006945
So to add 4 hours would be (.04167 * 4) = 0.17 }
Int Property myLocationID Auto hidden
Bool Property inStateOff Auto conditional hidden
Bool Property HasBeenInitialized Auto conditional
Quest Property myQuest Auto hidden
String Property LocalScriptName = "RETriggerScript" Auto hidden
String Property MainLogName = "" Auto hidden
String Property SubLogName = "" Auto hidden
Bool Property DebugMode = False Auto hidden
Bool Property TerseLog = False Auto hidden

;-- Functions ---------------------------------------

Event OnInit()
  Self.DefineCustomLogs("")
EndEvent

Function InitKeywords()
  If keywordsInitialized == False
    keywordsInitialized = True
    Int I = 0
    While I < TriggerKeywords.Length
      Self.AddKeyword(TriggerKeywords[I])
      I += 1
    EndWhile
  EndIf
EndFunction

Function StartEncounter(Keyword overrideKeyword)
  Self.GoToState("Triggered")
  If Self.IsDisabled()
    Self.GoToState("On")
    Return 
  EndIf
  If DaysUntilReset == -1.0 || Utility.GetCurrentGameTime() >= TriggerResetTimer
    Self.InitKeywords()
    Keyword storyKeyword = EncounterType
    If overrideKeyword
      storyKeyword = overrideKeyword
    EndIf
    Quest[] startedQuests = storyKeyword.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, myLocationID, EventNum)
    If startedQuests.Length == 0
      Self.GoToState("On")
    EndIf
    If EventNumClearedAfterSpawning == True
      EventNum = -1
    EndIf
  EndIf
EndFunction

Function QuestStarted(rescript akQuest)
  HasBeenInitialized = True
  Bool pResetTimer = False
  pResetTimer = akQuest.SetResetTimer
  If DaysUntilReset > -1.0 && pResetTimer
    TriggerResetTimer = Utility.GetCurrentGameTime() + DaysUntilReset
  EndIf
  Self.GoToState("Off")
EndFunction

Function ReArmTrigger()
  Self.GoToState("On")
EndFunction

Function DefineCustomLogs(String akLocalScriptName)
  logs = new customlogs:logdatum[0]
  If akLocalScriptName != ""
    LocalScriptName = akLocalScriptName
  EndIf
  MainLogName = LocalScriptName
  customlogs.AddCustomLog(logs, MainLogName, SubLogName, True, True, "", True)
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  customlogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity)
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  customlogs.warning(logs, CallingObject, asTextToPrint)
EndFunction

;-- State -------------------------------------------
State Off

  Event OnEndState(String asNewState)
    inStateOff = False
  EndEvent

  Event OnBeginState(String asOldState)
    inStateOff = True
  EndEvent
EndState

;-- State -------------------------------------------
Auto State On

  Event OnCellLoad()
    REParent.SendCleanupEvent()
    If TriggerOnLoad
      Self.StartEncounter(None)
    EndIf
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    If TriggerOnLoad == False && (akActionRef == Game.GetPlayer() as ObjectReference)
      Self.StartEncounter(None)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State Triggered
EndState
