ScriptName Fragments:Quests:QF_MQ207B_00256B02 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ104 Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Scene Property MQ104_002_ReturnScene Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property MQ104AStart Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
ActorValue Property MQ104A_CompanionPresentTemple Auto Const mandatory
Scene Property MQ104A_008_TempleCompanionReaction Auto Const mandatory
Scene Property MQ104A_009_TempleCompanionReaction Auto Const mandatory
Scene Property MQ104A_010_TempleCompanionReaction Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
Scene Property MQ104A_012_PowerDemo Auto Const mandatory
ObjectReference Property MQ104AStartTestCell Auto Const mandatory
ObjectReference Property MQ104AVladTestMarker Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Artifact01QuestObject Auto Const mandatory
ReferenceAlias Property Alias_Artifact02QuestObject Auto Const mandatory
Quest Property MQ207C Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
Message Property TestMQ206AMSG Auto Const mandatory
ObjectReference Property MQ206C_Marker_Vladimir Auto Const mandatory
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
ObjectReference Property MQ206CArtifactSpawnMarker01 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
ObjectReference Property MQ206C_Marker_SarahBarrett Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const
Quest Property MQ301 Auto Const mandatory
ReferenceAlias Property Alias_Artifact01Activator Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Starborn01 Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
Location Property LC116NishinaResearchStationLocation Auto Const mandatory
Location Property LC116NishinaResearchStationResearchLevelLocation Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_MQ207 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker01 Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_MQ207_Cooldown Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  Alias_Vladimir.GetActorRef().moveto(MQ206C_Marker_Vladimir, 0.0, 0.0, 0.0, True, False)
  Alias_SarahMorgan.GetActorRef().moveto(MQ206C_Marker_SarahBarrett, 0.0, 0.0, 0.0, True, False)
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If ButtonPressed == 0
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference)
    Alias_SarahMorgan.GetActorRef().disable(False)
    Alias_Barrett.GetActorRef().moveto(MQ206C_Marker_SarahBarrett, 0.0, 0.0, 0.0, True, False)
  ElseIf ButtonPressed == 1
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference)
    Alias_SamCoe.GetActorRef().disable(False)
  ElseIf ButtonPressed == 2
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference)
    Alias_Andreja.GetActorRef().disable(False)
  ElseIf ButtonPressed == 3
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference)
    Alias_Barrett.GetActorRef().disable(False)
  EndIf
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(10)
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetActive(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor VladimirREF = Alias_Vladimir.GetActorRef()
  Self.SetObjectiveDisplayed(5, True, False)
  MQ204LodgeAttackClutterEnableMarker.disable(False)
  VladimirREF.disable(False)
  VladimirREF.moveto(MQ206C_Marker_Vladimir, 0.0, 0.0, 0.0, True, False)
  VladimirREF.Enable(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest
  mqcheckgravjumpquestscript kmyQuest = __temp as mqcheckgravjumpquestscript
  Self.SetObjectiveDisplayed(11, True, False)
  kmyQuest.CheckSkillsMenu()
  MQ_TutorialQuest.SetStage(210)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetObjectiveCompleted(11, True)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(5, True)
  Self.SetObjectiveDisplayed(10, True, False)
  Float currentGameTime = Utility.GetCurrentGameTime()
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue()
  Int I = 0
  While I < Alias_Companions.Length
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_MQ207_Cooldown, cooldownTime)
    I += 1
  EndWhile
  COM_WantsToTalkEvent_MQ207.Send(None)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(12, True, False)
  Self.SetObjectiveDisplayed(30, True, False)
  If Alias_playerShip.GetShipReference().GetGravJumpRange() < 21.0
    Self.SetStage(12)
  EndIf
  LC116NishinaResearchStationLocation.Reset()
  LC116NishinaResearchStationResearchLevelLocation.Reset()
  MQ207C.Start()
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False)
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False)
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()
  MapMarker01REF.AddToMapScanned(True)
  MapMarker01REF.SetMarkerVisibleOnStarMap(True)
  MapMarker01REF.SetRequiresScanning(False)
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(11, Alias_Artifact01Activator.GetRef())
  Alias_Artifact01Activator.ForceRefTo(ArtifactActivator01REF)
  ArtifactActivator01REF.EnableNoWait(False)
EndFunction

Function Fragment_Stage_0022_Item_00()
  Self.SetObjectiveCompleted(12, True)
  Self.SetObjectiveDisplayed(11, False, False)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor Starborn01REF = Alias_Starborn01.GetActorRef()
  Starborn01REF.Enable(False)
  Starborn01REF.moveto(Alias_ArtifactRoomSpawnMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  MUSGenesisStingerStarbornAppearB.add()
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If Self.GetStageDone(40) == True
    Self.SetStage(60)
  EndIf
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(11, MQ206CArtifactSpawnMarker01)
  Alias_Artifact01QuestObject.ForceRefTo(ArtifactREF)
  ArtifactREF.Enable(False)
  Game.GetPlayer().additem(ArtifactREF as Form, 1, False)
  MQ00_ArtifactsHolder.addref(ArtifactREF)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(11)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(35, True, False)
  Self.SetObjectiveDisplayed(11, False, False)
EndFunction

Function Fragment_Stage_0038_Item_00()
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0039_Item_00()
  Self.SetObjectiveDisplayed(35, False, False)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveDisplayed(40, False, False)
  Self.SetObjectiveCompleted(30, True)
  If Self.GetStageDone(30) == True
    Self.SetStage(60)
  EndIf
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  If MQ301.GetStageDone(900)
    MQ301.SetStage(1000)
  EndIf
  Self.Stop()
EndFunction
