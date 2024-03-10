ScriptName Fragments:Quests:QF_BE_Player_DerelictShip_Ca_0001EAE4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_DerelictGeneric_MissionCompanyGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionTypeGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardCauseGlobal Auto Const mandatory
ReferenceAlias Property Alias_GenetagRef Auto Const mandatory
ReferenceAlias Property Alias_CorpseKeyRef Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_LockedLootNote Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_Genetag Auto Const mandatory
RefCollectionAlias Property Alias_GenericCorpses Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_Repaired Auto Const mandatory
Keyword Property BlockPlayerActivation Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
ReferenceAlias Property Alias_CaptainSpawnMarker Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_MissionCrewTypeGlobal Auto Const mandatory
Hazard Property hazardToxicGas Auto Const mandatory
Hazard Property hazardExtremeCold Auto Const mandatory
Hazard Property hazardSpores Auto Const mandatory
Hazard Property hazardNoOxygen Auto Const mandatory
Hazard Property hazardRadiation Auto Const mandatory
Hazard Property hazardExtremeHeat Auto Const mandatory
Hazard Property hazardCorrosiveGas Auto Const mandatory
ActorBase Property LvlRobotModelA_Combat Auto Const mandatory
ActorBase Property creatures Auto Const mandatory
Hazard Property hazardSteamHeat Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_RadiationNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_NoOxygenNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_ToxicGasNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_BiohazardNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_AIMalfunctionNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_CorrosiveNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_CreaturesNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_ExtremeColdNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_ExtremeHeatNotes Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory
Keyword Property ENV_Loc_NotSealedEnvironment Auto Const mandatory
RefCollectionAlias Property Alias_Containers Auto Const mandatory
ReferenceAlias Property Alias_CaptainsLocker Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_GenericNotes Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_IDCardGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_BlackboxData Auto Const mandatory
Quest Property SE_GenericDerelict_IDCardQuest Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote01 Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote02 Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote03 Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote04 Auto Const mandatory
ReferenceAlias Property Alias_IDCard02 Auto Const mandatory
ReferenceAlias Property Alias_IDCard01 Auto Const mandatory
ReferenceAlias Property Alias_IDCard03 Auto Const mandatory
ReferenceAlias Property Alias_IDCard04 Auto Const mandatory
ReferenceAlias Property Alias_Blackbox Auto Const mandatory
MiscObject Property SE_GenericDerelict_BlackBox Auto Const mandatory
Quest Property SE_GenericDerelict_BlackBoxQuest Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_LogsDownloaded Auto Const mandatory
ReferenceAlias Property Alias_ExtraNote Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
wwiseevent Property pAlarm Auto Const mandatory
ReferenceAlias Property Alias_ModuleCockpit Auto Const mandatory
MiscObject Property Mfg_Tier02_ControlRod Auto Const mandatory
MiscObject Property Mfg_Tier02_IsotopicCoolant Auto Const mandatory
MiscObject Property Mfg_Tier01_ReactiveGauge Auto Const mandatory
MiscObject Property Mfg_Tier01_StructuralFrame Auto Const mandatory
RefCollectionAlias Property Alias_Robots Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const mandatory
ReferenceAlias Property Alias_RepairItem Auto Const mandatory
ActorValue Property ShipSystemGravDriveHealth Auto Const mandatory
ActorValue Property ShieldHealth Auto Const mandatory
wwiseevent Property ShipPowerOn Auto Const mandatory
RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_MySlates Auto Const mandatory
LeveledItem Property LL_Loot_IcyAsteroid Auto Const mandatory
LeveledItem Property LL_Loot_RockyAsteroid Auto Const mandatory
LeveledItem Property LL_Loot_Corpse_Scientist Auto Const mandatory
Outfit Property Outfit_Clothes_Science_Random_NoRyujin Auto Const mandatory
Outfit Property Outfit_Miner_All Auto Const mandatory
LeveledItem Property LL_Weapon_Cutter Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_GenericNotes_ChanceNone Auto Const mandatory
RefCollectionAlias Property Alias_MinerCrew Auto Const mandatory
ReferenceAlias Property Alias_MinerCaptainName Auto Const mandatory
RefCollectionAlias Property Alias_ScientistCrew Auto Const mandatory
RefCollectionAlias Property Alias_SurveyorCrew Auto Const mandatory
RefCollectionAlias Property Alias_CargoCrew Auto Const mandatory
ReferenceAlias Property Alias_ScientistCaptainName Auto Const mandatory
ReferenceAlias Property Alias_SurveyorCaptainName Auto Const mandatory
ReferenceAlias Property Alias_CargoCaptainName Auto Const mandatory
GlobalVariable Property BE_GenericDerelicCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalDockingGlobal Auto Const mandatory
Keyword Property ObjectTypeDataSlate Auto Const mandatory
RefCollectionAlias Property Alias_GenericTurrets Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewEquipmentGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalVoteTallyGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_UniqueEntry01Global Auto Const mandatory
MiscObject Property Mfg_Tier02_SemimetalWafer Auto Const mandatory
MiscObject Property Mfg_Tier03_PowerCircuit Auto Const mandatory
MiscObject Property Mfg_Tier03_CommRelay Auto Const mandatory
RefCollectionAlias Property Alias_GenericCreatures Auto Const mandatory
ActorBase Property LvlBECrew Auto Const mandatory
LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const mandatory
RefCollectionAlias Property Alias_TerminalCollection Auto Const mandatory
Outfit Property Outfit_Clothes_Ship_Captain_Hat Auto Const mandatory
Explosion Property BE_KT02_ExplosionHavok Auto Const mandatory
RefCollectionAlias Property Alias_GenericRobots Auto Const mandatory
RefCollectionAlias Property Alias_ConsoleTerminals Auto Const mandatory
ReferenceAlias Property Alias_DockingTerminal Auto Const mandatory
ReferenceAlias Property Alias_CrewTerminal Auto Const mandatory
RefCollectionAlias Property Alias_ConsoleTerminals_Engineering Auto Const mandatory
ReferenceAlias Property Alias_CargoTerminal Auto Const mandatory
reparentscript Property RE_Parent Auto Const mandatory
ReferenceAlias Property Alias_ScienceTerminal Auto Const mandatory
ActorValue Property BE_SpaceshipTakenOver Auto Const mandatory
MusicType Property MusicOverride Auto Const mandatory
Keyword Property LinkTerminalTurret Auto Const mandatory
Keyword Property LinkTerminalRobot Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_WillbyGlobal Auto Const mandatory
Hazard Property hazardExtremeColdBlast Auto Const mandatory
Hazard Property hazardExtremeColdLeak Auto Const mandatory
ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
Int Property MaxSpawn Auto Const
Keyword Property LinkShipModule Auto Const mandatory
Keyword Property LocTypeBEDerelict Auto Const mandatory
RefCollectionAlias Property Alias_turretSpawnMarkers Auto Const mandatory
ActorBase Property LvlTurretShort_aggro Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Quest Property SE_Derelict_IDCardQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
EndFunction

