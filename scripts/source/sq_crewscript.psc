ScriptName SQ_CrewScript Extends SQ_ActorRolesScript

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard crewAssignmentLock
Guard outpostCrewUpdateLock

;-- Properties --------------------------------------
Group CrewData
  ReferenceAlias Property ActiveEliteCrew Auto Const mandatory
  { autofill; when actively following the player, Elite Crew will be in this alias }
  Keyword Property COM_CREW_DismissedGenericTopic Auto Const mandatory
  { autofill; when unassigned through the menu while actively following the player, and Elite Crew will say this dialogue topic subtype, also when picking up companions or other elite crew }
  Faction Property AvailableCrewFaction Auto Const mandatory
  { autofill }
  Faction Property COM_CREW_CrimeFaction_IgnoreNonMembers Auto Const mandatory
  { autofill; makes them not report crime against non-crew after becoming available }
  Faction Property COM_CREW_CrimeFaction_IgnoreNonMembersNonViolent Auto Const mandatory
  { autofill; makes them not report non-violent crime against non-crew after becoming available }
  MiscObject Property Credits Auto Const mandatory
  { Autofill Credits }
  ReferenceAlias Property HomeShip Auto Const mandatory
  { player home ship }
  RefCollectionAlias Property CrewGoingHome Auto Const mandatory
  { actors in this alias are waiting to go home after being unassigned from an outpost }
  RefCollectionAlias Property CrewGoingToOutposts Auto Const mandatory
  { actors in this alias are waiting to go to an outpost }
  crew_genericcrewquestscript Property CREW_GenericCrew Auto Const mandatory
  { autofill }
  Keyword Property Crew_CrewTypeElite Auto Const mandatory
  { autofill }
  Keyword Property Crew_CrewTypeGeneric Auto Const mandatory
  { autofill }
  ActorValue Property Crew_Elite_BackstoryFollowup_Day Auto Const mandatory
  { autofill }
  GlobalVariable Property Crew_Elite_BackstoryFollowup_CooldownDays Auto Const mandatory
  { autofill }
  ActorValue Property Crew_CostTableIndex Auto Const mandatory
  { Autofill; Holds an index into the below CrewCostTables for a particular crew member.
Reminder: this AV defaults to -1 so we can tell the difference between unset and set index of 0, 
in case someone wants to specify a particular value for specific elite crew member }
  ActorValue Property Crew_CostMult Auto Const mandatory
  { autofill; holds the multiplier on the base crew cost for a particular crew member. Defaults to 1.0. Set to 0.75 to grant a 25% discount. }
  ActorValue Property FOL_ActiveFollower Auto Const mandatory
  { track if crew member has been dismissed }
  ActorValue Property COM_PQ_LockedIn Auto Const mandatory
  { track if crew member is Locked In }
  Int[] Property CrewCostTable_Elite Auto Const mandatory
  { A tight range of aesthetic values of hire costs for elite crew. (500, 525, 550) etc. }
  Int[] Property CrewCostTable_Generic Auto Const mandatory
  { A tight range of aesthetic values of hire costs for generic crew. (200, 225, 250) etc. }
  ReferenceAlias Property OutpostCrewApply Auto Const mandatory
  { used for stamping data onto crew assigned to an outpost }
  Keyword Property LinkOutpostCrewMarker01 Auto Const mandatory
  { autofill }
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { autofill }
  ActorBase Property Crew_LvlCrew_Any Auto Const mandatory
  { used to debug create crew }
  Keyword Property CREW_AlwaysTeammateWhenAssigned Auto Const mandatory
  { Autofill; currently for Vasco to prevent aggroing while standing outside the ship if not currently a follower but in a space the player is allowed to be because of factions }
  ActorValue Property SpaceshipCrewSlots Auto Const mandatory
  { autofill }
EndGroup

