ScriptName COM_CompanionQuestScript Extends Quest
{ Script attached to COM_Companion_<CompanionName> quest }

;-- Structs -----------------------------------------
Struct StoryGateDatum
  Int GateNumber
  GlobalVariable TimerDuration
  { in seconds, how long does the companion need to be following player to unlock the gate?
filter for: COM_StoryGate_TimerDuration }
EndStruct


;-- Variables ---------------------------------------
companionactorscript CompanionRef
Int GameTimerID_AngerCoolDown = 2
Bool StartedStoryGateTimerOnce
Int TimerID_StoryGate = 1
Int iAngerTimerNotRunning = 0
Int iAngerTimerRunning = 1

;-- Properties --------------------------------------
Group autofill
  sq_followersscript Property SQ_Followers Auto Const mandatory
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  ActorValue Property COM_StoryGatesCompleted Auto Const mandatory
  ActorValue Property COM_CurrentStoryGateTimerExpired Auto Const mandatory
  ActorValue Property COM_PersonalQuest_Started Auto Const mandatory
  ActorValue Property COM_PersonalQuest_Finished Auto Const mandatory
  ActorValue Property COM_CommitmentQuest_Started Auto Const mandatory
  ActorValue Property COM_AngerCoolDownTimerExpired Auto Const mandatory
  { 0 = not expired (timer currently running)
1 = expired (timer not currently running) }
  ActorValue Property COM_AngerSceneCompleted Auto Const mandatory
  { 0 = not completed yet
1 = completed }
  ActorValue Property COM_AngerSecondChances Auto Const mandatory
  GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const mandatory
  GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
  GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
  ActorValue Property COM_IsRomantic Auto Const mandatory
  ActorValue Property COM_HasBeenRomantic Auto Const mandatory
  ActorValue Property COM_CommitmentPossible Auto Const mandatory
  ActorValue Property COM_CommitmentDesired Auto Const mandatory
  ActorValue Property COM_IsCommitted Auto Const mandatory
  ActorValue Property COM_CommitmentRefusedPermanently Auto Const mandatory
  ActorBase Property Companion_Andreja Auto Const mandatory
  affinityevent Property COM_Event_PlayerBecomesRomantic_AndrejaJealous Auto Const mandatory
EndGroup

Group Aliases
  ReferenceAlias Property Alias_Companion Auto Const mandatory
  { The companion who this COM_Companion quest belongs to }
  ReferenceAlias Property Alias_PlayerShipCrewMarker Auto Const mandatory
  LocationAlias Property Alias_PlayerShipInteriorLocation Auto Const mandatory
EndGroup

Group StoryGates
  com_companionquestscript:storygatedatum[] Property StoryGateData Auto Const mandatory
  ActorValue Property COM_StarbornSaveActorValue_MaxStoryGate Auto Const mandatory
  { The av used to store the maximum story gate reach in any play through
	IMPORTANT: this also needs to be in the formlist: StarbornSaveActorValues
	filter for: COM_StarbornSaveActorValue_MaxStoryGate_* }
EndGroup

Group Quests
  Quest Property PersonalQuest Auto Const mandatory
  { The quest that takes player from friendship to affection }
  Quest Property CommitmentQuest Auto Const mandatory
  { The quest that implements the "commitment ceremony" }
EndGroup

Group AdditionalData
  Perk Property CompanionCheckPerk Auto Const mandatory
  { The perk used to pick companion speak for player lines in dialogue
filter for: CompanionCheck }
EndGroup

Group WantsToTalk
  Scene Property WantsToTalkAnnouncementScene Auto Const mandatory
  { where the companion blurts out they want to talk - this is likely just a one line scene
NOTE: conditions on the scene dialogue should cover cool downs, etc. as various things will trigger this scene to start }
  conditionform Property WantsToTalkConditionForm Auto Const mandatory
  { condition form that will be test against to turn on "wants to talk" functionality, will need to be true in all cases, such as affinity gates, anger, important quest response scenes, etc.
Filter for: COM_CND_WantsToTalk_* }
  Int Property WantsToTalkObjective = 10 Auto Const
EndGroup

Group Anger
  GlobalVariable[] Property PrioritizedAngerReasons Auto Const mandatory
  { Lower indexes = higher priority.
Filter for: COM_AngerReason_*
New anger reasons are ignored if current anger reason is in this list, and has lower index than the new reason.
This should normally only include things like murder that wouldn't be superceded by other, even more recent reasons to be angry.
There might only be one thing in this list (ex: murder). }
EndGroup

