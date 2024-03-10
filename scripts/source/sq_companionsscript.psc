ScriptName SQ_CompanionsScript Extends SQ_ActorRolesScript

;-- Structs -----------------------------------------
Struct ActiveCompanionChangedArgs
  Actor NewActiveCompanion
  Actor OldActiveCompanion
EndStruct

Struct AffinityLevelDatum
  GlobalVariable AffinityLevel
  { filter for: COM_AffinityLevel* }
  Message MessageToDisplay
  { filter for: SQ_Companions_AffinityLevel*Message }
EndStruct

Struct AngerLevelDatum
  GlobalVariable AngerLevel
  { filter for: COM_AngerLevel* }
  Message MessageToDisplay
  { filter for: SQ_Companions_AngerLevel*Message }
  Float CoolDownTimerDuration = -1.0
  { (Default: -1; no timer) How long, in *game day hours*, of a duration for the "cool down" timer. }
  Bool AutoDismiss = False
  { (Default: false) if true, when setting this anger state, also have the companion dismiss themselves }
EndStruct


;-- Variables ---------------------------------------
companionactorscript PQ_LockedInActor
Actor PlayerRef
Float TimerDur_SleepWake = 2.0 Const
Int TimerID_SleepWake = 1 Const
Activator Txt_Replace_QuestName

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard LockedinCompanionGuard

;-- Properties --------------------------------------
Group Affinity
  ActorValue Property COM_Affinity Auto Const mandatory
  { autofill; holds value of accrued affinity "points" }
  ActorValue Property COM_AffinityLevel Auto Const mandatory
  { autofill; holds value equaling the related AffinityLevelData[i].AffinityLevel globalvariable }
  GlobalVariable Property COM_AffinityLevel_0_Neutral Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
  { autofill }
  GlobalVariable[] Property COM_AffinityLevel_EnumGlobals Auto hidden mandatory
  { an array of all possible values of the associated actorvalues created and filled in_Init_COM_AffinityLevel_EnumGlobals() which is called in OnInt() }
  sq_companionsscript:affinityleveldatum[] Property AffinityLevelData Auto Const mandatory
EndGroup

Group Anger
  ActorValue Property COM_AngerLevel Auto Const mandatory
  { autofill; holds the current anger level (see globals in AngerLevelData) and description field in the COM_AngerLevel actorvalue }
  ActorValue Property COM_AngerSceneCompleted Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_0_NotAngry Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_1_Annoyed Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_2_Angry Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_3_Furious Auto Const mandatory
  { autofill }
  GlobalVariable[] Property COM_AngerLevel_EnumGlobals Auto hidden
  { an array of all possible values of the associated actorvalues created and filled in_Init_COM_AngerLevel_EnumGlobals() which is called in OnInt() }
  sq_companionsscript:angerleveldatum[] Property AngerLevelData Auto Const mandatory
  ActorValue Property COM_AngerReason Auto Const mandatory
  { autofill; holds the last (or prioritized) anger reason - used to conditionalize anger scene dialogue }
  GlobalVariable[] Property COM_AngerReason_EnumGlobals Auto Const mandatory
  { an array of all possible values of the associated actorvalues.
Note: This includes common as well as "companion specific" anger reasons }
  GlobalVariable Property COM_AngerReason_Common_0_NotAngry Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerReason_Common_3_BreakCommitment Auto Const mandatory
  { autofill }
EndGroup

Group Romance
  ActorValue Property COM_FlirtCount Auto Const mandatory
  { autofill }
  ActorValue Property COM_IsRomantic Auto Const mandatory
  { autofill }
  Keyword[] Property BedTypeKeywords Auto Const mandatory
  { used to find beds for companion placement when player sleeps }
  ReferenceAlias Property SleepCompanion Auto Const mandatory
  { autofill }
  ReferenceAlias Property SleepCompanionRomantic Auto Const mandatory
  { autofill }
  ReferenceAlias Property PlayerBedNoReuse Auto Const mandatory
  { autofill; forces non-romantic furniture to NOT be the player's bed when when refilling SleepCompanionFurniture, and to test romantic companions when they wake up if they are in the player's bed }
  ReferenceAlias Property SleepCompanionFurniture Auto Const mandatory
  { autofill }
  Keyword Property COM_SleepTopic_PlayerWakesUp Auto Const mandatory
  { autofill }
  Keyword Property COM_SleepTopic_WakeUpInPlayersBed Auto Const mandatory
  { autofill }
EndGroup