achievements_companionsandelitecrew Property Achievements_Quest Auto Const mandatory
{ autofill }
RefCollectionAlias Property DismissedCrew Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Parent.OnQuestInit()
  ReferenceAlias RefAlias_Available = Alias_Available as ReferenceAlias
  RefCollectionAlias RefColAlias_Available = Alias_Available as RefCollectionAlias
  If RefAlias_Available
    Self.RegisterForRemoteEvent(RefAlias_Available as ScriptObject, "OnUnload")
    Self.RegisterForRemoteEvent(RefAlias_Available as ScriptObject, "OnDeath")
  Else
    Self.RegisterForRemoteEvent(RefColAlias_Available as ScriptObject, "OnUnload")
    Self.RegisterForRemoteEvent(RefColAlias_Available as ScriptObject, "OnDeath")
  EndIf
  Self.RegisterForRemoteEvent(CrewGoingHome as ScriptObject, "OnUnload")
  Self.RegisterForRemoteEvent(CrewGoingToOutposts as ScriptObject, "OnUnload")
  Self.WarnOnFalseAssumptions()
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSource, ObjectReference akSenderRef)
  If akSource == CrewGoingHome
    Self.HandleCrewGoingHomeUnloaded(akSource)
  ElseIf akSource as Alias == Alias_Available
    Self.TestAndHandleUnloadedUnassignedGenericCrew(akSenderRef as Actor)
  EndIf
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSender)
  Self.TestAndHandleUnloadedUnassignedGenericCrew(akSender.GetActorRef())
EndEvent

Event ReferenceAlias.OnDeath(ReferenceAlias akSender, ObjectReference akKiller)
  Game.RemoveFromAvailableCrew(akSender.GetActorRef())
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
  Game.RemoveFromAvailableCrew(akSenderRef as Actor)
EndEvent

Function WarnOnFalseAssumptions()
  Alias AliasActiveVar = Alias_Active
  Bool isAlias_Active_a_RefCollectionAlias = AliasActiveVar is RefCollectionAlias
  If isAlias_Active_a_RefCollectionAlias == False
    
  EndIf
EndFunction

Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
  Game.AddToAvailableCrew(ActorToUpdate)
  Faction replacementCrimeFaction = None
  companioncrimeresponsescript CrimeResponseActor = ActorToUpdate as companioncrimeresponsescript
  If CrimeResponseActor as Bool == False
    replacementCrimeFaction = COM_CREW_CrimeFaction_IgnoreNonMembers
  EndIf
  If replacementCrimeFaction != None
    Faction currentCrimeFaction = ActorToUpdate.GetCrimeFaction()
    ActorToUpdate.RemoveFromFaction(currentCrimeFaction)
    ActorToUpdate.SetCrimeFaction(replacementCrimeFaction)
  EndIf
  If Self.IsEliteCrew(ActorToUpdate)
    Achievements_Quest.RecruitedCompanionOrEliteCrew(ActorToUpdate)
  EndIf
EndFunction

Function _CustomSetRoleUnavaliable(Actor ActorToUpdate)
  Game.RemoveFromAvailableCrew(ActorToUpdate)
  ObjectReference assignedRef = ActorToUpdate.GetCrewAssignment()
  If assignedRef
    assignedRef.UnassignCrew(ActorToUpdate)
  EndIf
EndFunction

Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
  If ActorToUpdate.HasKeyword(CREW_AlwaysTeammateWhenAssigned)
    ActorToUpdate.SetPlayerTeammate(True, False, False)
  EndIf
EndFunction

Function _CustomSetRoleInactive(Actor ActorToUpdate)
  If Self.IsEliteCrew(ActorToUpdate)
    Self.SetEliteCrewInactive(ActorToUpdate, False)
  EndIf
  If ActorToUpdate.HasKeyword(CREW_AlwaysTeammateWhenAssigned)
    ActorToUpdate.SetPlayerTeammate(False, False, False)
  EndIf
EndFunction

Function SetEliteCrewActive(Actor EliteCrew)
  Actor companionActorToDismiss = SQ_Companions.GetActiveActor()
  If companionActorToDismiss != None
    companionActorToDismiss.SayCustom(COM_CREW_DismissedGenericTopic, None, False, None)
    SQ_Companions.SetRoleInactive(companionActorToDismiss, True, False, True)
  EndIf
  Actor eliteCrewToDismiss = ActiveEliteCrew.GetActorReference()
  If eliteCrewToDismiss != None
    Self.SetEliteCrewInactive(eliteCrewToDismiss, True)
  EndIf
  ActiveEliteCrew.ForceRefTo(EliteCrew as ObjectReference)
  SQ_Followers.SetRoleActive(EliteCrew, True, True, 0.0, 0.0)