Function Fragment_Stage_0000_Item_01()
  Self.SetObjectiveDisplayed(11, True, False)
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
EndFunction

Function Fragment_Stage_0001_Item_00()
  ObjectReference[] Turrets = Alias_GenericTurrets.GetArray()
  ObjectReference[] Robots = Alias_GenericRobots.GetArray()
  Int x = Utility.RandomInt(0, 1)
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0
    Self.SetStage(3)
  Else
    Self.SetStage(3)
  EndIf
  Alias_Captain.GetActorRef().SnapIntoInteraction(Alias_CaptainSpawnMarker.GetRef())
  Alias_Terminal.GetRef().SetLinkedRef(Turrets[0], LinkTerminalTurret, False)
  Alias_Terminal.GetRef().SetLinkedRef(Robots[0], LinkTerminalRobot, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int y = Utility.RandomInt(0, myContainers.Length - 1)
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_CorpseKeyRef.ForceRefTo(myCorpses[z])
  ObjectReference myNPC = Alias_CorpseKeyRef.GetRef()
  ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[y], 1, False, False, True)
  myContainers[y].Lock(True, False, True)
  myCorpses[z].AddItem(lootkey as Form, 1, False)
  myCorpses[z].AddItem(LL_SE_GenericDerelict_LockedLootNote as Form, 1, False)
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_GenetagRef.ForceRefTo(myCorpses[z])
  If !SE_Derelict_IDCardQuest.IsRunning()
    Int x = Utility.RandomInt(1, 4)
    If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0
      
    ElseIf x == 1
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote01 as Form, Alias_IDCard01 as Alias, 1, True)
    ElseIf x == 2
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote02 as Form, Alias_IDCard02 as Alias, 1, True)
    ElseIf x == 3
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote03 as Form, Alias_IDCard03 as Alias, 1, True)
    Else
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote04 as Form, Alias_IDCard04 as Alias, 1, True)
    EndIf
  EndIf
  Int I = 1
  While I < myCorpses.Length
    If myCorpses[I].GetItemCount(ObjectTypeDataSlate as Form) == 0
      myCorpses[I].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0003_Item_01()
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0004_Item_00()
  SE_GenericDerelict_BlackBoxQuest.SetStage(10)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Int biohazard = Utility.RandomInt(0, 2)
  If biohazard == 0
    kmyQuest.SetShipHazard(hazardExtremeCold)
  ElseIf biohazard == 1
    kmyQuest.SetShipHazard(hazardExtremeColdBlast)
  Else
    kmyQuest.SetShipHazard(hazardExtremeColdLeak)
  EndIf
  kmyQuest.SetShipHazard(hazardExtremeCold)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int I = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[I].AddAliasedItem(Mfg_Tier01_ReactiveGauge as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[I].Lock(True, False, True)
EndFunction

Function Fragment_Stage_0005_Item_01()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipHazard(hazardNoOxygen)
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int I = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[I].AddAliasedItem(Mfg_Tier01_StructuralFrame as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[I].Lock(True, False, True)
EndFunction

Function Fragment_Stage_0005_Item_02()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipHazard(hazardRadiation)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int I = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[I].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[I].Lock(True, False, True)
EndFunction

Function Fragment_Stage_0005_Item_03()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Int biohazard = Utility.RandomInt(0, 1)
  If biohazard == 1
    kmyQuest.SetShipHazard(hazardExtremeHeat)
  Else
    kmyQuest.SetShipHazard(hazardSteamHeat)
  EndIf
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int k = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[k].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[k].Lock(True, False, True)
EndFunction

Function Fragment_Stage_0005_Item_04()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipHazard(hazardCorrosiveGas)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int k = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[k].AddAliasedItem(Mfg_Tier02_SemimetalWafer as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[k].Lock(True, False, True)
EndFunction

Function Fragment_Stage_0005_Item_05()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Int biohazard = Utility.RandomInt(0, 1)
  If biohazard == 1
    kmyQuest.SetShipHazard(hazardToxicGas)
  Else
    kmyQuest.SetShipHazard(hazardSpores)
  EndIf
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int k = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[k].AddAliasedItem(Mfg_Tier03_PowerCircuit as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[k].Lock(True, False, True)
EndFunction

Function Fragment_Stage_0005_Item_06()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  SE_DerelictGeneric_MissionHazardGlobal.SetValue(6.0)
  ObjectReference[] MarkersRef = Alias_CrewSpawnMarkers.GetArray()
  ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray()
  Int q = 0
  While q < myTurretMarkers.Length
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro as Form, 1, False, False, True, None, None, True)
    Alias_GenericTurrets.AddRef(turretRef)
    q += 1
  EndWhile
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
  ObjectReference TerminalRef = Alias_Terminal.GetRef()
  Int r = 0
  Int w = 1
  While r < myTurrets.Length
    (myTurrets[r] as Actor).SetUnconscious(True)
    If w < myTurrets.Length
      myTurrets[r].SetLinkedRef(myTurrets[w], LinkTerminalTurret, False)
    EndIf
    r += 1
    w += 1
  EndWhile
  Int iMaxSpawn = Utility.RandomInt(4, 8)
  Int k = Utility.RandomInt(0, 5)
  Int I = 0
  If k == 0
    While I < iMaxSpawn && I < MarkersRef.Length
      ObjectReference CreatureRef = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_HexapodAGlider as Form, 1, False, False, True, None, None, True)
      Alias_GenericCreatures.AddRef(CreatureRef)
      ObjectReference ShipModuleRef = MarkersRef[I].GetLinkedRef(LinkShipModule)
      CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, False)
      I += 1
    EndWhile
  ElseIf k == 1
    While I < iMaxSpawn && I < MarkersRef.Length
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACockroach as Form, 1, False, False, True, None, None, True)
      Alias_GenericCreatures.AddRef(creatureref)
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule)
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False)
      I += 1
    EndWhile
  ElseIf k == 2
    While I < iMaxSpawn && I < MarkersRef.Length
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACoralbug as Form, 1, False, False, True, None, None, True)
      Alias_GenericCreatures.AddRef(creatureref)
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule)
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False)
      I += 1
    EndWhile
  ElseIf k == 3
    While I < iMaxSpawn && I < MarkersRef.Length
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidAHookneck as Form, 1, False, False, True, None, None, True)
      Alias_GenericCreatures.AddRef(creatureref)
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule)
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False)
      I += 1
    EndWhile
  ElseIf k == 4
    While I < iMaxSpawn && I < MarkersRef.Length
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler as Form, 1, False, False, True, None, None, True)
      Alias_GenericCreatures.AddRef(creatureref)
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule)
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False)
      I += 1
    EndWhile
  ElseIf k == 5
    While I < iMaxSpawn && I < MarkersRef.Length
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab as Form, 1, False, False, True, None, None, True)
      Alias_GenericCreatures.AddRef(creatureref)
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule)
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False)
      I += 1
    EndWhile
  EndIf
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int x = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[x].AddAliasedItem(Mfg_Tier03_CommRelay as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[x].Lock(True, False, True)
  TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, False)
