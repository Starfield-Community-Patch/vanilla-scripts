ScriptName SQ_FollowersScript Extends SQ_ActorRolesScript conditional
{ Quest script attached to SQ_Followers. Handles various system level follower functionality }

;-- Variables ---------------------------------------
Int CountUpdateTrackingRequests
Actor PlayerRef
Int SkipNextWaitingFollowersObjective
Float TimerDur_UpdateTrackingData = 1.0 Const
Int TimerID_UpdateTrackingGlobalsAndObjectives = 1 Const

;-- Properties --------------------------------------
Group Autofill
  ActorValue Property IdleChatterTimeMax Auto Const mandatory
  ActorValue Property IdleChatterTimeMin Auto Const mandatory
  GlobalVariable Property FOL_IdleChatterTimeMax Auto Const mandatory
  GlobalVariable Property FOL_IdleChatterTimeMin Auto Const mandatory
  ActorValue Property FOL_PreviousIdleChatterTimeMax Auto Const mandatory
  ActorValue Property FOL_PreviousIdleChatterTimeMin Auto Const mandatory
  ActorValue Property FollowerState Auto Const mandatory
  GlobalVariable Property iFollower_Com_Follow Auto Const mandatory
  GlobalVariable Property iFollower_Com_Wait Auto Const mandatory
  GlobalVariable Property iFollower_Com_GoHome Auto Const mandatory
  Keyword Property SQ_Followers_Link_WaitAtRef Auto Const mandatory
  Keyword Property SQ_Followers_IdleChatterAllowed Auto Const mandatory
  Faction Property SQ_Followers_GroupFormation_Faction Auto Const mandatory
  GlobalVariable Property PlayerFollowers_HasFollower Auto Const mandatory
  GlobalVariable Property PlayerFollowers_HasFollowerFollowing Auto Const mandatory
  GlobalVariable Property PlayerFollowers_HasFollowerWaiting Auto Const mandatory
  GlobalVariable Property PlayerFollowers_HasCompanion Auto Const mandatory
  GlobalVariable Property PlayerFollowers_HasCompanionFollowing Auto Const mandatory
  GlobalVariable Property PlayerFollowers_HasCompanionWaiting Auto Const mandatory
  GlobalVariable Property PlayerFollowers_Count Auto Const mandatory
  GlobalVariable Property PlayerFollowers_CountFollowing Auto Const mandatory
  GlobalVariable Property PlayerFollowers_CountWaiting Auto Const mandatory
  Keyword Property SQ_Followers_TeleportToShipWithPlayerWhenWaiting Auto Const mandatory
  Keyword Property SQ_Followers_DisallowTeleportWaitingFollowersToShip Auto Const mandatory
  Package Property SQ_Followers_Wait Auto Const mandatory
  ActorValue Property Cached_PreFollowerAggression Auto Const mandatory
EndGroup

Group Properties
  ReferenceAlias Property PlayerShipCrewMarker Auto Const mandatory
  { PlayerShipCrewMarker alias in SQ_PlayerShip }
  Int Property ObjectiveRetrieveWaitingFollowers = 100 Auto Const
  { objective to turn on if you have any followers waiting for you to return }
EndGroup

Float Property AllFollowerState = 1.0 Auto conditional hidden

;-- Functions ---------------------------------------

Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
  ; Empty function
EndFunction

Function _CustomSetRoleUnavailable(Actor ActorToUpdate)
  ; Empty function
EndFunction

Event OnInit()
  PlayerRef = Game.GetPlayer()
  Self.RegisterForRemoteEvent((Alias_Active as RefCollectionAlias) as ScriptObject, "OnAliasChanged")
  Self.RegisterForRemoteEvent(PlayerRef as ScriptObject, "OnLocationChange")
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == TimerID_UpdateTrackingGlobalsAndObjectives
    CountUpdateTrackingRequests -= 1
    Self.UpdateTrackingGlobalsAndObjectives()
    If CountUpdateTrackingRequests > 0
      CountUpdateTrackingRequests = 1
      Self.StartTimer(TimerDur_UpdateTrackingData, TimerID_UpdateTrackingGlobalsAndObjectives)
    EndIf
  EndIf
EndEvent

Function TriggerTrackingGlobalsAndObjectivesUpdate()
  CountUpdateTrackingRequests += 1
  Self.StartTimer(TimerDur_UpdateTrackingData, TimerID_UpdateTrackingGlobalsAndObjectives)