Group Personal_Quest
  Message Property COM_PQ_AdvancingQuestWarning Auto Const mandatory
  { autofill }
  Message Property COM_PQ_LockedInMsg Auto Const mandatory
  { autofill }
  Message Property COM_PQ_LockedInReleasedMsg Auto Const mandatory
  { autofill }
  Message Property COM_PQ_LockedInReminder Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_PQ_LockedInCompanion Auto Const mandatory
  { autofill; will hold ID of companion who is locked in. Will be -1 if no one is locked in }
  ActorValue Property COM_PQ_LockedIn Auto Const mandatory
  { autofill; 0 = not locked in, 1 = locked in }
EndGroup

Group Misc
  Faction Property PotentialCrewFaction Auto Const mandatory
  { autofill }
  sq_traitsquestscript Property SQ_Traits Auto Const mandatory
  { autofill }
  Keyword Property Crew_CrewTypeElite Auto Const mandatory
  { autofill }
  ReferenceAlias Property ActiveEliteCrew Auto Const mandatory
  { autofill }
  achievements_companionsandelitecrew Property Achievements_Quest Auto Const mandatory
  { autofill }
  RefCollectionAlias Property CommitmentGifts Auto Const mandatory
  { autofill }
EndGroup

Keyword Property COM_NoSleepTeleportLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function StartTimer_SleepWake()
  Self.StartTimer(TimerDur_SleepWake, TimerID_SleepWake)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == TimerID_SleepWake
    Self.HandleTimer_SleepWake()
  EndIf
EndEvent

sq_companionsscript:activecompanionchangedargs Function GetActiveCompanionChangedArgsStruct(Var[] akArgsFromEvent)
  Return akArgsFromEvent[0] as sq_companionsscript:activecompanionchangedargs
EndFunction

Function _SendActiveCompanionChanged(Actor NewActiveCompanion, Actor OldActiveCompanion)
  sq_companionsscript:activecompanionchangedargs eventArgsStruct = new sq_companionsscript:activecompanionchangedargs
  eventArgsStruct.NewActiveCompanion = NewActiveCompanion
  eventArgsStruct.OldActiveCompanion = OldActiveCompanion
  Var[] args = new Var[1]
  args[0] = eventArgsStruct as Var
  Self.SendCustomEvent("sq_companionsscript_ActiveCompanionChanged", args)
EndFunction

Event OnInit()
  PlayerRef = Game.GetPlayer()
  Self._Init_COM_AngerLevel_EnumGlobals()
  Self._Init_COM_AffinityLevel_EnumGlobals()
EndEvent

Event OnQuestInit()
  Self.RegisterForPlayerSleep()
EndEvent

Function _Init_COM_AngerLevel_EnumGlobals()
  COM_AngerLevel_EnumGlobals = new GlobalVariable[0]
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_0_NotAngry, 1)
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_1_Annoyed, 1)
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_2_Angry, 1)
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_3_Furious, 1)
EndFunction

Function _Init_COM_AffinityLevel_EnumGlobals()
  COM_AffinityLevel_EnumGlobals = new GlobalVariable[0]
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_0_Neutral, 1)
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_1_Friendship, 1)
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_2_Affection, 1)
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_3_Commitment, 1)
EndFunction

Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
  Achievements_Quest.RecruitedCompanionOrEliteCrew(ActorToUpdate)
  ActorToUpdate.AddtoFaction(PotentialCrewFaction)
  SQ_Crew.SetRoleAvailable(ActorToUpdate, True)
EndFunction

Function _CustomSetRoleUnavailable(Actor ActorToUpdate)
  SQ_Crew.SetRoleUnavailable(ActorToUpdate, True)
EndFunction

Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
  If PriorActiveActor as Bool && PriorActiveActor != ActorToUpdate
    Self.SetRoleInactive(PriorActiveActor, True, False, True)
  EndIf
  SQ_Crew.SetEliteCrewInactive(ActiveEliteCrew.GetActorReference(), True)
  SQ_Followers.SetRoleActive(ActorToUpdate, False, True, 0.0, 0.0)
  SQ_Crew.SetRoleAvailable(ActorToUpdate, True)
  If PriorActiveActor != ActorToUpdate
    Self._SendActiveCompanionChanged(ActorToUpdate, PriorActiveActor)
  EndIf
EndFunction

Function _CustomSetRoleInactive(Actor ActorToUpdate)
  SQ_Followers.SetRoleInactive(ActorToUpdate, False, True, False)
  Self._SendActiveCompanionChanged(None, ActorToUpdate)
  ActorToUpdate.StopCombatAlarm()
  ActorToUpdate.StopCombat()
  If SQ_Crew.IsRoleActive(ActorToUpdate) == False && SQ_Crew.IsRoleAvailable(ActorToUpdate)
    spaceshipreference playerShipRef = SQ_Crew.HomeShip.GetReference() as spaceshipreference
    SQ_Crew.AssignCrew(ActorToUpdate, playerShipRef)
    playerShipRef.UnassignCrew(ActorToUpdate)
  EndIf
