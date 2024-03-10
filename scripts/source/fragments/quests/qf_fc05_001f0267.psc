ScriptName Fragments:Quests:QF_FC05_001F0267 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Jade Auto Const mandatory
Scene Property FC05_JadeStage500Scene Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC05_PT1 Auto Const mandatory
Scene Property FC05_AutumnPathToTableScene Auto Const mandatory
Scene Property FC05_MeiAnnounceRunScene Auto Const mandatory
Scene Property FC05_MeiRulesScene Auto Const mandatory
Scene Property FC05_MeiSpeakerScene Auto Const mandatory
ReferenceAlias Property Alias_StashRoomDoor Auto Const mandatory
Faction Property FC05_MarcoEnemyFaction Auto Const mandatory
ObjectReference Property FC05_MarcoShipEnableMarker Auto Const mandatory
ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const mandatory
Quest Property FC_EncryptedSlateQuest Auto Const mandatory
ReferenceAlias Property Alias_MeiDevine Auto Const mandatory
ReferenceAlias Property Alias_AutumnMacMillan Auto Const mandatory
ReferenceAlias Property Alias_MarcoGraziani Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_MarcoSlate Auto Const mandatory
Scene Property FC05_GuardWelcomeScene Auto Const mandatory
ReferenceAlias Property Alias_MarcoStarshipMapMarker Auto Const mandatory
ReferenceAlias Property Alias_MarcoDoorman Auto Const
Quest Property FFRedMileR01Misc Auto Const mandatory
ReferenceAlias Property Alias_PlayerRunningRedMile Auto Const mandatory
ReferenceAlias Property Alias_StageLightsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_RedMileStartingDoor Auto Const mandatory
ReferenceAlias Property Alias_DoorLightsEnableMarker Auto Const mandatory
ActorValue Property FC05_Completed Auto Const mandatory
Scene Property FC05_MarcoScene Auto Const mandatory
GlobalVariable Property PlayerCompletedRedMile Auto Const mandatory
Quest Property DialogueRedMile Auto Const mandatory
ReferenceAlias Property Alias_PlayerChair Auto Const mandatory
GlobalVariable Property PlayerMetMeiDevine Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
ObjectReference Property FC05_PTMarco Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0999_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_Jade.GetRef().Enable(False)
  Alias_AutumnMacMillan.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  FC05_AutumnPathToTableScene.Start()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Alias_Player.GetActorRef().GetFurnitureUsing() == Alias_PlayerChair.GetRef()
    Self.SetStage(500)
    FC05_AutumnPathToTableScene.Stop()
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_Jade.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveCompleted(200, True)
  EndIf
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(350, True, False)
  FC05_JadeStage500Scene.Start()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_PlayerRunningRedMile.ForceRefTo(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0650_Item_00()
  PlayerMetMeiDevine.SetValue(1.0)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  PlayerMetMeiDevine.SetValue(1.0)
  FC05_MeiAnnounceRunScene.Start()
  Alias_StageLightsEnableMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0750_Item_00()
  Alias_StageLightsEnableMarker.GetReference().Enable(False)
  FC05_MeiRulesScene.Start()
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Alias_DoorLightsEnableMarker.GetRef().Enable(False)
  Alias_RedMileStartingDoor.GetRef().SetOpen(True)
  Alias_StageLightsEnableMarker.GetRef().Disable(False)
  Alias_MeiDevine.GetActorRef().BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0800_Item_01()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  kmyQuest.SpawnCreatures(0)
  kmyQuest.RMDisableFastTravel()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(900, True, False)
  FC05_MeiSpeakerScene.Start()
  kmyQuest.SpawnCreatures(1)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_1110_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Alias_MeiDevine.GetActorRef().EvaluatePackage(False)
  kmyQuest.RMEnableFastTravel()
  Alias_DoorLightsEnableMarker.GetRef().Disable(False)
  PlayerCompletedRedMile.Mod(1.0)
  DialogueRedMile.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Quest __temp = Self as Quest
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  If FFRedMileR01Misc.IsRunning() && FFRedMileR01Misc.GetStageDone(110)
    FFRedMileR01Misc.SetStage(120)
  EndIf
  Alias_PlayerRunningRedMile.Clear()
EndFunction

Function Fragment_Stage_1201_Item_00()
  If FFRedMileR01Misc.IsRunning() && !FFRedMileR01Misc.GetStageDone(1000)
    FFRedMileR01Misc.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_1210_Item_00()
  Alias_AutumnMacMillan.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1600_Item_00()
  Alias_MarcoStarshipMapMarker.GetRef().AddToMapScanned(True)
  Alias_MarcoStarshipMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1200, True, False)
EndFunction

Function Fragment_Stage_1605_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  Self.SetObjectiveDisplayed(1400, True, False)
EndFunction

Function Fragment_Stage_1610_Item_00()
  Alias_MarcoDoorman.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1650_Item_00()
  FC05_GuardWelcomeScene.Start()
EndFunction

Function Fragment_Stage_1700_Item_00()
  Self.SetObjectiveCompleted(1400, True)
  Self.SetObjectiveDisplayed(1500, True, False)
EndFunction

Function Fragment_Stage_1705_Item_00()
  FC05_MarcoScene.Start()
EndFunction

Function Fragment_Stage_1710_Item_00()
  Alias_MarcoGraziani.GetActorRef().EvaluatePackage(False)
  Alias_Companion.GetRef().MoveTo(FC05_PTMarco, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1760_Item_00()
  Alias_Player.GetActorRef().AddItem(Credits as Form, NPCDemandMoney_Medium.GetValue() as Int, False)
EndFunction

Function Fragment_Stage_1770_Item_00()
  Self.SetObjectiveCompleted(1500, True)
  Self.SetObjectiveCompleted(1600, True)
  Alias_Player.GetActorRef().AddItem(Alias_MarcoSlate.GetRef() as Form, 1, False)
  Self.SetStage(2000)
EndFunction

Function Fragment_Stage_1800_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FC05_MarcoEnemyFaction)
EndFunction

Function Fragment_Stage_1900_Item_00()
  Self.SetObjectiveCompleted(1500, True)
  Self.SetObjectiveDisplayed(1600, True, False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetObjectiveCompleted(1600, True)
  Self.SetObjectiveDisplayed(1700, True, False)
  Alias_Player.GetReference().ModValue(FC_EncryptedSlatesCollectedAV, 1.0)
EndFunction

Function Fragment_Stage_2100_Item_00()
  Self.CompleteAllObjectives()
  Alias_Player.GetActorRef().SetValue(FC05_Completed, 1.0)
  Alias_Player.GetActorRef().RemoveItem(Alias_MarcoSlate.GetRef() as Form, 1, False, None)
  Self.Stop()
EndFunction
