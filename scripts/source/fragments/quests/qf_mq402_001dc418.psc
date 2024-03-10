ScriptName Fragments:Quests:QF_MQ402_001DC418 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker03 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker04 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker06 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker05 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker03 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker06 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker05 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker04 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker02 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker03 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker04 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker05 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker06 Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
Quest Property MQ302 Auto Const mandatory
ReferenceAlias Property Alias_Scorpius Auto Const mandatory
ReferenceAlias Property Alias_Helix Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Scene Property MQ402_003_HunterEmissary Auto Const mandatory
GlobalVariable Property MQ_EmissaryRandom Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
Quest Property MQ_TempleQuest_01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator03 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator04 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator05 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator06 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArmillary Auto Const mandatory
ObjectReference Property LC165_Adversary01ShipStartMarker Auto Const mandatory
ObjectReference Property LC165_Adversary02ShipStartMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_Starborn02 Auto Const mandatory
ReferenceAlias Property Alias_Starborn04 Auto Const mandatory
ReferenceAlias Property Alias_Starborn06 Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker04 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker06 Auto Const mandatory
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  MQAlllowArmillaryGravDrive.SetValueInt(1)
  MQ_EmissaryRandom.SetValueInt(1)
  MQ_EmissaryRevealed.SetValueInt(1)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(0)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(1)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(2)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ_TempleQuest_01.Start()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(110, True, False)
  Self.SetObjectiveDisplayed(120, True, False)
  Self.SetObjectiveDisplayed(130, True, False)
  Self.SetObjectiveDisplayed(140, True, False)
  Self.SetObjectiveDisplayed(150, True, False)
  Self.SetObjectiveDisplayed(160, True, False)
  Self.SetObjectiveDisplayed(170, True, False)
  Self.SetObjectiveDisplayed(180, True, False)
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(5, Alias_ArtifactActivator01.GetRef())
  Alias_ArtifactActivator01.ForceRefTo(ArtifactActivator01REF)
  ArtifactActivator01REF.EnableNoWait(False)
  ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(6, Alias_ArtifactActivator02.GetRef())
  Alias_ArtifactActivator02.ForceRefTo(ArtifactActivator02REF)
  ArtifactActivator02REF.EnableNoWait(False)
  ObjectReference ArtifactActivator03REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(8, Alias_ArtifactActivator03.GetRef())
  Alias_ArtifactActivator03.ForceRefTo(ArtifactActivator03REF)
  ArtifactActivator03REF.EnableNoWait(False)
  ObjectReference ArtifactActivator04REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(9, Alias_ArtifactActivator04.GetRef())
  Alias_ArtifactActivator04.ForceRefTo(ArtifactActivator04REF)
  ArtifactActivator04REF.EnableNoWait(False)
  ObjectReference ArtifactActivator05REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(11, Alias_ArtifactActivator05.GetRef())
  Alias_ArtifactActivator05.ForceRefTo(ArtifactActivator05REF)
  ArtifactActivator05REF.EnableNoWait(False)
  ObjectReference ArtifactActivator06REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(12, Alias_ArtifactActivator06.GetRef())
  Alias_ArtifactActivator06.ForceRefTo(ArtifactActivator06REF)
  ArtifactActivator06REF.EnableNoWait(False)
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False)
  Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait(False)
  Alias_OpenCaveEnableMarker03.GetRef().EnableNoWait(False)
  Alias_OpenCaveEnableMarker04.GetRef().EnableNoWait(False)
  Alias_OpenCaveEnableMarker05.GetRef().EnableNoWait(False)
  Alias_OpenCaveEnableMarker06.GetRef().EnableNoWait(False)
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False)
  Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait(False)
  Alias_ClosedCaveEnableMarker03.GetRef().DisableNoWait(False)
  Alias_ClosedCaveEnableMarker04.GetRef().DisableNoWait(False)
  Alias_ClosedCaveEnableMarker05.GetRef().DisableNoWait(False)
  Alias_ClosedCaveEnableMarker06.GetRef().DisableNoWait(False)
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()
  ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef()
  ObjectReference MapMarker03REF = Alias_MapMarker02.GetRef()
  ObjectReference MapMarker04REF = Alias_MapMarker02.GetRef()
  ObjectReference MapMarker05REF = Alias_MapMarker02.GetRef()
  ObjectReference MapMarker06REF = Alias_MapMarker02.GetRef()
  MapMarker01REF.AddToMapScanned(True)
  MapMarker01REF.SetMarkerVisibleOnStarMap(True)
  MapMarker01REF.SetRequiresScanning(False)
  MapMarker02REF.AddToMapScanned(True)
  MapMarker02REF.SetMarkerVisibleOnStarMap(True)
  MapMarker02REF.SetRequiresScanning(False)
  MapMarker03REF.AddToMapScanned(True)
  MapMarker03REF.SetMarkerVisibleOnStarMap(True)
  MapMarker03REF.SetRequiresScanning(False)
  MapMarker04REF.AddToMapScanned(True)
  MapMarker04REF.SetMarkerVisibleOnStarMap(True)
  MapMarker04REF.SetRequiresScanning(False)
  MapMarker05REF.AddToMapScanned(True)
  MapMarker05REF.SetMarkerVisibleOnStarMap(True)
  MapMarker05REF.SetRequiresScanning(False)
  MapMarker06REF.AddToMapScanned(True)
  MapMarker06REF.SetMarkerVisibleOnStarMap(True)
  MapMarker06REF.SetRequiresScanning(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(110, True)
  If Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True
    Self.SetStage(500)
  EndIf
  ObjectReference ArtifactREF01 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(5, MQHoldingCellCenterMarker)
  ArtifactREF01.Enable(False)
  Game.GetPlayer().additem(ArtifactREF01 as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(5)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(120, True)
  If Self.GetStageDone(110) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True
    Self.SetStage(500)
  EndIf
  ObjectReference ArtifactREF02 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(6, MQHoldingCellCenterMarker)
  ArtifactREF02.Enable(False)
  Game.GetPlayer().additem(ArtifactREF02 as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(6)
EndFunction

Function Fragment_Stage_0122_Item_00()
  Actor Starborn02REF = Alias_Starborn02.GetActorRef()
  Starborn02REF.Enable(False)
  Starborn02REF.moveto(Alias_ArtifactRoomSpawnMarker02.GetRef(), 0.0, 0.0, 0.0, True, False)
  MUSGenesisStingerStarbornAppearB.Add()
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(130, True)
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True
    Self.SetStage(500)
  EndIf
  ObjectReference ArtifactREF03 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(8, MQHoldingCellCenterMarker)
  ArtifactREF03.Enable(False)
  Game.GetPlayer().additem(ArtifactREF03 as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(8)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(140, True)
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True
    Self.SetStage(500)
  EndIf
  ObjectReference ArtifactREF04 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(9, MQHoldingCellCenterMarker)
  ArtifactREF04.Enable(False)
  Game.GetPlayer().additem(ArtifactREF04 as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(9)
EndFunction

Function Fragment_Stage_0142_Item_00()
  Actor Starborn04REF = Alias_Starborn04.GetActorRef()
  Starborn04REF.Enable(False)
  Starborn04REF.moveto(Alias_ArtifactRoomSpawnMarker04.GetRef(), 0.0, 0.0, 0.0, True, False)
  MUSGenesisStingerStarbornAppearB.Add()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(150, True)
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(160) == True
    Self.SetStage(500)
  EndIf
  ObjectReference ArtifactREF05 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(11, MQHoldingCellCenterMarker)
  ArtifactREF05.Enable(False)
  Game.GetPlayer().additem(ArtifactREF05 as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(11)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(160, True)
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True
    Self.SetStage(500)
  EndIf
  ObjectReference ArtifactREF06 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(12, MQHoldingCellCenterMarker)
  ArtifactREF06.Enable(False)
  Game.GetPlayer().additem(ArtifactREF06 as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(12)
EndFunction

Function Fragment_Stage_0162_Item_00()
  Actor Starborn06REF = Alias_Starborn06.GetActorRef()
  Starborn06REF.Enable(False)
  Starborn06REF.moveto(Alias_ArtifactRoomSpawnMarker06.GetRef(), 0.0, 0.0, 0.0, True, False)
  MUSGenesisStingerStarbornAppearB.Add()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  mq402script kmyQuest = __temp as mq402script
  kmyQuest.EnableLodgeActors()
  ObjectReference ArmillaryREF = Alias_LodgeArmillary.GetRef()
  ArmillaryREF.DisableNoWait(False)
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveCompleted(130, True)
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0500_Item_01()
  ObjectReference ArmillaryREF = Alias_LodgeArmillary.GetRef()
  ArmillaryREF.DisableNoWait(False)
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest
  mq402script kmyQuest = __temp as mq402script
  kmyQuest.AddLodgeArtifacts(Game.GetPlayer())
  MQ_TempleQuest_01.Start()
EndFunction

Function Fragment_Stage_0600_Item_00()
  spaceshipreference HunterShipREF = Alias_Scorpius.GetShipReference()
  spaceshipreference EmissaryShipREF = Alias_Helix.GetShipReference()
  HunterShipREF.Enable(False)
  EmissaryShipREF.Enable(False)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(610, True, False)
  MQ402_003_HunterEmissary.Start()
EndFunction

Function Fragment_Stage_0620_Item_00()
  MQ302b.SetStage(20)
  MQ302_SidedWithChoice.SetValueInt(0)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0630_Item_00()
  MQ302b.SetStage(21)
  MQ302_SidedWithChoice.SetValueInt(1)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0640_Item_00()
  MQ302b.SetStage(22)
  MQ302_SidedWithChoice.SetValueInt(2)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  spaceshipreference HunterShipREF = Alias_Scorpius.GetShipReference()
  spaceshipreference EmissaryShipREF = Alias_Helix.GetShipReference()
  HunterShipREF.DisableWithGravJump()
  EmissaryShipREF.DisableWithGravJump()
  HunterShipREF.moveto(LC165_Adversary01ShipStartMarker, 0.0, 0.0, 0.0, True, False)
  EmissaryShipREF.moveto(LC165_Adversary02ShipStartMarkerRef, 0.0, 0.0, 0.0, True, False)
  HunterShipREF.EvaluatePackage(False)
  EmissaryShipREF.EvaluatePackage(False)
  HunterShipREF.Enable(False)
  EmissaryShipREF.Enable(False)
  Self.CompleteAllObjectives()
  MQ302.SetStage(15)
  Self.Stop()
EndFunction