EndFunction

Function Fragment_Stage_0005_Item_07()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  SE_DerelictGeneric_MissionHazardGlobal.SetValue(7.0)
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()
  ObjectReference[] myRobots = Alias_GenericRobots.GetArray()
  ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray()
  Int q = 0
  While q < myTurretMarkers.Length
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro as Form, 1, False, False, True, None, None, True)
    Alias_GenericTurrets.AddRef(turretRef)
    q += 1
  EndWhile
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
  ObjectReference TerminalRef = Alias_Terminal.GetRef()
  Int r = 0
  Int w = 1
  While r < myTurrets.Length
    (myTurrets[r] as Actor).SetUnconscious(True)
    If w < myTurrets.Length
      myTurrets[r].SetLinkedRef(myTurrets[w], LinkTerminalTurret, False)
    EndIf
    r += 1
    w += 1
  EndWhile
  Int iMaxSpawn = Utility.RandomInt(4, 8)
  Int I = 0
  While I < myMarkers.Length && myRobots.Length < iMaxSpawn
    ObjectReference Robot = myMarkers[I].PlaceAtMe(LvlRobotModelA_Combat as Form, 1, False, False, True, None, None, True)
    ObjectReference ShipModuleRef = myMarkers[I].GetLinkedRef(LinkShipModule)
    Robot.SetLinkedRef(ShipModuleRef, LinkShipModule, False)
    Alias_Robots.AddRef(Robot)
    I += 4
  EndWhile
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int k = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[k].AddAliasedItem(Mfg_Tier03_CommRelay as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[k].Lock(True, False, True)
  TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, False)