EndFunction

Function SetEliteCrewInactive(Actor EliteCrew, Bool SayUnassignedLine)
  Actor activeEliteCrewRef = ActiveEliteCrew.GetActorRef()
  If activeEliteCrewRef as Bool && activeEliteCrewRef == EliteCrew
    ActiveEliteCrew.Clear()
    If SayUnassignedLine
      EliteCrew.SayCustom(COM_CREW_DismissedGenericTopic, None, False, None)
    EndIf
    SQ_Followers.SetRoleInactive(EliteCrew, True, False, True)
    EliteCrew.StopCombatAlarm()
    EliteCrew.StopCombat()
  EndIf
EndFunction

Bool Function IsEliteCrew(Actor ActorToCheck)
  Return ActorToCheck.HasKeyword(Crew_CrewTypeElite)
EndFunction

Bool Function IsActiveEliteCrew(Actor ActorToCheck)
  Return ActiveEliteCrew.GetActorRef() == ActorToCheck
EndFunction

Function SetRecruitCost(Actor CrewMember)
  Int[] costTable = Self.GetRecruitCostTable(CrewMember)
  If CrewMember.GetValue(Crew_CostTableIndex) < 0.0
    Int iRandom = Utility.RandomInt(0, costTable.Length - 1)
    CrewMember.SetValue(Crew_CostTableIndex, iRandom as Float)
  EndIf
EndFunction

Function SetRecruitCostMult(Actor CrewMember, Float Mult)
  CrewMember.SetValue(Crew_CostMult, Mult)
EndFunction

Int Function GetRecruitCost(Actor CrewMember)
  If CrewMember.GetValue(Crew_CostTableIndex) < 0.0
    Self.SetRecruitCost(CrewMember)
  EndIf
  Int[] costTable = Self.GetRecruitCostTable(CrewMember)
  Int cost = costTable[CrewMember.GetValue(Crew_CostTableIndex) as Int]
  Float Mult = CrewMember.GetValue(Crew_CostMult)
  Int returnVal = (cost as Float * Mult) as Int
  Return returnVal
EndFunction

Int[] Function GetRecruitCostTable(Actor CrewMember)
  Int[] costTable = None
  If CrewMember.HasKeyword(Crew_CrewTypeElite)
    costTable = CrewCostTable_Elite
  ElseIf CrewMember.HasKeyword(Crew_CrewTypeGeneric)
    costTable = CrewCostTable_Generic
  Else
    costTable = CrewCostTable_Generic
  EndIf
  Return costTable
EndFunction

Function AssignCrew(Actor assignedCrew, spaceshipreference assignedShip)
  assignedShip.AssignCrew(assignedCrew)
EndFunction

