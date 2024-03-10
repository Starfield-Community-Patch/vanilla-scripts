ScriptName Fragments:Quests:QF_MQ201_00017CE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Scene Property MQ204_002_ReturnScene Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
Quest Property MQ203 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
ObjectReference Property MQ203VladimirStartMarker Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactQuestObject01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactQuestObject02 Auto Const mandatory
ReferenceAlias Property Alias_MQ204CompanionChoice Auto Const mandatory
ObjectReference Property SarahMorganREF Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
GlobalVariable Property MQ_CompanionAtEye Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtEye Auto Const
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker02 Auto Const mandatory
ObjectReference Property MQ201ArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ201ArtifactSpawnMarker02 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
Quest Property MQ201B Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator02 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Starborn01 Auto Const mandatory
ReferenceAlias Property Alias_Starborn02 Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker02 Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory

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
  Game.GetPlayer().MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Vladimir.GetActorRef().MoveTo(MQ106_VladimirMarker01, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
  Self.SetStage(10)
  Frontier_ModularREF.MoveTo(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  MQ404.Start()
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(12, True, False)
  Self.SetObjectiveDisplayed(22, True, False)
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False)
  Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait(False)
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False)
  Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait(False)
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()
  ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef()
  MapMarker01REF.AddToMapScanned(True)
  MapMarker01REF.SetMarkerVisibleOnStarMap(True)
  MapMarker01REF.SetRequiresScanning(False)
  MapMarker02REF.AddToMapScanned(True)
  MapMarker02REF.SetMarkerVisibleOnStarMap(True)
  MapMarker02REF.SetRequiresScanning(False)
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(8, Alias_ArtifactActivator01.GetRef())
  Alias_ArtifactActivator01.ForceRefTo(ArtifactActivator01REF)
  ArtifactActivator01REF.EnableNoWait(False)
  ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(9, Alias_ArtifactActivator02.GetRef())
  Alias_ArtifactActivator02.ForceRefTo(ArtifactActivator02REF)
  ArtifactActivator02REF.EnableNoWait(False)
EndFunction

Function Fragment_Stage_0022_Item_00()
  Self.SetObjectiveCompleted(12, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0024_Item_00()
  Self.SetObjectiveCompleted(14, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor Starborn01REF = Alias_Starborn01.GetActorRef()
  Starborn01REF.Enable(False)
  Starborn01REF.MoveTo(Alias_ArtifactRoomSpawnMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  MUSGenesisStingerStarbornAppearB.Add()
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If Self.GetStageDone(40) == True
    Self.SetStage(100)
  EndIf
  ObjectReference Artifact01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(8, MQ201ArtifactSpawnMarker01)
  Alias_ArtifactQuestObject01.ForceRefTo(Artifact01REF)
  Artifact01REF.Enable(False)
  Game.GetPlayer().additem(Artifact01REF as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(8)
EndFunction

Function Fragment_Stage_0032_Item_00()
  Self.SetObjectiveCompleted(22, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0034_Item_00()
  Self.SetObjectiveCompleted(24, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Actor Starborn02REF = Alias_Starborn02.GetActorRef()
  Starborn02REF.Enable(False)
  Starborn02REF.MoveTo(Alias_ArtifactRoomSpawnMarker02.GetRef(), 0.0, 0.0, 0.0, True, False)
  MUSGenesisStingerStarbornAppearB.Add()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  If Self.GetStageDone(30) == True
    Self.SetStage(100)
  EndIf
  ObjectReference Artifact02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(9, MQ201ArtifactSpawnMarker02)
  Alias_ArtifactQuestObject02.ForceRefTo(Artifact02REF)
  Artifact02REF.Enable(False)
  Game.GetPlayer().additem(Artifact02REF as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(9)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  ArmillaryMountSwapEnableMarker.DisableNoWait(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ204_002_ReturnScene.Start()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0115_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  MQ201B.SetStageNoWait(10)
  Game.AddAchievement(5)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  Game.AddAchievement(5)
  Self.Stop()
EndFunction