EndFunction

Function Fragment_Stage_0005_Item_08()
  Quest __temp = Self as Quest
  be_derelictscript kmyQuest = __temp as be_derelictscript
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()
  ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray()
  Int q = 0
  While q < myTurretMarkers.Length && q < MaxSpawn
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro as Form, 1, False, False, True, None, None, True)
    Alias_GenericTurrets.AddRef(turretRef)
    q += 1
  EndWhile
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
  ObjectReference TerminalRef = Alias_Terminal.GetRef()
  Int I = 0
  Int w = 1
  While I < myTurrets.Length
    (myTurrets[I] as Actor).SetUnconscious(False)
    If w < myTurrets.Length
      myTurrets[I].SetLinkedRef(myTurrets[w], LinkTerminalTurret, False)
    EndIf
    I += 1
    w += 1
  EndWhile
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int z = Utility.RandomInt(0, myCorpses.Length - 1)
  Alias_ExtraNote.ForceRefTo(myCorpses[z])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False)
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Int k = Utility.RandomInt(0, myContainers.Length - 1)
  myContainers[k].AddAliasedItem(Mfg_Tier03_CommRelay as Form, Alias_RepairItem as Alias, 1, True)
  myContainers[k].Lock(True, False, True)
  TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, False)
EndFunction

Function Fragment_Stage_0005_Item_09()
  Self.SetStage(13)
  Self.SetStage(1)
EndFunction

Function Fragment_Stage_0005_Item_10()
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
  Int I = 0
  While I < myTurrets.Length
    myTurrets[I].DisableNoWait(False)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0006_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(1)
EndFunction

Function Fragment_Stage_0007_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(2)
EndFunction

Function Fragment_Stage_0008_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(3)
EndFunction

