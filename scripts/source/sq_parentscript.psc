ScriptName SQ_ParentScript Extends Quest
{ holds overall system data/functionality }

;-- Structs -----------------------------------------
Struct ActorValueDatum
  ActorValue ActorValueToDamage
  { An actor value to damage. }
  Float DamagePercent = 1.0
  { The percent to damage the value by, 0-1, with 1 being 100% damage. }
EndStruct

Struct OutpostAttackSpecialCase
  conditionform specialCaseCondition
  Float specialCaseAttackChance
  Keyword storyEventKeyword
EndStruct

Struct PlanetAbundanceData
  Keyword planetKeyword
  Float surveyDifficulty = 1.0
EndStruct

Struct PlanetSurveySlateData
  Book planetSurveySlate
  Int minTraitValue = 0
  Float minSurveyPercent = 0.25
  GlobalVariable RewardXP
EndStruct

Struct PlanetTraitData
  Keyword PlanetTrait
  ActorValue PlanetTraitAV
  ObjectReference TraitNameMarker
  ObjectReference TraitCategoryMarker
  Perk AssociatedSkill
  Perk AssociatedSkill02
  Int discoverCountRequired = 1
EndStruct

Struct RandomShipDamageDatum
  ActorValue ActorValueToDamage
  { The ship system actor value to damage. }
  Float ChanceDestroyed = 0.5
  { Chance that this ship system is fully destroyed. }
  Float MinDamagePercent = 0.0
  { If this system is not destroyed, the minimum amount to damage it by. }
  Float MaxDamagePercent = 1.0
  { If this system is not destroyed, the maximum amount to damage it by. }
EndStruct

Struct SurveySite
  ObjectReference siteMarker
  { map marker (?) that holds survey site information }
EndStruct

Struct SurveySiteType
  Activator siteTypeMarker
  GlobalVariable siteTypeCount
EndStruct

Struct SystemSurveyData
  Int minTraitValue = 0
  GlobalVariable RewardXP
EndStruct

Struct TutorialMessage
  Int tutorialID
  Message TutorialMessage
EndStruct

Struct mapMarkerName
  Keyword groupTypeKeyword
  Form nameMarker
EndStruct


;-- Variables ---------------------------------------
Float attackChanceBase = 0.100000001 Const
Float attackChanceCargoLinkMult = 0.050000001 Const
Float attackChanceCreature = 0.079999998 Const
Float attackChanceResourceMult = 0.01 Const
Int criticalHitType0_Reactor = 0 Const
Int criticalHitType1_Crew = 1 Const
Int criticalHitType2_Hull = 2 Const
Int criticalHitType3_System = 3 Const
Int criticalHitType4_EM = 4 Const
Int criticalHitType5_Engine = 5 Const
Int criticalHitType6_Shield = 6 Const
Float minDaysSinceLastAttack = 7.0 Const
Float minDaysSinceLastAttackRoll = 0.039999999 Const
defaulttutorialquestscript tutorialQuest

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ShipCriticalHitGuard
Guard computersAchievementGuard
Guard discoverMatchingTraitsBusy
Guard harvestLock
Guard planetSurveyLock
Guard tutorialMessageGuard

;-- Properties --------------------------------------
Group SurveySiteGroup
  sq_parentscript:surveysite[] Property SurveySites Auto
  { array holds survey sites that the player has discovered but not used }
  Message Property SQ_SurveySiteDiscoveredMessage Auto Const mandatory
  sq_parentscript:surveysitetype[] Property surveySiteTypes Auto Const
EndGroup

Group PlanetTraitGroup
  RefCollectionAlias Property SurveySlates Auto Const mandatory
  { holds planet survey slates until player sells them }
  sq_parentscript:planettraitdata[] Property PlanetTraits Auto Const
  sq_parentscript:planetabundancedata[] Property PlanetAbundanceKeywords Auto Const
  Message Property SQ_ParentPlanetTraitScanMessage Auto Const mandatory
  Message Property SQ_ParentPlanetTraitUpdateMessage Auto Const mandatory
  Message Property SQ_ParentPlanetTraitDiscoverMessage Auto Const mandatory
  Message Property SQ_ParentPlanetTraitExploreMessage Auto Const mandatory
  Int Property KeywordType_PlanetTrait = 44 Auto Const hidden
  { used to get PlanetTrait keyword types using GetKeywordTypeList native function }
  Int Property KeywordType_PlanetFloraAbundance = 47 Auto Const hidden
  { used to get Flora Abundance keyword types using GetKeywordTypeList native function }
  Int Property KeywordType_PlanetFaunaAbundance = 48 Auto Const hidden
  { used to get Flora Abundance keyword types using GetKeywordTypeList native function }
  ReferenceAlias Property PlanetTraitCategory Auto Const mandatory
  { used for message text replacement }
  ReferenceAlias Property PlanetTraitName Auto Const mandatory
  { used for message text replacement }
  LocationRefType Property PlanetTraitScanTargetLocRef Auto Const mandatory
  { used to count planet trait scan targets in a location }
  ReferenceAlias Property ScanTarget Auto Const mandatory
  { used for stamping scan target with "real name" after scanning }
  ReferenceAlias Property ScanTargetName Auto Const mandatory
  { used for stamping scan target with "real name" after scanning }
  ActorValue Property PlanetTraitLocationScanCount Auto Const mandatory
  { actor value used to count how many scan targets have been scanned on a location }
  ActorValue Property PlanetTraitLocationScanCountRequired Auto Const mandatory
  { actor value used to set total number of scan targets in location (default AV used by UI) }
  ActorValue Property SQ_PlanetLastSurveyReward Auto Const mandatory
  { actor value used to stamp the last survey reward slate % on a planet }
  ActorValue Property SurveyingTraitBonus Auto Const mandatory
  { used to reduce number of POIs needed to discover a trait }
  ReferenceAlias Property SurveySlate Auto Const mandatory
  { used for stamping survey slate with the planet name }
  sq_parentscript:planetsurveyslatedata[] Property PlanetSurveySlates Auto Const
  { array of planet survey slate data
	  NOTE: needs to be ordered with highest value slate in 0 position and going down in value from there }
  Float[] Property SurveyRewardThresholds Auto Const
  { if new survey % goes above one of these, time to reward a survey slate }
  sq_parentscript:systemsurveydata[] Property SystemSurveyRewards Auto Const
  { array of rewards for completing system surveys }
  GlobalVariable Property PlanetTraitXPReward Auto Const mandatory
  GlobalVariable Property PlanetTraitXPRewardSkillBonus Auto Const mandatory
  GlobalVariable Property PlanetTraitXPRewardAstrophysicsMult Auto Const mandatory
  GlobalVariable Property Skill_Astrophysics_DiscoverTraitChance Auto Const mandatory
  { chance to discover a trait when scanning a planet }
  Keyword Property SQ_PlanetTraitOverrideLink Auto Const mandatory
  { keyword used to link scan targets to map marker for cases where the location can work for multiple planet traits }
  conditionform Property SQ_PlanetIsHabitable Auto Const mandatory
  { used to determine if a planet is habitable }
  Keyword Property SQ_PlanetIsHabitableKeyword Auto Const mandatory
  { stamp survey slates with this keyword for habitable planets }
  missionparentscript Property MB_Parent Auto Const mandatory
  { mission parent quest }
  Location[] Property SystemsFullySurveyed Auto
  { array that will be updated to hold system locations that have been completely surveyed - all planets at 100% }
  Keyword Property SQ_SurveySlateEvent Auto Const mandatory
  { keyword used to start SQ_SurveySlate quests to stamp survey slates with the correct name }
