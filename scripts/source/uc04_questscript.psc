ScriptName UC04_QuestScript Extends Quest

;-- Variables ---------------------------------------
Int iIntAlarmIndex

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CountGuard
Guard FollowerStateGuard

;-- Properties --------------------------------------
Group RefCollections
  RefCollectionAlias Property SpaceportGuards Auto Const mandatory
  { Ref collection that contains all the guards in the spaceport }
  RefCollectionAlias Property CoweringNPCs Auto Const mandatory
  { Collection of NPCs we want to stand around cowering during the sequence }
  RefCollectionAlias Property DisableNPCs Auto Const mandatory
  { Collection of NPCs we want to disable during the sequence }
  RefCollectionAlias Property KneelingNPCs Auto Const mandatory
  { Collection of NPCs we want to kneel in place during the sequence }
  RefCollectionAlias Property CaptiveCollection Auto Const mandatory
  { Collection used to keep appropriate NPCs out of combat }
  RefCollectionAlias Property Shutters Auto Const mandatory
  { Ref collection for the minister hall shutters }
  RefCollectionAlias Property PrimaryFloorManagers Auto Const mandatory
  { Floor marker objects for the main MAST floors. These get turned off during the main attack sequence }
  RefCollectionAlias Property VanguardCourseFloorManagers Auto Const mandatory
  { Floor marker objects for the Vanguard course floor. These get turned off during the main attack sequence }
  RefCollectionAlias Property VanguardRecruitmentFloorManagers Auto Const mandatory
  { Floor marker objects for the Vanguard recruitment floor. These get turned off during the main attack sequence }
  RefCollectionAlias Property AttackPathFloorManagers Auto Const mandatory
  { Floor marker objects for the that make up the path the player takes to the attack. Get turned off temporarily during the initial conversation and then turned back on during the attack }
  RefCollectionAlias Property EmergencyLights Auto Const mandatory
  { Collection of the emergency lights around the spaceport tarmac }
  RefCollectionAlias Property SpaceportCrew Auto Const mandatory
  { Collection that contains all the spawned crew (so we can turn 'em off during the attack) }
  RefCollectionAlias Property RunInGuards Auto Const mandatory
  { Collection of the guards we want to start outside the spaceport fight and then run in later }
  RefCollectionAlias Property IACrew Auto Const mandatory
  { All the workers in the Minister Hall floor }
  RefCollectionAlias Property BackUpMinisterHallGuards Auto Const mandatory
  { Ref coll for the guards that come in post-post-explosion scene }
  RefCollectionAlias Property LodgeDoorTriggers Auto Const mandatory
  { SF-1629: Message triggers informing the player the Lodge is locked until the attack is complete }
EndGroup

Group Aliases
  ReferenceAlias Property FireTeamMarineCaptain Auto Const mandatory
  { Alias for the fire team captain Marine }
  ReferenceAlias Property FireTeamMarine Auto Const mandatory
  { Alias for the fire team assault Marine }
  ReferenceAlias Property Hadrian Auto Const mandatory
  { Ref alias for Hadrian }
  ReferenceAlias Property Obj400Marker Auto Const mandatory
  { Ref alias from which we're triggering the interior alarm }
  ReferenceAlias[] Property MinisterHallNPCs Auto Const mandatory
  { Array of individual aliases for all the NPCs in the Minister Hall }
EndGroup

Group Stages
  Int Property MindControlShoutPrereqStage = 600 Auto Const
  { Only have Hadrian shout about mind control if this stage has already been set }
  Int Property MindControlShoutShutdownStage = 850 Auto Const
  { Only have Hadrian shout about mind control if this stage hasn't already been set }
  Int Property StageToSetOnMindControl = 820 Auto Const
  { Stage to be set during the attack sequence if an NPC gets mind controlled }
  Int Property StageToSetOnPlayerMindControl = 825 Auto Const
  { Stage to be set during the attack sequence if the player gets mind controlled }
EndGroup

Group MiscObjects
  inputenablelayer Property AttackEnableLayer Auto
  { Var used to save out the enable layer used to manage the player's behavior during the attack }
  GlobalVariable Property UC04_SecurityDeathCount Auto Const mandatory
  { Global used to track how many guards have died during the attack }
  GlobalVariable Property UC04_MarineFollowerState Auto Const mandatory
  { Global used to track if the Marines are actively following the player or not }
  GlobalVariable Property UC04_HadrianWarningShoutDistance Auto Const mandatory
  { Hadrian needs to be this close to a mind control event to comment on it }
  sq_followersscript Property SQ_Followers Auto Const mandatory
  { Followers script. Used to get Marines into the proper states }
  ucparentfactionquestscript Property DialogueUCFactionAlwaysOn Auto Const mandatory
  { Used to register for successful mind control attacks }
  wwiseevent Property WEF_QST_UC04_Shutters_Close Auto Const mandatory
  { Shutter closing sound }
  Topic Property UC04_UCSecurity_WitnessMindControl Auto Const mandatory
  { Topic used to get UC Security to respond to the player's actions }
  FormList Property VoicesDialogueUCSecurity Auto Const mandatory
  { Form list of UC security voicetypes }
  MagicEffect Property CrTerrormorphMindControlEffect_NPC Auto Const mandatory
  { Magic effect used to check for mind controlled NPCs }
  Location Property CityNewAtlantisLocation Auto Const mandatory
  { New Atlantis location object }
  Faction Property AvailableCrewFaction Auto Const mandatory
  { Faction used to check if crew have been current hired by the player }
  wwiseevent Property WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_Alarm_Interior Auto Const mandatory
  { Event used to trigger the alarm inside the cabinet chamber }
  Keyword Property UC04_Spaceport_RunIn_Start_LinkedRef Auto Const mandatory
  { Keyword used to link the run-in guards to their starting points }
EndGroup


;-- Functions ---------------------------------------

Function RegisterForMindControlEvents()
  Self.RegisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_MindControlTriggered")
EndFunction

Function UnregisterForMindControlEvents()
  Self.UnRegisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_MindControlTriggered")
EndFunction

Event UCParentFactionQuestScript.MindControlTriggered(ucparentfactionquestscript akSender, Var[] kargs)
  If Self.GetStageDone(MindControlShoutPrereqStage) && !Self.GetStageDone(MindControlShoutShutdownStage)
    Actor ControlTarget = kargs[1] as Actor
    If ControlTarget
      If ControlTarget == Game.GetPlayer()
        If !Self.GetStageDone(StageToSetOnPlayerMindControl) && Hadrian.GetRef().GetDistance(ControlTarget as ObjectReference) <= UC04_HadrianWarningShoutDistance.GetValue()
          Self.SetStage(StageToSetOnPlayerMindControl)
        EndIf
      Else
        Actor ShoutTarget = Self.FindLivingGuard()
        If ShoutTarget
          ShoutTarget.Say(UC04_UCSecurity_WitnessMindControl, None, False, None)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent

Actor Function FindLivingGuard()
  Int I = 0
  Int iCount = SpaceportGuards.GetCount()
  Actor TargetGuard = None
  While I < iCount && TargetGuard == None
    Actor currAct = SpaceportGuards.GetAt(I) as Actor
    If !currAct.IsDead() && !currAct.HasMagicEffect(CrTerrormorphMindControlEffect_NPC) && VoicesDialogueUCSecurity.HasForm(currAct.GetVoiceType() as Form)
      TargetGuard = currAct
    EndIf
    I += 1
  EndWhile
  Return TargetGuard
EndFunction

Function DEBUGTriggerMindControlShout()
  Actor ShoutTarget = Self.FindLivingGuard()
  If ShoutTarget
    ShoutTarget.Say(UC04_UCSecurity_WitnessMindControl, None, False, None)
  EndIf
EndFunction

Function ToggleShutter(Bool bOpen)
  If !bOpen
    WEF_QST_UC04_Shutters_Close.Play(Shutters.GetAt(0), None, None)
  EndIf
  Int I = 0
  Int iCount = Shutters.GetCount()
  While I < iCount
    ObjectReference currRef = Shutters.GetAt(I)
    If bOpen
      currRef.PlayAnimation("Open")
    Else
      currRef.PlayAnimation("Close")
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetUpAttackState(Bool bDisable)
  Int I = 0
  Int iCount = DisableNPCs.GetCount()
  While I < iCount
    ObjectReference currRef = DisableNPCs.GetAt(I)
    If bDisable
      currRef.Disable(False)
    Else
      currRef.Enable(False)
    EndIf
    I += 1
  EndWhile
  Int j = 0
  Int jCount = CoweringNPCs.GetCount()
  While j < jCount
    Actor currAct = CoweringNPCs.GetAt(j) as Actor
    currAct.EvaluatePackage(False)
    currAct.MoveToPackageLocation()
    If bDisable
      CaptiveCollection.AddRef(currAct as ObjectReference)
      currAct.IgnoreFriendlyHits(True)
    Else
      CaptiveCollection.RemoveRef(currAct as ObjectReference)
      currAct.IgnoreFriendlyHits(False)
    EndIf
    j += 1
  EndWhile
  Int k = 0
  Int kCount = KneelingNPCs.GetCount()
  While k < kCount
    Actor curract = KneelingNPCs.GetAt(k) as Actor
    curract.EvaluatePackage(False)
    If bDisable
      CaptiveCollection.AddRef(curract as ObjectReference)
      curract.IgnoreFriendlyHits(True)
    Else
      CaptiveCollection.RemoveRef(curract as ObjectReference)
      curract.IgnoreFriendlyHits(False)
    EndIf
    k += 1
  EndWhile
  Int l = 0
  Int lCount = SpaceportCrew.GetCount()
  While l < lCount
    Actor curract = SpaceportCrew.GetAt(l) as Actor
    Location currLoc = curract.GetCurrentLocation()
    If curract.IsEnabled() && (currLoc == CityNewAtlantisLocation || currLoc.IsChild(CityNewAtlantisLocation)) && !curract.IsInFaction(AvailableCrewFaction)
      curract.Disable(False)
    EndIf
    l += 1
  EndWhile
EndFunction

Function ResetLivingSpaceportGuards()
  Int I = 0
  Int iCount = SpaceportGuards.GetCount()
  While I < iCount
    Actor currAct = SpaceportGuards.GetAt(I) as Actor
    If !currAct.IsDead()
      currAct.Reset(None)
    EndIf
    I += 1
  EndWhile
EndFunction

Function IncrementGuardDeathCount()
  Guard CountGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    UC04_SecurityDeathCount.Mod(1.0)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ToggleElevatorCollAccessibility(RefCollectionAlias akTargetColl, Bool bMakeAccessible)
  Int I = 0
  Int iCount = akTargetColl.GetCount()
  While I < iCount
    loadelevatorfloorscript myElev = akTargetColl.GetAt(I) as loadelevatorfloorscript
    myElev.SetAccessible(bMakeAccessible)
    I += 1
  EndWhile
EndFunction

Function LockAllDoors(RefCollectionAlias akTargetColl, Bool bLock)
  Int I = 0
  Int iCount = akTargetColl.GetCount()
  While I < iCount
    ObjectReference myDoor = akTargetColl.GetAt(I)
    If bLock
      myDoor.BlockActivation(True, True)
    Else
      myDoor.BlockActivation(False, False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function ToggleMarineFollowers(Int iForceState)
  Guard FollowerStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int iFollowerState = UC04_MarineFollowerState.GetValueInt()
    Actor CapACT = FireTeamMarineCaptain.GetActorRef()
    Actor MarACT = FireTeamMarine.GetActorRef()
    If iForceState >= 0
      If iForceState == 0
        iFollowerState = 1
      ElseIf iForceState == 1
        iFollowerState = 0
      EndIf
    EndIf
    If iFollowerState < 1
      UC04_MarineFollowerState.SetValue(1.0)
      SQ_Followers.SetRoleActive(CapACT, False, True, 0.0, 0.0)
      SQ_Followers.SetRoleActive(MarACT, False, True, 0.0, 0.0)
      SQ_Followers.CommandFollow(CapACT)
      SQ_Followers.CommandFollow(MarACT)
    Else
      UC04_MarineFollowerState.SetValue(0.0)
      SQ_Followers.SetRoleInactive(CapACT, False, False, True)
      SQ_Followers.SetRoleInactive(MarACT, False, False, True)
    EndIf
    CapACT.EvaluatePackage(False)
    MarACT.EvaluatePackage(False)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function DisableRefifDeadRefCollection()
  Int I = 0
  Int iCount = SpaceportGuards.GetCount()
  While I < iCount
    Actor currAct = SpaceportGuards.GetAt(I) as Actor
    If currAct.IsDead()
      currAct.Disable(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function ToggleEmergencyLights(Bool bOn)
  Int I = 0
  Int iCount = EmergencyLights.GetCount()
  While I < iCount
    ObjectReference currRef = EmergencyLights.GetAt(I)
    If currRef.Is3DLoaded()
      If bOn
        currRef.PlayAnimation("Red")
        currRef.PlayAnimation("TurnOnPulse")
      Else
        currRef.PlayAnimation("TurnOffFull")
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function ToggleInteriorAlarm(Bool bActivate)
  If bActivate
    iIntAlarmIndex = WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_Alarm_Interior.Play(Obj400Marker.GetRef(), None, None)
  Else
    wwiseevent.StopInstance(iIntAlarmIndex)
  EndIf
EndFunction

Function MoveRunInGuardsToStartLocations()
  Int I = 0
  Int iCount = RunInGuards.GetCount()
  While I < iCount
    Actor currAct = RunInGuards.GetAt(I) as Actor
    If currAct
      ObjectReference StartRef = currAct.GetLinkedRef(UC04_Spaceport_RunIn_Start_LinkedRef)
      If StartRef
        currAct.EvaluatePackage(False)
        currAct.MoveTo(StartRef, 0.0, 0.0, 0.0, True, False)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function TogglePerkOnCollection(RefCollectionAlias akTargetColl, Perk akTargetPerk, Bool bAdd)
  Int I = 0
  Int iCount = akTargetColl.GetCount()
  While I < iCount
    Actor currAct = akTargetColl.GetAt(I) as Actor
    If bAdd
      If !currAct.IsDead()
        currAct.AddPerk(akTargetPerk, False)
      EndIf
    ElseIf currAct.HasPerk(akTargetPerk)
      currAct.RemovePerk(akTargetPerk)
    EndIf
    I += 1
  EndWhile
EndFunction

Function ToggleMinistersHallNPCsGhosted(Bool abSetGhosted)
  Int I = 0
  Int iLength = MinisterHallNPCs.Length
  While I < iLength
    Actor currAct = MinisterHallNPCs[I].GetActorRef()
    If currAct
      currAct.SetGhost(abSetGhosted)
    EndIf
    I += 1
  EndWhile
  IACrew.SetGhost(abSetGhosted)
  BackUpMinisterHallGuards.SetGhost(abSetGhosted)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