Function HandleOnCrewAssigned(Actor assignedCrew, ObjectReference assignedRef)
  Guard crewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.SetRoleActive(assignedCrew, False, True, 0.0, 0.0)
    spaceshipreference assignedShip = assignedRef as spaceshipreference
    If assignedShip
      CrewGoingToOutposts.RemoveRef(assignedCrew as ObjectReference)
      assignedCrew.SetLinkedRef(None, LinkOutpostCrewMarker01, True)
    Else
      DismissedCrew.RemoveRef(assignedCrew as ObjectReference)
      DisembarkingCrew.RemoveRef(assignedCrew as ObjectReference)
      assignedCrew.SetLinkedRef(assignedRef, LinkOutpostCrewMarker01, True)
      If assignedCrew.Is3DLoaded() || assignedRef.Is3DLoaded()
        CrewGoingToOutposts.AddRef(assignedCrew as ObjectReference)
      ElseIf assignedCrew.GetValue(COM_PQ_LockedIn) == 1.0 && assignedCrew.GetValue(FOL_ActiveFollower) == 0.0
        
      Else
        assignedCrew.MoveTo(assignedRef, 0.0, 0.0, 0.0, True, False)
      EndIf
    EndIf
    CrewGoingHome.RemoveRef(assignedCrew as ObjectReference)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Bool Function HandleOnCrewDismissed(Actor unassignedCrew, ObjectReference previousAssignmentRef)
  Guard crewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference newAssignment = unassignedCrew.GetCrewAssignment()
    Bool dismissMe = newAssignment == None
    If dismissMe
      If unassignedCrew.HasKeyword(Crew_CrewTypeElite)
        Actor activeEliteCrewRef = ActiveEliteCrew.GetActorRef()
        If activeEliteCrewRef as Bool && activeEliteCrewRef == unassignedCrew
          Self.SetEliteCrewInactive(unassignedCrew, True)
        EndIf
      EndIf
      Self.SetRoleInactive(unassignedCrew, False, False, True)
      If previousAssignmentRef as outpostbeaconscript
        If newAssignment is outpostbeaconscript == False
          unassignedCrew.SetLinkedRef(None, LinkOutpostCrewMarker01, True)
        EndIf
        If unassignedCrew.Is3DLoaded()
          CrewGoingHome.AddRef(unassignedCrew as ObjectReference)
        Else
          Self.MoveCrewHome(unassignedCrew as ObjectReference)
        EndIf
      ElseIf previousAssignmentRef.IsDisabled()
        Self.MoveCrewHome(unassignedCrew as ObjectReference)
      EndIf
    EndIf
    Return dismissMe
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function HandleCrewGoingHomeUnloaded(RefCollectionAlias RefCollectionOfCrewGoingHome)
  Int I = RefCollectionOfCrewGoingHome.GetCount() - 1
  While I > -1
    ObjectReference theCrew = RefCollectionOfCrewGoingHome.GetAt(I)
    If theCrew is Actor == False
      RefCollectionOfCrewGoingHome.RemoveRef(theCrew)
    ElseIf Self.TestAndHandleUnloadedUnassignedGenericCrew(theCrew as Actor)
      
    ElseIf RefCollectionOfCrewGoingHome == CrewGoingHome
      Self.MoveCrewHome(theCrew)
    ElseIf RefCollectionOfCrewGoingHome == CrewGoingToOutposts
      Self.MoveCrewToAssignedOutpost(theCrew as Actor)
    EndIf
    I -= 1
  EndWhile
EndFunction

Bool Function TestAndHandleUnloadedUnassignedGenericCrew(Actor crewToTest)
  Guard crewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Bool isGeneric = crewToTest.HasKeyword(Crew_CrewTypeGeneric)
    Bool isUnassigned = crewToTest.GetCrewAssignment() == None
    Bool returnVal = False
    If isGeneric && isUnassigned
      Self.SetRoleUnavailable(crewToTest, True)
      Game.RemoveFromAvailableCrew(crewToTest)
      If CREW_GenericCrew.CrewMemberRef == crewToTest
        CREW_GenericCrew.CrewMemberRef = None
      EndIf
      SQ_PreventRecalc.RemoveRef(crewToTest as ObjectReference)
      crewspawnerscript spawnMarker = crewToTest.GetLinkedRef(LinkGenericCrewSpawnMarker) as crewspawnerscript
      If spawnMarker
        spawnMarker.RemoveFromSpawnedCrewArray(crewToTest)
      EndIf
      crewToTest.DisableNoWait(False)
      crewToTest.Delete()
      returnVal = True
    EndIf
    Return returnVal
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function MoveCrewHome(ObjectReference unassignedCrew)
  RefCollectionAlias activeCrew = Alias_Active as RefCollectionAlias
  If activeCrew.Find(unassignedCrew) < 0
    SQ_PlayerShip.MoveCrewToHome(unassignedCrew as Actor)
  EndIf
  CrewGoingHome.RemoveRef(unassignedCrew)
EndFunction

