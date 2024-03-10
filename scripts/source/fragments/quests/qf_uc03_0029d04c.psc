ScriptName Fragments:Quests:QF_UC03_0029D04C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
ReferenceAlias Property Alias_Andy Auto Const mandatory
Scene Property UC03_590_HadrianRequestsPlayersHelp Auto Const mandatory
Scene Property UC03_700_CambridgeRadioScene Auto Const mandatory
Scene Property UC03_890_HadrianSpotsDevilsHQ Auto Const mandatory
Scene Property UC03_900_MarcusAndHadrian Auto Const mandatory
ObjectReference Property HadrianTeleportMarkerScene900 Auto Const mandatory
ReferenceAlias Property Alias_Marcus Auto Const mandatory
Scene Property UC03_930_MarcusInsideScene Auto Const mandatory
Scene Property UC03_970_MarcusAnalyzesSample Auto Const mandatory
Scene Property UC03_750_CambridgeWrapUp Auto Const mandatory
MiscObject Property InorgUniqueBloodstone Auto Const mandatory
Quest Property UC04 Auto Const
ObjectReference Property HadTeleportMarker01 Auto Const
ObjectReference Property DebugMarker01 Auto Const
Scene Property UC03_510_AndyHadrianLouIntro Auto Const mandatory
ObjectReference Property HadrianTeleStage500 Auto Const
ObjectReference Property DebugMarker02 Auto Const
ObjectReference Property HadTeleportMarker02 Auto Const
ObjectReference Property DebugMarker03 Auto Const
ObjectReference Property HadTeleportMarker05 Auto Const
ObjectReference Property DebugMarker05 Auto Const
LeveledItem Property TestVSWeapons Auto Const mandatory
ObjectReference Property DebugMarker07 Auto Const
ObjectReference Property DebugMarker08 Auto Const
ObjectReference Property HadrianTeleportMarker940 Auto Const
ReferenceAlias Property Alias_Oktai Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_RedDevils Auto Const mandatory
Scene Property UC03_410_AndyShoutsScene Auto Const mandatory
Scene Property UC03_420_LouAttractScene Auto Const mandatory
MiscObject Property Credits Auto Const
Scene Property UC03_510_CambridgeAttractScene Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCellSample Auto Const mandatory
Scene Property UC03_900_JakobAttractScene Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HadriansPast_Xenowarfare Auto Const mandatory
Quest Property UC03_DeepMinesQuest Auto Const mandatory
Scene Property UC03_810_CambridgeCommsScene Auto Const mandatory
Weapon Property Cutter Auto Const mandatory
ReferenceAlias Property Alias_LaserCutter Auto Const mandatory
MiscObject Property InorgUniqueHematite Auto Const mandatory
ReferenceAlias Property Alias_ThresherTrigger Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_HematiteQuestItem Auto Const mandatory
Scene Property UC03_825_Thresher_HematiteDeposited Auto Const mandatory
Scene Property UC03_830_ThresherAnalysisSequence Auto Const mandatory
ReferenceAlias Property Alias_ThresherDataTrigger Auto Const mandatory
Scene Property UC03_845_CambridgeResearchCollected Auto Const mandatory
Message Property UC03_DEBUG_TradeAuthorityVaultDoesntExist Auto Const mandatory
Key Property UC03_CydoniaUtilityKey Auto Const mandatory
ReferenceAlias Property Alias_ResearchData Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtAmount Auto Const mandatory
Key Property UC03_DeepMineDrillKey Auto Const mandatory
ReferenceAlias Property Alias_RedHQMainDoor Auto Const mandatory
ActorValue Property UC03_PlayerLearnedPickMeUpRecipe Auto Const mandatory
GlobalVariable Property UC03_Reward_OktaiFindersFee Auto Const mandatory
GlobalVariable Property UC03_Reward_OktaiFindersFee_Better Auto Const mandatory
GlobalVariable Property UC03_Result Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisCrewSpawner Auto Const mandatory
ReferenceAlias Property Alias_ResearchDataSpawn Auto Const mandatory
Key Property UC03_RedDevilsHQKey Auto Const mandatory
ObjectReference Property HadrianTeleportMarker940a Auto Const mandatory
ObjectReference Property JakobTeleportMarker943 Auto Const
Scene Property UC03_940a_HadrianLouJakobScene Auto Const mandatory
ReferenceAlias Property Alias_TriggerScene410 Auto Const mandatory
LeveledItem Property LL_Drink_Any Auto Const mandatory
ObjectReference Property JakobDisSceneMarker Auto Const
GlobalVariable Property UC_PlayerKnows_ArmisticeArchives Auto Const mandatory
GlobalVariable Property DialogueCydonia_RedEyes Auto Const mandatory
ReferenceAlias Property Alias_RedDevilsHQMapMarker Auto Const mandatory
GlobalVariable Property UC03_BloodstoneAvailable Auto Const mandatory
ObjectReference Property UC04_Percival_TeleportMarker_Stage943 Auto Const mandatory
ReferenceAlias Property Alias_Trigger943 Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
Key Property UC03_DeepMineQuickExitKey Auto Const mandatory
Scene Property UC03_891_DrillDoorActivated Auto Const mandatory
Scene Property UC03_895_DoorAccessRestored Auto Const mandatory
ReferenceAlias Property Alias_DrillExit Auto Const mandatory
Perk Property Intimidation Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
Perk Property BackgroundCombatMedic Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Scene Property UC03_940b_HadrianJakobScene Auto Const mandatory
ReferenceAlias Property Alias_TriggerSixthCircleInterior Auto Const mandatory
ActorValue Property UC03_Starborn_QuestCompleted Auto Const mandatory
ReferenceAlias Property Alias_DrillExitMarker Auto Const mandatory
ObjectReference Property UC03_DebugMarker06a Auto Const mandatory
GlobalVariable Property UC03_PlayerKnows_TerrormorphProjectFailed Auto Const mandatory
GlobalVariable Property UC_Hadrian_ECCombatDialogueActive Auto Const mandatory
ReferenceAlias Property Alias_RedDevilsMinePostQuestEnableMarker Auto Const mandatory
Quest Property UC03_DeepMinesSupportQuest Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const mandatory
LocationAlias Property Alias_DeepMines Auto Const mandatory
LocationAlias Property Alias_LC028RedDevilMinesLocation Auto Const mandatory
ReferenceAlias Property Alias_ThresherSoundSource Auto Const mandatory
ReferenceAlias Property Alias_HadrianShip Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
ReferenceAlias Property Alias_HematiteObj Auto Const mandatory
LeveledItem Property LargeNegotiateReward Auto Const
ReferenceAlias Property Alias_EmployeeExitKey Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference HadREF = Alias_Hadrian.GetRef()
  Self.SetStage(100)
  Game.GetPlayer().MoveTo(DebugMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(400)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(400)
  Self.SetStage(442)
  Self.SetStage(500)
  Self.SetStage(510)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False)
  Game.GetPlayer().MoveTo(DebugMarker05, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(400)
  Self.SetStage(440)
  Self.SetStage(442)
  Self.SetStage(500)
  Self.SetStage(510)
  Self.SetStage(600)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(400, True)
EndFunction

Function Fragment_Stage_0007_Item_00()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  PlayREF.AddItem(TestVSWeapons as Form, 1, False)
  PlayREF.MoveTo(DebugMarker07, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(899)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0008_Item_00()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  Alias_Marcus.GetRef().MoveTo(UC04_Percival_TeleportMarker_Stage943, 0.0, 0.0, 0.0, True, False)
  PlayREF.AddItem(TestVSWeapons as Form, 1, False)
  PlayREF.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(942)
  Utility.Wait(2.0)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0009_Item_00()
  ObjectReference HadREF = Alias_Hadrian.GetRef()
  HadREF.Enable(False)
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  PlayREF.AddItem(TestVSWeapons as Form, 1, False)
  PlayREF.MoveTo(DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(950)
  Self.SetStage(990)
  Self.SetStage(1000)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(940, True)
  Utility.Wait(1.0)
  HadREF.MoveTo(HadrianTeleportMarker940, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Game.GetPlayer().MoveTo(UC03_DebugMarker06a, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(3.0)
  Self.SetStage(810)
EndFunction

Function Fragment_Stage_0019_Item_00()
  Actor PA = Game.GetPlayer()
  PA.AddPerk(Intimidation, False)
  PA.AddPerk(BackgroundIndustrialist, False)
  PA.AddPerk(BackgroundCombatMedic, False)
  PA.AddPerk(BackgroundXenobiologist, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_DeepMines.ForceLocationTo(Alias_LC028RedDevilMinesLocation.GetLocation())
EndFunction

Function Fragment_Stage_0050_Item_00()
  DialogueCydonia_RedEyes.SetValue(1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_Andy.GetRef().Enable(False)
  Alias_LaserCutter.GetRef().Enable(False)
  Alias_EmployeeExitKey.GetRef().Enable(False)
  Alias_HematiteObj.GetRef().EnableNoWait(False)
  (Alias_Player as uc03_playeraliasscript).RegisterPlayerForBloodstoneCollection()
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Alias_Oktai.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0320_Item_00()
  UC_PlayerKnows_RedDevils.SetValue(1.0)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If !Self.GetStageDone(850)
    Self.SetObjectiveDisplayed(400, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0410_Item_00()
  UC03_410_AndyShoutsScene.Start()
EndFunction

Function Fragment_Stage_0420_Item_00()
  UC03_420_LouAttractScene.Start()
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(430, True, False)
EndFunction

Function Fragment_Stage_0442_Item_00()
  Self.SetStage(330)
EndFunction

Function Fragment_Stage_0443_Item_00()
  Game.GetPlayer().AddItem(Digipick as Form, 5, False)
EndFunction

Function Fragment_Stage_0445_Item_00()
  Self.SetStage(320)
EndFunction

Function Fragment_Stage_0447_Item_00()
  Self.SetStage(438)
EndFunction

Function Fragment_Stage_0503_Item_00()
  Self.SetObjectiveCompleted(503, True)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetObjectiveCompleted(430, True)
  Self.SetObjectiveDisplayed(501, True, False)
  Self.SetObjectiveDisplayedAtTop(500)
  Utility.Wait(2.0)
  UC03_510_CambridgeAttractScene.Start()
  Self.SetObjectiveDisplayed(510, True, False)
EndFunction

Function Fragment_Stage_0521_Item_00()
  Game.GetPlayer().AddItem(LL_Drink_Any as Form, 1, False)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayedAtTop(550)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(510, True)
  If !UC03_DeepMinesSupportQuest.GetStageDone(100)
    Self.SetObjectiveDisplayed(600, True, False)
  Else
    Self.SetStage(800)
    Self.SetObjectiveDisplayed(800, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.GetStageDone(850) && !Self.GetStageDone(890) && Self.GetStageDone(510)
    Self.SetObjectiveCompleted(501, True)
    Self.SetObjectiveDisplayed(500, True, True)
    Self.SetObjectiveDisplayed(502, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0750_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, UC03_JakobsDebtNewValue_00.GetValueInt(), False)
  Self.SetObjectiveCompleted(502, True)
  If !Self.IsObjectiveCompleted(600)
    Self.SetObjectiveDisplayed(600, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(800)
    Self.SetObjectiveDisplayed(800, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(810)
    Self.SetObjectiveDisplayed(810, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(811)
    Self.SetObjectiveDisplayed(811, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(820)
    Self.SetObjectiveDisplayed(820, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(825)
    Self.SetObjectiveDisplayed(825, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(830)
    Self.SetObjectiveDisplayed(830, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(835)
    Self.SetObjectiveDisplayed(835, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(840)
    Self.SetObjectiveDisplayed(840, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(845)
    Self.SetObjectiveDisplayed(845, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(600) && !Self.GetStageDone(750) && !Self.GetStageDone(890)
    Self.SetObjectiveCompleted(600, True)
    Self.SetObjectiveDisplayed(500, True, True)
    Self.SetObjectiveDisplayed(800, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0810_Item_00()
  UC03_810_CambridgeCommsScene.Start()
EndFunction

Function Fragment_Stage_0811_Item_00()
  Alias_LaserCutter.Clear()
  Self.SetObjectiveCompleted(811, True)
EndFunction

Function Fragment_Stage_0815_Item_00()
  Self.SetObjectiveCompleted(800, True)
  If !Self.GetStageDone(750)
    Actor Player = Game.GetPlayer()
    If Player.GetItemCount(InorgUniqueHematite as Form) < 1
      Self.SetObjectiveDisplayed(500, True, True)
      Self.SetObjectiveDisplayed(810, True, False)
      If Player.GetItemCount(Cutter as Form) < 1
        Self.SetObjectiveDisplayed(811, True, False)
      EndIf
    Else
      Player.RemoveItem(InorgUniqueHematite as Form, 1, True, None)
      Player.AddAliasedItem(InorgUniqueHematite as Form, Alias_HematiteQuestItem as Alias, 1, True)
      Self.SetStage(820)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0820_Item_00()
  Alias_LaserCutter.Clear()
  If !Self.GetStageDone(750)
    Alias_ThresherTrigger.GetRef().Enable(False)
    Self.SetObjectiveCompleted(810, True)
    Self.SetObjectiveDisplayed(500, True, True)
    If !Self.IsObjectiveCompleted(811)
      Self.SetObjectiveDisplayed(811, False, False)
    EndIf
    Self.SetObjectiveDisplayed(820, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0825_Item_00()
  If !Self.GetStageDone(750)
    Alias_ThresherTrigger.GetRef().Disable(False)
    Alias_ThresherSoundSource.GetRef().Enable(False)
    Game.GetPlayer().RemoveItem(Alias_HematiteQuestItem.GetRef() as Form, 1, False, None)
    Self.SetObjectiveCompleted(820, True)
    Self.SetObjectiveDisplayed(500, True, True)
    Self.SetObjectiveDisplayed(830, True, False)
    UC03_825_Thresher_HematiteDeposited.Start()
  EndIf
EndFunction

Function Fragment_Stage_0830_Item_00()
  If !Self.GetStageDone(750)
    UC03_830_ThresherAnalysisSequence.Start()
    Self.SetObjectiveCompleted(825, True)
    Self.SetObjectiveDisplayed(500, True, True)
    Self.SetObjectiveDisplayed(830, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0835_Item_00()
  If !Self.GetStageDone(750)
    Alias_ThresherDataTrigger.GetRef().Enable(False)
    Alias_ThresherSoundSource.GetRef().Disable(False)
    Self.SetObjectiveCompleted(830, True)
    Self.SetObjectiveDisplayed(500, True, True)
    Self.SetObjectiveDisplayed(835, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0840_Item_00()
  If !Self.GetStageDone(750)
    Game.GetPlayer().AddItem(Alias_ResearchData.GetRef() as Form, 1, False)
    Alias_ThresherDataTrigger.GetRef().Disable(False)
    Self.SetObjectiveCompleted(835, True)
    Self.SetObjectiveDisplayed(500, True, True)
    Self.SetObjectiveDisplayed(840, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0843_Item_00()
  If !Self.GetStageDone(890) && !Self.GetStageDone(750)
    UC03_845_CambridgeResearchCollected.Start()
    Self.SetObjectiveCompleted(840, True)
    If Game.GetPlayer().GetItemCount(UC03_DeepMineQuickExitKey as Form) >= 1
      Self.SetStage(845)
    Else
      Self.SetObjectiveDisplayed(500, True, True)
      Self.SetObjectiveDisplayed(843, True, False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0844_Item_00()
  ObjectReference DrillMM = Alias_DrillExitMarker.GetRef()
  DrillMM.Enable(False)
  DrillMM.AddToMapScanned(True)
EndFunction

Function Fragment_Stage_0845_Item_00()
  If !Self.GetStageDone(750)
    Self.SetObjectiveCompleted(843, True)
    Self.SetObjectiveDisplayed(500, True, True)
    Self.SetObjectiveDisplayed(845, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  If !Self.GetStageDone(750)
    Self.SetStage(856)
    Game.GetPlayer().SetValue(UC03_PlayerLearnedPickMeUpRecipe, 1.0)
    Self.SetObjectiveCompleted(845, True)
    Self.SetObjectiveDisplayed(850, True, False)
    If !Self.IsObjectiveCompleted(500)
      Self.SetObjectiveDisplayed(500, False, False)
    EndIf
    If !Self.IsObjectiveCompleted(501)
      Self.SetObjectiveDisplayed(501, False, False)
    EndIf
    If !Self.IsObjectiveCompleted(502)
      Self.SetObjectiveDisplayed(502, False, False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0860_Item_00()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.RemoveItem(Alias_ResearchData.GetRef() as Form, 1, False, None)
  If Self.GetStageDone(870)
    PlayACT.AddItem(LargeNegotiateReward as Form, 1, False)
  Else
    PlayACT.AddItem(LL_Quest_Reward_Credits_Misc_01_Small as Form, 1, False)
  EndIf
  UC03_JakobsDebtAmount.SetValue(0.0)
  Self.SetObjectiveCompleted(850, True)
  UC03_Result.SetValue(1.0)
  Self.SetStage(890)
EndFunction

Function Fragment_Stage_0880_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, UC03_JakobsDebtAmount.GetValueInt(), False, None)
  Self.SetStage(890)
EndFunction

Function Fragment_Stage_0890_Item_00()
  Self.SetStage(856)
  Self.SetObjectiveCompleted(500, True)
  If !Self.IsObjectiveCompleted(501)
    Self.SetObjectiveDisplayed(501, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(502)
    Self.SetObjectiveDisplayed(502, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(503)
    Self.SetObjectiveDisplayed(503, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(510)
    Self.SetObjectiveDisplayed(510, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(600)
    Self.SetObjectiveDisplayed(600, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(800)
    Self.SetObjectiveDisplayed(800, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(810)
    Self.SetObjectiveDisplayed(810, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(811)
    Self.SetObjectiveDisplayed(811, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(820)
    Self.SetObjectiveDisplayed(820, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(825)
    Self.SetObjectiveDisplayed(825, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(830)
    Self.SetObjectiveDisplayed(830, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(835)
    Self.SetObjectiveDisplayed(835, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(840)
    Self.SetObjectiveDisplayed(840, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(845)
    Self.SetObjectiveDisplayed(845, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(850)
    Self.SetObjectiveDisplayed(850, False, False)
  EndIf
  Self.SetObjectiveDisplayed(890, True, False)
EndFunction

Function Fragment_Stage_0891_Item_00()
  If !Self.GetStageDone(895)
    UC03_891_DrillDoorActivated.Start()
    Self.SetObjectiveDisplayed(900, False, False)
    Self.SetObjectiveDisplayed(891, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0895_Item_00()
  Self.SetObjectiveCompleted(891, True)
  If !Self.IsObjectiveDisplayed(900)
    Self.SetObjectiveDisplayed(900, True, False)
  EndIf
  Alias_DrillExit.GetRef().Unlock(False)
  UC03_895_DoorAccessRestored.Start()
EndFunction

Function Fragment_Stage_0899_Item_00()
  Self.SetObjectiveCompleted(430, True)
  Self.SetObjectiveCompleted(890, True)
  Self.SetObjectiveDisplayed(900, True, False)
  Game.GetPlayer().AddItem(UC03_DeepMineDrillKey as Form, 1, False)
  If Self.GetStageDone(442) && !Self.GetStageDone(750)
    Self.SetStage(750)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  UC03_900_JakobAttractScene.Start()
  Alias_Marcus.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0901_Item_00()
  Alias_Marcus.GetActorRef().EvaluatePackage(False)
  ObjectReference HadREF = Alias_Hadrian.GetRef()
  HadREF.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0905_Item_00()
  Game.GetPlayer().RemoveItem(Alias_TerrormorphCellSample.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0910_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(910, True, False)
EndFunction

Function Fragment_Stage_0920_Item_00()
  Alias_RedHQMainDoor.GetRef().Unlock(False)
  Alias_Marcus.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(920, True, False)
EndFunction

Function Fragment_Stage_0930_Item_00()
  UC03_930_MarcusInsideScene.Start()
EndFunction

Function Fragment_Stage_0939_Item_00()
  Actor JakobRef = Alias_Marcus.GetActorRef()
  (SQ_Followers as sq_followersscript).SetRoleInactive(JakobRef, True, False, True)
EndFunction

Function Fragment_Stage_0940_Item_00()
  Alias_Marcus.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0942_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, False)
  DialogueRedDevilsHQ.SetStage(7)
  Actor PA = Alias_Marcus.GetActorRef()
  (SQ_Followers as sq_followersscript).SetRoleActive(PA, True, True, 0.0, 0.0)
  (SQ_Followers as sq_followersscript).CommandFollow(PA)
  Actor HadREF = Alias_Hadrian.GetActorRef()
  HadREF.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False)
  HadREF.Enable(False)
  HadREF.EvaluatePackage(False)
  Alias_HadrianShip.TryToEnable()
  UC_Hadrian_ECCombatDialogueActive.SetValue(1.0)
  ObjectReference MMRef = Alias_RedDevilsHQMapMarker.GetRef()
  MMRef.Enable(False)
  MMRef.SetMarkerVisibleOnStarMap(True)
  MMRef.SetMarkerDiscovered()
  Self.SetObjectiveCompleted(920, True)
  Self.SetObjectiveDisplayed(942, True, False)
EndFunction

Function Fragment_Stage_0943_Item_00()
  Actor JakobRef = Alias_Marcus.GetActorRef()
  (SQ_Followers as sq_followersscript).SetRoleInactive(JakobRef, True, False, True)
  If !Game.GetPlayer().HasDetectionLOS(JakobRef as ObjectReference)
    JakobRef.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False)
  EndIf
  JakobRef.EvaluatePackage(False)
  UC03_940b_HadrianJakobScene.Start()
EndFunction

Function Fragment_Stage_0945_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0949_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(942, True)
  Self.SetObjectiveDisplayed(950, True, False)
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
  Alias_Marcus.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0955_Item_00()
  UC_PlayerKnows_HadriansPast_Xenowarfare.SetValue(1.0)
EndFunction

Function Fragment_Stage_0956_Item_00()
  UC03_PlayerKnows_TerrormorphProjectFailed.SetValue(1.0)
EndFunction

Function Fragment_Stage_0957_Item_00()
  UC_PlayerKnows_ArmisticeArchives.SetValue(1.0)
EndFunction

Function Fragment_Stage_0960_Item_00()
  Self.SetObjectiveCompleted(950, True)
  Self.SetObjectiveDisplayed(960, True, False)
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0961_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0970_Item_00()
  UC03_970_MarcusAnalyzesSample.Start()
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.SetObjectiveCompleted(940, True)
  Self.SetObjectiveDisplayed(980, True, False)
EndFunction

Function Fragment_Stage_0990_Item_00()
  UC_PlayerKnows_ArmisticeArchives.SetValue(1.0)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_NewAtlantisCrewSpawner.GetRef().Disable(False)
  If !UC03_DeepMinesSupportQuest.GetStageDone(200)
    UC03_DeepMinesSupportQuest.SetStage(200)
  EndIf
  If Self.GetStageDone(860)
    UC03_BloodstoneAvailable.SetValue(1.0)
    Alias_RedDevilsMinePostQuestEnableMarker.GetRef().Enable(False)
  EndIf
  Game.GetPlayer().SetValue(UC03_Starborn_QuestCompleted, 1.0)
  Self.SetStage(844)
  (SQ_Followers as sq_followersscript).SetRoleInactive(Alias_Marcus.GetActorRef(), True, False, True)
  UC04.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_1015_Item_00()
  Self.SetObjectiveCompleted(1010, True)
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveCompleted(1010, True)
  Self.SetObjectiveDisplayed(1050, True, False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1050, True)
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
  UC04.Start()
EndFunction