Function Fragment_Stage_0009_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(4)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(True, False, True)
  ObjectReference[] myMarkers = Alias_ItemSpawnMarkers.GetArray()
  Int d = 0
  While d < myMarkers.Length
    Alias_MySlates.AddRef(myMarkers[d].PlaceAtMe(LL_SE_GenericDerelict_GenericNotes_ChanceNone as Form, 1, False, False, True, None, None, True))
    d += 1
  EndWhile
EndFunction

Function Fragment_Stage_0011_Item_00()
  SE_GenericDerelict_UniqueEntry01Global.SetValue(1.0)
EndFunction

Function Fragment_Stage_0012_Item_00()
  SE_GenericDerelict_WillbyGlobal.SetValue(100.0)
EndFunction

Function Fragment_Stage_0013_Item_00()
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int d = 0
  While d < myCorpses.Length
    Alias_MinerCrew.AddRef(myCorpses[d])
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False)
    EndIf
    d += 1
  EndWhile
  Int I = 0
  While I < myContainers.Length
    myContainers[I].AddItem(LL_Loot_IcyAsteroid as Form, 1, False)
    myContainers[I].AddItem(LL_Loot_RockyAsteroid as Form, 1, False)
    I += 1
  EndWhile
  ObjectReference MinerRef = Alias_Captain.GetRef()
  Alias_MinerCrew.RemoveRef(MinerRef)
  Alias_MinerCaptainName.ForceRefTo(MinerRef)
EndFunction

Function Fragment_Stage_0013_Item_01()
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int d = 0
  While d < myCorpses.Length
    Alias_ScientistCrew.AddRef(myCorpses[d])
    (myCorpses[d] as Actor).SetOutfit(Outfit_Clothes_Science_Random_NoRyujin, False)
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False)
    EndIf
    d += 1
  EndWhile
  BE_GenericDerelicCrewGlobal.SetValue(d as Float)
  ObjectReference ScientistRef = Alias_Captain.GetRef()
  Alias_ScientistCrew.RemoveRef(ScientistRef)
  Alias_ScientistCaptainName.ForceRefTo(ScientistRef)
EndFunction

Function Fragment_Stage_0013_Item_02()
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int d = 0
  While d < myCorpses.Length
    Alias_SurveyorCrew.AddRef(myCorpses[d])
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False)
    EndIf
    d += 1
  EndWhile
  BE_GenericDerelicCrewGlobal.SetValue(d as Float)
  ObjectReference SurveyorRef = Alias_Captain.GetRef()
  Alias_SurveyorCrew.RemoveRef(SurveyorRef)
  Alias_SurveyorCaptainName.ForceRefTo(SurveyorRef)
EndFunction

Function Fragment_Stage_0013_Item_03()
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int d = 0
  While d < myCorpses.Length
    Alias_CargoCrew.AddRef(myCorpses[d])
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False)
    EndIf
    d += 1
  EndWhile
  BE_GenericDerelicCrewGlobal.SetValue(d as Float)
  ObjectReference CargoRef = Alias_Captain.GetRef()
  Alias_CargoCrew.RemoveRef(CargoRef)
  Alias_CargoCaptainName.ForceRefTo(CargoRef)
EndFunction