EndFunction

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  If akSender == Alias_Active as RefCollectionAlias
    Self.TriggerTrackingGlobalsAndObjectivesUpdate()
  EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == PlayerRef
    Self.TeleportWaitingFollowersToShip(akNewLoc)
  EndIf
EndEvent

Function TeleportWaitingFollowersToShip(Location akNewLoc)
  If PlayerRef.GetCurrentShipRef() != None
    If akNewLoc as Bool && akNewLoc.HasKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip)
      
    Else
      Self.TeleportFollowers(PlayerRef as ObjectReference, None, False, True, True, False, False)
    EndIf
  EndIf
EndFunction

Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
  Self.SetGroupFormationFactionData(ActorToUpdate)
  ActorToUpdate.SetPlayerTeammate(True, False, False)
  Self.SetIdleChatterTimes(ActorToUpdate, True)
  ActorToUpdate.SetNotShowOnStealthMeter(True)
  ActorValue aggressionAV = Game.GetAggressionAV()
  Float aggression = ActorToUpdate.GetValue(aggressionAV)
  ActorToUpdate.SetValue(Cached_PreFollowerAggression, aggression)
  ActorToUpdate.SetValue(aggressionAV, 0.0)
  Self.CommandFollow(ActorToUpdate)
EndFunction

Function _CustomSetRoleInactive(Actor ActorToUpdate)
  Self.UnsetGroupFormationFactionData(ActorToUpdate)
  ActorToUpdate.SetPlayerTeammate(False, False, False)
  Self.SetIdleChatterTimes(ActorToUpdate, False)
  ActorToUpdate.SetNotShowOnStealthMeter(False)
  ActorValue aggressionAV = Game.GetAggressionAV()
  Float aggression = ActorToUpdate.GetValue(Cached_PreFollowerAggression)
  ActorToUpdate.SetValue(aggressionAV, aggression)
EndFunction

Function SetGroupFormationFactionData(Actor ActorToSet)
  Int rank = 0
  If SQ_Companions.IsCompanion(ActorToSet, True) || SQ_Crew.IsEliteCrew(ActorToSet)
    rank = 2
  EndIf
  ActorToSet.SetFactionRank(SQ_Followers_GroupFormation_Faction, rank)
  ActorToSet.SetGroupFaction(SQ_Followers_GroupFormation_Faction)
EndFunction

Function UnsetGroupFormationFactionData(Actor ActorToSet)
  ActorToSet.RemoveFromFaction(SQ_Followers_GroupFormation_Faction)
  ActorToSet.SetGroupFaction(None)
EndFunction

Function SetIdleChatterTimes(Actor ActorToSet, Bool IsFollower)
  If ActorToSet.HasKeyword(SQ_Followers_IdleChatterAllowed)
    
  ElseIf IsFollower
    Self._SetIdleChatterTimeAV(ActorToSet, IdleChatterTimeMax, FOL_PreviousIdleChatterTimeMax, FOL_IdleChatterTimeMax)
    Self._SetIdleChatterTimeAV(ActorToSet, IdleChatterTimeMin, FOL_PreviousIdleChatterTimeMin, FOL_IdleChatterTimeMin)
  Else
    Self._RestoreIdleChatterTimeAV(ActorToSet, IdleChatterTimeMax, FOL_PreviousIdleChatterTimeMax)
    Self._RestoreIdleChatterTimeAV(ActorToSet, IdleChatterTimeMin, FOL_PreviousIdleChatterTimeMin)
  EndIf
EndFunction

Function _SetIdleChatterTimeAV(Actor ActorToSet, ActorValue IdleChatterTimeAV, ActorValue PreviousIdleChatterTimeAV, GlobalVariable TargetIdleChatterTime)
  Float currentVal = ActorToSet.GetValue(IdleChatterTimeAV)
  Float targetVal = TargetIdleChatterTime.GetValue()
  If currentVal != targetVal
    ActorToSet.SetValue(PreviousIdleChatterTimeAV, currentVal)
    ActorToSet.SetValue(IdleChatterTimeAV, targetVal)
  EndIf
EndFunction

Function _RestoreIdleChatterTimeAV(Actor ActorToSet, ActorValue IdleChatterTimeAV, ActorValue PreviousIdleChatterTimeAV)
  Float targetVal = ActorToSet.GetValue(PreviousIdleChatterTimeAV)
  ActorToSet.SetValue(IdleChatterTimeAV, targetVal)
EndFunction

Function CommandFollow(Actor Follower)
  Follower.SetLinkedRef(None, SQ_Followers_Link_WaitAtRef, True)
  Follower.SetValue(FollowerState, iFollower_Com_Follow.GetValue())
  Follower.EvaluatePackage(False)
  Self.TriggerTrackingGlobalsAndObjectivesUpdate()
