ScriptName Fragments:Quests:QF_MQ104_000160A9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Scene Property MQ104_002_ReturnScene Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property MQ104AStart Auto Const mandatory
ReferenceAlias Property Alias_TEMPSarahMorgan Auto Const mandatory
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
ReferenceAlias Property Alias_Noel Auto Const mandatory
ReferenceAlias Property Alias_MatteoKhatri Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Artifact01QuestObject Auto Const mandatory
ReferenceAlias Property Alias_Artifact02QuestObject Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker02 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory
ObjectReference Property MQ104AArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ104AArtifactSpawnMarker02 Auto Const mandatory
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
ReferenceAlias Property Alias_AndrejaMarker Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
Message Property MQ104APowerTutorialMSG Auto Const mandatory
Spell Property AntiGravityFieldSpell Auto Const mandatory
Spell Property GrantSpellAntiGravityFieldSpell Auto Const mandatory
Quest Property MQ_TempleQuest_MQ104A Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Quest Property MQ_TempleQuest_01 Auto Const mandatory
GlobalVariable Property MQ_TurnOnTemples Auto Const mandatory
Scene Property COM_Andreja_Story_IntroScene01 Auto Const mandatory
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_AndrejaArtifactMarker Auto Const mandatory
Scene Property COM_Andreja_Story_IntroScene02 Auto Const mandatory
ObjectReference Property MQ_LodgeEntranceMoveMarker Auto Const mandatory
Scene Property MQ104A_002a_AndrejaScene Auto Const mandatory
Scene Property MQ104A_002b_ArtifactScene Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Artifact01Activator Auto Const mandatory
ReferenceAlias Property Alias_Artifact02Activator Auto Const mandatory
ReferenceAlias Property Alias_AndrejaIntroMarker Auto Const mandatory
ReferenceAlias Property Alias_VaruunZealot Auto Const mandatory
ReferenceAlias Property Alias_RadiantLocation02EnableMarker Auto Const mandatory
Spell Property ArtifactPowerAntiGravityField_Spell Auto Const mandatory
Scene Property MQ104A_008b_TempleCompanionReaction Auto Const mandatory
Faction Property ConstellationFaction Auto Const mandatory
GlobalVariable Property COM_PQ_LockedInCompanion Auto Const mandatory
Quest Property COM_Companion_Andreja Auto Const mandatory
GlobalVariable Property MQ104_BlockStarbornPowerTopicDialogue Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_MQ104A Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_MQ104A_Cooldown Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
Scene Property MQ104A_011b_PowerReaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ102.SetStage(1150)
  MQ101.SetStage(1810)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4)
  Game.GetPlayer().moveto(MQ104AStart, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().addtoFaction(ConstellationFaction)
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor SarahMorganREF = Alias_TEMPSarahMorgan.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0)
  SarahMorganREF.EvaluatePackage(False)
  MQ_TempleQuest_MQ104A.SetStage(10)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3)
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4)
  Utility.Wait(0.5)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(300)
  Self.SetObjectiveCompleted(50, True)
  Game.GetPlayer().addtoFaction(ConstellationFaction)
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(0)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(1)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(2)
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  AndrejaREF.SetGhost(True)
  AndrejaREF.moveto(Alias_AndrejaIntroMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_MatteoKhatri.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(12, True, False)
  Self.SetObjectiveDisplayed(22, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False)
  Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait(False)
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False)
  Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait(False)
  Alias_RadiantLocation02EnableMarker.GetRef().Disable(False)
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()
  ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef()
  MapMarker01REF.AddtoMap(True)
  MapMarker01REF.SetMarkerVisibleOnStarMap(True)
  MapMarker01REF.SetRequiresScanning(False)
  MapMarker02REF.AddtoMap(True)
  MapMarker02REF.SetMarkerVisibleOnStarMap(True)
  MapMarker02REF.SetRequiresScanning(False)
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(5, Alias_Artifact01Activator.GetRef())
  Alias_Artifact01Activator.ForceRefTo(ArtifactActivator01REF)
  ArtifactActivator01REF.EnableNoWait(False)
  ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(6, Alias_Artifact02Activator.GetRef())
  Alias_Artifact02Activator.ForceRefTo(ArtifactActivator02REF)
  ArtifactActivator02REF.EnableNoWait(False)
EndFunction