Function Fragment_Stage_0013_Item_04()
  Actor CaptainRef = Alias_Captain.GetActorRef()
  RE_Parent.KillWithForceNoWait(CaptainRef, None, True)
  CaptainRef.SetOutfit(Outfit_Clothes_Ship_Captain_Hat, False)
  BE_GenericDerelicCrewGlobal.SetValue((Alias_GenericCorpses.GetCount() + 1) as Float)
  Self.UpdateCurrentInstanceGlobal(BE_GenericDerelicCrewGlobal)
  Alias_Terminal.GetRef().EnableNoWait(False)
  Alias_ConsoleTerminals.EnableAll(False)
  Alias_ConsoleTerminals_Engineering.EnableAll(False)
  Alias_DockingTerminal.GetRef().EnableNoWait(False)
  Alias_CargoTerminal.GetRef().EnableNoWait(False)
  Alias_CrewTerminal.GetRef().EnableNoWait(False)
  Alias_ScienceTerminal.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Alias_Robots.KillAll(None)
  SE_GenericDerelict_HazardFixed.SetValue(1.0)
  Self.SetObjectiveCompleted(11, True)
  If !Self.GetStageDone(15)
    Self.SetObjectiveDisplayed(15, True, False)
  EndIf
  If !Self.GetStageDone(20)
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  ShipPowerOn.Play(Game.GetPlayer() as ObjectReference, None, None)
  kmyQuest.SetShipHazard(None)
  Alias_Robots.KillAll(None)
  SE_GenericDerelict_HazardFixed.SetValue(1.0)
  spaceshipreference myShip = Alias_enemyShip.GetShipRef()
  Alias_PilotSeat.GetRef().BlockActivation(False, False)
  Alias_PilotSeat.Clear()
  myShip.RestoreValue(Health, 50000.0)
  myShip.RestoreValue(ShipSystemGravDriveHealth, 50000.0)
  myShip.RestoreValue(ShieldHealth, 50000.0)
  myShip.RestoreValue(ShipSystemShieldsHealth, 50000.0)
  myShip.RestoreValue(ShipSystemEngineHealth, 50000.0)
  kmyQuest.SetShipGravity(1.0)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0015_Item_01()
  Game.GetPlayer().RemoveItem(Mfg_Tier01_ReactiveGauge as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0015_Item_02()
  Game.GetPlayer().RemoveItem(Mfg_Tier01_StructuralFrame as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0015_Item_03()
  Game.GetPlayer().RemoveItem(Mfg_Tier02_ControlRod as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0015_Item_04()
  Game.GetPlayer().RemoveItem(Mfg_Tier02_IsotopicCoolant as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0015_Item_05()
  Game.GetPlayer().RemoveItem(Mfg_Tier02_SemimetalWafer as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0015_Item_06()
  Game.GetPlayer().RemoveItem(Mfg_Tier03_PowerCircuit as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0015_Item_07()
  Game.GetPlayer().RemoveItem(Mfg_Tier03_CommRelay as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0016_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0017_Item_00()
  Self.SetObjectiveCompleted(10, True)
  If !Self.GetStageDone(15)
    Self.SetObjectiveDisplayed(15, True, False)
  EndIf
  If !Self.GetStageDone(20)
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0018_Item_00()
  Self.SetObjectiveCompleted(30, True)
  MusicOverride.Remove()
EndFunction

Function Fragment_Stage_0019_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None)
  SE_GenericDerelict_Repaired.SetValue(1.0)
  ObjectReference TerminalRef = Alias_Terminal.GetRef()
  TerminalRef.SetLinkedRef(Alias_CaptainsLocker.GetRef(), None, False)
  Self.SetObjectiveCompleted(15, True)
EndFunction

Function Fragment_Stage_0020_Item_01()
  spaceshipreference myShip = Alias_enemyShip.GetShipRef()
  ObjectReference PilotSeatRef = Alias_PilotSeat.GetRef()
  PilotSeatRef.RemoveKeyword(BlockPlayerActivation)
  PilotSeatRef.BlockActivation(False, False)
  Alias_PilotSeat.Clear()
  myShip.RestoreValue(Health, 50000.0)
  myShip.RestoreValue(ShipSystemGravDriveHealth, 50000.0)
  myShip.RestoreValue(ShieldHealth, 50000.0)
EndFunction

Function Fragment_Stage_0021_Item_00()
  Alias_GenericTurrets.KillAll(None)
  Self.SetStage(14)
EndFunction

Function Fragment_Stage_0022_Item_00()
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
  ObjectReference[] myRobots = Alias_Robots.GetArray()
  Alias_Terminal.GetRef().SetLinkedRef(myTurrets[0], LinkTerminalTurret, False)
  Alias_Terminal.GetRef().SetLinkedRef(myRobots[0], LinkTerminalRobot, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(4)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
EndFunction

Function Fragment_Stage_1000_Item_00()
  SE_GenericDerelict_TerminalGlobal.SetValue(0.0)
  SE_GenericDerelict_TerminalCrewGlobal.SetValue(0.0)
  SE_GenericDerelict_TerminalDockingGlobal.SetValue(0.0)
  Alias_Terminal.GetRef().DisableNoWait(False)
  Alias_ConsoleTerminals.DisableAll(False)
  Alias_ConsoleTerminals_Engineering.DisableAll(False)
  Alias_DockingTerminal.GetRef().DisableNoWait(False)
  Alias_CargoTerminal.GetRef().DisableNoWait(False)
  Alias_CrewTerminal.GetRef().DisableNoWait(False)
  Alias_ScienceTerminal.GetRef().DisableNoWait(False)
  Self.SetObjectiveFailed(10, True)
  MusicOverride.Remove()
  Self.Stop()
EndFunction
