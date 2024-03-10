ScriptName Fragments:Quests:QF_FC03_0027AB1A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Blake Auto Const mandatory
ObjectReference Property FC03_DebriefScene_BlakeMarker Auto Const mandatory
ReferenceAlias Property Alias_Hannah Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC03_PT1 Auto Const mandatory
ObjectReference Property FC03_PT1_Hannah Auto Const mandatory
ObjectReference Property FC03_PT2_Hannah Auto Const mandatory
ReferenceAlias Property Alias_Emma Auto Const mandatory
Key Property FC03_ArmoryLockerKey Auto Const mandatory
Scene Property FC03_HopeIntroScene Auto Const mandatory
Scene Property FC03_CosetteInterruptScene Auto Const mandatory
Quest Property FC01 Auto Const mandatory
ObjectReference Property FC03_PT2 Auto Const mandatory
Quest Property FC04 Auto Const mandatory
ReferenceAlias Property Alias_Birgit Auto Const mandatory
ReferenceAlias Property Alias_Ron Auto Const mandatory
Scene Property FC03_ConcludeDebriefing Auto Const mandatory
Scene Property FC03_NiaDistressCallScene Auto Const mandatory
ReferenceAlias Property Alias_NiaKaluShip Auto Const mandatory
Message Property FC03_RepairMSG Auto Const mandatory
ObjectReference Property FC03_Nia_St1300SceneMarker Auto Const mandatory
ReferenceAlias Property Alias_Nia Auto Const mandatory
ReferenceAlias Property Alias_Cosette Auto Const mandatory
ReferenceAlias Property Alias_HopeOfficeDoor Auto Const mandatory
ObjectReference Property FC03_NiaWoundedMarkerRef Auto Const mandatory
Quest Property FC03_SpaceEncounterQuest Auto Const mandatory
LocationAlias Property Alias_HopeTechLocation Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property SettleWaggonerFarm_ShipLandingMarkerRef Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
LocationAlias Property Alias_NiaKaluShipLocation Auto Const mandatory
ObjectReference Property FC03_StartQuestTriggerRef Auto Const mandatory
Quest Property FC01_PostQuest Auto Const mandatory
Quest Property FC02 Auto Const mandatory
ObjectReference Property FC03_EmmaDebriefMarker Auto Const mandatory
Scene Property FC03_NiaShipLandingScene Auto Const mandatory
Scene Property FC03_NiaWalkTalkScene Auto Const mandatory
ObjectReference Property FC03_Birgit_St1300Marker Auto Const mandatory
ObjectReference Property FC03_NiaWaitMarker Auto Const mandatory
ObjectReference Property FC03_Ron_St1400Marker Auto Const mandatory
Faction Property FreestarRangerFaction Auto Const mandatory
RefCollectionAlias Property Alias_GuardShips Auto Const mandatory
ActorValue Property FC03_Completed Auto Const mandatory
GlobalVariable Property NiaKaluIsInjured Auto Const mandatory
ObjectReference Property HopetownLandingMarker_NonPlayer Auto Const mandatory
ObjectReference Property HopetownLandingMarker Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel01 Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel02 Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel03 Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_JobsDoneSlate Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel03_FX Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel02_FX Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel01_FX Auto Const mandatory
Keyword Property Artifact_GravImmune Auto Const mandatory
GlobalVariable Property SQ_GuardShipsWaitToScan Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1185_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_1500_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_1700_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Frontier_ModularREF.moveto(SettleWaggonerFarm_ShipLandingMarkerRef, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(SettleWaggonerFarm_ShipLandingMarkerRef, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  FC01.SetStage(2000)
  FC01_PostQuest.SetStage(2000)
  FC02.SetStage(2000)
  Alias_Player.GetActorRef().AddToFaction(FreestarRangerFaction)
  Alias_Player.GetRef().moveto(FC03_PT1, 0.0, 0.0, 0.0, True, False)
  Alias_Hannah.GetRef().moveto(FC03_PT1_Hannah, 0.0, 0.0, 0.0, True, False)
  Alias_Blake.GetRef().moveto(FC03_DebriefScene_BlakeMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_HopeOfficeDoor.GetRef().Lock(True, False, True)
  Alias_HopeOfficeDoor.GetRef().SetLockLevel(255)
  NiaKaluIsInjured.SetValue(1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Hannah.GetRef().moveto(FC03_PT2_Hannah, 0.0, 0.0, 0.0, True, False)
  Alias_Player.GetRef().moveto(FC03_PT2, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Blake.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Alias_Hannah.GetRef().moveto(FC03_EmmaDebriefMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetStage(305)
  Alias_Blake.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_Blake.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_Emma.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(650, True, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Alias_JobsDoneSlate.GetRef() as Form, 1, False, None)
  Alias_NiaKaluShip.GetRef().Enable(False)
  Alias_NiaKaluShip.GetShipRef().EnablePartRepair(Health, False)
  Float fBlastDamage03 = Alias_NiaKaluShip.GetShipRef().GetBaseValue(Health) * 0.800000012
  Alias_NiaKaluShip.GetShipRef().DamageValue(Health, fBlastDamage03)
  Alias_Nia.GetActorRef().SetRestrained(True)
  Alias_Nia.GetRef().moveto(FC03_NiaWoundedMarkerRef, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(850, True, False)
EndFunction

Function Fragment_Stage_1025_Item_00()
  FC03_NiaDistressCallScene.Start()
  SQ_GuardShipsWaitToScan.SetValue(1.0)
EndFunction

Function Fragment_Stage_1030_Item_00()
  SQ_GuardShipsWaitToScan.SetValue(0.0)
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveCompleted(850, True)
  Self.SetObjectiveDisplayed(950, True, False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(950, True)
  Self.SetObjectiveDisplayed(1000, True, False)
EndFunction

Function Fragment_Stage_1150_Item_00()
  Alias_Nia.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1160_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1050, True, False)
EndFunction

Function Fragment_Stage_1162_Item_00()
  If Self.GetStageDone(1164) && Self.GetStageDone(1166)
    Self.SetStage(1170)
  EndIf
  Alias_RepairPanel01.GetRef().BlockActivation(True, True)
  Alias_RepairPanel01_FX.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_1164_Item_00()
  If Self.GetStageDone(1162) && Self.GetStageDone(1166)
    Self.SetStage(1170)
  EndIf
  Alias_RepairPanel02.GetRef().BlockActivation(True, True)
  Alias_RepairPanel02_FX.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_1166_Item_00()
  If Self.GetStageDone(1162) && Self.GetStageDone(1164)
    Self.SetStage(1170)
  EndIf
  Alias_RepairPanel03.GetRef().BlockActivation(True, True)
  Alias_RepairPanel03_FX.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_1170_Item_00()
  If Self.IsObjectiveDisplayed(1000)
    Self.SetObjectiveDisplayed(1000, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(1050)
    Self.SetObjectiveCompleted(1050, True)
  EndIf
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1180_Item_00()
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1110, True, False)
EndFunction

Function Fragment_Stage_1182_Item_00()
  FC03_SpaceEncounterQuest.Start()
  Self.SetObjectiveCompleted(1110, True)
  Self.SetObjectiveDisplayed(1125, True, False)
EndFunction

Function Fragment_Stage_1190_Item_00()
  Self.SetObjectiveCompleted(1125, True)
  Self.SetObjectiveDisplayed(1130, True, False)
  FC03_NiaShipLandingScene.Start()
  Alias_NiaKaluShip.GetActorRef().EvaluatePackage(False)
  Alias_Nia.GetRef().moveto(FC03_NiaWaitMarker, 0.0, 0.0, 0.0, True, False)
  Alias_NiaKaluShip.GetRef().moveto(HopetownLandingMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1192_Item_00()
  Alias_Nia.GetActorRef().RemoveKeyword(Artifact_GravImmune)
  Alias_Nia.GetActorRef().SetRestrained(False)
  NiaKaluIsInjured.SetValue(0.0)
  Self.SetObjectiveCompleted(1130, True)
  Self.SetObjectiveDisplayed(1150, True, False)
  Alias_Birgit.GetRef().moveto(FC03_Birgit_St1300Marker, 0.0, 0.0, 0.0, True, False)
  Alias_Ron.GetRef().moveto(FC03_Ron_St1400Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1195_Item_00()
  Alias_Nia.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  FC03_NiaWalkTalkScene.Start()
  Alias_HopeOfficeDoor.GetRef().Unlock(False)
  Alias_HopeOfficeDoor.GetRef().SetOpen(False)
  Self.SetObjectiveCompleted(1150, True)
  Self.SetObjectiveDisplayed(1170, True, False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  FC03_HopeIntroScene.Start()
  Alias_Cosette.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1350_Item_00()
  Alias_Birgit.GetActorRef().EvaluatePackage(False)
  Alias_Nia.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1400_Item_00()
  Alias_Ron.GetActorRef().EvaluatePackage(False)
  Alias_GuardShips.EnableAll(False)
  Self.SetObjectiveCompleted(1170, True)
  Self.SetObjectiveDisplayed(1200, True, False)
EndFunction

Function Fragment_Stage_1550_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  Self.SetObjectiveDisplayed(1300, True, False)
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveCompleted(1300, True)
  Self.SetObjectiveDisplayed(1400, True, False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  Alias_Player.GetActorRef().SetValue(FC03_Completed, 1.0)
  FC04.Start()
  Self.Stop()
EndFunction