EndFunction

Bool Function IsCompanion(Actor ActorToCheck, Bool IncludeAvailableCompanions)
  Return Self.IsRole(ActorToCheck, IncludeAvailableCompanions)
EndFunction

Event OnPlayerSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime, ObjectReference akBed)
  Self.HandlePlayerSleepStart(akBed)
EndEvent

Event OnPlayerSleepStop(Bool abInterrupted, ObjectReference akBed)
  Self.HandlePlayerSleepStop()
EndEvent

Function ShowAffinityLevelMessage(Actor Companion)
  GlobalVariable affinityEnumGlobal = Companion.GetValueEnumGlobal(COM_AffinityLevel, COM_AffinityLevel_EnumGlobals)
  If affinityEnumGlobal
    sq_companionsscript:affinityleveldatum foundDatum = Self.GetAffinityLevelDatum(affinityEnumGlobal)
    If foundDatum
      Message msg = foundDatum.MessageToDisplay
      If msg
        Self.ShowTextReplacedMessage(Companion, msg, False, None, 0.0, 0.0)
      EndIf
    EndIf
  EndIf
EndFunction

sq_companionsscript:affinityleveldatum Function GetAffinityLevelDatum(GlobalVariable AffinityLevel)
  Int iFound = AffinityLevelData.findstruct("AffinityLevel", AffinityLevel, 0)
  If iFound > -1
    Return AffinityLevelData[iFound]
  EndIf
EndFunction

Function SetAffinityLevel(Actor Companion, GlobalVariable AffinityLevel)
  Companion.SetValue(COM_AffinityLevel, AffinityLevel.GetValue())
  Self.ShowAffinityLevelMessage(Companion)
  Achievements_Quest.AffinityLevelReached(Companion)
  If AffinityLevel == SQ_Companions.COM_AffinityLevel_1_Friendship
    (Companion as companionactorscript).COM_CompanionQuest.AwardSecondChance()
  EndIf
EndFunction

Function SortCompanionArrayByAffinity(companionactorscript[] CompanionArray, Bool ExcludeLockedInCompanion)
  If ExcludeLockedInCompanion
    Int i = CompanionArray.Length - 1
    While i > -1
      If Self.IsCompanionLockedIn(CompanionArray[i])
        CompanionArray.remove(i, 1)
      EndIf
      i -= 1
    EndWhile
  EndIf
  Int I = 0
  While I < CompanionArray.Length - 1
    Int j = 0
    While j < CompanionArray.Length - I - 1
      companionactorscript companionA = CompanionArray[j]
      companionactorscript companionB = CompanionArray[j + 1]
      If companionB.HasGreaterAffinityThanTestedCompanion(companionA)
        CompanionArray[j] = companionB
        CompanionArray[j + 1] = companionA
      EndIf
      j += 1
    EndWhile
    I += 1
  EndWhile
EndFunction

Function SetAngerLevel(companionactorscript Companion, GlobalVariable AngerLevel, GlobalVariable AngerReason)
  If AngerReason != COM_AngerReason_Common_0_NotAngry
    AngerReason = Self._GetPrioritizedAngerReason(Companion as Actor, AngerReason, Companion.COM_CompanionQuest.PrioritizedAngerReasons)
  EndIf
  If AngerLevel == COM_AngerLevel_0_NotAngry
    AngerReason = COM_AngerReason_Common_0_NotAngry
  EndIf
  Companion.SetValue(COM_AngerReason, AngerReason.GetValue())
  sq_companionsscript:angerleveldatum foundDatum = Self.GetAngerLevelDatum(AngerLevel)
  If foundDatum
    Companion.SetValue(COM_AngerLevel, foundDatum.AngerLevel.GetValue())
    If foundDatum.MessageToDisplay
      Self.ShowTextReplacedMessage(Companion as Actor, foundDatum.MessageToDisplay, False, None, 0.0, 0.0)
    EndIf
    If foundDatum.AutoDismiss
      If SQ_Companions.IsCompanionLockedIn(Companion)
        
      Else
        Self.SetRoleInactive(Companion as Actor, True, False, True)
      EndIf
      If AngerReason == COM_AngerReason_Common_3_BreakCommitment
        
      Else
        Companion.SetValue(COM_AngerSceneCompleted, 0.0)
      EndIf
    EndIf
  EndIf
EndFunction