EndGroup

Group TextReplacement
  ReferenceAlias Property PlanetReference Auto Const mandatory
  Keyword Property LocTypeMajorOrbital Auto Const mandatory
  Keyword Property LocTypeStarSystem Auto Const mandatory
  LocationAlias Property PlanetReferencePlanetLocation Auto Const mandatory
  { current planet matching PlanetReference }
  LocationAlias Property PlanetReferenceSystemLocation Auto Const mandatory
  { current system location matching PlanetReference }
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { player current ship }
  LocationAlias[] Property SystemPlanets Auto Const
  { array of location aliases for all planets in current system - many will be empty }
EndGroup

Group Skills
  ActorValue Property ZoologyNonLethalHarvestCount Auto Const mandatory
  { used to track how many times the player has harvested from a creature }
  GlobalVariable Property ZoologyNonLethalHarvestCountMax Auto Const mandatory
  { current max harvest count }
EndGroup

Group Companions
  companionaffinityeventsscript Property SQ_Companions Auto Const mandatory
  { autofill }
EndGroup

Group Quests
  rad01_list_questscript Property Rad01_LIST Auto Const mandatory
  { autofill }
EndGroup

Group DerelictShips
  sq_parentscript:randomshipdamagedatum[] Property RandomShipDamageData Auto Const mandatory
  ReferenceAlias Property DerelictShipNameAlias Auto Const mandatory
  Keyword Property BEDerelict Auto Const mandatory
  Message Property DerelictShipNameOverrideMessage Auto Const mandatory
  ActorValue Property SpaceshipCrew Auto Const mandatory
  ActorValue Property SpaceshipExternalLightsDisabledValue Auto Const mandatory
EndGroup

Group outpostAttacks
  ActorValue Property OutpostLastAttackTimestamp Auto Const mandatory
  { used to timestamp last outpost attack }
  ActorValue Property OutpostLastAttackRollTimestamp Auto Const mandatory
  { used to timestamp last outpost attack roll }
  ActorValue Property OutpostCargoLinkAV Auto Const mandatory
  { used to weight attacks based on cargo links at the outpost }
  Keyword Property SQ_OutpostEventAttack Auto Const mandatory
  { used to trigger outpost attacks by NPCs }
  Keyword Property SQ_OutpostEventAttackCreatures Auto Const mandatory
  { used to trigger outpost attacks by creatures }
  sq_parentscript:outpostattackspecialcase[] Property OutpostAttackSpecialCases Auto Const
  { used to increase attack chance for special cases }
EndGroup

Group OE_CivilianData
  sq_parentscript:mapmarkername[] Property MapMarkerNames Auto Const
  { array to use to rename map marker based on keyword on location }
  Keyword Property MapMarkerLinkedRefNameOverride Auto Const mandatory
  { use to link to override name }
  FormList Property OE_CiviliansVisibleFromStarmapKeywords Auto Const mandatory
  { locations with one of these keywords are visible on starmap }
EndGroup

Group Tutorials
  sq_parentscript:tutorialmessage[] Property TutorialMessages Auto
  { array of tutorial messages. Array entries are removed after the message has been triggered. }
EndGroup

Group Achievements
  Int Property ComputersAchievementID = 35 Auto Const
  ActorValue Property ComputersAchievementAV Auto Const mandatory
  { AV on player to track number of terminals accessed }
  GlobalVariable Property ComputersAchievementCount Auto Const mandatory
  { how many computers accessed required for achievement? }
  Bool Property ComputersAchievementAwarded = False Auto hidden
  { set to true when player gets this achievement }
EndGroup