Group Flirting
  GlobalVariable Property COM_FlirtCooldownDays Auto Const mandatory
  { autofill }
  ActorValue Property COM_FlirtCount Auto Const mandatory
  { autofill }
  ActorValue Property COM_FlirtCooldownExpiry Auto Const mandatory
  { autofill }
  ActorValue Property COM_FlirtChoice Auto Const mandatory
  { autofill; 0 to FlirtChoiceMax - used to conditionalize scene phases of variations of flirt dialogue choices for the player }
  Int Property FlirtChoiceMax = 2 Auto Const
  { COM_FlirtChoice will be 0 to FlirtChoiceMax - represents which sets choices player will get each flirt scene play through
Example: three sets of flirt phases, set FlirtChoiceMax to 2 }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  CompanionRef = Alias_Companion.GetActorRef() as companionactorscript
  Self.RegisterForRemoteEvent(CompanionRef as ScriptObject, "OnAffinityEvent")
  Self.RegisterForRemoteEvent(CompanionRef as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForCustomEvent(SQ_Companions as ScriptObject, "sq_companionsscript_ActiveCompanionChanged")
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == TimerID_StoryGate
    CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 1.0)
    Self.CheckAndSetWantsToTalk(True)
  EndIf
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == GameTimerID_AngerCoolDown
    CompanionRef.setValue(COM_AngerCoolDownTimerExpired, 1.0)
    Self.CheckAngerAndSetNotAngry()
  EndIf
EndEvent

Event SQ_CompanionsScript.ActiveCompanionChanged(sq_companionsscript akSender, Var[] akArgs)
  If CompanionRef as Actor == SQ_Companions.GetActiveCompanionChangedArgsStruct(akArgs).NewActiveCompanion
    Self.PickedUpAsCompanion()
  Else
    Self.DismissedAsCompanion()
  EndIf
EndEvent

Event Actor.OnAffinityEvent(Actor akSender, affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  Self.CheckAndSetWantsToTalk(True)
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == CompanionRef as Actor
    Self.CheckAndSetWantsToTalk(False)
  EndIf
EndEvent

Function CheckAngerAndSetNotAngry()
  Bool angerSceneCompelted = CompanionRef.GetValue(COM_AngerSceneCompleted) == 1.0
  Bool angerCoolDownExpired = CompanionRef.GetValue(COM_AngerCoolDownTimerExpired) == 1.0
  GlobalVariable angerLevelGlobal = SQ_Companions.GetAngerLevel(CompanionRef as Actor)
  If angerSceneCompelted && angerCoolDownExpired && angerLevelGlobal == SQ_Companions.COM_AngerLevel_2_Angry
    Self.MakeNotAngry()
  EndIf
EndFunction

Function PickupSceneEnded()
  Game.StopDialogueCamera(False, False)
  If SQ_Companions.IsCompanionLockedIn(None) == False
    SQ_Companions.SetRoleActive(CompanionRef as Actor, True, True, 0.0, 0.0)
  EndIf
EndFunction

Function DismissSceneEnded()
  If SQ_Companions.IsCompanionLockedIn(CompanionRef) == False
    SQ_Companions.SetRoleInactive(CompanionRef as Actor, True, False, True)
  EndIf
EndFunction

Function WaitSceneEnded()
  SQ_Followers.CommandWait(CompanionRef as Actor, None)
EndFunction

Function FollowSceneEnded()
  SQ_Followers.CommandFollow(CompanionRef as Actor)
EndFunction

Function TalkAboutQuestEventSceneEnded(ActorValue AssociatedActorValue)
  CompanionRef.setValue(AssociatedActorValue, 0.0)
  Self.CheckAndSetWantsToTalk(True)
EndFunction

Function GiveItemSceneEnded()
  (Alias_Companion.GetReference() as com_crew_giveitemactorscript).GiveItems()
EndFunction

Function FlirtSceneEnded()
  Float flirtExpiryDay = Utility.ExpiryDay(COM_FlirtCooldownDays.GetValue(), None, -1.0, -1.0)
  CompanionRef.setValue(COM_FlirtCooldownExpiry, flirtExpiryDay)
  Float newFlirtCount = CompanionRef.GetValue(COM_FlirtCount) + 1.0
  CompanionRef.setValue(COM_FlirtCount, newFlirtCount)
  Int nextFlirtChoice = CompanionRef.IncrementLoopingValue(COM_FlirtChoice, FlirtChoiceMax, 1)
EndFunction

Function PickedUpAsCompanion()
  Game.GetPlayer().AddPerk(CompanionCheckPerk, False)
  If StartedStoryGateTimerOnce == False
    StartedStoryGateTimerOnce = True
    Self.StoryGateSceneCompleted(False)
  Else
    Self.PauseTimer(TimerID_StoryGate, False)
  EndIf
EndFunction

Function DismissedAsCompanion()
  Game.GetPlayer().RemovePerk(CompanionCheckPerk)
  Self.PauseTimer(TimerID_StoryGate, True)
EndFunction

Bool Function OnPlayerShip(Actor ActorToCheck, Location LocationToCheck)
  Return ActorToCheck.GetCurrentLocation() == Alias_PlayerShipInteriorLocation.GetLocation()
EndFunction

Function CheckAndSetWantsToTalk(Bool SayDialogue)
  Bool WantsToTalk = WantsToTalkConditionForm.IsTrue(CompanionRef as ObjectReference, Game.GetPlayer() as ObjectReference)
  If WantsToTalk
    If SayDialogue
      WantsToTalkAnnouncementScene.Start()
    EndIf
    Self.SetObjectiveCompleted(WantsToTalkObjective, False)
    Self.SetObjectiveDisplayed(WantsToTalkObjective, True, False)
  Else
    Self.SetObjectiveCompleted(WantsToTalkObjective, True)
  EndIf
EndFunction

Function StoryGateSceneCompleted(Bool IncrementAV)
  Float currentAV = CompanionRef.GetValue(COM_StoryGatesCompleted)
  Float newAV = currentAV
  If IncrementAV
    newAV += 1.0
  EndIf
  CompanionRef.setValue(COM_StoryGatesCompleted, newAV)
  Actor PlayerRef = Game.GetPlayer()
  Float maxStoryGate = Math.Max(newAV, PlayerRef.GetValue(COM_StarbornSaveActorValue_MaxStoryGate))
  PlayerRef.setValue(COM_StarbornSaveActorValue_MaxStoryGate, maxStoryGate)
  Int nextGateNumber = (newAV + 1.0) as Int
  Self.StartStoryGateTimer(nextGateNumber)
  Self.CheckAndSetWantsToTalk(True)
EndFunction

Function StartStoryGateTimer(Int nextGateNumber)
  com_companionquestscript:storygatedatum nextStoryGateDatum = Self.GetStoryGateDatum(nextGateNumber)
  If nextStoryGateDatum
    CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 0.0)
    Float nextGateTimerDuration = nextStoryGateDatum.TimerDuration.GetValue()
    Self.StartTimer(nextGateTimerDuration, TimerID_StoryGate)
  EndIf