GlobalVariable Function _GetPrioritizedAngerReason(Actor Companion, GlobalVariable NewReason, GlobalVariable[] PrioritizedAngerReasons)
  GlobalVariable returnVal = NewReason
  GlobalVariable currentReason = Companion.GetValueEnumGlobal(COM_AngerReason, COM_AngerReason_EnumGlobals)
  If currentReason != None
    Int iCurrentReason = PrioritizedAngerReasons.find(currentReason, 0)
    Int iNewReason = PrioritizedAngerReasons.find(NewReason, 0)
    If iCurrentReason > -1 && iNewReason > -1
      If iCurrentReason < iNewReason
        returnVal = currentReason
      Else
        returnVal = NewReason
      EndIf
    ElseIf iCurrentReason > -1
      returnVal = currentReason
    ElseIf iNewReason > -1
      returnVal = NewReason
    EndIf
  EndIf
  Return returnVal
EndFunction

GlobalVariable Function GetAngerLevel(Actor Companion)
  GlobalVariable returnVar = Companion.GetValueEnumGlobal(COM_AngerLevel, COM_AngerLevel_EnumGlobals)
  Return returnVar
EndFunction

Float Function GetAngerCoolDownTimerDuration(Actor Companion)
  Float returnVal = -1.0
  sq_companionsscript:angerleveldatum foundDatum = Self.GetAngerLevelDatum(Companion.GetValueEnumGlobal(COM_AngerLevel, COM_AngerLevel_EnumGlobals))
  If foundDatum
    returnVal = foundDatum.CoolDownTimerDuration
  EndIf
  Return returnVal
EndFunction

sq_companionsscript:angerleveldatum Function GetAngerLevelDatum(GlobalVariable AngerLevel)
  Int iFound = AngerLevelData.findstruct("AngerLevel", AngerLevel, 0)
  If iFound > -1
    Return AngerLevelData[iFound]
  EndIf
EndFunction

Function IncrementFlirtCount(companionactorscript Companion)
  Companion.SetValue(COM_FlirtCount, Companion.GetValue(COM_FlirtCount) + 1.0)
EndFunction

Function HandlePlayerSleepStart(ObjectReference PlayerBedRef)
  If PlayerBedRef.GetCurrentLocation().HasKeyword(COM_NoSleepTeleportLocation) == True
    Return 
  EndIf
  PlayerBedNoReuse.ForceRefTo(PlayerBedRef)
  companionactorscript companionRef = Self.GetActiveActor() as companionactorscript
  If companionRef
    SleepCompanion.ForceRefTo(companionRef as ObjectReference)
  Else
    SleepCompanionRomantic.RefillAlias()
  EndIf
  If SleepCompanion.GetReference() == None
    SleepCompanion.RefillAlias()
  EndIf
  companionRef = SleepCompanion.GetReference() as companionactorscript
  If companionRef
    If Self.IsCompanionRomantic(companionRef)
      SleepCompanionFurniture.ForceRefTo(PlayerBedRef)
    Else
      SleepCompanionFurniture.RefillAlias()
    EndIf
    ObjectReference sleepCompanionFurnitureRef = SleepCompanionFurniture.GetReference()
    If !companionRef.IsInScene()
      If (sleepCompanionFurnitureRef as Bool && sleepCompanionFurnitureRef.GetActorOwner() == None) && sleepCompanionFurnitureRef.GetFactionOwner() == None && (PlayerRef.HasDetectionLOS(sleepCompanionFurnitureRef) || SleepCompanionFurniture.GetRef() == PlayerBedRef)
        Bool snappedIntoFurnitureSuccess = companionRef.MoveToFurniture(sleepCompanionFurnitureRef)
      Else
        companionRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
      EndIf
    EndIf
  EndIf
EndFunction

Function HandlePlayerSleepStop()
  companionactorscript sleepCompanionRef = SleepCompanion.GetReference() as companionactorscript
  If sleepCompanionRef
    ObjectReference sleepCompanionFurnitureRef = SleepCompanionFurniture.GetReference()
    If sleepCompanionFurnitureRef == PlayerBedNoReuse.GetReference()
      sleepCompanionRef.SayCustom(COM_SleepTopic_WakeUpInPlayersBed, None, False, None)
    Else
      sleepCompanionRef.SayCustom(COM_SleepTopic_PlayerWakesUp, None, False, None)
    EndIf
  EndIf
  Self.StartTimer_SleepWake()
EndFunction

Function HandleTimer_SleepWake()
  Actor sleepCompanionRef = SleepCompanion.GetActorReference()
  PlayerBedNoReuse.Clear()
  SleepCompanionRomantic.Clear()
  SleepCompanion.Clear()
  SleepCompanionFurniture.Clear()
  sleepCompanionRef.EvaluatePackage(False)
