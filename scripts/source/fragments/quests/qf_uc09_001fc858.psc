ScriptName Fragments:Quests:QF_UC09_001FC858 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
GlobalVariable Property UC09_PlayerChoiceResult Auto Const mandatory
ObjectReference Property UC09_DebugMarker01 Auto Const mandatory
ObjectReference Property UC09_DebugMarker02 Auto Const mandatory
ObjectReference Property UC09_DebugMarker03 Auto Const mandatory
ObjectReference Property UC09_DebugMarker04 Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
Message Property UC09_DEBUG_ExpansionPoint Auto Const mandatory
Message Property UC09_DEBUG_SpeechChallenge Auto Const mandatory
ReferenceAlias Property Alias_Jakob Auto Const mandatory
Scene Property UC09_300_CabinetMainScene Auto Const mandatory
Message Property UC09_DEBUG_AdditionalUC05Variations Auto Const mandatory
Message Property UC09_DEBUG_SpeakToTuala Auto Const mandatory
GlobalVariable Property UC_PlayerMentionedVVToHadrian Auto Const mandatory
GlobalVariable Property UC09_HadsMad Auto Const mandatory
GlobalVariable Property UC09_CleanUpLazarusPlant Auto Const mandatory
ReferenceAlias Property Alias_VaeVictis Auto Const mandatory
ReferenceAlias Property Alias_FB441MarineEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_FCObserverEnableMarker Auto Const mandatory
Quest Property UC09_PostQuestline_HadrianScene Auto Const mandatory
GlobalVariable Property UC07_HadrianKnowsVVLives Auto Const mandatory
ReferenceAlias Property Alias_PostVVSceneTrigger Auto Const mandatory
Perk Property BackgroundDiplomat Auto Const mandatory
Perk Property TraitEmpath Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
GlobalVariable Property UCR05_Bonus Auto Const mandatory
RefCollectionAlias Property Alias_LondinionDoors Auto Const mandatory
ReferenceAlias Property Alias_ContinueAddressTrigger Auto Const mandatory
GlobalVariable Property UC09_TellFreestarAboutLazPlant Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
GlobalVariable Property MQ305_UC_AcelesEnding Auto Const mandatory
GlobalVariable Property MQ305_UC_PlagueEnding Auto Const mandatory
GlobalVariable Property UC09_LazarusPlantResult Auto Const mandatory
GlobalVariable Property UC_LoganKnowsPlayerLearnedOfVaeVictis Auto Const mandatory
ActorValue Property UC09_Foreknowledge_VVCommittedTheAttacksAV Auto Const mandatory
ReferenceAlias Property Alias_HadrianShip Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToDisable Auto Const mandatory
ReferenceAlias Property Alias_EmergencyRecording Auto Const mandatory
GlobalVariable Property MQ305_UC_SterilizationEnding Auto Const mandatory
ReferenceAlias Property Alias_ChiefSarkin Auto Const mandatory
ReferenceAlias Property Alias_Abello Auto Const mandatory
ReferenceAlias Property Alias_ChiefYasin Auto Const mandatory
ReferenceAlias Property Alias_ChiefKulkarni Auto Const mandatory
ReferenceAlias Property Alias_AdmiralLogan Auto Const mandatory
ReferenceAlias Property Alias_VVDoor Auto Const mandatory
ReferenceAlias Property Alias_SS7FloorManager Auto Const mandatory
Book Property UC08_VV_AudioLog Auto Const mandatory
Quest Property DialogueUCFactionNewAtlantis Auto Const mandatory
GlobalVariable Property UCR05_Enabled Auto Const mandatory
ReferenceAlias Property Alias_PostQuestSlate Auto Const mandatory
Quest Property UC08_QueenBattle Auto Const mandatory
Quest Property UC08_AnomalyBattle Auto Const mandatory
ReferenceAlias Property Alias_HadriansShip_RHQ Auto Const mandatory
Quest Property UC01 Auto Const mandatory
ReferenceAlias Property Alias_VVCellDoor Auto Const mandatory
ReferenceAlias Property Alias_SS7_CompanionWaitTrigger Auto Const mandatory
Outfit Property Outfit_Clothes_Colonist_CroppedVest_Hadrian Auto Const mandatory
Outfit Property Outfit_Clothes_ScienceLabTec Auto Const mandatory
ActorValue Property ActorShouldShowSpacesuitCosmetic_AV Auto Const mandatory
ActorValue Property ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV Auto Const mandatory
GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const mandatory
Quest Property UC02 Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_UnitedColonies Auto Const mandatory
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_UnitedColonies_Cooldown Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19)
  Game.GetPlayer().MoveTo(UC09_DebugMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Game.GetPlayer().MoveTo(UC09_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Game.GetPlayer().MoveTo(UC09_DebugMarker03, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(310)
  UC09_300_CabinetMainScene.Stop()
  UC01.SetStage(100)
  UC01.SetStage(1000)
  Game.GetPlayer().MoveTo(UC09_DebugMarker04, 0.0, 0.0, 0.0, True, False)
  Alias_Hadrian.GetRef().MoveTo(UC09_DebugMarker04, 0.0, 0.0, 0.0, True, False)
  UC02.Stop()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0019_Item_00()
  Alias_Hadrian.GetRef().Enable(False)
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddPerk(BackgroundDiplomat, False)
  PlayACT.AddPerk(BackgroundIndustrialist, False)
  PlayACT.AddPerk(TraitEmpath, False)
  PlayACT.AddPerk(BackgroundXenobiologist, False)
  Alias_VVDoor.GetRef().Unlock(False)
  (Alias_SS7FloorManager.GetRef() as loadelevatorfloorscript).SetAccessible(True)
  Game.GetPlayer().AddAliasedItem(UC08_VV_AudioLog as Form, Alias_EmergencyRecording as Alias, 1, True)
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
  Alias_NPCsToDisable.DisableAll(False)
EndFunction

Function Fragment_Stage_0105_Item_00()
  UC08_AnomalyBattle.SetStage(1000)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Int Count = Alias_LondinionDoors.GetCount()
  Int I = 0
  While I < Count
    ObjectReference currDoor = Alias_LondinionDoors.GetAt(I)
    currDoor.SetOpen(False)
    currDoor.Lock(True, False, True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0113_Item_00()
  Self.SetStage(124)
EndFunction

Function Fragment_Stage_0119_Item_00()
  UCR05_Bonus.SetValue(1.0)
EndFunction

Function Fragment_Stage_0124_Item_00()
  Alias_VaeVictis.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Game.GetPlayer().SetValue(UC09_Foreknowledge_VVCommittedTheAttacksAV, 1.0)
EndFunction

Function Fragment_Stage_0130_Item_00()
  DialogueUCFactionNewAtlantis.SetStage(1011)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  uc09questscript kmyQuest = __temp as uc09questscript
  Actor HadACT = Alias_Hadrian.GetActorRef()
  HadACT.SetOutfit(Outfit_Clothes_Colonist_CroppedVest_Hadrian, True)
  HadACT.SetValue(ActorShouldShowSpacesuitCosmetic_AV, 0.0)
  HadACT.SetValue(ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV, 0.0)
  Alias_Jakob.GetActorRef().SetOutfit(Outfit_Clothes_ScienceLabTec, False)
  kmyQuest.GetNPCsInPlace()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_HadrianShip.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  UC_PlayerMentionedVVToHadrian.SetValue(1.0)
  UC07_HadrianKnowsVVLives.SetValue(1.0)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(229)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
  Alias_Jakob.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  UC09_300_CabinetMainScene.Start()
  Alias_ContinueAddressTrigger.GetRef().Enable(False)
  Alias_NPCsToDisable.EnableAll(False)
EndFunction

Function Fragment_Stage_0315_Item_00()
  UC09_HadsMad.SetValue(1.0)
EndFunction

Function Fragment_Stage_0320_Item_00()
  UC_LoganKnowsPlayerLearnedOfVaeVictis.SetValue(1.0)
EndFunction

Function Fragment_Stage_0325_Item_00()
  Game.GetPlayer().RemoveItem(Alias_EmergencyRecording.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0365_Item_00()
  UC09_LazarusPlantResult.SetValue(1.0)
EndFunction

Function Fragment_Stage_0367_Item_00()
  UC09_LazarusPlantResult.SetValue(1.0)
EndFunction

Function Fragment_Stage_0369_Item_00()
  UC09_LazarusPlantResult.SetValue(2.0)
EndFunction

Function Fragment_Stage_0371_Item_00()
  UC09_LazarusPlantResult.SetValue(2.0)
EndFunction

Function Fragment_Stage_0399_Item_00()
  UC09_DEBUG_AdditionalUC05Variations.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0499_Item_00()
  Quest __temp = Self as Quest
  uc09questscript kmyQuest = __temp as uc09questscript
  Alias_ContinueAddressTrigger.GetRef().Disable(False)
  kmyQuest.StaggeredEvalPackages()
  If Self.GetStageDone(401)
    UC09_PlayerChoiceResult.SetValue(2.0)
    MQ305_UC_PlagueEnding.SetValue(1.0)
  ElseIf Self.GetStageDone(402)
    UC09_PlayerChoiceResult.SetValue(3.0)
    MQ305_UC_SterilizationEnding.SetValue(1.0)
  Else
    UC09_PlayerChoiceResult.SetValue(1.0)
    MQ305_UC_AcelesEnding.SetValue(1.0)
  EndIf
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(320)
    Alias_VaeVictis.GetRef().Disable(False)
    Alias_PostQuestSlate.GetRef().Enable(False)
    Alias_VVCellDoor.GetRef().Unlock(False)
    Alias_SS7_CompanionWaitTrigger.GetRef().Disable(False)
  Else
    UCR05_Enabled.SetValue(1.0)
  EndIf
  UC09_PostQuestline_HadrianScene.Start()
  Alias_FB441MarineEnableMarker.GetRef().Enable(False)
  DialogueRedDevilsHQ.SetStage(30)
  Alias_HadriansShip_RHQ.GetRef().Enable(False)
  If Self.GetStageDone(367) || Self.GetStageDone(371)
    DialogueRedDevilsHQ.SetStage(32)
    Alias_FCObserverEnableMarker.GetRef().Enable(False)
    UC09_TellFreestarAboutLazPlant.SetValue(1.0)
  EndIf
  If Self.GetStageDone(369) || Self.GetStageDone(371)
    UC09_CleanUpLazarusPlant.SetValue(1.0)
  EndIf
  DialogueUCNewAtlantisUCFaction.SetStage(500)
  Game.AddAchievement(13)
  Float currentGameTime = Utility.GetCurrentGameTime()
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue()
  Int I = 0
  While I < Alias_Companions.Length
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_UnitedColonies_Cooldown, cooldownTime)
    I += 1
  EndWhile
  COM_WantsToTalkEvent_UnitedColonies.Send(None)
  Actor HadACT = Alias_Hadrian.GetActorRef()
  If HadACT.HasKeyword(SQ_Followers_UseFollowPlayerCustom)
    HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
  EndIf
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