Function Fragment_Stage_0022_Item_00()
  Self.SetObjectiveCompleted(12, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If Self.GetStageDone(40) == True && Self.GetStageDone(50) == True
    Self.SetStage(60)
  EndIf
  ObjectReference Artifact01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(5, MQ104AArtifactSpawnMarker01)
  Alias_Artifact01QuestObject.ForceRefTo(Artifact01REF)
  Artifact01REF.Enable(False)
  Game.GetPlayer().additem(Artifact01REF as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(5)
EndFunction

Function Fragment_Stage_0032_Item_00()
  Self.SetObjectiveCompleted(22, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  COM_Companion_Andreja.SetStage(50)
  Self.SetStage(50)
  Self.SetObjectiveCompleted(30, True)
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Self.SetObjectiveDisplayed(45, True, False)
  Game.GetPlayer().StopCombatAlarm()
  AndrejaREF.moveto(Alias_AndrejaArtifactMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  AndrejaREF.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
  (SQ_Followers as sq_followersscript).SetRoleInActive(AndrejaREF, True, False, True)
  AndrejaREF.EvaluatePackage(False)
  COM_Andreja_Story_IntroScene02.Start()
  If Self.GetStageDone(30) == True && Self.GetStageDone(50) == True
    Self.SetStage(60)
  EndIf
  ObjectReference Artifact02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(6, MQ104AArtifactSpawnMarker02)
  Alias_Artifact02QuestObject.ForceRefTo(Artifact02REF)
  Artifact02REF.Enable(False)
  Game.GetPlayer().additem(Artifact02REF as Form, 1, False)
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(6)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_VaruunZealot.GetActorRef().Kill(None)
  Game.GetPlayer().StopCombatAlarm()
  Alias_Andreja.GetActorRef().StopCombatAlarm()
  COM_Andreja_Story_IntroScene01.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(20)
  Self.SetStage(32)
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  AndrejaREF.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
  (SQ_Followers as sq_followersscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0)
  AndrejaREF.EvaluatePackage(False)
  AndrejaREF.SetGhost(False)
  Self.SetObjectiveCompleted(40, True)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  ArmillaryMountSwapEnableMarker.DisableNoWait(False)
  Actor MatteoKhatriREF = Alias_MatteoKhatri.GetActorRef()
  MatteoKhatriREF.Disable(False)
  MatteoKhatriREF.EvaluatePackage(False)
  MatteoKhatriREF.Enable(False)
  Alias_Noel.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  AndrejaREF.Disable(False)
  AndrejaREF.moveto(MQ_LodgeEntranceMoveMarker, 0.0, 0.0, 0.0, True, False)
  AndrejaREF.EvaluatePackage(False)
  AndrejaREF.Enable(False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  MQ104A_002a_AndrejaScene.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ104A_002b_ArtifactScene.Start()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(55, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(AndrejaREF, True)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Self.SetStage(110)
  If COM_PQ_LockedInCompanion.GetValueInt() > -1
    kmyQuest.ShowHelpMessage("CompanionBlocked")
  Else
    Actor AndrejaREF = Alias_Andreja.GetActorRef()
    (SQ_Companions as sq_companionsscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0)
    AndrejaREF.EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(55, True)
  Self.SetObjectiveDisplayed(60, True, False)
  MQ_TempleQuest_MQ104A.SetStageNoWait(10)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  mq104ascript kmyQuest = __temp as mq104ascript
  kmyQuest.TempleArrived()
EndFunction

Function Fragment_Stage_0402_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  MQ104A_008b_TempleCompanionReaction.Start()
  kmyQuest.ShowHelpMessage("ZeroG")
EndFunction

Function Fragment_Stage_0405_Item_00()
  MQ104A_008_TempleCompanionReaction.Start()
EndFunction

Function Fragment_Stage_0500_Item_00()
  MQ104A_009_TempleCompanionReaction.Start()
EndFunction

Function Fragment_Stage_0600_Item_00()
  MQ104A_010_TempleCompanionReaction.Start()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveCompleted(73, True)
  Self.SetObjectiveDisplayed(80, True, False)
  Actor VladimirREF = Alias_Vladimir.GetActorRef()
  VladimirREF.EvaluatePackage(False)
  VladimirREF.moveto(MQ106_VladimirMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0600_Item_01()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  MQ_TutorialQuest.SetStage(100)
EndFunction

Function Fragment_Stage_0600_Item_02()
  Alias_Companion.GetActorRef().SetValue(MQ104A_CompanionPresentTemple, 1.0)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_Vladimir.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0705_Item_00()
  Alias_Vladimir.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0710_Item_00()
  MQ104_BlockStarbornPowerTopicDialogue.SetValue(1.0)
  MQ104A_011b_PowerReaction.Start()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
  Alias_WalterStroud.GetActorRef().EvaluatePackage(False)
  Alias_MatteoKhatri.GetActorRef().EvaluatePackage(False)
  Actor PlayerREF = Game.GetPlayer()
  If PlayerREF.HasSpell(AntiGravityFieldSpell as Form) == False
    GrantSpellAntiGravityFieldSpell.Cast(PlayerREF as ObjectReference, PlayerREF as ObjectReference)
    MQ104APowerTutorialMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction

Function Fragment_Stage_0720_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  MQ104_BlockStarbornPowerTopicDialogue.SetValue(0.0)
  Self.CompleteAllObjectives()
  MQ_TempleQuest_01.SetStageNoWait(10)
  If MQ103.GetStageDone(2000) && MQ104B.GetStageDone(1000)
    MQ105.SetStage(10)
  EndIf
  Float currentGameTime = Utility.GetCurrentGameTime()
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue()
  Int I = 0
  While I < Alias_Companions.Length
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_MQ104A_Cooldown, cooldownTime)
    I += 1
  EndWhile
  COM_WantsToTalkEvent_MQ104A.Send(None)
  Game.AddAchievement(3)
EndFunction

Function Fragment_Stage_1010_Item_00()
  MQ104_BlockStarbornPowerTopicDialogue.SetValue(0.0)
  Alias_Vladimir.GetActorRef().MoveToMyEditorLocation()
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  AndrejaREF.SetGhost(False)
EndFunction