Function MoveCrewToAssignedOutpost(Actor assignedCrew)
  ObjectReference myAssignment = assignedCrew.GetCrewAssignment()
  If myAssignment
    If assignedCrew.GetValue(COM_PQ_LockedIn) == 1.0 && assignedCrew.GetValue(FOL_ActiveFollower) == 0.0
      
    Else
      assignedCrew.MoveTo(myAssignment, 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
  CrewGoingToOutposts.RemoveRef(assignedCrew as ObjectReference)
EndFunction

Actor[] Function GetCrewAssignedToOutpost(ObjectReference outpostRef)
  RefCollectionAlias activeCrew = Alias_Active as RefCollectionAlias
  Actor[] assignedCrew = new Actor[0]
  Int I = 0
  Int crewCount = activeCrew.GetCount()
  While I < crewCount
    Actor testCrew = activeCrew.GetActorAt(I)
    If testCrew
      ObjectReference assignedOutpost = testCrew.GetLinkedRef(LinkOutpostCrewMarker01)
      If assignedOutpost as Bool && assignedOutpost == outpostRef
        assignedCrew.add(testCrew, 1)
      EndIf
    EndIf
    I += 1
  EndWhile
  Return assignedCrew
EndFunction

Function CheckCrewCountAtOutpost(ObjectReference outpostRef)
  If outpostRef
    Guard outpostCrewUpdateLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Int crewSlots = outpostRef.GetValueInt(SpaceshipCrewSlots)
      Actor[] assignedCrew = Self.GetCrewAssignedToOutpost(outpostRef)
      If assignedCrew as Bool && assignedCrew.Length > crewSlots
        Int I = assignedCrew.Length - 1
        While I > -1 && assignedCrew.Length > crewSlots
          Actor theCrew = assignedCrew[I]
          outpostRef.UnassignCrew(theCrew)
          assignedCrew.removelast()
          Self.ShowTextReplacedMessage(theCrew, NotActiveMessage, False, None, 0.0, 0.0)
          I -= 1
        EndWhile
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Actor Function DebugCreateCrew(ActorBase CrewBaseActor, spaceshipreference ShipRef)
  If CrewBaseActor == None
    CrewBaseActor = Crew_LvlCrew_Any
  EndIf
  If ShipRef == None
    ShipRef = SQ_PlayerShip.DebugGetHomeShip()
    If ShipRef == None
      Return None
    EndIf
  EndIf
  Actor newCrew = Game.GetPlayer().PlaceAtMe(CrewBaseActor as Form, 1, False, False, True, None, None, True) as Actor
  Self.AssignCrew(newCrew, ShipRef)
  Return newCrew
EndFunction

Function DebugCreateCrewOnShip(spaceshipreference ShipRef, ActorBase CrewBaseActor)
  If ShipRef == None
    ShipRef = SQ_PlayerShip.DebugGetHomeShip()
    If ShipRef == None
      Return 
    EndIf
  EndIf
  Actor newCrew = Self.DebugCreateCrew(CrewBaseActor, ShipRef)
  newCrew.MoveTo(ShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugCreateCrewFromFormlist(FormList FormlistWithCrew, Bool AddToShip, spaceshipreference ShipRef)
  If ShipRef == None
    ShipRef = SQ_PlayerShip.DebugGetHomeShip()
    If ShipRef == None
      Return 
    EndIf
  EndIf
  Int I = 0
  Int iMax = FormlistWithCrew.GetSize()
  While I < iMax
    Form currentForm = FormlistWithCrew.GetAt(I)
    ActorBase currentActorBase = currentForm as ActorBase
    If currentActorBase
      Actor crewActor = currentActorBase.GetUniqueActor()
      If crewActor
        Self.AssignCrew(crewActor, ShipRef)
      Else
        crewActor = Self.DebugCreateCrew(currentActorBase, ShipRef)
      EndIf
      If AddToShip && crewActor as Bool
        crewActor.MoveTo(ShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function DebugNewShipWithCrewLanded(FormList FormlistWithCrew, ObjectReference ReferenceToPutShipAt)
  spaceshipreference homeshipRef = SQ_PlayerShip.DebugCreateHomeShipLanded(ReferenceToPutShipAt)
  Self.DebugCreateCrewFromFormlist(FormlistWithCrew, True, homeshipRef)
EndFunction

Function DebugNewShipWithCrewInSpace(FormList FormlistWithCrew, ObjectReference ReferenceToPutShipAt)
  spaceshipreference homeshipRef = SQ_PlayerShip.DebugCreateHomeShipInSpace(ReferenceToPutShipAt)
  Self.DebugCreateCrewFromFormlist(FormlistWithCrew, True, homeshipRef)
EndFunction
