ScriptName Fragments:Quests:QF_BE_Player_DerelictShip_Sc_0001EAE5 Extends Quest Const hidden

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

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Int x = Utility.RandomInt(0, 1)
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0
    Self.SetStage(3)
  Else
    Self.SetStage(3)
  EndIf
  Int I = 3
  While I < myCorpses.Length
    myCorpses[I].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False)
    I += 1
  EndWhile
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  ObjectReference[] myContainers = Alias_Containers.GetArray()
  Alias_CorpseKeyRef.ForceRefTo(myCorpses[0])
  ObjectReference myNPC = Alias_CorpseKeyRef.GetRef()
  ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[0], 1, False, False, True)
  myContainers[0].Lock(True, False, True)
  myNPC.AddItem(lootkey as Form, 1, False)
  myNPC.AddItem(LL_SE_GenericDerelict_LockedLootNote as Form, 1, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Alias_GenetagRef.ForceRefTo(myCorpses[2])
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
EndFunction

Function Fragment_Stage_0004_Item_00()
  SE_GenericDerelict_BlackBoxQuest.SetStage(10)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipHazard(hazardExtremeCold)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes as Form, 1, False)
EndFunction

Function Fragment_Stage_0005_Item_01()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipHazard(hazardNoOxygen)
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes as Form, 1, False)
EndFunction

Function Fragment_Stage_0005_Item_02()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipHazard(hazardRadiation)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes as Form, 1, False)
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
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes as Form, 1, False)
EndFunction

Function Fragment_Stage_0005_Item_04()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetShipHazard(hazardCorrosiveGas)
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes as Form, 1, False)
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
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes as Form, 1, False)
EndFunction

Function Fragment_Stage_0005_Item_06()
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()
  Int I = 0
  While I < myMarkers.Length
    myMarkers[I].PlaceAtMe(creatures as Form, 1, False, False, True, None, None, True)
    I += 1
  EndWhile
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes as Form, 1, False)
EndFunction

Function Fragment_Stage_0005_Item_07()
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()
  Int I = 0
  While I < myMarkers.Length
    myMarkers[I].PlaceAtMe(LvlRobotModelA_Combat as Form, 1, False, False, True, None, None, True)
    I += 1
  EndWhile
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
  Alias_ExtraNote.ForceRefTo(myCorpses[1])
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False)
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
  SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0, 4))
  SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(1.0)
  SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0, 7))
  SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0, 2))
  SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0, 1))
  SE_GenericDerelict_Repaired.SetValue(0.0)
  SE_GenericDerelict_LogsDownloaded.SetValue(0.0)
  Alias_CaptainsLocker.GetRef().Lock(True, False, True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None)
  SE_GenericDerelict_Repaired.SetValue(1.0)
  Alias_Terminal.GetRef().SetLinkedRef(Alias_CaptainsLocker.GetRef(), None, True)
  kmyQuest.SetShipGravity(1.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_BlackBox as Form, Alias_Blackbox as Alias, 1, True)
  Self.SetStage(4)
EndFunction