EndFunction

companionactorscript[] Function GetRomanticCompanions(Float MaxDistance, Bool GetFirstOnly)
  companionactorscript[] availableCompanions = Self.GetAvailableActors() as companionactorscript[]
  companionactorscript[] romanticCompanions = new companionactorscript[0]
  Int I = 0
  While I < availableCompanions.Length
    companionactorscript currentCompanionRef = availableCompanions[I]
    If currentCompanionRef.IsRomantic() && (MaxDistance <= 0.0 || currentCompanionRef.GetDistance(Game.GetPlayer() as ObjectReference) <= MaxDistance)
      romanticCompanions.add(currentCompanionRef, 1)
      If GetFirstOnly
        I = availableCompanions.Length
      EndIf
    EndIf
    I += 1
  EndWhile
  Return romanticCompanions
EndFunction

Bool Function IsCompanionRomantic(companionactorscript Companion)
  Bool returnVal = Companion.GetValue(SQ_Companions.COM_IsRomantic) >= 1.0
  Return returnVal
EndFunction

Bool Function IsCompanionLockedIn(companionactorscript SpecificCompanionToTest)
  Guard LockedinCompanionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Bool returnVal = False
    If SpecificCompanionToTest != None
      returnVal = SpecificCompanionToTest == PQ_LockedInActor
    Else
      returnVal = COM_PQ_LockedInCompanion.GetValue() > -1.0
    EndIf
    Return returnVal
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function LockInCompanion(companionactorscript Companion, Bool LockedIn, Message CustomMessage, Activator TextReplaceActivator)
  Guard LockedinCompanionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Txt_Replace_QuestName = TextReplaceActivator
    ObjectReference QuestNameRef = Companion.PlaceAtMe(Txt_Replace_QuestName as Form, 1, False, True, True, None, None, True)
    Alias_MessageTextReplaceRef.ForceRefTo(QuestNameRef)
    Message messageToShow = CustomMessage
    If LockedIn
      If COM_PQ_LockedInCompanion.GetValue() > -1.0
        PQ_LockedInActor.SetValue(COM_PQ_LockedIn, 0.0)
        If CustomMessage == None
          messageToShow = COM_PQ_LockedInReleasedMsg
        EndIf
        Self.ShowTextReplacedMessage(PQ_LockedInActor as Actor, messageToShow, True, QuestNameRef, 0.0, 0.0)
      EndIf
      If CustomMessage == None
        messageToShow = COM_PQ_LockedInMsg
      EndIf
      Self.ShowTextReplacedMessage(Companion as Actor, messageToShow, True, QuestNameRef, 0.0, 0.0)
      If Self.IsCompanion(Companion as Actor, False) == False
        If Self.IsRoleAvailable(Companion as Actor)
          Self.SetRoleActive(Companion as Actor, True, True, 0.0, 0.0)
        EndIf
      EndIf
      Companion.SetValue(COM_PQ_LockedIn, 1.0)
      COM_PQ_LockedInCompanion.SetValue(Companion.GetCompanionIDValue())
      PQ_LockedInActor = Companion
      companionactorscript[] availableCompanions = Self.GetAvailableActors() as companionactorscript[]
      Int I = 0
      While I < availableCompanions.Length
        companionactorscript currentCompanion = availableCompanions[I]
        currentCompanion.COM_CompanionQuest.CheckAndSetWantsToTalk(True)
        I += 1
      EndWhile
    Else
      Companion.SetValue(COM_PQ_LockedIn, 0.0)
      COM_PQ_LockedInCompanion.SetValue(-1.0)
      If CustomMessage as Bool == False
        messageToShow = COM_PQ_LockedInReleasedMsg
      EndIf
      Self.ShowTextReplacedMessage(Companion as Actor, messageToShow, True, QuestNameRef, 0.0, 0.0)
      PQ_LockedInActor = None
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function PersonalQuestReminder()
  ObjectReference QuestNameRef = PQ_LockedInActor.PlaceAtMe(Txt_Replace_QuestName as Form, 1, False, True, True, None, None, True)
  Self.ShowTextReplacedMessage(PQ_LockedInActor as Actor, COM_PQ_LockedInReminder, True, QuestNameRef, 0.0, 0.0)
EndFunction

Function DebugCompanion(Actor Companion)
  Self.SetRoleActive(Companion, True, True, 0.0, 0.0)
  Companion.MoveTo(PlayerRef as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugModAffinity(Actor Companion, Float Amount)
  Companion.AddPassiveAffinity(Amount)
EndFunction
