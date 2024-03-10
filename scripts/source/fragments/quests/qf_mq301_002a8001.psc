ScriptName Fragments:Quests:QF_MQ301_002A8001 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ301StartMarker Auto Const mandatory
Key Property MQ301MoonBaseKey Auto Const mandatory
Scene Property MQ301_001_LaunchScene Auto Const mandatory
ReferenceAlias Property Alias_MoonTransmitter Auto Const mandatory
Scene Property MQ301_002_CompanionReaction Auto Const mandatory
Scene Property MQ301_003_CompanionReaction_TruthAboutEarth Auto Const mandatory
ObjectReference Property MQ301ExtNASAMarker Auto Const mandatory
ObjectReference Property MQ301InteriorNASAMarker Auto Const mandatory
Quest Property MQ302 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ReferenceAlias Property Alias_Artifact Auto Const mandatory
Scene Property MQ301_004_StarbornScene Auto Const mandatory
ObjectReference Property NASAMapMarkerREF Auto Const mandatory
Quest Property MQ207B Auto Const mandatory
LocationAlias Property Alias_NASALocation Auto Const mandatory
Location Property LC165BuriedTempleSpaceLocation Auto Const mandatory
Location Property LC165BuriedTempleLocation Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth10 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth09 Auto Const mandatory
Key Property MQ301NasaKey Auto Const mandatory
Key Property MQ301PrototypeKey Auto Const mandatory
ReferenceAlias Property Alias_ReleaseArtifactSwitch Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
RefCollectionAlias Property Alias_StarbornAttackers Auto Const mandatory
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ObjectReference Property MQ301EmissaryHunterMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
ReferenceAlias Property Alias_GravDriveActivator Auto Const mandatory
ReferenceAlias Property Alias_GravDriveDoor Auto Const mandatory
ReferenceAlias Property Alias_GravDriveAnimHelper Auto Const mandatory
ReferenceAlias Property Alias_MoonMapMarker Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ReferenceAlias Property Alias_GravDriveSoundMarker Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const
wwiseevent Property WwiseEvent_ShakeController_p75_p75_03 Auto Const mandatory
wwiseevent Property WwiseEvent_ShakeController_p5_p5_05 Auto Const mandatory
wwiseevent Property OE_EarthquakeSound Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False)
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False)
  Self.SetStage(130)
  Self.SetStage(132)
  Game.GetPlayer().moveto(MQ301ExtNASAMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  Self.SetStage(137)
  Game.GetPlayer().moveto(MQ301InteriorNASAMarker, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(5, True, False)
  ObjectReference MoonMapMarkerREF = Alias_MoonMapMarker.GetRef()
  MoonMapMarkerREF.Enable(False)
  MoonMapMarkerREF.AddToMapScanned(False)
  MoonMapMarkerREF.SetMarkerVisibleOnStarMap(True)
  Alias_MoonTransmitter.GetRef().Enable(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(5, True)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveDisplayed(12, True, False)
EndFunction

Function Fragment_Stage_0031_Item_00()
  Quest __temp = Self as Quest
  mq301script kmyQuest = __temp as mq301script
  kmyQuest.UpdateMoonLogCount()
EndFunction

Function Fragment_Stage_0032_Item_00()
  Quest __temp = Self as Quest
  mq301script kmyQuest = __temp as mq301script
  kmyQuest.UpdateMoonLogCount()
EndFunction

Function Fragment_Stage_0033_Item_00()
  Quest __temp = Self as Quest
  mq301script kmyQuest = __temp as mq301script
  kmyQuest.UpdateMoonLogCount()
EndFunction

Function Fragment_Stage_0034_Item_00()
  Quest __temp = Self as Quest
  mq301script kmyQuest = __temp as mq301script
  kmyQuest.UpdateMoonLogCount()
EndFunction

Function Fragment_Stage_0035_Item_00()
  Quest __temp = Self as Quest
  mq301script kmyQuest = __temp as mq301script
  kmyQuest.UpdateMoonLogCount()
EndFunction

Function Fragment_Stage_0036_Item_00()
  Quest __temp = Self as Quest
  mq301script kmyQuest = __temp as mq301script
  kmyQuest.UpdateMoonLogCount()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(12, True)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(15, True, False)
  Alias_MoonTransmitter.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  NASAMapMarkerREF.SetMarkerVisibleOnStarMap(True)
  Alias_MoonTransmitter.GetRef().BlockActivation(True, True)
  MQ301_001_LaunchScene.Start()
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(5, True)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveCompleted(15, True)
  Self.SetObjectiveDisplayed(20, True, False)
  NASAMapMarkerREF.Enable(False)
  NASAMapMarkerREF.AddToMapScanned(False)
  NASAMapMarkerREF.SetMarkerVisibleOnStarMap(True)
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False)
EndFunction

Function Fragment_Stage_0130_Item_01()
  Self.SetObjectiveDisplayed(20, True, False)
  NASAMapMarkerREF.Enable(False)
  NASAMapMarkerREF.AddToMapScanned(False)
  NASAMapMarkerREF.SetMarkerVisibleOnStarMap(True)
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0132_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(12, False, False)
  Self.SetObjectiveDisplayed(25, True, False)
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0137_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  kmyQuest.ShowHelpMessage("Flashlight")
  ObjectReference ArtifactPlacementREF = Alias_Artifact.GetRef()
  ObjectReference AttachREF = Alias_GravDriveActivator.GetRef()
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifactandAttach(13, ArtifactPlacementREF, AttachREF)
  Alias_Artifact.ForceRefTo(ArtifactREF)
  ArtifactREF.BlockActivation(True, True)
  ArtifactREF.Enable(False)
EndFunction

Function Fragment_Stage_0141_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0142_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0143_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0144_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveCompleted(70, True)
  Game.GetPlayer().additem(MQ301PrototypeKey as Form, 1, False)
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0145_Item_00()
  MQ301_003_CompanionReaction_TruthAboutEarth.Start()
EndFunction

Function Fragment_Stage_0147_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("ZeroG")
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
  Alias_Artifact.GetRef().BlockActivation(False, False)
  Alias_ReleaseArtifactSwitch.GetRef().GetParentCell().setGravityScale(0.0)
  Alias_ReleaseArtifactSwitch.GetRef().GetParentCell().setGravityScale(1.0)
  Alias_GravDriveSoundMarker.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0170_Item_00()
  ObjectReference GravDriveDoorREF = Alias_GravDriveDoor.GetRef()
  ObjectReference GravDriveAnimHelperREF = Alias_GravDriveAnimHelper.GetRef()
  Actor PlayerREF = Game.GetPlayer()
  Bool bAnimationsPlayed = True
  If GravDriveDoorREF.PlayAnimation("Open")
    
  Else
    bAnimationsPlayed = False
  EndIf
  If GravDriveAnimHelperREF.PlayAnimation("Play01")
    
  Else
    bAnimationsPlayed = False
  EndIf
  If bAnimationsPlayed == False
    PlayerREF.additem(Alias_Artifact.GetRef() as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  AudioLogsQuest_MQ301_Earth09.Stop()
  AudioLogsQuest_MQ301_Earth10.Stop()
  MQ301_004_StarbornScene.Start()
  Actor PlayerREF = Game.GetPlayer()
  Game.ShakeCamera(None, 0.25, 5.0)
  WwiseEvent_ShakeController_p5_p5_05.Play(PlayerREF as ObjectReference, None, None)
  OE_EarthquakeSound.Play(PlayerREF as ObjectReference, None, None)
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(13)
  MQ00_ArtifactsHolder.AddRef(Alias_Artifact.GetRef())
  MQ302.SetStage(10)
  Alias_StarbornAttackers.EnableAll(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
  Actor HunterREF = Alias_Hunter.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  HunterREF.Disable(False)
  HunterREF.EvaluatePackage(False)
  HunterREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False)
  HunterREF.Enable(False)
  EmissaryREF.Disable(False)
  EmissaryREF.EvaluatePackage(False)
  EmissaryREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False)
  EmissaryREF.Enable(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If MQ207B.GetStageDone(1000)
    Self.SetStage(1000)
  Else
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllOBjectives()
  LC165BuriedTempleSpaceLocation.Reset()
  LC165BuriedTempleLocation.Reset()
  Int iChoice = MQ302_SidedWithChoice.GetValueInt()
  If iChoice == 0
    MQ302b.SetStage(20)
  ElseIf iChoice == 1
    MQ302b.SetStage(21)
  Else
    MQ302b.SetStage(22)
  EndIf
  Game.AddAchievement(9)
  Self.Stop()
EndFunction
