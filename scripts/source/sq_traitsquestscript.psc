ScriptName SQ_TraitsQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct TaskmasterSystemDatum
  String SystemName
  { for readability and console command use, not used by script logic }
  ActorValue SystemAV
  { the AV the code uses for the health of this system }
  ActorValue SystemHealthAV
  { the ship part id associated with this system - for repairs }
  Perk AssociatedCrewSkill
  { the skill that crew need to repair this system with Taskmaster. For multiple skills, use AssociatedCrewSkillsList }
  FormList AssociatedCrewSkillsList
  { IGNORED if AssociatedCrewSkill is set, the skills that crew need to repair this system with Taskmaster }
  Message RepairedMessage
  { message to display when repairing }
  Bool allowToRollForRestore = True
EndStruct


;-- Variables ---------------------------------------
Int TimerID_KidStuff = 1 Const
Bool initialized

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard TaskMasterRestoreGuard

;-- Properties --------------------------------------
Group Taskmaster
  Perk Property TRAIT_Taskmaster Auto Const mandatory
  { autofill }
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { autofill; linked alias to PlayerShip alias on SQ_PlayerShip }
  Float Property ShipPartHealthPercentTriggerThreshold = 0.5 Auto Const
  { in 0-1 range, the system health percent that triggers the Taskmaster die roll }
  Int Property TaskmasterChance = 25 Auto Const
  { chance on a d100, chance to restore system health when rolling to do so }
  sq_traitsquestscript:taskmastersystemdatum[] Property TaskmasterSystemData Auto mandatory
  { data to connect ship part IDs to various data }
EndGroup

Group Empathy
  Perk Property TRAIT_Empath Auto Const mandatory
  { autofill }
  ActorValue Property COM_Affinity Auto Const mandatory
  { autofill }
  Spell Property Trait_EmpathBuff Auto Const mandatory
  { autofill }
  Spell Property Trait_EmpathDebuff Auto Const mandatory
  { autofill }
  Message Property Trait_EmpathyBuff_Msg Auto Const mandatory
  { autofill }
  Message Property Trait_EmpathyDebuff_Msg Auto Const mandatory
  { autofill }
EndGroup

Group KidStuff
  Quest Property MQ101 Auto Const mandatory
  { autofill }
  Int Property CharGenCompleteStage = 105 Auto Const
  { stage in MQ101 that means player finished creating their character and has traits }
  Perk Property Trait_KidStuff Auto Const mandatory
  { autofill }
  Message Property Trait_KidStuff_Msg_SentCredits Auto Const mandatory
  { autofill }
  GlobalVariable Property Trait_KidStuff_WeeklyParentalGiftPercentage Auto Const mandatory
  { 0-1, percentage of player credits to remove each week }
  GlobalVariable Property Trait_KidStuff_WeeklyParentalGiftMax Auto Const mandatory
  { Autofill. The total amount of Credits that can be sent each week. }
  wwiseevent Property ITM_Credits_Down_WEF Auto Const mandatory
  { Autofill. Credits removal SFX. For use with Kid Stuff Parental Gift. }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  initialized = True
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipSystemDamaged")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipSystemRepaired")
  Self.RegisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If akSender == MQ101 && auiStageID == CharGenCompleteStage
    If Game.GetPlayer().HasPerk(Trait_KidStuff)
      Self.StartKidStuffGameTimeTimer()
    EndIf
    Self.UnregisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet")
  EndIf
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == TimerID_KidStuff
    Actor playerRef = Game.GetPlayer()
    If playerRef.HasPerk(Trait_KidStuff)
      Self.HandleKidStuffTimer()
      Self.StartKidStuffGameTimeTimer()
    EndIf
  EndIf
EndEvent

