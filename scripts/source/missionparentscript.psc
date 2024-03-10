ScriptName MissionParentScript Extends Quest
{ parent script for Mission handling }

;-- Structs -----------------------------------------
Struct MissionBoardSurveyTraitData
  Int minTraitValue = 0
  GlobalVariable RewardXP
EndStruct

Struct MissionEnemyType
  Faction enemyFaction
  Form enemyName
EndStruct

Struct MissionLocRefType
  LocationRefType cargoSource
  LocationRefType cargoDestination
  Form cargoSourceBase
  Form cargoDestinationBase
EndStruct

Struct MissionSupplyType
  ActorValue supplyAV
EndStruct

Struct MissionType
  Keyword missionTypeKeyword
  { story manager keyword to try to start }
  Message MissionCompleteMessage
  { OPTIONAL: Extra notification to the player that the mission is complete }
  Message MissionFailMessage
  { OPTIONAL: Extra notification to the player that the mission has failed }
  GlobalVariable MissionCompletedCount
  { global to track how many of this type of mission the player has completed }
  Bool RandomStoryEventOrder = False
  { mission types with RandomStoryEventOrder = true are sent in a random order since there is a limited number allowed to start }
EndStruct


;-- Variables ---------------------------------------
Location lastResetLocation
Float lastResetTimestamp
Int resetTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard MissionCompletedFailedGuard
Guard resetMissionGuard