EndFunction

Function CommandWait(Actor Follower, ObjectReference WaitAtRef)
  If WaitAtRef
    Follower.SetLinkedRef(WaitAtRef, SQ_Followers_Link_WaitAtRef, True)
  EndIf
  Follower.SetValue(FollowerState, iFollower_Com_Wait.GetValue())
  Follower.EvaluatePackage(False)
  If Follower.IsInScene() == False && Follower.IsInCombat() == False
    Float waitTime = 0.5
    Float timeWaiting = 0.0
    Float maxWaitTimeBeforeBailout = 10.0
    While Follower.GetCurrentPackage() != SQ_Followers_Wait && timeWaiting <= maxWaitTimeBeforeBailout
      Utility.Wait(waitTime)
      timeWaiting += waitTime
    EndWhile
  EndIf
  Self.TriggerTrackingGlobalsAndObjectivesUpdate()
EndFunction

Bool Function IsFollowing(Actor FollowerToTest)
  Return FollowerToTest.GetValue(FollowerState) == iFollower_Com_Follow.GetValue()
EndFunction

Bool Function IsWaiting(Actor FollowerToTest)
  Return FollowerToTest.GetValue(FollowerState) == iFollower_Com_Wait.GetValue()
EndFunction

Function UpdateRetrieveWaitingFollowersObjective(Actor[] ActiveFollowersArray)
  If ActiveFollowersArray == None
    ActiveFollowersArray = Self.GetFollowers(True, True)
  EndIf
  Bool turnOnObjective = False
  Int I = 0
  While turnOnObjective == False && I < ActiveFollowersArray.Length
    turnOnObjective = ActiveFollowersArray[I].GetValue(FollowerState) == iFollower_Com_Wait.GetValue()
    I += 1
  EndWhile
  If turnOnObjective
    If SkipNextWaitingFollowersObjective > 0
      SkipNextWaitingFollowersObjective -= 1
    Else
      Self.SetObjectiveActive(ObjectiveRetrieveWaitingFollowers, True)
    EndIf
  Else
    Self.SetObjectiveDisplayed(ObjectiveRetrieveWaitingFollowers, False, False)
  EndIf
EndFunction

Actor[] Function GetFollowers(Bool IncludeFollowingFollowers, Bool IncludeWaitingFollowers)
  Actor[] ActiveFollowersArray = (Alias_Active as RefCollectionAlias).GetArray() as Actor[]
  Actor[] followersToReturn = new Actor[0]
  Int I = 0
  While I < ActiveFollowersArray.Length
    Actor currentFollower = ActiveFollowersArray[I]
    If IncludeFollowingFollowers && Self.IsFollowing(currentFollower) || IncludeWaitingFollowers && Self.IsWaiting(currentFollower)
      followersToReturn.add(currentFollower, 1)
    EndIf
    I += 1
  EndWhile
  Return followersToReturn
EndFunction

Actor[] Function AllFollowersWait(ObjectReference WaitAtRef, Bool IgnoreCurrentlyWaitingFollowers, Bool SkipWaitingFollowersObjective)
  If SkipWaitingFollowersObjective
    SkipNextWaitingFollowersObjective += 1
  EndIf
  Actor[] ActiveFollowersArray = (Alias_Active as RefCollectionAlias).GetArray() as Actor[]
  Actor[] commandedFollowers = new Actor[0]
  Int I = 0
  While I < ActiveFollowersArray.Length
    Actor currentActor = ActiveFollowersArray[I]
    If IgnoreCurrentlyWaitingFollowers == False || Self.IsWaiting(currentActor) == False
      Self.CommandWait(currentActor, WaitAtRef)
      commandedFollowers.add(currentActor, 1)
    EndIf
    I += 1
  EndWhile
  Return commandedFollowers
EndFunction

Function AllFollowersFollow(Actor[] SpecificFollowersToCommand)
  Actor[] ActiveFollowersArray = (Alias_Active as RefCollectionAlias).GetArray() as Actor[]
  If SpecificFollowersToCommand == None
    SpecificFollowersToCommand = ActiveFollowersArray
  EndIf
  Int I = 0
  While I < SpecificFollowersToCommand.Length
    Self.CommandFollow(SpecificFollowersToCommand[I])
    I += 1
  EndWhile
  Self.TriggerTrackingGlobalsAndObjectivesUpdate()
EndFunction