EndFunction

com_companionquestscript:storygatedatum Function GetStoryGateDatum(Int GateNumber)
  Int iFound = StoryGateData.findstruct("GateNumber", GateNumber, 0)
  com_companionquestscript:storygatedatum foundStoryGateDatum = None
  If iFound > -1
    foundStoryGateDatum = StoryGateData[iFound]
  EndIf
  Return foundStoryGateDatum
EndFunction

Function SetAngerLevel(GlobalVariable AngerLevelToSet, GlobalVariable AngerReason)
  SQ_Companions.SetAngerLevel(CompanionRef, AngerLevelToSet, AngerReason)
  Self.CheckAndSetWantsToTalk(True)
EndFunction

Function MakeNotAngry()
  Self.SetAngerLevel(SQ_Companions.COM_AngerLevel_0_NotAngry, SQ_Companions.COM_AngerReason_Common_0_NotAngry)
EndFunction

Function StartAngerCoolDownTimer()
  Float coolDownTimerDur = SQ_Companions.GetAngerCoolDownTimerDuration(CompanionRef as Actor)
  If coolDownTimerDur > -1.0
    Self.StartTimerGameTime(coolDownTimerDur, GameTimerID_AngerCoolDown)
    CompanionRef.setValue(COM_AngerCoolDownTimerExpired, 0.0)
  Else
    Self.CancelTimerGameTime(GameTimerID_AngerCoolDown)
  EndIf
  Self.CheckAndSetWantsToTalk(True)
EndFunction

Function ExpireAngerCoolDownTimer()
  Self.CancelTimerGameTime(GameTimerID_AngerCoolDown)
  Self.OnTimerGameTime(GameTimerID_AngerCoolDown)
EndFunction

Function SetAffinityLevel(GlobalVariable AffinityLevel)
  SQ_Companions.SetAffinityLevel(CompanionRef as Actor, AffinityLevel)
EndFunction

Function StartPersonalQuest()
  Self.StoryGateSceneCompleted(True)
  Self.SetAffinityLevel(COM_AffinityLevel_1_Friendship)
  PersonalQuest.Start()
  CompanionRef.setValue(COM_PersonalQuest_Started, 1.0)
  Activator QuestName = CompanionRef.COM_PQ_TxtReplace_QuestName
  ObjectReference QuestNameRef = CompanionRef.PlaceAtMe(QuestName as Form, 1, False, True, True, None, None, True)
  SQ_Companions.ShowTextReplacedMessage(CompanionRef as Actor, SQ_Companions.COM_PQ_AdvancingQuestWarning, True, QuestNameRef, 0.0, 0.0)