;-- Properties --------------------------------------
Group MissionData
  missionparentscript:missiontype[] Property MissionTypes Auto Const
  { array of mission types }
  Int Property NoMissionIndex = 0 Auto Const
  { index of the entry to use if there are no missions available }
  missionquestscript[] Property missionQuests Auto Const
  { array of all mission quests }
  missioncargoparentscript[] Property cargoQuests Auto Const
  { cargo quests - needed to update before displaying and after cargo space changes }
  missionpassengerquestscript[] Property passengerQuests Auto Const
  { passenger quests - needed to update before displaying and after passenger space changes }
  missionsurveyquestscript[] Property surveyQuests Auto Const
  { survey mission quests - needed to check if planet is a survey target }
  missionparentscript:missionlocreftype[] Property cargoTypes Auto Const
  { array of cargo type data { }
  missionparentscript:missionlocreftype[] Property passengerTypes Auto Const
  { array of cargo type data }
  missionparentscript:missionsupplytype[] Property resourceAVs Auto Const
  { array of resourceAVs }
  ActorValue[] Property supplyNeedAVs Auto Const
  { array of supply need resource AVs }
  missionparentscript:missionenemytype[] Property enemyTypes Auto Const
  { array of enemy types to match faction with name marker (for text replacement) }
  ActorValue Property MissionRewardMultiplier Auto Const mandatory
  { if on appropriate mission refs, acts as a multiplier on mission rewards }
  Message Property MissionBoardAcceptMessage Auto Const mandatory
  { confirmation message box for accepting a mission }
  GlobalVariable Property MB_MissionsLastSurveyTrait Auto Const mandatory
  { tracks the trait index of last completed survey trait mission }
  GlobalVariable Property MB_MissionsLastSurveyTraitTimestamp Auto Const mandatory
  { timestamp of last completed survey trait mission }
  GlobalVariable Property MissionBoardSurveyTraitRewardOverlayMult Auto Const mandatory
  { multiplier based on total number of overlays needed to be explored for this trait }
  GlobalVariable Property MissionBoardSurveyTraitSystemValueMult Auto Const mandatory
  { multiplier based on total trait value of the target system }
  missionparentscript:missionboardsurveytraitdata[] Property MissionBoardSurveyTraitXPRewards Auto Const
  { array of xp rewards for completing survey trait missions }
  GlobalVariable Property MissionBoardSurveyXPRewardBase Auto Const mandatory
  { base XP reward for survey planet missions }
EndGroup

Group MissionBoardAliases
  LocationAlias Property TargetSystemLocation Auto Const
  LocationAlias Property TargetPlanetLocation Auto Const
  LocationAlias Property TargetLocation Auto Const
  ReferenceAlias Property PrimaryRef Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
EndGroup

Group RQ_Hellos
  ActorValue Property RQ_AV_Hello Auto Const mandatory
  { used to condition for RQ hellos }
  GlobalVariable Property RQ_Hello_AboardShipValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_DepartingShipValue Auto Const mandatory
EndGroup

Keyword Property LocTypeStarSystem Auto Const mandatory
Keyword Property LocTypeMajorOrbital Auto Const mandatory
{ used to check if something is a planet or moon }
Keyword Property LocTypeSettlement Auto Const mandatory
{ used to check if something is a settlement - try to start new missions }
Keyword Property LocTypeMissionSource Auto Const mandatory
{ used to check if something is a mission source - try to start new missions }
Keyword Property SpaceshipKeyword Auto Const mandatory
{ used to check if a location is a spaceship }
Keyword Property OutpostCargoLinkFueledKeyword Auto Const mandatory
{ keyword to find fueled cargo links }
ActorValue Property CarryWeight Auto Const mandatory
{ used to check cargo space }
ActorValue Property CarryWeightShielded Auto Const mandatory
{ used to check shielded cargo space }
Float Property resetTimeInterval = 1.0 Auto Const
{ time in game time days before mission board will reset even if player hasn't changed location }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer()
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Self.CheckLocationChange(akOldLoc, akNewLoc)
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Self.CheckLocationChange(akOldLoc, akNewLoc)
EndEvent

Function CheckLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc as Bool && akNewLoc as Bool
    If akOldLoc.HasKeyword(SpaceshipKeyword) || akNewLoc.HasKeyword(SpaceshipKeyword)
      
    Else
      Guard resetMissionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
        Location[] newLocParentSettlements = akNewLoc.GetParentLocations(LocTypeSettlement)
        Location newLocParentSettlement = None
        If newLocParentSettlements.Length > 0
          newLocParentSettlement = newLocParentSettlements[0]
        EndIf
        Bool enteringSettlement = newLocParentSettlement as Bool || akNewLoc.HasKeyword(LocTypeSettlement)
        If akOldLoc.IsSameLocation(akNewLoc, LocTypeStarSystem) == False
          Self.ResetMissions(True, False, akNewLoc, False)
        ElseIf enteringSettlement && akOldLoc.IsSameLocation(akNewLoc, LocTypeSettlement) == False || akNewLoc.HasKeyword(LocTypeMissionSource)
          Self.ResetMissions(False, False, akNewLoc, False)
        EndIf
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    EndIf
  EndIf
EndFunction

Function ResetMissions(Bool bShutDownUnstarted, Bool bShutDownAll, Location resetLocation, Bool resetLocationOverride)
  Guard resetMissionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If resetLocation != lastResetLocation || resetLocationOverride
      lastResetLocation = resetLocation
      lastResetTimestamp = Utility.GetCurrentGameTime()
      Self.StartTimerGameTime(resetTimeInterval * 24.0, resetTimerID)
      Self.StopMissions(bShutDownUnstarted, bShutDownAll)
      Int I = 0
      Int missionCount = 0
      Keyword[] randomMissionEvents = new Keyword[0]
      While I < MissionTypes.Length
        missionparentscript:missiontype theMissionType = MissionTypes[I]
        If theMissionType.RandomStoryEventOrder
          randomMissionEvents.add(theMissionType.missionTypeKeyword, 1)
        Else
          theMissionType.missionTypeKeyword.SendStoryEvent(resetLocation, None, None, 0, 0)
        EndIf
        I += 1
      EndWhile
      While randomMissionEvents.Length > 0
        Int randomIndex = Utility.RandomInt(0, randomMissionEvents.Length - 1)
        randomMissionEvents[randomIndex].SendStoryEvent(resetLocation, None, None, 0, 0)
        randomMissionEvents.remove(randomIndex, 1)
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == resetTimerID
    Float currentTimestamp = Utility.GetCurrentGameTime()
    Float timeSinceReset = currentTimestamp - lastResetTimestamp
    If timeSinceReset > resetTimeInterval
      Self.ResetMissions(False, False, Game.GetPlayer().GetCurrentLocation(), True)
    Else
      Self.StartTimerGameTime(resetTimeInterval * 24.0, resetTimerID)
    EndIf
  EndIf
EndEvent

Function StopMissions(Bool bShutDownUnstarted, Bool bShutDownAll)
  If bShutDownUnstarted || bShutDownAll
    Int I = 0
    While I < missionQuests.Length
      missionquestscript theMission = missionQuests[I]
      If theMission.IsRunning() && (theMission.PlayerAcceptedQuest == False || bShutDownAll)
        theMission.Stop()
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction

Function UpdateMissions()
  Int I = 0
  While I < cargoQuests.Length
    missioncargoparentscript theMission = cargoQuests[I]
    If theMission.IsRunning() && theMission.PlayerAcceptedQuest == False
      theMission.UpdatePlayerCargoSpace()
    EndIf
    I += 1
  EndWhile
  I = 0
  While I < passengerQuests.Length
    missionpassengerquestscript themission = passengerQuests[I]
    If themission.IsRunning() && themission.PlayerAcceptedQuest == False
      themission.UpdatePlayerPassengerSpace()
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function IsPlanetSurveyTarget(ObjectReference refToCheck)
  Bool isTarget = False
  planet planetToCheck = refToCheck.GetCurrentPlanet()
  If planetToCheck
    Int I = 0
    While I < surveyQuests.Length && isTarget == False
      missionsurveyquestscript theSurveyQuest = surveyQuests[I]
      If theSurveyQuest.IsRunning() && theSurveyQuest.PlayerAcceptedQuest
        If theSurveyQuest.TargetPlanetLocation.GetLocation().GetCurrentPlanet() == planetToCheck
          isTarget = True
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
  Return isTarget
EndFunction

Function HandleMissionCompleted(missionquestscript theMission)
  Guard MissionCompletedFailedGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int missionTypeIndex = theMission.MissionType
    missionparentscript:missiontype theMissionType = MissionTypes[missionTypeIndex]
    If theMissionType.MissionCompleteMessage
      TargetSystemLocation.ForceLocationTo(theMission.TargetSystemLocation.GetLocation())
      TargetPlanetLocation.ForceLocationTo(theMission.TargetPlanetLocation.GetLocation())
      TargetLocation.ForceLocationTo(theMission.TargetLocation.GetLocation())
      PrimaryRef.ForceRefTo(theMission.PrimaryRef.GetRef())
      theMissionType.MissionCompleteMessage.Show(theMission.RewardAmountGlobalActual.GetValueInt() as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
    If theMissionType.MissionCompletedCount
      theMissionType.MissionCompletedCount.Mod(1.0)
    EndIf
    If theMission is missionsurveytraitscript
      missionsurveytraitscript theSurveyMission = theMission as missionsurveytraitscript
      Int traitIndex = theSurveyMission.SQ_Parent.PlanetTraits.findstruct("PlanetTrait", theSurveyMission.PlanetTrait, 0)
      If traitIndex > -1
        MB_MissionsLastSurveyTrait.SetValueInt(traitIndex)
        MB_MissionsLastSurveyTraitTimestamp.SetValue(Utility.GetCurrentGameTime())
      EndIf
    EndIf
    Self.SendMissionCompletedEvent(theMission, False)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function HandleMissionFailed(missionquestscript theMission)
  Guard MissionCompletedFailedGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int missionTypeIndex = theMission.MissionType
    missionparentscript:missiontype theMissionType = MissionTypes[missionTypeIndex]
    If theMissionType.MissionFailMessage
      TargetSystemLocation.ForceLocationTo(theMission.TargetSystemLocation.GetLocation())
      TargetPlanetLocation.ForceLocationTo(theMission.TargetPlanetLocation.GetLocation())
      TargetLocation.ForceLocationTo(theMission.TargetLocation.GetLocation())
      PrimaryRef.ForceRefTo(theMission.PrimaryRef.GetRef())
      theMissionType.MissionFailMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
    Self.SendMissionCompletedEvent(theMission, True)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function SendMissionAcceptedEvent(missionquestscript theQuest)
  Var[] kargs = new Var[1]
  kargs[0] = theQuest as Var
  Self.SendCustomEvent("missionparentscript_MissionAccepted", kargs)
EndFunction

Function SendMissionCompletedEvent(missionquestscript theQuest, Bool missionFailed)
  Var[] kargs = new Var[2]
  kargs[0] = theQuest as Var
  kargs[1] = missionFailed as Var
  Self.SendCustomEvent("missionparentscript_MissionCompleted", kargs)
EndFunction

Function TestGetMatchingLocations(Location parentLocation, LocationRefType wantedrefType)
  LocationRefType[] targetRefTypes = new LocationRefType[1]
  targetRefTypes[0] = wantedrefType
EndFunction

Function DebugResetMissions()
  Self.ResetMissions(True, True, None, True)
EndFunction
