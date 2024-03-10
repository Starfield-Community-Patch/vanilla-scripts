ScriptName CompanionCrimeResponseScript Extends Actor
{ handles having the companion bail on combat with people they consider civilians and respond to player killing them as murder

***REMINDERS
all actors with this script MUST have their own "personal crime faction" faction that has a shared crime faction list of factions they consider "civilians" }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  Faction Property CurrentCompanionFaction Auto Const mandatory
  GlobalVariable Property COM_AngerReason_Common_1_Murder Auto Const mandatory
  Keyword Property COM_NotCivilian Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  ActorValue Property Assistance Auto Const mandatory
EndGroup

Group Properties
  affinityevent Property AffinityEventOnCombat Auto Const mandatory
  { filter for: COM_Event_Action_CivilianCombat }
  affinityevent Property AffinityEventOnKill Auto Const mandatory
  { filter for: COM_Event_Action_CivilianKilled }
  Faction[] Property IgnoreSharedCrimeForAnyoneInTheseFactions Auto Const
  { Even if the companion would help them because they are in his shared crime list, ignore it if they are in this faction. }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForEvents()
EndEvent

Event OnUnload()
  Self.UnregisterForEvents()
EndEvent

Function RegisterForEvents()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor")
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerMurderActor")
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnCombatStateChanged")
EndFunction

Function UnregisterForEvents()
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor")
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerMurderActor")
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnCombatStateChanged")
EndFunction

Bool Function AmIHere()
  Return Self.Is3DLoaded()
EndFunction

Bool Function AmIAngry()
  Bool returnVal = SQ_Companions.GetAngerLevel(Self as Actor).GetValue() >= SQ_Companions.COM_AngerLevel_2_Angry.GetValue()
  Return returnVal
EndFunction

Function ProcessCombatantsForCrimeFactionAnger(Bool TestMyCombatTargets)
  If Self.AmIAngry()
    Return 
  EndIf
  Faction myCrimeFaction = Self.GetCrimeFaction()
  Actor ActorWhoseCombatantTargetsToTest = Game.GetPlayer()
  If TestMyCombatTargets
    ActorWhoseCombatantTargetsToTest = Self as Actor
  EndIf
  Actor[] combatants = ActorWhoseCombatantTargetsToTest.GetAllCombatTargets()
  Int I = 0
  Int max = combatants.Length
  While I < max
    Self.ProcessCrimeFactionAnger(combatants[I], myCrimeFaction, True)
    I += 1
  EndWhile
  If TestMyCombatTargets == False && myCrimeFaction.IsPlayerEnemy() == False
    Self.ProcessCombatantsForCrimeFactionAnger(True)
  EndIf
EndFunction

Function ProcessCrimeFactionAnger(Actor ActorToTest, Faction myCrimeFaction, Bool SkipLockedInCompanionCheck)
  Faction actorToTestCrimeFaction = ActorToTest.GetCrimeFaction()
  If actorToTestCrimeFaction as Bool && actorToTestCrimeFaction.IsPlayerEnemy()
    If myCrimeFaction.IsFactionInCrimeGroup(actorToTestCrimeFaction) && commonarrayfunctions.CheckActorAgainstFactionArray(ActorToTest, IgnoreSharedCrimeForAnyoneInTheseFactions, False) == False
      Self.CivilianCombat(ActorToTest)
      Return 
    EndIf
  EndIf
EndFunction

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If Self.AmIHere() == False
    Return 
  EndIf
  If aeCombatState > 0
    Self.ProcessCombatantsForCrimeFactionAnger(False)
  EndIf
EndEvent

Event Actor.OnPlayerAssaultActor(Actor akSender, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  If Self.AmIHere() == False
    Return 
  EndIf
  Actor victimActor = akVictim as Actor
  If Self.IsValidCrimeVictim(victimActor)
    Self.CivilianCombat(victimActor)
  EndIf
EndEvent

Event Actor.OnPlayerMurderActor(Actor akSender, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  If Self.AmIHere() == False
    Return 
  EndIf
  Actor victimActor = akVictim as Actor
  If Self.IsValidCrimeVictim(victimActor)
    Self.CivilianKilled(victimActor)
  EndIf
EndEvent

Bool Function IsValidCrimeVictim(Actor ActorToCheck)
  Bool returnVal = False
  If ActorToCheck as Bool && Self.AmIHere()
    Faction myCrimeFaction = Self.GetCrimeFaction()
    Faction ActorToCheckCrimeFaction = ActorToCheck.GetCrimeFaction()
    Bool isInSharedCrimeFaction = myCrimeFaction.IsFactionInCrimeGroup(ActorToCheckCrimeFaction)
    If isInSharedCrimeFaction
      Bool isActorValidCrimeVictim = ActorToCheck.HasKeyword(COM_NotCivilian) == False && commonarrayfunctions.CheckActorAgainstFactionArray(ActorToCheck, IgnoreSharedCrimeForAnyoneInTheseFactions, False) == False
      If isActorValidCrimeVictim
        returnVal = True
      EndIf
    EndIf
  EndIf
  Return returnVal
EndFunction

Function CivilianCombat(Actor CivilianActor)
  Self.Pacify()
  AffinityEventOnCombat.Send(CivilianActor as ObjectReference)
  Self.AutoDismiss()
EndFunction

Function CivilianKilled(Actor CivilianActor)
  Self.Pacify()
  AffinityEventOnKill.Send(CivilianActor as ObjectReference)
  Self.ProcessCrimeFactionAnger(CivilianActor, Self.GetCrimeFaction(), False)
EndFunction

Function AutoDismiss()
  If SQ_Companions.IsCompanionLockedIn((Self as Actor) as companionactorscript)
    
  ElseIf SQ_Companions.IsRoleActive(Self as Actor)
    SQ_Companions.SetRoleInactive(Self as Actor, True, False, True)
  EndIf
EndFunction

Bool Function TestForLockedInCompanion()
  Bool returnVal = False
  companionactorscript companion = (Self as Actor) as companionactorscript
  returnVal = companion as Bool && SQ_Companions.IsCompanionLockedIn(companion)
  Return returnVal
EndFunction

Function Pacify()
  Self.StopCombat()
  Self.StopCombatAlarm()
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