Function UpdateTrackingGlobalsAndObjectives()
  Actor[] ActiveFollowersArray = Self.GetFollowers(True, True)
  Self.UpdateRetrieveWaitingFollowersObjective(ActiveFollowersArray)
  Int followerCount = ActiveFollowersArray.Length
  PlayerFollowers_Count.SetValueInt(followerCount)
  If followerCount > 0
    PlayerFollowers_HasFollower.SetValueInt(1)
  Else
    PlayerFollowers_HasFollower.SetValueInt(0)
  EndIf
  Int followerCountFollowing = 0
  Int followerCountWaiting = 0
  Bool hasCompanion = False
  Int companionCountFollowing = 0
  Int companionCountWaiting = 0
  Int iWait = iFollower_Com_Wait.GetValue() as Int
  Int I = 0
  While I < ActiveFollowersArray.Length
    Actor currentFollower = ActiveFollowersArray[I]
    If currentFollower.GetValue(FollowerState) == iWait as Float
      followerCountWaiting += 1
      If currentFollower is companionactorscript
        companionCountWaiting += 1
        hasCompanion = True
      EndIf
    Else
      followerCountFollowing += 1
      If currentFollower is companionactorscript
        companionCountFollowing += 1
        hasCompanion = True
      EndIf
    EndIf
    I += 1
  EndWhile
  If followerCountFollowing > 0
    PlayerFollowers_HasFollowerFollowing.SetValueInt(1)
  Else
    PlayerFollowers_HasFollowerFollowing.SetValueInt(0)
  EndIf
  If followerCountWaiting > 0
    PlayerFollowers_HasFollowerWaiting.SetValueInt(1)
  Else
    PlayerFollowers_HasFollowerWaiting.SetValueInt(0)
  EndIf
  PlayerFollowers_CountFollowing.SetValueInt(followerCountFollowing)
  PlayerFollowers_CountWaiting.SetValueInt(followerCountWaiting)
  If hasCompanion
    PlayerFollowers_HasCompanion.SetValue(1.0)
  Else
    PlayerFollowers_HasCompanion.SetValue(0.0)
  EndIf
  If companionCountFollowing > 0
    PlayerFollowers_HasCompanionFollowing.SetValueInt(1)
  Else
    PlayerFollowers_HasCompanionFollowing.SetValueInt(0)
  EndIf
  If companionCountWaiting > 0
    PlayerFollowers_HasCompanionWaiting.SetValueInt(1)
  Else
    PlayerFollowers_HasCompanionWaiting.SetValueInt(0)
  EndIf
EndFunction

Actor[] Function TeleportFollowers(ObjectReference DestinationRef, Actor[] SpecificFollowersToTeleport, Bool IncludeFollowingFollowers, Bool IncludeWaitingFollowers, Bool StartFollowingAfterTeleport, Bool StartWaitingAfterTeleport, Bool SkipWaitingFollowersObjective)
  If SpecificFollowersToTeleport == None
    SpecificFollowersToTeleport = (Alias_Active as RefCollectionAlias).GetActorArray()
  EndIf
  If DestinationRef == None
    DestinationRef = PlayerRef as ObjectReference
  EndIf
  Actor[] teleportedActors = new Actor[0]
  Int I = 0
  While I < SpecificFollowersToTeleport.Length
    Actor currentActor = SpecificFollowersToTeleport[I]
    Bool shouldTeleport = IncludeFollowingFollowers && Self.IsFollowing(currentActor) || IncludeWaitingFollowers && Self.IsWaiting(currentActor)
    If shouldTeleport
      If StartFollowingAfterTeleport
        Self.CommandFollow(currentActor)
      ElseIf StartWaitingAfterTeleport
        If SkipWaitingFollowersObjective
          SkipNextWaitingFollowersObjective += 1
        EndIf
        If DestinationRef != PlayerRef as ObjectReference
          Self.CommandWait(currentActor, DestinationRef)
        Else
          Self.CommandWait(currentActor, None)
        EndIf
      EndIf
      currentActor.MoveTo(DestinationRef, 0.0, 0.0, 0.0, True, False)
      teleportedActors.add(currentActor, 1)
    EndIf
    I += 1
  EndWhile
  Return teleportedActors
EndFunction

Function DebugFollower(Actor Follower)
  Self.SetRoleActive(Follower, True, True, 0.0, 0.0)
  Follower.MoveTo(PlayerRef as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

SQ_FollowersScript Function GetScript() Global
  Return (Game.GetFormFromFile(55155, "Starfield.esm") as Quest) as SQ_FollowersScript
EndFunction
