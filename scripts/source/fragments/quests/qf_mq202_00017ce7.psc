ScriptName Fragments:Quests:QF_MQ202_00017CE7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CaptainPetrov Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property MQ104AStart Auto Const mandatory
Scene Property MQ202_002_ScowScene Auto Const mandatory
Scene Property MQ202_003a_TaoXun_HostileScene Auto Const mandatory
Scene Property MQ202_004_PetrovScene Auto Const mandatory
Scene Property MQ202_006_PetrovEscortScene Auto Const mandatory
ReferenceAlias Property Alias_TaoXun Auto Const mandatory
ReferenceAlias Property Alias_VaultDoor Auto Const mandatory
ReferenceAlias Property Alias_AlarmSoundMarker Auto Const mandatory
Faction Property MQ202PetrovFaction Auto Const mandatory
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ObjectReference Property MQ106_BarrettMarker01 Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
ReferenceAlias Property Alias_PetrovShip Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const mandatory
Scene Property MQ202_003b_TaoXun_PeacefulScene Auto Const mandatory
ReferenceAlias Property Alias_MQ202Artifact Auto Const mandatory
ReferenceAlias Property MQ00_MQ202ArtifactHolder Auto Const
Faction Property MQ202PetrovEnemyFaction Auto Const mandatory
ObjectReference Property MQ202ScowStart Auto Const mandatory
Key Property MQ202VaultKey Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_ArtifactHolder Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtLodge Auto Const
ReferenceAlias Property MQ00_CompanionAtEye Auto Const
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Faction Property MQ202PetrovGuardsFriendsFaction Auto Const mandatory
ReferenceAlias Property Alias_LockVaultActivator Auto Const mandatory
Scene Property MQ202_008_Petrov_BleedoutScene Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Message Property MQ202BountyMSG Auto Const mandatory
Key Property LC012Scow_ZooPassword Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
ReferenceAlias Property Alias_BountyHunter_Bull Auto Const mandatory
ReferenceAlias Property Alias_BountyHunter_ErinSeptember Auto Const mandatory
ReferenceAlias Property Alias_BountyHunter_Raptor Auto Const mandatory
LocationAlias Property Alias_ScowShipLocation Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_ZooCreatures Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Message Property MQ202CompanionLockInMSG Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory
ObjectReference Property MQ201B_Eye_EnableMarker Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Andreja Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Barrett Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sam Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sarah Auto Const mandatory
ObjectReference Property ScowMapMarkerREF Auto Const mandatory
Quest Property SQ_Crew Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
Perk Property MQ202ScowReduceDamage Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
RefCollectionAlias Property DisembarkingCrew Auto Const
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
Activator Property COM_MQ202_TxtReplace_QuestName_Any Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(7)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(8)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(9)
  Game.GetPlayer().moveto(MQ104AStart, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  MQ102.Stop()
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(7)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(8)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(9)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(50)
  Game.GetPlayer().moveto(MQ202ScowStart, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  MQ102.Stop()
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(7)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(8)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(9)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(60)
  Game.GetPlayer().moveto(MQ202ScowStart, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  ScowMapMarkerREF.Enable(False)
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipRef()
  PetrovShipREF.Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  ObjectReference PlacementREF = Alias_MQ202Artifact.GetRef()
  ObjectReference AttachREF = Alias_ArtifactHolder.GetRef()
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifactAndAttach(10, PlacementREF, AttachREF)
  Alias_MQ202Artifact.ForceRefTo(ArtifactREF)
  ArtifactREF.Enable(False)
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Actor BarrettREF = Alias_Barrett.GetActorRef()
  Actor SamCoeREF = Alias_SamCoe.GetActorRef()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  Actor VascoREF = Alias_Vasco.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleInactive(AndrejaREF, False, True, False)
  (SQ_Companions as sq_companionsscript).SetRoleInactive(BarrettREF, False, True, False)
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SamCoeREF, False, True, False)
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SarahMorganREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(AndrejaREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(BarrettREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(SamCoeREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(SarahMorganREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(VascoREF, False, True, False)
  DismissedCrew.RemoveRef(AndrejaREF as ObjectReference)
  DismissedCrew.RemoveRef(BarrettREF as ObjectReference)
  DismissedCrew.RemoveRef(SamCoeREF as ObjectReference)
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference)
  DisembarkingCrew.RemoveRef(AndrejaREF as ObjectReference)
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference)
  If MQ00_CompanionAtLodge.GetActorRef() == None
    MQ00_CompanionAtLodge.ForceRefTo(SamCoeREF as ObjectReference)
  EndIf
  If MQ00_CompanionAtEye.GetActorRef() == None
    MQ00_CompanionAtEye.ForceRefTo(SarahMorganREF as ObjectReference)
  EndIf
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("FollowerWarnAndreja")
EndFunction

Function Fragment_Stage_0012_Item_01()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("FollowerWarnBarrett")
EndFunction

Function Fragment_Stage_0012_Item_02()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("FollowerWarnSam")
EndFunction

Function Fragment_Stage_0012_Item_03()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("FollowerWarnSarah")
EndFunction

Function Fragment_Stage_0013_Item_00()
  Message.ClearHelpMessages()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Message.ClearHelpMessages()
EndFunction

Function Fragment_Stage_0018_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(15)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Message.ClearHelpMessages()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleActive(CompanionAtLodgeREF, True, True, 0.0, 0.0)
  (SQ_Companions as sq_companionsscript).LockInCompanion(CompanionAtLodgeREF as companionactorscript, True, MQ202CompanionLockInMSG, COM_MQ202_TxtReplace_QuestName_Any)
  CompanionAtLodgeREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayedAtTop(30)
  Self.SetObjectiveDisplayed(32, True, False)
  Self.SetObjectiveDisplayed(34, True, False)
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipRef()
  PetrovShipREF.SetNoBleedoutRecovery(True)
  PetrovShipREF.EnablePartRepair(ShipSystemEngineHealth, False)
EndFunction

Function Fragment_Stage_0033_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(32, True)
  Self.SetObjectiveDisplayed(34, False, False)
  Self.SetObjectiveDisplayed(30, True, True)
  Game.GetPlayer().addtoFaction(MQ202PetrovBoardingFaction)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveDisplayed(32, False, False)
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference()
  PetrovShipREF.addtoFaction(PlayerEnemyFaction)
  PetrovShipREF.StartCombat(Alias_playerShip.GetShipReference(), False)
  PetrovShipREF.EnablePartRepair(SpaceshipEngineHealth, False)
  Game.GetPlayer().RemoveFromFaction(MQ202PetrovBoardingFaction)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(32, False, False)
  Self.SetObjectiveDisplayed(34, False, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayedAtTop(40)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ202_003a_TaoXun_HostileScene.Start()
EndFunction

Function Fragment_Stage_0130_Item_00()
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference()
  PetrovShipREF.RemoveFromFaction(PlayerEnemyFaction)
  PetrovShipREF.addtoFaction(PlayerAllyFaction)
  PetrovShipREF.SetValue(Aggression, 0.0)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Actor TaoXunREF = Alias_TaoXun.GetActorRef()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction)
  PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
  PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction)
  TaoXunREF.StartCombat(PlayerREF as ObjectReference, False)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0190_Item_00()
  MQ202_003b_TaoXun_PeacefulScene.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(32, False, False)
  Self.SetObjectiveDisplayed(34, False, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayedAtTop(40)
EndFunction

Function Fragment_Stage_0210_Item_00()
  MQ202_004_PetrovScene.Start()
EndFunction

Function Fragment_Stage_0213_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0214_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
  Game.GetPlayer().additem(LC012Scow_ZooPassword as Form, 1, False)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0215_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None)
  Actor BullREF = Alias_BountyHunter_Bull.GetActorRef()
  Actor ErinSeptemberREF = Alias_BountyHunter_ErinSeptember.GetActorRef()
  Actor RaptorREF = Alias_BountyHunter_Raptor.GetActorRef()
  BullREF.RemoveFromFaction(MQ202PetrovFaction)
  BullREF.addtoFaction(PlayerAllyFaction)
  ErinSeptemberREF.RemoveFromFaction(MQ202PetrovFaction)
  ErinSeptemberREF.addtoFaction(PlayerAllyFaction)
  RaptorREF.RemoveFromFaction(MQ202PetrovFaction)
  RaptorREF.addtoFaction(PlayerAllyFaction)
EndFunction

Function Fragment_Stage_0217_Item_00()
  Actor BullREF = Alias_BountyHunter_Bull.GetActorRef()
  Actor ErinSeptemberREF = Alias_BountyHunter_ErinSeptember.GetActorRef()
  Actor RaptorREF = Alias_BountyHunter_Raptor.GetActorRef()
  Actor PlayerREF = Game.GetPlayer()
  BullREF.RemoveFromFaction(PlayerAllyFaction)
  BullREF.addtoFaction(MQ202PetrovFaction)
  ErinSeptemberREF.RemoveFromFaction(PlayerAllyFaction)
  ErinSeptemberREF.addtoFaction(MQ202PetrovFaction)
  RaptorREF.RemoveFromFaction(PlayerAllyFaction)
  RaptorREF.addtoFaction(MQ202PetrovFaction)
  BullREF.StartCombat(PlayerREF as ObjectReference, False)
  ErinSeptemberREF.StartCombat(PlayerREF as ObjectReference, False)
  RaptorREF.StartCombat(PlayerREF as ObjectReference, False)
EndFunction

Function Fragment_Stage_0235_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayedAtTop(50)
  Self.SetObjectiveDisplayed(52, True, False)
  Self.SetObjectiveDisplayed(54, True, False)
  Self.SetObjectiveDisplayed(56, True, False)
EndFunction

Function Fragment_Stage_0236_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(52, True)
  Self.SetObjectiveDisplayed(54, False, False)
  Self.SetObjectiveDisplayed(56, False, False)
  Self.SetObjectiveDisplayed(50, True, True)
EndFunction

Function Fragment_Stage_0240_Item_00()
  MQ202_006_PetrovEscortScene.Start()
  Game.GetPlayer().addtoFaction(MQ202PetrovGuardsFriendsFaction)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(52, False, False)
  Self.SetObjectiveDisplayed(54, False, False)
  Self.SetObjectiveDisplayed(56, False, False)
  Self.SetObjectiveDisplayed(57, True, False)
EndFunction

Function Fragment_Stage_0242_Item_00()
  Alias_ArtifactHolder.GetRef().Activate(Alias_CaptainPetrov.GetActorRef() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0245_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(52, False, False)
  Self.SetObjectiveDisplayed(54, False, False)
  Self.SetObjectiveDisplayed(56, False, False)
  Self.SetObjectiveDisplayed(200, False, False)
  Self.SetObjectiveDisplayed(210, False, False)
  Self.SetObjectiveDisplayed(220, False, False)
  Self.SetObjectiveDisplayed(230, False, False)
  Self.SetObjectiveDisplayed(250, False, False)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest
  mq202_questscript kmyQuest = __temp as mq202_questscript
  kmyQuest.CheckPetrov()
EndFunction

Function Fragment_Stage_0250_Item_01()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayedAtTop(50)
  Self.SetObjectiveDisplayed(52, False, False)
  Self.SetObjectiveDisplayed(54, True, False)
  Self.SetObjectiveDisplayed(56, True, False)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Alias_VaultDoor.GetRef().SetOpen(True)
  Self.SetStage(290)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(57, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Self.SetStage(260)
EndFunction

Function Fragment_Stage_0280_Item_00()
  Game.GetPlayer().additem(Alias_MQ202Artifact.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(52, True)
  Self.SetObjectiveCompleted(54, True)
  Self.SetObjectiveCompleted(56, True)
  Self.SetObjectiveCompleted(57, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  Alias_ArtifactCollection.GetRef().Enable(False)
  MQ202_006_PetrovEscortScene.Stop()
  If Self.GetStageDone(410) == False
    Alias_AlarmSoundMarker.GetRef().Enable(False)
    PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
    PlayerREF.addtoFaction(MQ202PetrovEnemyFaction)
    Alias_CaptainPetrov.GetActorRef().StartCombat(PlayerREF as ObjectReference, False)
  EndIf
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(10)
  CrimeFactionUC.ModCrimeGold(500, False)
  MQ202BountyMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  ArmillaryMountSwapEnableMarker.DisableNoWait(False)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(52, True)
  Self.SetObjectiveCompleted(54, True)
  Self.SetObjectiveCompleted(56, True)
  Self.SetObjectiveCompleted(57, True)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  mq202_questscript kmyQuest = __temp as mq202_questscript
  kmyQuest.CheckPetrov()
EndFunction

Function Fragment_Stage_0410_Item_00()
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef()
  Game.GetPlayer().addtoFaction(MQ202PetrovGuardsFriendsFaction)
  PetrovREF.RestoreValue(Health, 9999.0)
  PetrovREF.SetEssential(False)
  PetrovREF.SetNoBleedoutRecovery(False)
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference()
  PetrovShipREF.RemoveFromFaction(PlayerEnemyFaction)
  PetrovShipREF.addtoFaction(PlayerAllyFaction)
  PetrovShipREF.SetValue(Aggression, 0.0)
EndFunction

Function Fragment_Stage_0415_Item_00()
  Self.SetStage(410)
  Self.SetStage(290)
  Alias_VaultDoor.GetRef().SetOpen(True)
  Actor PlayerREF = Game.GetPlayer()
  If PlayerREF.GetItemCount(MQ202VaultKey as Form) == 0 && Self.GetStageDone(310) == False
    PlayerREF.additem(MQ202VaultKey as Form, 1, False)
  EndIf
  Alias_CaptainPetrov.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef()
  Self.SetStage(410)
  PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
  PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction)
  PlayerREF.RemoveFromFaction(MQ202PetrovFaction)
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction)
  PetrovREF.StartCombat(PlayerREF as ObjectReference, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(250, False, False)
  Self.SetObjectiveDisplayed(100, True, False)
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference()
  PetrovShipREF.SetEssential(False)
  Alias_AlarmSoundMarker.GetRef().Disable(False)
  MQ204.Start()
EndFunction

Function Fragment_Stage_0510_Item_00()
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference()
  PetrovShipREF.addtoFaction(PlayerEnemyFaction)
  PetrovShipREF.SetEssential(False)
  PetrovShipREF.SetValue(Aggression, 1.0)
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
  PlayerREF.RemoveFromFaction(MQ202PetrovFaction)
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction)
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef()
  PetrovREF.SetEssential(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(210, True, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(210, True)
  Self.SetObjectiveDisplayed(220, True, False)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(210, True)
  Self.SetObjectiveCompleted(220, True)
  Self.SetObjectiveDisplayed(230, True, False)
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(210, True)
  Self.SetObjectiveCompleted(220, True)
  Self.SetObjectiveCompleted(230, True)
  Self.SetStage(245)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(250, True)
  Alias_ZooCreatures.RemoveFromFaction(MQ202PetrovFaction)
  Alias_ZooCreatures.addtoFaction(PlayerAllyFaction)
  Alias_ZooCreatures.addtoFaction(MQ202PetrovEnemyFaction)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  MQ204.SetStage(60)
  RAD02.SetStage(200)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  MQ00_MQ202ArtifactHolder.ForceRefTo(Alias_MQ202Artifact.GetRef())
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference()
  PetrovShipREF.addtoFaction(PlayerEnemyFaction)
  PetrovShipREF.SetEssential(False)
  PetrovShipREF.SetValue(Aggression, 1.0)
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction)
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef()
  PetrovREF.SetEssential(False)
  MQ201BSparksEnableMarker_Andreja.DisableNoWait(False)
  MQ201BSparksEnableMarker_Barrett.DisableNoWait(False)
  MQ201BSparksEnableMarker_Sam.DisableNoWait(False)
  MQ201BSparksEnableMarker_Sarah.DisableNoWait(False)
  MQ201B_Eye_EnableMarker.DisableNoWait(False)
EndFunction
