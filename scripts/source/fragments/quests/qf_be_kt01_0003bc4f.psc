ScriptName Fragments:Quests:QF_BE_KT01_0003BC4F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
GlobalVariable Property PBE_DerelictCreaturesMax Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Scene Property BE_KT01_SceneWelcome Auto Const mandatory
Hazard Property CreateVacuumHazard Auto Const mandatory
Hazard Property myHazard01 Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
GlobalVariable Property BE_KT01_InstanceID Auto Const mandatory
Scene Property BE_KT01_SceneStart Auto Const mandatory
LeveledItem Property LL_OE_Default_Reward Auto Const mandatory
Hazard Property myHazard02 Auto Const mandatory
Hazard Property myHazard03 Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_Announcer Auto Const mandatory
Quest Property SE_KT01 Auto Const mandatory
ReferenceAlias Property Alias_Captain01 Auto Const mandatory
ReferenceAlias Property Alias_Captain02 Auto Const mandatory
ReferenceAlias Property Alias_Captain03 Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const mandatory
RefCollectionAlias Property Alias_creatures Auto Const mandatory
RefCollectionAlias Property Alias_turretSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_Computers Auto Const mandatory
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory
Keyword Property LinkTerminalTurret Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_SoftAlarm Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
ReferenceAlias Property Alias_SpawnMarkerCaptain Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0009_Item_00()
  Actor CaptainRef = Alias_Captain.GetActorRef()
  CaptainRef.RemoveFromFaction(CaptiveFaction)
  CaptainRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference[] MarkersRef = Alias_CrewSpawnMarkers.GetArray()
  Int k = Utility.RandomInt(0, 5)
  Int I = 0
  If k == 0
    While I < 7 && I < MarkersRef.Length
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_HexapodAGlider as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 1
    While I < 7 && I < MarkersRef.Length
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACockroach as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 2
    While I < 7 && I < MarkersRef.Length
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACoralbug as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 3
    While I < 7 && I < MarkersRef.Length
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidAHookneck as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 4
    While I < 7 && I < MarkersRef.Length
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 5
    While I < 7 && I < MarkersRef.Length
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  EndIf
  ObjectReference[] ComputerRefs = Alias_Computers.GetArray()
  Int p = 0
  While p < ComputerRefs.Length
    If ComputerRefs[p].GetLinkedRef(LinkTerminalTurret) == None && ComputerRefs[I].GetLinkedRef(LinkTerminalSecurityDoor) == None
      ComputerRefs[p].SetLockLevel(255)
    EndIf
    p += 1
  EndWhile
  Alias_Captain.GetRef().IgnoreFriendlyHits(True)
EndFunction

Function Fragment_Stage_0010_Item_01()
  ObjectReference CaptainRef = Alias_Captain01.GetRef()
  CaptainRef.EnableNoWait(False)
  Alias_Captain.ForceRefTo(CaptainRef)
EndFunction

Function Fragment_Stage_0010_Item_02()
  ObjectReference CaptainRef = Alias_Captain02.GetRef()
  CaptainRef.EnableNoWait(False)
  Alias_Captain.ForceRefTo(CaptainRef)
EndFunction

Function Fragment_Stage_0010_Item_03()
  ObjectReference CaptainRef = Alias_Captain03.GetRef()
  CaptainRef.EnableNoWait(False)
  Alias_Captain.ForceRefTo(CaptainRef)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Self.SetObjectiveCompleted(10, True)
  If !Self.GetStageDone(66) && !SE_KT01.GetStageDone(6)
    Self.SetObjectiveDisplayed(20, True, False)
    BE_KT01_SceneStart.Start()
  EndIf
  Alias_SoftAlarm.GetRef().DisableNoWait(False)
  kmyQuest.SetShipHazard(None)
  kmyQuest.SetShipGravity(1.0)
  Alias_Captain.GetRef().IgnoreFriendlyHits(False)
  Alias_EnemyShip.GetShipRef().SetValue(SpaceshipCrew, 1.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  BE_KT01_SceneWelcome.Start()
  SE_KT01.SetStage(30)
EndFunction

Function Fragment_Stage_0024_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipGravity(1.0)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_EnemyShip.GetShipRef().SetGhost(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(15)
    wwiseevent.StopInstance(BE_KT01_InstanceID.GetValueInt())
    Alias_Captain.GetActorRef().Kill(None)
  EndIf
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  If Self.GetStageDone(100) && !Self.GetStageDone(66)
    enemyShipRef.SetValue(DockingPermission, 4.0)
    enemyShipRef.DisableWithGravJump()
  EndIf
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Captain.GetRef().MoveTo(Alias_SpawnMarkerCaptain.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_PilotSeat.GetRef().BlockActivation(False, False)
  Alias_EnemyShip.GetShipRef().SetValue(SpaceshipCrew, 0.0)
  SE_KT01.SetStage(66)
  Self.SetObjectiveSkipped(10)
  Self.SetObjectiveSkipped(20)
EndFunction

Function Fragment_Stage_1000_Item_00()
  wwiseevent.StopInstance(BE_KT01_InstanceID.GetValueInt())
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
