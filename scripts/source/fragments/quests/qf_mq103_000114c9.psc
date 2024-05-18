ScriptName Fragments:Quests:QF_MQ103_000114C9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ103 Auto Const mandatory
Scene Property MQ102_01_SamCoraScene Auto Const mandatory
Scene Property MQ102_02_SamPlayerIntroScene Auto Const mandatory
Scene Property MQ102_03_ArrriveAkilaScene Auto Const mandatory
Scene Property MQ103_09_SurveyScene Auto Const mandatory
Scene Property MQ103_12_ArtifactScene Auto Const mandatory
Scene Property MQ103_13_AftermathScene Auto Const mandatory
Scene Property MQ103_15_SmugglerAfterScene Auto Const mandatory
Scene Property MQ103_14_AmbushScene Auto Const mandatory
Scene Property MQ103_16_LodgeScene Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Scene Property MQ103_17_EndScene Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
ObjectReference Property MQ103SamStartMarker Auto Const mandatory
Scene Property MQ103_03_ArriveAkilaScene Auto Const mandatory
Scene Property MQ103_04_GalBankVaultScene Auto Const mandatory
Scene Property MQ103_06_CoeEstateIntroScene Auto Const mandatory
Scene Property MQ103_11b_JacobSamEndScene Auto Const mandatory
Scene Property MQ103_11a_JacobSamArgueScene Auto Const mandatory
Scene Property MQ103_12b_CoraJacobScene Auto Const mandatory
Scene Property MQ103_15_LockeGangSamScene Auto Const mandatory
Scene Property MQ103_16a_LockeGangEavesdrop Auto Const mandatory
Scene Property MQ103_16b_LockeGangEavesdrop Auto Const mandatory
Scene Property MQ103_17_ArtifactScene Auto Const mandatory
Scene Property MQ103_18_AftermathScene Auto Const mandatory
ObjectReference Property MQ103LockeEnableMarkerREF Auto Const mandatory
Scene Property MQ103_19_AmbushScene Auto Const mandatory
ReferenceAlias Property Alias_Locke Auto Const mandatory
RefCollectionAlias Property Alias_LockeBodyguard Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property MQ103_20_SmugglerAfterScene Auto Const mandatory
Scene Property MQ103_21_LodgeScene Auto Const mandatory
Scene Property MQ103_22_EndScene Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ObjectReference Property MQ103DungeonStart Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator Auto Const mandatory
ReferenceAlias Property Alias_MQ103ArtifactQuestObject Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Weapon Property Eon Auto Const mandatory
ObjectReference Property MQ103ArtifactSpawnMarker Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ObjectReference Property MQ103_SamOutsideAkilaMarker Auto Const mandatory
Key Property MQ103CoeVaultKey Auto Const mandatory
Perk Property TraitFreestarCollectiveSettler Auto Const mandatory
Scene Property MQ103_04a_GalBankLockedScene Auto Const mandatory
ReferenceAlias Property Alias_GalBankVaultDoor Auto Const mandatory
Quest Property FC01 Auto Const mandatory
ObjectReference Property MQ103LockeGangExteriorEnableMarker Auto Const mandatory
ObjectReference Property MQ103AshtaEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_AshtaALL Auto Const mandatory
ReferenceAlias Property Alias_LockeGangMapMarker Auto Const mandatory
Scene Property MQ103_19b_AshtaScene Auto Const mandatory
Scene Property MQ103_21a_LodgeMoveScene Auto Const mandatory
Scene Property MQ103_04b_GalBankOpenScene Auto Const mandatory
ObjectReference Property LC006_CaveBlocker_EnableMarker Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_SetStage300Trigger Auto Const mandatory
ReferenceAlias Property Alias_LockGang01 Auto Const mandatory
ReferenceAlias Property Alias_LockGang02 Auto Const mandatory
ReferenceAlias Property Alias_LockGang03 Auto Const mandatory
ReferenceAlias Property Alias_LockGang04 Auto Const mandatory
Faction Property MQ103LockeGangFaction Auto Const mandatory
ReferenceAlias Property Alias_CoeOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_CoeMainDoor Auto Const mandatory
ReferenceAlias Property Alias_SolomonMaps Auto Const mandatory
Key Property MQ103JacobOfficeKey Auto Const mandatory
ReferenceAlias Property Alias_JacobCoe Auto Const mandatory
Message Property MQ103SamLockInMSG Auto Const mandatory
Message Property MQ103SamLockInOverMSG Auto Const mandatory
Message Property MQ103SamLockInMidquestOverMSG Auto Const mandatory
Quest Property CREW_EliteCrew_CoraCoe Auto Const mandatory
LeveledItem Property LL_Weapon_Razorback_Upgraded Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory
ObjectReference Property MQ103_CoraSpaceportReadingMarker Auto Const mandatory
Perk Property BackgroundGangster Auto Const mandatory
ObjectReference Property LC006_LoadDoor_Ext Auto Const mandatory
ObjectReference Property CoeEstateFirstFloorDoorREF Auto Const mandatory
ObjectReference Property CoeEstateBalconyDoorREF Auto Const mandatory
ObjectReference Property CoeEstateFrontDoorREF Auto Const mandatory
Faction Property CoeEstateDoorFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_Blake Auto Const mandatory
Keyword Property TeammateReadyWeapon_DO Auto Const mandatory
ReferenceAlias Property Alias_ArtifactSoundMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactSoundMarker02 Auto Const mandatory
ReferenceAlias Property Alias_LockeAshtaScreammer Auto Const mandatory
RefCollectionAlias Property PassengersRefColl Auto Const
RefCollectionAlias Property Alias_LockeGangInteriorNPCs Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const
ObjectReference Property CoeEstateFirstFloorDoorTwo Auto Const
Activator Property COM_MQ103_TxtReplace_QuestName_SamCoe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.SetStage(1150)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  Game.GetPlayer().MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().additem(Credits as Form, 1500, False)
  Game.GetPlayer().additem(Eon as Form, 1, False)
  Game.GetPlayer().AddPerk(TraitFreestarCollectiveSettler, False)
  Self.SetStage(10)
  Frontier_ModularREF.MoveTo(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ102.CompleteQuest()
  Self.SetStage(210)
  Self.SetStage(610)
  Self.SetObjectiveCompleted(40, True)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  Game.GetPlayer().MoveTo(MQ103DungeonStart, 0.0, 0.0, 0.0, True, False)
  Alias_SamCoe.GetActorRef().MoveTo(MQ103DungeonStart, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().additem(Credits as Form, 1500, False)
  Game.GetPlayer().additem(Eon as Form, 1, False)
  Game.GetPlayer().AddPerk(BackgroundGangster, False)
  LC006_CaveBlocker_EnableMarker.Disable(False)
  ObjectReference ArtifactActivatorREF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(4, Alias_ArtifactActivator.GetRef())
  Alias_ArtifactActivator.ForceRefTo(ArtifactActivatorREF)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_SamCoe.GetActorRef().MoveTo(MQ103SamStartMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CoraCoe.GetActorRef().MoveTo(MQ103SamStartMarker, 0.0, 0.0, 0.0, True, False)
  ObjectReference ArtifactActivatorREF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(4, Alias_ArtifactActivator.GetRef())
  Alias_ArtifactActivator.ForceRefTo(ArtifactActivatorREF)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ102_01_SamCoraScene.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Actor SamCoeREF = Alias_SamCoe.GetActorRef()
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(SamCoeREF)
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(CoraCoeREF)
  CREW_EliteCrew_CoraCoe.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  ObjectReference PassengerMarkerREF = Alias_PlayerShipPassengerMarker.GetRef()
  Actor SamREF = Alias_SamCoe.GetActorRef()
  Actor CoraREF = Alias_CoraCoe.GetActorRef()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Actor SamCoeREF = Alias_SamCoe.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(SamCoeREF)
  PassengersRefColl.RemoveRef(SamCoeREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference)
  SamCoeREF.EvaluatePackage(False)
  SamCoeREF.MoveTo(MQ103_SamOutsideAkilaMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0202_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("FollowerWarn")
EndFunction

Function Fragment_Stage_0203_Item_00()
  Message.ClearHelpMessages()
EndFunction

Function Fragment_Stage_0205_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor SamREF = Alias_SamCoe.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleActive(SamREF, True, True, 0.0, 0.0)
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, True, MQ103SamLockInMSG, COM_MQ103_TxtReplace_QuestName_SamCoe)
  SamREF.EvaluatePackage(False)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  If FC01.GetStageDone(2000)
    Self.SetStage(225)
  ElseIf FC01.GetStageDone(110)
    Self.SetStage(220)
  EndIf
EndFunction

Function Fragment_Stage_0220_Item_00()
  MQ103_04a_GalBankLockedScene.Start()
  Self.SetObjectiveDisplayed(40, False, False)
  Self.SetObjectiveDisplayed(45, True, False)
EndFunction

Function Fragment_Stage_0220_Item_01()
  Alias_SetStage300Trigger.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Self.SetStage(240)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(45, True)
  Self.SetObjectiveDisplayed(40, True, True)
  MQ103_04b_GalBankOpenScene.Start()
  Self.SetStage(240)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Alias_GalBankVaultDoor.GetRef().Unlock(False)
  Alias_SetStage300Trigger.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  MQ103_04_GalBankVaultScene.Start()
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Game.GetPlayer().additem(MQ103CoeVaultKey as Form, 1, False)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(55, True, False)
  MQ103_04_GalBankVaultScene.Stop()
  CoeEstateFirstFloorDoorREF.Lock(False, False, True)
  CoeEstateBalconyDoorREF.Lock(False, False, True)
  CoeEstateFrontDoorREF.Lock(False, False, True)
  CoeEstateFirstFloorDoorTwo.Lock(False, False, True)
  Game.GetPlayer().AddToFaction(CoeEstateDoorFaction)
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetObjectiveCompleted(55, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Alias_SolomonMaps.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_SamCoe.GetRef().RemoveKeyword(TeammateReadyWeapon_DO)
  MQ103_06_CoeEstateIntroScene.Start()
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
  OfficeDoorREF.SetOpen(False)
  OfficeDoorREF.Lock(True, False, True)
  OfficeDoorREF.BlockActivation(True, True)
  Self.SetStage(330)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Alias_JacobCoe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
  Alias_SamCoe.GetRef().AddKeyword(TeammateReadyWeapon_DO)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
  Self.SetObjectiveDisplayedAtTop(80)
  Self.SetObjectiveDisplayed(85, True, False)
  Self.SetObjectiveDisplayed(90, True, False)
  Self.SetObjectiveDisplayed(95, True, False)
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(CoraCoeREF)
  PassengersRefColl.RemoveRef(CoraCoeREF as ObjectReference)
  DisembarkingCrew.RemoveRef(CoraCoeREF as ObjectReference)
  CoraCoeREF.EvaluatePackage(False)
  CoraCoeREF.MoveTo(MQ103_CoraSpaceportReadingMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveFailed(85, True)
EndFunction

Function Fragment_Stage_0460_Item_00()
  Alias_SolomonMaps.GetRef().SetFactionOwner(PlayerFaction, False)
  Game.GetPlayer().additem(MQ103JacobOfficeKey as Form, 1, False)
  Self.SetObjectiveCompleted(85, True)
  Self.SetObjectiveDisplayed(80, True, True)
  Self.SetObjectiveDisplayed(90, False, False)
  Self.SetObjectiveDisplayed(95, False, False)
  Alias_JacobCoe.GetActorRef().EvaluatePackage(False)
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
  OfficeDoorREF.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0470_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(80, True, True)
  Self.SetObjectiveDisplayed(85, False, False)
  Self.SetObjectiveDisplayed(95, False, False)
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
  OfficeDoorREF.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(CoraCoeREF)
  PassengersRefColl.RemoveRef(CoraCoeREF as ObjectReference)
  DisembarkingCrew.RemoveRef(CoraCoeREF as ObjectReference)
  CoraCoeREF.EvaluatePackage(False)
  Self.SetObjectiveCompleted(95, True)
EndFunction

Function Fragment_Stage_0510_Item_00()
  MQ103_12b_CoraJacobScene.Start()
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(600)
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(85, False, False)
  Self.SetObjectiveDisplayed(90, False, False)
  Self.SetObjectiveDisplayed(95, False, False)
  Self.SetObjectiveDisplayed(100, True, False)
  If MQ103_11a_JacobSamArgueScene.IsPlaying()
    MQ103_11a_JacobSamArgueScene.Stop()
    MQ103_11b_JacobSamEndScene.Start()
  EndIf
  Alias_JacobCoe.GetActorRef().EvaluatePackage(False)
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
  OfficeDoorREF.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
  Alias_LockeGangMapMarker.GetRef().Enable(False)
  Alias_LockeGangMapMarker.GetRef().AddToMapScanned(False)
  LC006_LoadDoor_Ext.Lock(False, False, True)
  LC006_CaveBlocker_EnableMarker.Disable(False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  MQ103_15_LockeGangSamScene.Start()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0710_Item_00()
  MQ103_16a_LockeGangEavesdrop.Start()
EndFunction

Function Fragment_Stage_0720_Item_00()
  MQ103_16b_LockeGangEavesdrop.Start()
EndFunction

Function Fragment_Stage_0800_Item_00()
  MQ103_17_ArtifactScene.Start()
EndFunction

Function Fragment_Stage_0830_Item_00()
  Quest __temp = Self as Quest
  mq103script kmyQuest = __temp as mq103script
  Alias_ArtifactActivator.GetRef().Disable(False)
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(4, MQ103ArtifactSpawnMarker)
  Alias_MQ103ArtifactQuestObject.ForceRefTo(ArtifactREF)
  ArtifactREF.Enable(False)
  Game.GetPlayer().additem(ArtifactREF as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(4)
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(CoraCoeREF)
  kmyQuest.MQ103EnableLayer = inputenablelayer.Create()
  kmyQuest.MQ103EnableLayer.EnableFastTravel(False)
  ArmillaryMountSwapEnableMarker.Disable(False)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.AddToFaction(MQ103LockeGangFaction)
  Alias_LockeGangInteriorNPCs.KillAll(None)
  PlayerREF.StopCombatAlarm()
  MQ103LockeEnableMarkerREF.Enable(False)
  MQ103LockeGangExteriorEnableMarker.Disable(False)
  MQ103_18_AftermathScene.Start()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(125, True, False)
EndFunction

Function Fragment_Stage_0910_Item_00()
  Quest __temp = Self as Quest
  mq103script kmyQuest = __temp as mq103script
  Game.GetPlayer().StopCombatAlarm()
  MQ103_19_AmbushScene.Start()
  Self.SetObjectiveCompleted(125, True)
  If !Self.GetStageDone(985)
    Self.SetObjectiveDisplayed(127, True, False)
    Self.SetObjectiveDisplayedAtTop(127)
  EndIf
  kmyQuest.MQ103EnableLayer.EnableFastTravel(True)
  kmyQuest.MQ103EnableLayer = None
EndFunction

Function Fragment_Stage_0920_Item_00()
  Actor LockeREF = Alias_Locke.GetActorRef()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.RemoveFromFaction(MQ103LockeGangFaction)
  LockeREF.AddToFaction(PlayerEnemyFaction)
  LockeREF.SetValue(Aggression, 1.0)
  Alias_LockeBodyguard.AddToFaction(PlayerEnemyFaction)
  Alias_LockeBodyguard.SetValue(Aggression, 1.0)
  If !Self.GetStageDone(950)
    Self.SetObjectiveCompleted(125, True)
    If !Self.GetStageDone(985)
      Self.SetObjectiveDisplayed(127, True, False)
      Self.SetObjectiveDisplayedAtTop(127)
    EndIf
    Self.SetStageNoWait(925)
  EndIf
  Self.SetObjectiveDisplayed(129, False, False)
EndFunction

Function Fragment_Stage_0925_Item_00()
  Utility.Wait(5.0)
  MQ103AshtaEnableMarker.Enable(False)
  Alias_AshtaALL.SetValue(Aggression, 2.0)
  MQ103_19b_AshtaScene.Start()
  Self.SetStage(955)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(985)
  MQ103AshtaEnableMarker.Enable(False)
  Alias_AshtaALL.SetValue(Aggression, 2.0)
  MQ103_19b_AshtaScene.Start()
EndFunction

Function Fragment_Stage_0955_Item_00()
  Self.SetObjectiveDisplayed(128, True, False)
  Alias_Locke.GetActorRef().EvaluatePackage(False)
  Alias_LockeBodyguard.EvaluateAll()
EndFunction

Function Fragment_Stage_0956_Item_00()
  Self.SetObjectiveCompleted(128, True)
  If Self.GetStageDone(950) && !Self.GetStageDone(960)
    Self.SetObjectiveDisplayed(129, True, False)
  EndIf
  Alias_LockeBodyguard.EvaluateAll()
  Alias_Locke.GetActorRef().EvaluatePackage(False)
  Alias_LockeAshtaScreammer.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0957_Item_00()
  Self.SetObjectiveCompleted(129, True)
  Game.GetPlayer().additem(LL_Weapon_Razorback_Upgraded as Form, 1, False)
EndFunction

Function Fragment_Stage_0960_Item_00()
  Self.SetStage(985)
  Self.SetObjectiveDisplayed(129, False, False)
EndFunction

Function Fragment_Stage_0985_Item_00()
  Self.SetObjectiveCompleted(125, True)
  Self.SetObjectiveCompleted(127, True)
  Self.SetObjectiveDisplayed(130, True, False)
EndFunction

Function Fragment_Stage_0987_Item_00()
  MQ103_20_SmugglerAfterScene.Start()
EndFunction

Function Fragment_Stage_0990_Item_00()
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(CoraCoeREF)
  DisembarkingCrew.RemoveRef(CoraCoeREF as ObjectReference)
  PassengersRefColl.RemoveRef(CoraCoeREF as ObjectReference)
  CoraCoeREF.EvaluatePackage(False)
  Actor SamREF = Alias_SamCoe.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleInActive(SamREF, False, False, True)
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, False, MQ103SamLockInMidquestOverMSG, None)
  DisembarkingCrew.RemoveRef(SamREF as ObjectReference)
  PassengersRefColl.RemoveRef(SamREF as ObjectReference)
  Int iFailSafe = 0
  While iFailSafe < 15 && (SQ_PlayerShip as sq_playershipscript).DisembarkingCrew.Find(SamREF as ObjectReference) < 0 && (SQ_PlayerShip as sq_playershipscript).DismissedCrew.Find(SamREF as ObjectReference) < 0
    Utility.Wait(1.0)
    iFailSafe += 1
  EndWhile
  (SQ_PlayerShip as sq_playershipscript).DisembarkingCrew.RemoveRef(SamREF as ObjectReference)
  (SQ_PlayerShip as sq_playershipscript).DismissedCrew.RemoveRef(SamREF as ObjectReference)
  SamREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0995_Item_00()
  MQ103_21a_LodgeMoveScene.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_ArtifactCollection.GetRef().EnableNoWait(False)
  MQ103_21a_LodgeMoveScene.Stop()
  MQ103_21_LodgeScene.Start()
  Self.SetObjectiveCompleted(130, True)
  Self.SetObjectiveDisplayed(140, True, False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  MQ103_21_LodgeScene.Stop()
  MQ103_22_EndScene.Start()
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_1110_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(160, True, False)
EndFunction

Function Fragment_Stage_1120_Item_00()
  Actor SamREF = Alias_SamCoe.GetActorRef()
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, False, MQ103SamLockInOverMSG, None)
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(SamREF, True)
  (SQ_Companions as sq_companionsscript).SetRoleActive(SamREF, True, True, 0.0, 0.0)
  (SamREF as companionactorscript).AllowStoryGatesAndRestartTimer()
  SamREF.EvaluatePackage(False)
  Self.SetStage(2000)
EndFunction

Function Fragment_Stage_1130_Item_00()
  Actor SamREF = Alias_SamCoe.GetActorRef()
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, False, MQ103SamLockInOverMSG, None)
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(SamREF, True)
  (SamREF as companionactorscript).AllowStoryGatesAndRestartTimer()
  Self.SetStage(2000)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  mq103script kmyQuest = __temp as mq103script
  Self.CompleteAllObjectives()
  Actor PlayerREF = Game.GetPlayer()
  If MQ104A.GetStageDone(1000) && MQ104B.GetStageDone(1000)
    MQ105.SetStage(10)
  EndIf
  MQ103LockeGangExteriorEnableMarker.Enable(False)
  PlayerREF.RemoveFromFaction(MQ103LockeGangFaction)
  ObjectReference SamREF = Alias_SamCoe.GetRef()
  If !SamREF.HasKeyword(TeammateReadyWeapon_DO)
    SamREF.AddKeyword(TeammateReadyWeapon_DO)
  EndIf
  kmyQuest.MQ103EnableLayer.Delete()
  Self.Stop()
EndFunction
