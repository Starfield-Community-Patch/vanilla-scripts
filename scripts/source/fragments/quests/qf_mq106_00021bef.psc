ScriptName Fragments:Quests:QF_MQ106_00021BEF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ106_001_StarbornScene01 Auto Const mandatory
Scene Property MQ106_004_AftermathScene Auto Const mandatory
Scene Property MQ106_005_LodgeScene Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
Quest Property MQ203 Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
GlobalVariable Property MQ106_SurrenderedArtifact Auto Const mandatory
ReferenceAlias Property Alias_StarbornEmissaryShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_MQ105Artifact Auto Const mandatory
Scene Property MQ106_005b_MoveEveryoneScene Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
ReferenceAlias Property Alias_Collection Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_HelixMoveMarker Auto Const mandatory
Scene Property MQ106_004_AftermathScene_NGPlus Auto Const mandatory
ObjectReference Property MQ_LodgeEntranceMoveMarker Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppear Auto Const mandatory
Quest Property MQ_HunterPreMQ106 Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_VladimirSall Auto Const mandatory
ObjectReference Property MQ106VladimirFurnitureREF Auto Const mandatory
ReferenceAlias Property Alias_VoliiGuardShip01 Auto Const mandatory
ReferenceAlias Property Alias_VoliiGuardShip02 Auto Const mandatory
ReferenceAlias Property Alias_LodgeDisplay Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
Perk Property MQ106HelixReduceDamage Auto Const mandatory
Location Property VoliiStationLocation Auto Const mandatory
Keyword Property SQ_TrafficManagerHeavy_LocType Auto Const mandatory
ObjectReference Property VoliiAlphaTrafficManagerREF Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_MQ106 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_MQ106_Cooldown Auto Const mandatory
Scene Property MQ106_006_LodgeScene Auto Const mandatory
Quest Property MQ00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  MQ102.Stop()
  MQ105.SetStage(920)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6)
  Alias_Barrett.GetActorRef().Enable(False)
  Alias_Barrett.GetActorRef().moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False)
  Alias_WalterStroud.GetActorRef().moveto(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Actor WalterStroudREF = Alias_WalterStroud.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(WalterStroudREF)
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
  Self.SetStage(200)
  Alias_Barrett.GetActorRef().Enable(False)
  Alias_Barrett.GetActorRef().moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(220)
  Self.SetStage(230)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  mq106script kmyQuest = __temp as mq106script
  Game.SetInChargen(True, False, False)
  kmyQuest.MQ106EnableLayer = inputenablelayer.Create()
  kmyQuest.MQ106EnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
  kmyQuest.MQ106EnableLayer.EnableFastTravel(False)
  kmyQuest.MQ106EnableLayer.EnableGravJump(False)
  kmyQuest.MQ106EnableLayer.EnableFarTravel(False)
  spaceshipreference HelixREF = Alias_StarbornEmissaryShip.GetShipRef()
  spaceshipreference PlayerShipREF = Alias_playerShip.GetShipRef()
  HelixREF.Reset(None)
  HelixREF.MoveNear(PlayerShipREF as ObjectReference, 1, 0, 0)
  HelixREF.SetGhost(True)
  HelixREF.EnableWithGravJump()
  MQ_HunterPreMQ106.SetStageNoWait(1000)
  MQ106_001_StarbornScene01.Start()
  MUSGenesisStingerStarbornAppear.Add()
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ105.SetStage(2000)
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(10, True)
  spaceshipreference EmissaryShipREF = Alias_StarbornEmissaryShip.GetShipReference()
  EmissaryShipREF.DisableWithGravJump()
  EmissaryShipREF.SetGhost(False)
  Utility.Wait(3.0)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  mq106script kmyQuest = __temp as mq106script
  Game.SetInChargen(False, False, False)
  kmyQuest.MQ106EnableLayer.EnableFastTravel(True)
  kmyQuest.MQ106EnableLayer.EnableGravJump(True)
  kmyQuest.MQ106EnableLayer.EnableFarTravel(False)
  kmyQuest.MQ106EnableLayer = None
  (MQ105 as mq105script).MQ105EnableLayer = None
  MQ105.SetStageNoWait(1100)
  Self.SetObjectiveDisplayed(10, False, False)
  Self.SetObjectiveDisplayed(20, False, False)
  Self.SetObjectiveDisplayed(25, True, False)
  spaceshipreference StarbornShipREF = Alias_StarbornEmissaryShip.GetShipReference()
  StarbornShipREF.SetGhost(False)
  StarbornShipREF.AddPerk(MQ106HelixReduceDamage, False)
  Utility.Wait(5.0)
  StarbornShipREF.AddtoFaction(PlayerEnemyFaction)
  StarbornShipREF.StartCombat(Alias_playerShip.GetShipReference(), False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  mq106script kmyQuest = __temp as mq106script
  kmyQuest.MQ106EnableLayer = None
  (MQ105 as mq105script).MQ105EnableLayer = None
  MQ105.SetStageNoWait(1100)
  Self.SetObjectiveCompleted(10, True)
  Game.GetPlayer().removeitem(Alias_MQ105Artifact.GetRef() as Form, 1, False, None)
  MQ106_SurrenderedArtifact.SetValueInt(1)
  spaceshipreference EmissaryShipREF = Alias_StarbornEmissaryShip.GetShipReference()
  EmissaryShipREF.SetGhost(False)
  EmissaryShipREF.DisableWithGravJump()
  Utility.Wait(3.0)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_StarbornEmissaryShip.GetShipRef().DisableWithGravJump()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  mq106script kmyQuest = __temp as mq106script
  spaceshipreference HelixREF = Alias_StarbornEmissaryShip.GetShipRef()
  HelixREF.SetGhost(False)
  HelixREF.DisableNoWait(False)
  Game.SetInChargen(False, False, False)
  kmyQuest.MQ106EnableLayer.EnableFastTravel(True)
  kmyQuest.MQ106EnableLayer.EnableGravJump(True)
  kmyQuest.MQ106EnableLayer.EnableFarTravel(True)
  kmyQuest.MQ106EnableLayer = None
  (MQ105 as mq105script).MQ105EnableLayer = None
  MQ105.SetStageNoWait(1100)
  Alias_VoliiGuardShip01.GetRef().EnableNoWait(False)
  Alias_VoliiGuardShip02.GetRef().EnableNoWait(False)
  VoliiAlphaTrafficManagerREF.EnableNoWait(False)
  If Self.GetStageDone(90)
    MQ106_004_AftermathScene_NGPlus.Start()
  Else
    MQ106_004_AftermathScene.Start()
    Self.SetObjectiveCompleted(10, True)
    Self.SetObjectiveCompleted(20, True)
    Self.SetObjectiveCompleted(25, True)
    Self.SetObjectiveDisplayed(30, True, False)
  EndIf
  ArmillaryMountSwapEnableMarker.DisableNoWait(False)
  Actor VladimirREF = Alias_VladimirSall.GetActorRef()
  VladimirREF.Disable(False)
  VladimirREF.moveto(MQ106VladimirFurnitureREF, 0.0, 0.0, 0.0, True, False)
  VladimirREF.Enable(False)
  MUSGenesisStingerStarbornAppear.Remove()
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Actor NoelREF = Alias_Noel.GetActorRef()
  NoelREF.Disable(False)
  NoelREF.EvaluatePackage(False)
  NoelREF.Enable(False)
  NoelREF.MovetoPackageLocation()
EndFunction

Function Fragment_Stage_0220_Item_00()
  Actor WalterStroudREF = Alias_WalterStroud.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(WalterStroudREF)
  WalterStroudREF.moveto(MQ_LodgeEntranceMoveMarker, 0.0, 0.0, 0.0, True, False)
  WalterStroudREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Actor WalterStroudREF = Alias_WalterStroud.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(WalterStroudREF)
  WalterStroudREF.moveto(MQ_LodgeEntranceMoveMarker, 0.0, 0.0, 0.0, True, False)
  WalterStroudREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  MQ106_005b_MoveEveryoneScene.Start()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0302_Item_00()
  If !MQ106_006_LodgeScene.IsPlaying()
    MQ106_006_LodgeScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0305_Item_00()
  Alias_LodgeDisplay.GetRef().PlayAnimation("Play01")
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(45, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(110) == False
    Self.SetStage(505)
  Else
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0505_Item_00()
  Self.SetObjectiveCompleted(45, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  mq106script kmyQuest = __temp as mq106script
  Self.CompleteAllObjectives()
  MQ201.SetStageNoWait(10)
  kmyQuest.MQ106EnableLayer = None
  Float currentGameTime = Utility.GetCurrentGameTime()
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue()
  Int I = 0
  While I < Alias_Companions.Length
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_MQ106_Cooldown, cooldownTime)
    I += 1
  EndWhile
  COM_WantsToTalkEvent_MQ106.Send(None)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  MUSGenesisStingerStarbornAppear.Remove()
  Alias_VoliiGuardShip01.GetRef().Enable(False)
  Alias_VoliiGuardShip02.GetRef().Enable(False)
  spaceshipreference HelixREF = Alias_StarbornEmissaryShip.GetShipRef()
  HelixREF.SetGhost(False)
  HelixREF.RemovePerk(MQ106HelixReduceDamage)
  HelixREF.DisableNoWait(False)
  (MQ00 as mq00questscript).StartMQ201FailsafeTimer()
EndFunction