Group SmugglingMinigame
  Message Property SQ_GuardShipSmugglingMinigameSuccess Auto Const mandatory
  { temp message box for smuggling minigame }
  Message Property SQ_GuardShipSmugglingMinigameFailure Auto Const mandatory
  { temp message box for smuggling minigame }
  Float Property fSmugglingBaseChance = 60.0 Auto
  Float Property fSmugglingTargetSkillMult = -5.0 Auto Const
  Float Property fSmugglingCapacityMult = 1.0 Auto Const
  Float Property fSmugglingWeightPower = 0.5 Auto Const
  Float Property fSmugglingWeightMult = -1.0 Auto Const
  Float Property fSmugglingWeightMax = 2000.0 Auto Const
  Float Property fSmugglingMaxChance = 90.0 Auto Const
  Float Property fSmugglingMinChance = 10.0 Auto Const
  Float[] Property ScanJammerMults Auto Const mandatory
  { this will hold the values to use in the formula for each level of SpaceshipScanJammer, which will be ints }
  Float[] Property PlayerSkillMults Auto Const mandatory
  { this will hold the values to use in the formula for each level of player skill, which will be ints }
  ActorValue Property CarryWeightShielded Auto Const mandatory
  ActorValue Property Perception Auto Const mandatory
  ActorValue Property PayloadLevel Auto Const mandatory
  { player's Payloads skill }
  ActorValue Property SpaceshipScanJammer Auto Const mandatory
  { ship's scan jammer level }
  Int Property SmugglingAchievementID = 45 Auto Const
EndGroup

Group ShipCriticalHits
  ActorValue Property ShipSystemReactorHealth Auto Const mandatory
  { reactor system health }
  ActorValue Property Health Auto Const mandatory
  { ship health }
  ActorValue Property ShipSystemEngineHealth Auto Const mandatory
  { engine system health - needed if crew goes to 0 }
  ActorValue Property SpaceshipCriticalHitCrew Auto Const mandatory
  { set to 1 when crew is wiped out by a critical }
  Int Property maxCrewDamage = 6 Auto Const
  { max number of crew that can be killed in a single critical hit }
  Float Property minReactorHealthDamage = 0.100000001 Auto Const
  { min % of reactor health to damage }
  Float Property maxReactorHealthDamage = 0.25 Auto Const
  { max % of reactor health to damage }
  Float Property minHullHealthDamage = 0.100000001 Auto Const
  { min % of Hull health to damage }
  Float Property maxHullHealthDamage = 0.25 Auto Const
  { max % of reactor health to damage }
  Float Property minSystemHealthDamage = 1.0 Auto Const
  { min % of system health to damage }
  Float Property maxSystemHealthDamage = 1.25 Auto Const
  { max % of system health to damage }
  ActorValue[] Property SystemHealthAVs Auto Const
  { system health actor values }
  ActorValue[] Property SystemEMHealthAVs Auto Const
  { system EM health actor values }
  Message[] Property CriticalHitMessages Auto Const
  { array of critical hit messages - index matches the hit type }
  wwiseevent Property UICriticalHitShip Auto Const mandatory
  { critical hit sound }
EndGroup


;-- Functions ---------------------------------------

Function TestGetBaseActor(Actor testActor)
  ; Empty function
EndFunction

Function TestGetEditorLocation(ObjectReference testRef)
  ; Empty function
EndFunction

Function TestGetMatchingActorBase(Actor theActor)
  ; Empty function
EndFunction

Function TestIsInSameLocation(ObjectReference refToTest, Location locationToTest, Keyword locationKeyword)
  ; Empty function
EndFunction

Function testConditionForm(ObjectReference testRef, conditionform testCondition)
  ; Empty function
EndFunction

Function testGetRefsLinkedToMe(ObjectReference refToCheck, Keyword keywordToCheck)
  ; Empty function
EndFunction

Function testRandomInt(Int Min, Int Max)
  ; Empty function
EndFunction

Event OnQuestInit()
  SurveySites = new sq_parentscript:surveysite[0]
  tutorialQuest = (Self as Quest) as defaulttutorialquestscript
  Actor playerRef = Game.GetPlayer()
  Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnPlayerPlanetSurveyComplete")
  Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnPlayerScannedObject")
  SystemsFullySurveyed = new Location[0]
EndEvent

Event Actor.OnPlayerPlanetSurveyComplete(Actor akSource, planet akPlanet)
  Self.CheckCompletePlanetSurvey(akPlanet, False)
EndEvent

Event Actor.OnPlayerScannedObject(Actor akSource, ObjectReference akScannedRef)
  Self.CheckCompletePlanetSurvey(akScannedRef.GetCurrentPlanet(), False)
EndEvent

Event ObjectReference.OnSell(ObjectReference akSource, Actor akSeller)
  Int index = SurveySlates.Find(akSource)
  If index > -1
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnSell")
    SurveySlates.RemoveRef(akSource)
  EndIf
EndEvent

Function SendPlanetTraitDiscoveredEvent(planet traitPlanet, Keyword PlanetTrait, Int discoverCountCurrent, Int discoverCountRequired)
  Var[] kargs = new Var[4]
  kargs[0] = traitPlanet as Var
  kargs[1] = PlanetTrait as Var
  kargs[2] = discoverCountCurrent as Var
  kargs[3] = discoverCountRequired as Var
  Self.SendCustomEvent("sq_parentscript_SQ_PlanetTraitDiscovered", kargs)
EndFunction

Function SendPlanetTraitUpdatedEvent(planet traitPlanet, Keyword PlanetTrait, Int discoverCountCurrent, Int discoverCountRequired)
  Var[] kargs = new Var[4]
  kargs[0] = traitPlanet as Var
  kargs[1] = PlanetTrait as Var
  kargs[2] = discoverCountCurrent as Var
  kargs[3] = discoverCountRequired as Var
  Self.SendCustomEvent("sq_parentscript_SQ_PlanetTraitUpdated", kargs)
EndFunction

Function SendBEStartedEvent(ObjectReference enemyShip, bescript BEQuest)
  Var[] kargs = new Var[2]
  kargs[0] = enemyShip as Var
  kargs[1] = BEQuest as Var
  Self.SendCustomEvent("sq_parentscript_SQ_BEStarted", kargs)
EndFunction

Function SendBEForceStopEvent()
  Self.SendCustomEvent("sq_parentscript_SQ_BEForceStop", None)
EndFunction

Function SendNativeTerminalActorUnconsciousEvent(ObjectReference terminalRef, Actor actorRef, Bool bSetUnconscious)
  Var[] kargs = new Var[3]
  kargs[0] = terminalRef as Var
  kargs[1] = actorRef as Var
  kargs[2] = bSetUnconscious as Var
  Self.SendCustomEvent("sq_parentscript_SQ_NativeTerminalActor_Unconscious", kargs)
EndFunction

Function SendNativeTerminalActorAllyEvent(ObjectReference terminalRef, Actor actorRef)
  Var[] kargs = new Var[2]
  kargs[0] = terminalRef as Var
  kargs[1] = actorRef as Var
  Self.SendCustomEvent("sq_parentscript_SQ_NativeTerminalActor_Ally", kargs)
EndFunction

Function SendNativeTerminalActorFrenzyEvent(ObjectReference terminalRef, Actor actorRef)
  Var[] kargs = new Var[2]
  kargs[0] = terminalRef as Var
  kargs[1] = actorRef as Var
  Self.SendCustomEvent("sq_parentscript_SQ_NativeTerminalActor_Frenzy", kargs)
EndFunction

Function SendAlarmTriggeredOnEvent(ObjectReference alarmRef, Actor alarmActor, sq_alarmscript SQ_AlarmQuest)
  If alarmRef as Bool && SQ_AlarmQuest as Bool
    Var[] kargs = new Var[4]
    kargs[0] = alarmRef.GetCurrentLocation() as Var
    kargs[1] = SQ_AlarmQuest as Var
    kargs[2] = alarmRef as Var
    kargs[3] = alarmActor as Var
    Self.SendCustomEvent("sq_parentscript_SQ_AlarmTriggeredOn", kargs)
  EndIf
EndFunction

Function SendAlarmTriggeredOffEvent(ObjectReference alarmRef, sq_alarmscript SQ_AlarmQuest)
  If alarmRef as Bool && SQ_AlarmQuest as Bool
    Var[] kargs = new Var[3]
    kargs[0] = alarmRef.GetCurrentLocation() as Var
    kargs[1] = SQ_AlarmQuest as Var
    kargs[2] = alarmRef as Var
    Self.SendCustomEvent("sq_parentscript_SQ_AlarmTriggeredOff", kargs)
  EndIf
EndFunction

Function SendPiracyEvent(ObjectReference piratedShip, Bool piracySuccess)
  Var[] kargs = new Var[2]
  kargs[0] = piratedShip as Var
  kargs[1] = piracySuccess as Var
  Self.SendCustomEvent("sq_parentscript_SQ_PiracyEvent", kargs)
EndFunction

Function SendContrabandConfiscatedEvent(Faction crimeFaction)
  Self.SendCustomEvent("sq_parentscript_SQ_ContrabandConfiscated", None)
EndFunction

Function UpdateTextReplacementAliasesPlanet(planet planetToUse)
  Location planetLocation = planetToUse.GetLocation()
  Location systemLocation = planetLocation.GetParentLocations(LocTypeStarSystem)[0]
  PlanetReferencePlanetLocation.ForceLocationTo(planetLocation)
  PlanetReferenceSystemLocation.ForceLocationTo(systemLocation)
EndFunction

Function UpdateTextReplacementAliases(ObjectReference siteMarkerRef)
  PlanetReference.ForceRefTo(siteMarkerRef)
  Location siteMarkerLocation = siteMarkerRef.GetCurrentLocation()
  Location sitePlanetLocation = siteMarkerLocation.GetParentLocations(LocTypeMajorOrbital)[0]
  Location siteSystemLocation = siteMarkerLocation.GetParentLocations(LocTypeStarSystem)[0]
  PlanetReferencePlanetLocation.ForceLocationTo(sitePlanetLocation)
  PlanetReferenceSystemLocation.ForceLocationTo(siteSystemLocation)
EndFunction

sq_parentscript:planettraitdata Function GetPlanetTraitData(ObjectReference refToCheck)
  planettraitscantargetscript scanTargetRef = refToCheck as planettraitscantargetscript
  sq_parentscript:planettraitdata theData = None
  planet planetToCheck = refToCheck.GetCurrentPlanet()
  Location locationToCheck = refToCheck.GetCurrentLocation()
  mapmarkerplanettraitscript mapMarkerRef = None
  If scanTargetRef as Bool && scanTargetRef.GetLinkedRef(SQ_PlanetTraitOverrideLink) is mapmarkerplanettraitscript
    mapMarkerRef = scanTargetRef.GetLinkedRef(SQ_PlanetTraitOverrideLink) as mapmarkerplanettraitscript
  Else
    mapMarkerRef = refToCheck as mapmarkerplanettraitscript
  EndIf
  If mapMarkerRef as Bool && mapMarkerRef.LocationTraitOverride as Bool
    theData = Self.FindMatchingPlanetTraitForKeyword(mapMarkerRef.LocationTraitOverride, planetToCheck)
  Else
    theData = Self.FindMatchingPlanetTrait(locationToCheck, planetToCheck)
  EndIf
  Return theData
EndFunction

Function DiscoverMatchingPlanetTraits(ObjectReference refToCheck, Bool incrementScanCount)
  Guard discoverMatchingTraitsBusy ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    sq_parentscript:planettraitdata theData = Self.GetPlanetTraitData(refToCheck)
    planettraitscantargetscript scanTargetRef = refToCheck as planettraitscantargetscript
    If scanTargetRef
      ScanTargetName.ForceRefTo(scanTargetRef.PlanetTraitScanTargetRef)
      ScanTarget.ForceRefTo(scanTargetRef as ObjectReference)
    EndIf
    Location locationToCheck = refToCheck.GetCurrentLocation()
    If theData
      Int scanCountNeeded = locationToCheck.GetRefTypeAliveCount(PlanetTraitScanTargetLocRef)
      Int scanCount = locationToCheck.GetValue(PlanetTraitLocationScanCount) as Int
      If incrementScanCount
        scanCount += 1
      EndIf
      locationToCheck.SetValue(PlanetTraitLocationScanCount, scanCount as Float)
      If scanCount >= scanCountNeeded
        If locationToCheck.IsExplored() == False
          locationToCheck.SetExplored(True)
          Self.UpdatePlanetTraitDiscoveryPrivate(refToCheck, theData, 1)
        EndIf
      Else
        Self.UpdateTextReplacementAliases(refToCheck)
        PlanetTraitCategory.ForceRefTo(theData.TraitCategoryMarker)
        PlanetTraitName.ForceRefTo(theData.TraitNameMarker)
        If incrementScanCount
          
        ElseIf locationToCheck.IsExplored() == False
          SQ_ParentPlanetTraitExploreMessage.Show(scanCount as Float, scanCountNeeded as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function UpdatePlanetTraitDiscovery(ObjectReference refToCheck, sq_parentscript:planettraitdata theData, Int incrementAmount)
  Guard discoverMatchingTraitsBusy ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.UpdatePlanetTraitDiscoveryPrivate(refToCheck, theData, incrementAmount)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function UpdatePlanetTraitDiscoveryPrivate(ObjectReference refToCheck, sq_parentscript:planettraitdata theData, Int incrementAmount)
  If theData as Bool && refToCheck as Bool
    planet planetToCheck = refToCheck.GetCurrentPlanet()
    Self.UpdateTextReplacementAliases(refToCheck)
    Location planetLocation = PlanetReferencePlanetLocation.GetLocation()
    PlanetTraitCategory.ForceRefTo(theData.TraitCategoryMarker)
    PlanetTraitName.ForceRefTo(theData.TraitNameMarker)
    If planetToCheck.IsTraitKnown(theData.PlanetTrait)
      
    Else
      Int traitValue = planetLocation.GetValue(theData.PlanetTraitAV) as Int + incrementAmount
      planetLocation.SetValue(theData.PlanetTraitAV, traitValue as Float)
      Int surveyingBonus = Game.GetPlayer().GetValueInt(SurveyingTraitBonus)
      Int discoverCountRequiredActual = 1
      If traitValue >= discoverCountRequiredActual
        Self.DiscoverPlanetTrait(planetToCheck, theData, traitValue, 1.0)
      Else
        SQ_ParentPlanetTraitUpdateMessage.Show(traitValue as Float, discoverCountRequiredActual as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Self.SendPlanetTraitUpdatedEvent(planetToCheck, theData.PlanetTrait, traitValue, theData.discoverCountRequired)
      EndIf
    EndIf
  EndIf
EndFunction

Function DiscoverPlanetTrait(planet planetToCheck, sq_parentscript:planettraitdata theData, Int traitValue, Float xpMult)
  PlanetTraitCategory.ForceRefTo(theData.TraitCategoryMarker)
  PlanetTraitName.ForceRefTo(theData.TraitNameMarker)
  planetToCheck.SetTraitKnown(theData.PlanetTrait, True)
  Int xpReward = (PlanetTraitXPReward.GetValueInt() as Float * xpMult) as Int
  Actor playerRef = Game.GetPlayer()
  If (theData.AssociatedSkill as Bool && playerRef.HasPerk(theData.AssociatedSkill)) || (theData.AssociatedSkill02 as Bool && playerRef.HasPerk(theData.AssociatedSkill))
    xpReward += PlanetTraitXPRewardSkillBonus.GetValueInt()
  EndIf
  Game.RewardPlayerXP(xpReward, False)
  Self.SendPlanetTraitDiscoveredEvent(planetToCheck, theData.PlanetTrait, traitValue, theData.discoverCountRequired)
EndFunction

Function CheckForScanTargetUpdate(ObjectReference refToCheck)
  Location locationToCheck = refToCheck.GetCurrentLocation()
  planet planetToCheck = refToCheck.GetCurrentPlanet()
  sq_parentscript:planettraitdata theData = Self.FindMatchingPlanetTrait(locationToCheck, planetToCheck)
  If theData
    If planetToCheck.IsTraitKnown(theData.PlanetTrait)
      Self.UpdateScanTarget(refToCheck)
      locationToCheck.SetExplored(True)
    EndIf
  EndIf
EndFunction

Function UpdateScanTarget(ObjectReference refToCheck)
  planettraitscantargetscript scanTargetRef = refToCheck as planettraitscantargetscript
  If scanTargetRef
    ScanTargetName.ForceRefTo(scanTargetRef.PlanetTraitScanTargetRef)
    ScanTarget.ForceRefTo(scanTargetRef as ObjectReference)
    scanTargetRef.SetScanned(True)
  EndIf
EndFunction

sq_parentscript:planettraitdata Function FindMatchingPlanetTrait(Location locationToCheck, planet planetToCheck)
  Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
  sq_parentscript:planettraitdata theData = None
  Int I = 0
  While I < matchingKeywords.Length && theData == None
    Keyword planetTraitKeyword = matchingKeywords[I]
    If locationToCheck.HasKeyword(planetTraitKeyword)
      Int planetTraitIndex = PlanetTraits.findstruct("PlanetTrait", planetTraitKeyword, 0)
      If planetTraitIndex > -1
        theData = PlanetTraits[planetTraitIndex]
      EndIf
    EndIf
    I += 1
  EndWhile
  Return theData
EndFunction

sq_parentscript:planettraitdata Function FindMatchingPlanetTraitForKeyword(Keyword keywordToCheck, planet planetToCheck)
  Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
  sq_parentscript:planettraitdata theData = None
  Int I = 0
  While I < matchingKeywords.Length && theData == None
    Keyword planetTraitKeyword = matchingKeywords[I]
    If keywordToCheck == planetTraitKeyword
      Int planetTraitIndex = PlanetTraits.findstruct("PlanetTrait", planetTraitKeyword, 0)
      If planetTraitIndex > -1
        theData = PlanetTraits[planetTraitIndex]
      EndIf
    EndIf
    I += 1
  EndWhile
  Return theData
EndFunction

Function OnPlayerScanPlanet(planet planetToCheck)
  Int discoverTraitChance = Skill_Astrophysics_DiscoverTraitChance.GetValueInt()
  If discoverTraitChance > 0
    Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
    If matchingKeywords.Length > 0
      Int discoveryRoll = Utility.RandomInt(0, 100)
      If discoveryRoll <= discoverTraitChance
        Int I = matchingKeywords.Length - 1
        While I > -1
          If planetToCheck.IsTraitKnown(matchingKeywords[I])
            matchingKeywords.remove(I, 1)
          EndIf
          I += -1
        EndWhile
        If matchingKeywords.Length > 0
          Int randomKeyword = Utility.RandomInt(0, matchingKeywords.Length - 1)
          Keyword traitToDiscover = matchingKeywords[randomKeyword]
          sq_parentscript:planettraitdata theData = Self.FindMatchingPlanetTraitForKeyword(traitToDiscover, planetToCheck)
          Guard discoverMatchingTraitsBusy ;*** WARNING: Experimental syntax, may be incorrect: Guard 
            Self.DiscoverPlanetTrait(planetToCheck, theData, 99, PlanetTraitXPRewardAstrophysicsMult.GetValue())
          EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
        EndIf
      EndIf
    EndIf
  EndIf
  Self.CheckCompletePlanetSurvey(planetToCheck, False)
EndFunction

Function CheckCompletePlanetSurvey(planet planetToCheck, Bool bForceCompletion)
  Guard planetSurveyLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If planetToCheck.HasKeyword(LocTypeMajorOrbital)
      Location planetLocation = planetToCheck.GetLocation()
      Float lastSurveyReward = planetLocation.GetValue(SQ_PlanetLastSurveyReward)
      Float currentSurvey = planetToCheck.GetSurveyPercent()
      If currentSurvey > lastSurveyReward
        Float actualRewardThreshold = 0.0
        Float currentRewardThreshold = 0.0
        Int I = 0
        While I < SurveyRewardThresholds.Length && actualRewardThreshold == 0.0
          If currentSurvey >= SurveyRewardThresholds[I]
            actualRewardThreshold = SurveyRewardThresholds[I]
          EndIf
          I += 1
        EndWhile
        currentRewardThreshold = actualRewardThreshold
        If bForceCompletion
          currentRewardThreshold = 1.0
        EndIf
        If currentRewardThreshold > lastSurveyReward
          planetLocation.SetValue(SQ_PlanetLastSurveyReward, currentRewardThreshold)
          sq_planetsurveyslatescript slateToReplace = None
          If lastSurveyReward > 0.0
            sq_planetsurveyslatescript[] surveySlateArray = SurveySlates.GetArray() as sq_planetsurveyslatescript[]
            I = 0
            While I < surveySlateArray.Length && slateToReplace == None
              sq_planetsurveyslatescript theSlate = surveySlateArray[I]
              If theSlate.myPlanet == planetToCheck
                slateToReplace = theSlate
                Self.UnregisterForRemoteEvent(slateToReplace as ScriptObject, "OnSell")
              EndIf
              I += 1
            EndWhile
            If slateToReplace == None
              currentRewardThreshold -= lastSurveyReward
            EndIf
          EndIf
          Int totalTraitValue = Self.GetPlanetTraitValue(planetToCheck) + Self.GetPlanetAbundanceValue(planetToCheck) as Int
          Actor player = Game.GetPlayer()
          spaceshipreference playerShipRef = PlayerShip.GetShipRef()
          If playerShipRef == None
            
          ElseIf MB_Parent.IsPlanetSurveyTarget(playerShipRef as ObjectReference)
            
          Else
            Book planetSurveySlate = None
            GlobalVariable RewardXP = None
            sq_parentscript:planetsurveyslatedata theData = Self.GetSurveySlateData(totalTraitValue, currentRewardThreshold)
            If theData
              planetSurveySlate = theData.planetSurveySlate
              RewardXP = theData.RewardXP
            EndIf
            Self.UpdateTextReplacementAliasesPlanet(planetToCheck)
            Keyword[] keywords = new Keyword[0]
            If SQ_PlanetIsHabitable.IsTrue(playerShipRef as ObjectReference, None)
              keywords.add(SQ_PlanetIsHabitableKeyword, 1)
              Rad01_LIST.SurveyCompleted()
            EndIf
            ObjectReference currentSlateContainer = player as ObjectReference
            If slateToReplace
              currentSlateContainer = slateToReplace.GetContainer()
            EndIf
            sq_planetsurveyslatescript newSlate = None
            Bool addNewItem = False
            If currentSlateContainer
              addNewItem = True
              If slateToReplace
                SurveySlates.RemoveRef(slateToReplace as ObjectReference)
                currentSlateContainer.RemoveItem(slateToReplace as Form, 1, True, None)
                addNewItem = False
              EndIf
              newSlate = currentSlateContainer.AddAliasedItemWithKeywordsSingle(planetSurveySlate as Form, SurveySlate as Alias, True, keywords) as sq_planetsurveyslatescript
            Else
              newSlate = slateToReplace.PlaceAtMe(planetSurveySlate as Form, 1, False, True, True, None, SurveySlate as Alias, True) as sq_planetsurveyslatescript
              If keywords != None && keywords.Length > 0
                I = 0
                While I < keywords.Length
                  newSlate.AddKeyword(keywords[I])
                  I += 1
                EndWhile
              EndIf
              SurveySlates.RemoveRef(slateToReplace as ObjectReference)
              slateToReplace.DisableNoWait(False)
              newSlate.EnableNoWait(False)
            EndIf
            SurveySlates.AddRef(newSlate as ObjectReference)
            Int rewardThresholdPercent = (actualRewardThreshold * 100.0) as Int
            Int addNewItemInt = 0
            If addNewItem
              addNewItemInt = 1
            EndIf
            Quest[] surveySlateQuests = SQ_SurveySlateEvent.SendStoryEventAndWait(None, None, None, addNewItemInt, rewardThresholdPercent)
            If surveySlateQuests == None
              
            EndIf
            newSlate.myPlanet = planetToCheck
            Self.RegisterForRemoteEvent(newSlate as ScriptObject, "OnSell")
            If currentSurvey >= 1.0
              If RewardXP
                Game.RewardPlayerXP(RewardXP.GetValueInt(), False)
              EndIf
              Self.CheckCompleteSystemSurvey(planetToCheck)
            EndIf
          EndIf
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

sq_parentscript:planetsurveyslatedata Function GetSurveySlateData(Int planetRewardValue, Float currentRewardThreshold)
  sq_parentscript:planetsurveyslatedata rewardSlateData = None
  Int S = 0
  While S < PlanetSurveySlates.Length && rewardSlateData == None
    sq_parentscript:planetsurveyslatedata theData = PlanetSurveySlates[S]
    If theData.minTraitValue <= planetRewardValue && currentRewardThreshold >= theData.minSurveyPercent
      rewardSlateData = theData
    EndIf
    S += 1
  EndWhile
  Return rewardSlateData
EndFunction

Function CheckCompleteSystemSurvey(planet planetToCheck)
  Location currentSystem = PlanetReferenceSystemLocation.GetLocation()
  If currentSystem
    Int I = 0
    Bool foundMatch = False
    While I < SystemsFullySurveyed.Length && foundMatch == False
      Location theSystem = SystemsFullySurveyed[I]
      foundMatch = theSystem == currentSystem
      I += 1
    EndWhile
    If foundMatch == False
      I = 0
      Float surveyPercentage = 1.0
      Int systemTraitValue = 0
      While I < SystemPlanets.Length && surveyPercentage >= 1.0
        LocationAlias planetAlias = SystemPlanets[I]
        planetAlias.RefillAlias()
        Location planetLocation = planetAlias.GetLocation()
        If planetLocation
          planet thePlanet = planetLocation.GetCurrentPlanet()
          surveyPercentage = thePlanet.GetSurveyPercent()
          If surveyPercentage >= 1.0
            systemTraitValue += Self.GetPlanetTraitValue(thePlanet)
          EndIf
        EndIf
        I += 1
      EndWhile
      If surveyPercentage >= 1.0
        I = 0
        GlobalVariable RewardXP = None
        While I < SystemSurveyRewards.Length && RewardXP == None
          sq_parentscript:systemsurveydata theRewardData = SystemSurveyRewards[I]
          If systemTraitValue >= theRewardData.minTraitValue
            RewardXP = theRewardData.RewardXP
          EndIf
          I += 1
        EndWhile
        If RewardXP
          Game.RewardPlayerXP(RewardXP.GetValueInt(), False)
        EndIf
        SystemsFullySurveyed.add(currentSystem, 1)
      EndIf
    EndIf
  EndIf
EndFunction

Int Function GetPlanetTraitValue(planet planetToCheck)
  Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
  Int I = 0
  Int totalTraitValue = 0
  While I < matchingKeywords.Length
    Keyword planetTraitKeyword = matchingKeywords[I]
    Bool allTraitsKnown = planetToCheck.IsTraitKnown(planetTraitKeyword)
    Int planetTraitIndex = PlanetTraits.findstruct("PlanetTrait", planetTraitKeyword, 0)
    If planetTraitIndex > -1
      sq_parentscript:planettraitdata theData = PlanetTraits[planetTraitIndex]
      totalTraitValue += 1
    EndIf
    I += 1
  EndWhile
  Return totalTraitValue
EndFunction

Float Function GetPlanetAbundanceValue(planet planetToCheck)
  Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetFloraAbundance)
  Int I = 0
  Float totalSurveyValue = 0.0
  While I < matchingKeywords.Length
    Keyword planetKeyword = matchingKeywords[I]
    Int planetTraitIndex = PlanetAbundanceKeywords.findstruct("planetKeyword", planetKeyword, 0)
    If planetTraitIndex > -1
      sq_parentscript:planetabundancedata theData = PlanetAbundanceKeywords[planetTraitIndex]
      totalSurveyValue += theData.surveyDifficulty
    EndIf
    I += 1
  EndWhile
  matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetFaunaAbundance)
  I = 0
  While I < matchingKeywords.Length
    Keyword planetkeyword = matchingKeywords[I]
    Int planettraitindex = PlanetAbundanceKeywords.findstruct("planetKeyword", planetkeyword, 0)
    If planettraitindex > -1
      sq_parentscript:planetabundancedata thedata = PlanetAbundanceKeywords[planettraitindex]
      totalSurveyValue += thedata.surveyDifficulty
    EndIf
    I += 1
  EndWhile
  Return totalSurveyValue
EndFunction

Function CheckForRenameMapMarker(ObjectReference mapMarkerRef)
  Location myLocation = mapMarkerRef.GetCurrentLocation()
  If myLocation as Bool && Self.VisibleOnStarmap(myLocation)
    Int I = 0
    Bool found = False
    While found == False && I < MapMarkerNames.Length
      sq_parentscript:mapmarkername theMarkerNameData = MapMarkerNames[I]
      found = myLocation.HasKeyword(theMarkerNameData.groupTypeKeyword)
      If found
        ObjectReference myRenameMarker = mapMarkerRef.PlaceAtMe(theMarkerNameData.nameMarker, 1, False, False, True, None, None, True)
        mapMarkerRef.SetLinkedRef(myRenameMarker, MapMarkerLinkedRefNameOverride, True)
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction

Bool Function VisibleOnStarmap(Location locationToCheck)
  Int I = 0
  Bool isVisible = False
  While I < OE_CiviliansVisibleFromStarmapKeywords.GetSize() && isVisible == False
    Keyword theKeyword = OE_CiviliansVisibleFromStarmapKeywords.GetAt(I) as Keyword
    isVisible = theKeyword as Bool && locationToCheck.HasKeyword(theKeyword)
    I += 1
  EndWhile
  Return isVisible
EndFunction

Function HarvestActor(Actor HarvestActor)
  Guard harvestLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor player = Game.GetPlayer()
    If HarvestActor
      If HarvestActor.GetValue(ZoologyNonLethalHarvestCount) < ZoologyNonLethalHarvestCountMax.GetValue()
        HarvestActor.ModValue(ZoologyNonLethalHarvestCount, 1.0)
        resource[] resources = HarvestActor.GetValueResources()
        Int I = 0
        While I < resources.Length
          MiscObject harvestItem = resources[I].GetCreatedObject() as MiscObject
          If harvestItem
            player.AddItem(harvestItem as Form, 1, False)
            SQ_Companions.SendAffinityEvent(SQ_Companions.COM_Event_Action_Harvest_Animal, None, False)
          EndIf
          I += 1
        EndWhile
        Game.RequestHUDRolloverRefresh()
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function SetupDamagedShip(spaceshipreference damagedShip, Bool shouldBeDestroyed, Bool shouldBeDerelict, Bool shouldApplyDerelictName, Bool shouldDamageRandomSystems, Bool shouldDisableExteriorLights, Bool shouldBlockRepairOfDestroyedParts, sq_parentscript:actorvaluedatum[] additionalActorValuesToDamage)
  If damagedShip == None
    
  ElseIf shouldBeDestroyed
    damagedShip.KillSilent(None)
  Else
    If shouldBeDerelict
      damagedShip.AddKeyword(BEDerelict)
      damagedShip.DamageValue(SpaceshipCrew, damagedShip.GetValue(SpaceshipCrew))
    EndIf
    If shouldApplyDerelictName
      DerelictShipNameAlias.ApplyToRef(damagedShip as ObjectReference)
    EndIf
    If shouldDamageRandomSystems
      Int I = 0
      While I < RandomShipDamageData.Length
        Float DamagePercent = 0.0
        If Utility.RandomFloat(0.0, 1.0) < RandomShipDamageData[I].ChanceDestroyed
          DamagePercent = 1.0
        Else
          DamagePercent = 1.0 - Utility.RandomFloat(RandomShipDamageData[I].MinDamagePercent, RandomShipDamageData[I].MaxDamagePercent)
        EndIf
        damagedShip.DamageValue(RandomShipDamageData[I].ActorValueToDamage, damagedShip.GetValue(RandomShipDamageData[I].ActorValueToDamage) * DamagePercent)
        I += 1
      EndWhile
    EndIf
    If shouldDisableExteriorLights
      damagedShip.SetValue(SpaceshipExternalLightsDisabledValue, 1.0)
    EndIf
    If shouldBlockRepairOfDestroyedParts
      damagedShip.EnablePartRepair(None, False)
    EndIf
    If additionalActorValuesToDamage != None
      Int i = 0
      While i < additionalActorValuesToDamage.Length
        damagedShip.DamageValue(additionalActorValuesToDamage[i].ActorValueToDamage, damagedShip.GetValue(additionalActorValuesToDamage[i].ActorValueToDamage) * additionalActorValuesToDamage[i].DamagePercent)
        i += 1
      EndWhile
    EndIf
  EndIf
EndFunction

Float Function GetSmugglingChance(spaceshipreference playerShipRef, spaceshipreference scanningShipRef)
  Int contrabandStatus = playerShipRef.CheckContrabandStatus(True)
  Float realChance = 0.0
  If contrabandStatus < 0
    realChance = 100.0
  ElseIf contrabandStatus > 0
    realChance = 0.0
  Else
    Float contrabandWeight = playerShipRef.GetContrabandWeight(False)
    Float contrabandWeightShip = playerShipRef.GetContrabandWeight(True)
    Float contrabandCapacity = playerShipRef.GetValue(CarryWeightShielded)
    Int playerSmugglingSkillValue = Math.Clamp(Game.GetPlayer().GetValueInt(PayloadLevel) as Float, 0.0, (PlayerSkillMults.Length - 1) as Float) as Int
    Float playerSmugglingSkillBonus = PlayerSkillMults[playerSmugglingSkillValue]
    Int playerScanJammerValue = Math.Clamp(playerShipRef.GetValueInt(SpaceshipScanJammer) as Float, 0.0, (ScanJammerMults.Length - 1) as Float) as Int
    Float playerScanJammerBonus = ScanJammerMults[playerScanJammerValue]
    Float scanningShipPerception = scanningShipRef.GetValue(Perception)
    Float targetSkillFactor = fSmugglingTargetSkillMult * scanningShipPerception
    Float contrabandWeightFactor = fSmugglingWeightMult * Math.pow(contrabandWeight, fSmugglingWeightPower) * contrabandWeight / contrabandCapacity
    Float baseChance = fSmugglingBaseChance + targetSkillFactor + contrabandWeightFactor
    realChance = baseChance * (1.0 + playerScanJammerBonus) * (1.0 + playerSmugglingSkillBonus)
    realChance = Math.Max(realChance, fSmugglingMinChance)
    realChance = Math.Min(realChance, fSmugglingMaxChance)
  EndIf
  Return realChance
EndFunction

Bool Function SmugglingMinigame(spaceshipreference playerShipRef, spaceshipreference scanningShipRef)
  Float realChance = Self.GetSmugglingChance(playerShipRef, scanningShipRef)
  Float dieRoll = Utility.RandomFloat(1.0, 100.0)
  Bool bSuccess = dieRoll <= realChance
  If bSuccess
    Game.AddAchievement(SmugglingAchievementID)
  EndIf
  Return bSuccess
EndFunction

Function CheckForAttack(outpostbeaconscript outpostRef, Bool bForceAttack, Int iForceAttackType, Float fDieRoll)
  If outpostRef.AllowAttacks == False
    Return 
  EndIf
  If Game.GetPlayer().GetCurrentPlanet() != outpostRef.GetCurrentPlanet()
    Return 
  EndIf
  Location outpostLocation = outpostRef.GetCurrentLocation()
  Location[] parentLocations = outpostLocation.GetParentLocations(LocTypeMajorOrbital)
  If !parentLocations
    Return 
  EndIf
  Location myPlanet = parentLocations[0]
  Float lastAttackRoll = myPlanet.GetValue(OutpostLastAttackRollTimestamp)
  Float daysSinceLastRoll = Utility.GetCurrentGameTime() - lastAttackRoll
  If lastAttackRoll > 0.0 && minDaysSinceLastAttackRoll > daysSinceLastRoll && bForceAttack == False
    Return 
  EndIf
  Float lastAttack = myPlanet.GetValue(OutpostLastAttackTimestamp)
  Float daysSinceLastAttack = 0.0
  If lastAttack <= 0.0
    daysSinceLastAttack = minDaysSinceLastAttack + 1.0
  Else
    daysSinceLastAttack = Utility.GetCurrentGameTime() - lastAttack
  EndIf
  If minDaysSinceLastAttack > daysSinceLastAttack && bForceAttack == False
    Return 
  EndIf
  Int I = 0
  Float specialCaseRating = 0.0
  While I < OutpostAttackSpecialCases.Length
    sq_parentscript:outpostattackspecialcase theSpecialCase = OutpostAttackSpecialCases[I]
    If theSpecialCase.specialCaseCondition.IsTrue(outpostRef as ObjectReference, None)
      If theSpecialCase.storyEventKeyword
        If Game.GetDieRollSuccess((theSpecialCase.specialCaseAttackChance * 100.0) as Int, 1, 100, -1, -1) || fDieRoll > 0.0 && fDieRoll <= theSpecialCase.specialCaseAttackChance
          Quest[] specialCaseAttacks = theSpecialCase.storyEventKeyword.SendStoryEventAndWait(None, outpostRef as ObjectReference, None, 0, 0)
          If specialCaseAttacks
            Return 
          EndIf
        EndIf
      Else
        specialCaseRating += theSpecialCase.specialCaseAttackChance
      EndIf
    EndIf
    I += 1
  EndWhile
  missionparentscript:missionsupplytype[] resourceAVs = MB_Parent.resourceAVs
  Float resourceRating = 0.0
  I = 0
  While I < resourceAVs.Length
    Float resourceValue = outpostRef.GetValue(resourceAVs[I].supplyAV)
    If resourceValue > 0.0
      resourceRating += resourceValue
    EndIf
    I += 1
  EndWhile
  Float cargoLinkRating = outpostRef.GetValue(OutpostCargoLinkAV)
  Float attackChance = attackChanceBase + attackChanceResourceMult * resourceRating + attackChanceCargoLinkMult * cargoLinkRating + specialCaseRating
  Float attackRoll = Utility.RandomFloat(0.0, 1.0)
  If fDieRoll > 0.0
    attackRoll = fDieRoll
  EndIf
  If attackRoll <= attackChanceCreature && iForceAttackType == 0 || iForceAttackType > 1
    SQ_OutpostEventAttackCreatures.SendStoryEvent(None, outpostRef as ObjectReference, None, 0, 0)
  ElseIf attackRoll <= attackChance || iForceAttackType == 1
    SQ_OutpostEventAttack.SendStoryEvent(None, outpostRef as ObjectReference, None, 0, 0)
  EndIf
  myPlanet.SetValue(OutpostLastAttackRollTimestamp, Utility.GetCurrentGameTime())
EndFunction

Function ShowTutorialMessage(Int tutorialID)
  Guard tutorialMessageGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int messageIndex = TutorialMessages.findstruct("tutorialID", tutorialID, 0)
    If messageIndex > -1
      sq_parentscript:tutorialmessage theMessage = TutorialMessages[messageIndex]
      theMessage.TutorialMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      TutorialMessages.remove(messageIndex, 1)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function IncrementComputersAchievement(ObjectReference terminalRef)
  Guard computersAchievementGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If ComputersAchievementAwarded == False
      If terminalRef.GetValue(ComputersAchievementAV) == 0.0
        terminalRef.SetValue(ComputersAchievementAV, 1.0)
        Actor playerRef = Game.GetPlayer()
        playerRef.ModValue(ComputersAchievementAV, 1.0)
        Int computerCount = playerRef.GetValueInt(ComputersAchievementAV)
        If computerCount >= ComputersAchievementCount.GetValueInt()
          Game.AddAchievement(ComputersAchievementID)
          ComputersAchievementAwarded = True
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function HandleCriticalHit(spaceshipreference targetShip, shipcriticalhiteffectscript:criticalhiteffect[] CriticalHitEffects)
  TryGuard ShipCriticalHitGuard ;*** WARNING: Experimental syntax, may be incorrect: TryGuard 
    Int totalCriticalHitEffectWeight = 0
    Int I = 0
    While I < CriticalHitEffects.Length
      shipcriticalhiteffectscript:criticalhiteffect theCriticalHit = CriticalHitEffects[I]
      totalCriticalHitEffectWeight += theCriticalHit.weight
      I += 1
    EndWhile
    Int criticalEffectRoll = Utility.RandomInt(1, totalCriticalHitEffectWeight)
    I = 0
    Int currentWeight = 0
    Int criticalHitEffectIndex = -1
    While I < CriticalHitEffects.Length && criticalHitEffectIndex < 0
      shipcriticalhiteffectscript:criticalhiteffect thecriticalhit = CriticalHitEffects[I]
      currentWeight += thecriticalhit.weight
      If criticalEffectRoll <= currentWeight
        criticalHitEffectIndex = I
      EndIf
      I += 1
    EndWhile
    If criticalHitEffectIndex > -1
      shipcriticalhiteffectscript:criticalhiteffect thecriticalhit = CriticalHitEffects[criticalHitEffectIndex]
      If thecriticalhit.criticalHitType == criticalHitType0_Reactor
        Float baseReactorHealth = targetShip.GetBaseValue(ShipSystemReactorHealth)
        Float minHealthDamage = baseReactorHealth * minReactorHealthDamage
        Float maxHealthDamage = baseReactorHealth * maxReactorHealthDamage
        Float damageHealth = Utility.RandomFloat(minHealthDamage, maxHealthDamage)
        targetShip.DamageValue(ShipSystemReactorHealth, damageHealth)
      ElseIf thecriticalhit.criticalHitType == criticalHitType1_Crew
        If targetShip.GetValue(SpaceshipCrew) > 0.0
          Int currentCrew = targetShip.GetValueInt(SpaceshipCrew)
          Int crewDamage = Utility.RandomInt(1, currentCrew)
          crewDamage = Math.Min(maxCrewDamage as Float, crewDamage as Float) as Int
          targetShip.DamageValue(SpaceshipCrew, crewDamage as Float)
          If targetShip.GetValueInt(SpaceshipCrew) == 0
            Float currentEngineHealth = targetShip.GetValue(ShipSystemEngineHealth)
            targetShip.DamageValue(ShipSystemEngineHealth, currentEngineHealth)
            targetShip.SetValue(SpaceshipCriticalHitCrew, 1.0)
          EndIf
        EndIf
      ElseIf thecriticalhit.criticalHitType == criticalHitType2_Hull
        Float baseHullHealth = targetShip.GetBaseValue(Health)
        Float minhealthdamage = baseHullHealth * minHullHealthDamage
        Float maxhealthdamage = baseHullHealth * maxHullHealthDamage
        Float damagehealth = Utility.RandomFloat(minhealthdamage, maxhealthdamage)
        targetShip.DamageValue(Health, damagehealth)
      ElseIf thecriticalhit.criticalHitType == criticalHitType3_System || thecriticalhit.criticalHitType == criticalHitType5_Engine || thecriticalhit.criticalHitType == criticalHitType6_Shield
        ActorValue systemAV = thecriticalhit.systemAV
        If systemAV == None
          ActorValue[] validSystemAVs = Self.GetValidSystemAVs(SystemHealthAVs, targetShip)
          Int systemIndex = Utility.RandomInt(0, validSystemAVs.Length - 1)
          systemAV = validSystemAVs[systemIndex]
        EndIf
        Float baseSystemHealth = targetShip.GetBaseValue(systemAV)
        Float minhealthdamage = baseSystemHealth * minSystemHealthDamage
        Float maxhealthdamage = baseSystemHealth * maxSystemHealthDamage
        Float damagehealth = Utility.RandomFloat(minhealthdamage, maxhealthdamage)
        targetShip.DamageValue(systemAV, damagehealth)
      ElseIf thecriticalhit.criticalHitType == criticalHitType4_EM
        ActorValue systemav = thecriticalhit.systemAV
        If systemav == None
          ActorValue[] validsystemavs = Self.GetValidSystemAVs(SystemEMHealthAVs, targetShip)
          Int systemindex = Utility.RandomInt(0, validsystemavs.Length - 1)
          systemav = validsystemavs[systemindex]
        EndIf
        Float basesystemhealth = targetShip.GetBaseValue(systemav)
        targetShip.DamageValue(systemav, basesystemhealth)
      EndIf
      Message criticalHitMessage = CriticalHitMessages[thecriticalhit.criticalHitType]
      If criticalHitMessage
        criticalHitMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        UICriticalHitShip.Play(Game.GetPlayer() as ObjectReference, None, None)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

ActorValue[] Function GetValidSystemAVs(ActorValue[] systemAVs, spaceshipreference targetShip)
  ActorValue[] validSystemAVs = new ActorValue[0]
  Int I = 0
  While I < systemAVs.Length
    If targetShip.GetValue(systemAVs[I]) > 0.0
      validSystemAVs.add(systemAVs[I], 1)
    EndIf
    I += 1
  EndWhile
  Return validSystemAVs
EndFunction

Function TestSetTraitKnown(Keyword planetTraitKeyword)
  planet planetToCheck = Game.GetPlayer().GetCurrentPlanet()
  planetToCheck.SetTraitKnown(planetTraitKeyword, True)
  Self.UpdateTextReplacementAliases(Game.GetPlayer() as ObjectReference)
  sq_parentscript:planettraitdata theData = Self.FindMatchingPlanetTraitForKeyword(planetTraitKeyword, planetToCheck)
  If theData
    Self.UpdatePlanetTraitDiscovery(Game.GetPlayer() as ObjectReference, theData, 99)
  EndIf
EndFunction

Function testSetGroupFaction(Actor testActor, Faction testFaction)
  testActor.SetGroupFaction(testFaction)
EndFunction

Function testEnableSpaceTravel(Location testLocation, Bool bEnable)
  testLocation.EnableSpaceTravel(Self as Quest, bEnable)
EndFunction

Function testSetSmugglingBaseChance(Float baseChance)
  fSmugglingBaseChance = baseChance
EndFunction

Function testSetScanned(ObjectReference scannableRef)
  scannableRef.SetScanned(True)
EndFunction

Function testGetHoursUntil(Float afTargetHourLocal)
  Utility.GetHoursUntilLocalHour(afTargetHourLocal)
EndFunction

Function TestGetArray(FormList formlistToCheck)
  Form[] formArray = formlistToCheck.GetArray(False)
EndFunction

Function TestMoveToEditorLocation(ObjectReference testRef)
  testRef.MoveToMyEditorLocation()
EndFunction

Function TestCompleteResearchProject(researchproject testProject)
  testProject.Complete()
EndFunction

Function TestFindRefsWithKeyword(Keyword testKeyword)
  ObjectReference[] refArray = Game.GetPlayer().FindAllReferencesWithKeyword(testKeyword as Form, 5000.0)
  Self.testTraceRefArray(refArray)
EndFunction

Function TestFindRefsByID(Form baseForm)
  ObjectReference[] refArray = Game.GetPlayer().FindAllReferencesOfType(baseForm, 5000.0)
  Self.testTraceRefArray(refArray)
EndFunction

Function testTraceRefArray(ObjectReference[] refArray)
  ObjectReference playerRef = Game.GetPlayer() as ObjectReference
  Int I = 0
  While I < refArray.Length
    I += 1
  EndWhile
EndFunction

Bool Function AddSurveySite(surveysitediscovermarkerscript newSite)
  Int siteIndex = SurveySites.findstruct("siteMarker", newSite as ObjectReference, 0)
  If siteIndex > -1
    Return False
  Else
    sq_parentscript:surveysite theSite = new sq_parentscript:surveysite
    theSite.siteMarker = newSite as ObjectReference
    SurveySites.add(theSite, 1)
    PlanetReference.ForceRefTo(newSite as ObjectReference)
    SQ_SurveySiteDiscoveredMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Self.SendSurveySiteDiscoveredEvent(newSite as ObjectReference)
    Return True
  EndIf
EndFunction

Bool Function RemoveSurveySite(surveysitediscovermarkerscript siteToRemove, Bool countAsBuilt)
  Int siteIndex = SurveySites.findstruct("siteMarker", siteToRemove as ObjectReference, 0)
  If siteIndex > -1
    SurveySites.remove(siteIndex, 1)
    If countAsBuilt
      siteToRemove.BuildSite()
    EndIf
    Return True
  Else
    Return False
  EndIf
EndFunction

Function SendSurveySiteDiscoveredEvent(ObjectReference newSite)
  Var[] kargs = new Var[1]
  kargs[0] = newSite as Var
  Self.SendCustomEvent("sq_parentscript_SQ_SurveySiteDiscovered", kargs)
EndFunction

Function TestAddSurveySite(ObjectReference newSite)
  Self.AddSurveySite(newSite as surveysitediscovermarkerscript)
EndFunction