EndFunction

Function FinishedPersonalQuest()
  Self.SetAffinityLevel(COM_AffinityLevel_2_Affection)
  CompanionRef.setValue(COM_PersonalQuest_Finished, 1.0)
EndFunction

Function PersonalQuestReminder()
  SQ_Companions.PersonalQuestReminder()
EndFunction

Function StartCommitmentQuest()
  Self.StoryGateSceneCompleted(True)
  CompanionRef.setValue(COM_CommitmentQuest_Started, 1.0)
  CommitmentQuest.Start()
EndFunction

Function RomanceSceneEndedRomantic()
  CompanionRef.setValue(COM_HasBeenRomantic, 1.0)
  Self.PossiblyMakeAndrejaJealous()
EndFunction

Function MakeRomantic()
  CompanionRef.setValue(COM_IsRomantic, 1.0)
  If CompanionRef.GetValue(COM_HasBeenRomantic) < 1.0
    CompanionRef.setValue(COM_HasBeenRomantic, 1.0)
  EndIf
  Self.PossiblyMakeAndrejaJealous()
EndFunction

Function PossiblyMakeAndrejaJealous()
  Actor romanticCompanion = Alias_Companion.GetActorRef()
  companionactorscript andrejaRef = Companion_Andreja.GetUniqueActor() as companionactorscript
  If (romanticCompanion != andrejaRef as Actor) && andrejaRef.IsRomantic()
    COM_Event_PlayerBecomesRomantic_AndrejaJealous.Send(romanticCompanion as ObjectReference)
  EndIf
EndFunction

Function MakeNotRomantic()
  CompanionRef.setValue(COM_IsRomantic, 0.0)
  Self.CommitmentDesired(False)
EndFunction

Function CommitmentDesired(Bool Desired)
  If Desired
    CompanionRef.setValue(COM_CommitmentDesired, 1.0)
    If CompanionRef.GetValue(COM_CurrentStoryGateTimerExpired) == 1.0
      CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 0.0)
      Self.StartTimer(600.0, TimerID_StoryGate)
    EndIf
  Else
    CompanionRef.setValue(COM_CommitmentDesired, 0.0)
  EndIf
  CompanionRef.setValue(COM_CommitmentPossible, 1.0)
EndFunction

Function MakeCommitted()
  Self.SetAffinityLevel(COM_AffinityLevel_3_Commitment)
  CompanionRef.setValue(COM_IsCommitted, 1.0)
EndFunction

Function MakeNotCommitted(Bool Permanent)
  Self.SetAffinityLevel(COM_AffinityLevel_2_Affection)
  CompanionRef.setValue(COM_IsCommitted, 0.0)
  If Permanent
    CompanionRef.setValue(COM_CommitmentRefusedPermanently, 1.0)
  EndIf
EndFunction

Function BreakCommitment()
  Self.MakeNotCommitted(True)
  Self.MakeNotRomantic()
  Self.SetAngerLevel(SQ_Companions.COM_AngerLevel_2_Angry, SQ_Companions.COM_AngerReason_Common_3_BreakCommitment)
  Self.StartAngerCoolDownTimer()
EndFunction

Function AwardSecondChance()
  Float newVal = CompanionRef.GetValue(COM_AngerSecondChances) + 1.0
  CompanionRef.setValue(COM_AngerSecondChances, newVal)
EndFunction

Function ReedemSecondChance()
  Float newVal = CompanionRef.GetValue(COM_AngerSecondChances) - 1.0
  CompanionRef.setValue(COM_AngerSecondChances, newVal)
  Self._AngerSceneCancelAnger()
EndFunction

Function AngerSpeechChallengeSuccess()
  Self._AngerSceneCancelAnger()
EndFunction

Function _AngerSceneCancelAnger()
  Self.CancelTimerGameTime(GameTimerID_AngerCoolDown)
  Self.MakeNotAngry()
EndFunction

Function AngerSceneCompleted()
  CompanionRef.setValue(COM_AngerSceneCompleted, 1.0)
  Self.StartAngerCoolDownTimer()
EndFunction

Function DebugSetStoryGateTimerComplete()
  If CompanionRef.GetValue(COM_CurrentStoryGateTimerExpired) == 0.0
    Self.CancelTimer(0)
    Self.OnTimer(TimerID_StoryGate)
  EndIf
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