Event ReferenceAlias.OnShipSystemDamaged(ReferenceAlias akSender, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If Game.GetPlayer().HasPerk(TRAIT_Taskmaster) && aElectromagneticDamage == False
    Self.TaskmasterPossibleRestore(akSender.GetShipReference(), akSystem, -1)
  EndIf
EndEvent

Event ReferenceAlias.OnShipSystemRepaired(ReferenceAlias akSender, ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  If Game.GetPlayer().HasPerk(TRAIT_Taskmaster) && aElectromagneticDamage == False
    Self.TaskmasterSystemRepaired(akSender.GetShipReference(), akSystem, -1)
  EndIf
EndEvent

Function TaskmasterSystemRepaired(spaceshipreference shipRef, ActorValue SystemAV, Int debugDieRoll)
  sq_traitsquestscript:taskmastersystemdatum systemDatum = Self.GetTaskmasterSystemDatum(SystemAV)
  If systemDatum.allowToRollForRestore == False
    Float shipPartHealthPercent = Self.GetSystemHealthPercent(shipRef, systemDatum.SystemHealthAV)
    If shipPartHealthPercent >= 1.0
      systemDatum.allowToRollForRestore = True
    EndIf
  EndIf
EndFunction

Function TaskmasterPossibleRestore(spaceshipreference shipRef, ActorValue SystemAV, Int debugDieRoll)
  If initialized == False
    Self.OnQuestInit()
  EndIf
  TryGuard TaskMasterRestoreGuard ;*** WARNING: Experimental syntax, may be incorrect: TryGuard 
    sq_traitsquestscript:taskmastersystemdatum systemDatum = Self.GetTaskmasterSystemDatum(SystemAV)
    If systemDatum.allowToRollForRestore
      Float shipPartHealthPercent = Self.GetSystemHealthPercent(shipRef, systemDatum.SystemHealthAV)
      If shipPartHealthPercent <= ShipPartHealthPercentTriggerThreshold
        Bool dieRollSucess = Game.GetDieRollSuccess(TaskmasterChance, 1, 100, debugDieRoll, -1)
        If dieRollSucess
          Self.TaskmasterRepair(shipRef, systemDatum)
        EndIf
        systemDatum.allowToRollForRestore = False
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Float Function GetSystemHealthPercent(spaceshipreference shipRef, ActorValue SystemHealthAV)
  Float currentHealth = shipRef.GetValue(SystemHealthAV)
  Float baseHealth = shipRef.GetBaseValue(SystemHealthAV)
  Float shipPartHealthPercent = currentHealth / baseHealth
  Return shipPartHealthPercent
EndFunction

sq_traitsquestscript:taskmastersystemdatum Function GetTaskmasterSystemDatum(ActorValue SystemAV)
  sq_traitsquestscript:taskmastersystemdatum systemDatum = None
  Int iFound = TaskmasterSystemData.findstruct("SystemAV", SystemAV, 0)
  If iFound >= 0
    systemDatum = TaskmasterSystemData[iFound]
  EndIf
  Return systemDatum
EndFunction

Actor[] Function GetTaskmasterSystemMatchingCrewMembers(spaceshipreference shipRef, sq_traitsquestscript:taskmastersystemdatum systemDatumToFindMatchCrewMembersFor)
  Perk[] crewSkillsNeeded = None
  If systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkill
    crewSkillsNeeded = new Perk[1]
    crewSkillsNeeded[0] = systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkill
  ElseIf systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkillsList
    crewSkillsNeeded = systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkillsList.GetArray(False) as Perk[]
  Else
    Return None
  EndIf
  Actor[] matchingCrewMembers = new Actor[0]
  Actor[] crewMembers = shipRef.GetAllCrewMembers()
  Int iCrewMember = 0
  While iCrewMember < crewMembers.Length
    Actor currentCrewMember = crewMembers[iCrewMember]
    Int iSkill = 0
    While iSkill < crewSkillsNeeded.Length
      Perk currentSkill = crewSkillsNeeded[iSkill]
      If currentCrewMember.HasPerk(currentSkill)
        matchingCrewMembers.add(currentCrewMember, 1)
        iSkill = crewSkillsNeeded.Length
      EndIf
      iSkill += 1
    EndWhile
    iCrewMember += 1
  EndWhile
  Return matchingCrewMembers
EndFunction

Function TaskmasterRepair(spaceshipreference shipRef, sq_traitsquestscript:taskmastersystemdatum systemDatum)
  Actor[] matchingCrew = Self.GetTaskmasterSystemMatchingCrewMembers(shipRef, systemDatum)
  If matchingCrew.Length > 0
    Int I = Utility.RandomInt(0, matchingCrew.Length - 1)
    Actor randomMatchingCrewMember = matchingCrew[I]
    shipRef.RestoreValue(systemDatum.SystemHealthAV, 10000.0)
    systemDatum.RepairedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction

Function HandleAffinityEvent(Actor CompanionRef, affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  If akActorValue == COM_Affinity
    Actor playerRef = Game.GetPlayer()
    Float reactionValue = akReactionValue.GetValue()
    If reactionValue > 0.0
      If playerRef.IsSpellTarget(Trait_EmpathDebuff as Form) && playerRef.HasPerk(TRAIT_Empath)
        playerRef.DispelSpell(Trait_EmpathDebuff)
      EndIf
      Self.TriggerEmpath(CompanionRef as ObjectReference, Trait_EmpathBuff, Trait_EmpathyBuff_Msg)
    ElseIf reactionValue < 0.0
      If playerRef.IsSpellTarget(Trait_EmpathBuff as Form) && playerRef.HasPerk(TRAIT_Empath)
        playerRef.DispelSpell(Trait_EmpathBuff)
      EndIf
      Self.TriggerEmpath(CompanionRef as ObjectReference, Trait_EmpathDebuff, Trait_EmpathyDebuff_Msg)
    EndIf
  EndIf
EndFunction

Function TriggerEmpath(ObjectReference CompanionRef, Spell SpellToCast, Message MessageToDisplay)
  Bool playerHasPerk = Game.GetPlayer().HasPerk(TRAIT_Empath)
  If playerHasPerk
    SpellToCast.Cast(CompanionRef, Game.GetPlayer() as ObjectReference)
    MessageToDisplay.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction

Function HandleKidStuffTimer()
  Actor playerRef = Game.GetPlayer()
  MiscObject credits = Game.GetCredits()
  Int playerCredits = playerRef.GetItemCount(credits as Form)
  Float weeklyParentalGiftPercentage = Trait_KidStuff_WeeklyParentalGiftPercentage.GetValue()
  Int parentalGiftAmount = (playerCredits as Float * Trait_KidStuff_WeeklyParentalGiftPercentage.GetValue()) as Int
  Int parentalGiftMax = Trait_KidStuff_WeeklyParentalGiftMax.GetValueInt()
  If parentalGiftAmount > parentalGiftMax
    parentalGiftAmount = parentalGiftMax
  EndIf
  If parentalGiftAmount > 0
    playerRef.RemoveItem(credits as Form, parentalGiftAmount, True, None)
    Int sfx = ITM_Credits_Down_WEF.Play(playerRef as ObjectReference, None, None)
    Trait_KidStuff_Msg_SentCredits.Show(parentalGiftAmount as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction

Function StartKidStuffGameTimeTimer()
  Float hoursUntilNextMondayAt8AM = Self.GetHoursUntilNextMondayAt8AM()
  Self.StartTimerGameTime(hoursUntilNextMondayAt8AM, TimerID_KidStuff)
EndFunction

Float Function GetHoursUntilNextMondayAt8AM()
  Float currentDay = Utility.GetCurrentGameTime()
  Int nextWeek = Math.Floor(currentDay + 7.0)
  Int nextSunday = nextWeek - nextWeek % 7
  Int nextMonday = nextSunday + 1
  Float nextMondayAt8AM = nextMonday as Float + 0.333299994
  Float daysUntilNextMondayAt8AM = nextMondayAt8AM - currentDay
  Float hoursUntilNextMondayAt8AM = daysUntilNextMondayAt8AM * 24.0
  Return hoursUntilNextMondayAt8AM
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
