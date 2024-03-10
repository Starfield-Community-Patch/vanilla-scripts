ScriptName Fragments:Quests:QF_FC02_002944B8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property FC02_PT1 Auto Const mandatory
Scene Property FC02_EmmaWalktoHannahScene Auto Const mandatory
Scene Property FC02_EmmaHandoffToHannahScene Auto Const mandatory
ReferenceAlias Property Alias_Hannah Auto Const mandatory
ObjectReference Property FC02_HannahWaitNearShipMarker Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC02_TempPlayerStage600Marker Auto Const mandatory
ObjectReference Property FC02_TempHannahStage600Marker Auto Const mandatory
ReferenceAlias Property Alias_Molly Auto Const mandatory
ObjectReference Property FC02_MaryStage600PackageMarker Auto Const mandatory
Scene Property FC02_HannahStartTrackingScene Auto Const mandatory
ObjectReference Property FC02_RuffiansEnableMarkerRef Auto Const mandatory
ObjectReference Property FC02_PT4 Auto Const mandatory
ObjectReference Property FC02_PT4_HannahMarker Auto Const mandatory
Scene Property FC02_HannaConcludeScene Auto Const mandatory
ObjectReference Property FC02_PT2 Auto Const mandatory
ObjectReference Property FC02_SetStage420Trigger Auto Const mandatory
Message Property FC02_BanditTracksActivatorA_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorB_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorC_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorD_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorE_MSG Auto Const mandatory
Faction Property FreestarRangerFaction Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksE Auto Const mandatory
Faction Property FC02_RuffianEnemyFaction Auto Const mandatory
Quest Property FC03 Auto Const mandatory
Scene Property FC02_MikaelaFlagDownScene Auto Const mandatory
Key Property TEMP_FreestarRangerBadge_Deputy Auto Const mandatory
Scene Property FC02_HelgaTrackingComment01Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment02Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment03Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment04Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment05Scene Auto Const mandatory
Scene Property FC02_HelgaRuffiansDeadScene Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property AkilaCityShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ObjectReference Property FC_PTRockDoor Auto Const mandatory
GlobalVariable Property MissionBoardAccessAllowed_FCR Auto Const mandatory
Perk Property FactionFreestarCollectivePerk Auto Const mandatory
ReferenceAlias Property Alias_Emma Auto Const mandatory
Quest Property FC01 Auto Const mandatory
Scene Property FC02_EmmaReportToBlakeScene Auto Const mandatory
Scene Property FC02_EmmaTrackingComment06Scene Auto Const mandatory
Scene Property FC02_EmmaTrackingComment07Scene Auto Const mandatory
Scene Property FC02_EmmaTrackingComment08Scene Auto Const mandatory
ReferenceAlias Property Alias_Chest Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
Quest Property FC02_BE_Quest Auto Const mandatory
ReferenceAlias Property Alias_WFIntroTrigger Auto Const mandatory
ReferenceAlias Property Alias_Waylon Auto Const mandatory
ReferenceAlias Property Alias_MikaelaStage500Marker Auto Const mandatory
ReferenceAlias Property Alias_MissionTerminal Auto Const mandatory
ActorValue Property FreestarRangerRank Auto Const mandatory
ReferenceAlias Property Alias_FC02_BanditCamp_EnableMarker Auto Const mandatory
Scene Property FC02_BanditChatterScene Auto Const mandatory
ActorValue Property FC02_Completed Auto Const mandatory
Armor Property Clothes_Ranger_Vested_Deputy Auto Const mandatory
ObjectReference Property FC02_BootprintEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Ruffian01 Auto Const mandatory
ObjectReference Property FC02_EmmaMoveToCampMarker Auto Const mandatory
GlobalVariable Property FC02_EmmaSandboxCampGlobal Auto Const mandatory
Armor Property Clothes_Ranger_Hat_Deputy Auto Const mandatory
GlobalVariable Property FC02_EmmaFollowing Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksA Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksD Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksC Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksB Auto Const mandatory
ReferenceAlias Property Alias_RuffianLeader Auto Const mandatory
ObjectReference Property FC02_Ruffian02Ref Auto Const mandatory
ReferenceAlias Property Alias_DanielBlake Auto Const mandatory
LeveledItem Property LL_Weapon_FreestarRangersSidearm Auto Const mandatory
MiscObject Property FreeStarDeputyBadge Auto Const mandatory
ReferenceAlias Property Alias_DeputyBadge Auto Const mandatory
ObjectReference Property FC02_BlakeReadingBookMarker Auto Const mandatory
ObjectReference Property FC03_PT1 Auto Const mandatory
wwiseevent Property WwiseEvent_QST_FC02_InvestigateTracks Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0120_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0170_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0220_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0420_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_1025_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  FC01.SetStage(2000)
  Game.GetPlayer().moveto(FC02_PT1, 0.0, 0.0, 0.0, True, False)
  Alias_DanielBlake.GetRef().moveto(FC02_BlakeReadingBookMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.moveto(AkilaCityShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(AkilaCityShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_WFIntroTrigger.GetRef().Disable(False)
  Alias_Waylon.GetActorRef().EvaluatePackage(False)
  Alias_Molly.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FreestarRangerFaction)
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(200, True, False)
  FC02_EmmaWalktoHannahScene.Start()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_DeputyBadge.GetRef() as Form, 1, False)
  Alias_Player.GetActorRef().AddItem(LL_Weapon_FreestarRangersSidearm as Form, 1, False)
  Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Vested_Deputy as Form, 1, False)
  Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Hat_Deputy as Form, 1, False)
  Alias_Player.GetActorRef().SetValue(FreestarRangerRank, 1.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Alias_Hannah.GetActorRef().EvaluatePackage(False)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0417_Item_00()
  Alias_Hannah.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript
  Self.SetObjectiveCompleted(250, True)
  Self.SetObjectiveDisplayed(500, True, False)
  FC02_EmmaFollowing.SetValue(1.0)
  kmyQuest.CheckConditions(None)
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
  Actor EmmaWilcoxREF = Alias_Emma.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(EmmaWilcoxREF)
  Alias_FC02_BanditCamp_EnableMarker.GetRef().Enable(False)
  FC02_BootprintEnableMarker.Enable(False)
  Alias_BanditTracksA.GetReference().Enable(False)
  Alias_BanditTracksB.GetReference().Enable(False)
  Alias_BanditTracksC.GetReference().Enable(False)
  Alias_BanditTracksD.GetReference().Enable(False)
  Alias_BanditTracksE.GetReference().Enable(False)
  Alias_Molly.GetActorRef().moveto(Alias_MikaelaStage500Marker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Alias_Player.GetRef().moveto(FC02_TempPlayerStage600Marker, 0.0, 0.0, 0.0, True, False)
  Alias_Hannah.GetRef().moveto(FC02_TempHannahStage600Marker, 0.0, 0.0, 0.0, True, False)
  Alias_Molly.GetRef().moveto(FC02_MaryStage600PackageMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Actor HelgaDubrayREF = Alias_Hannah.GetActorRef()
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(HelgaDubrayREF)
EndFunction

Function Fragment_Stage_0610_Item_00()
  FC02_MikaelaFlagDownScene.Start()
EndFunction

Function Fragment_Stage_0615_Item_00()
  Alias_Emma.GetReference().moveto(FC03_PT1, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Alias_Molly.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  FC02_RuffiansEnableMarkerRef.Enable(False)
  Alias_RuffianLeader.GetActorRef().AddItem(Alias_Slate.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(800, True, False)
  FC02_HannahStartTrackingScene.Start()
EndFunction

Function Fragment_Stage_0820_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None)
  Utility.Wait(0.5)
  FC02_BanditTracksActivatorA_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  FC02_HelgaTrackingComment01Scene.Start()
  Alias_BanditTracksA.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_0830_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None)
  Utility.Wait(0.5)
  FC02_BanditTracksActivatorB_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  FC02_HelgaTrackingComment02Scene.Start()
  Alias_BanditTracksB.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_0840_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None)
  Utility.Wait(0.5)
  FC02_BanditTracksActivatorC_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  FC02_HelgaTrackingComment03Scene.Start()
  Alias_BanditTracksC.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_0850_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None)
  Utility.Wait(0.5)
  FC02_BanditTracksActivatorD_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  FC02_HelgaTrackingComment04Scene.Start()
  Alias_BanditTracksD.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  FC02_EmmaTrackingComment06Scene.Start()
EndFunction

Function Fragment_Stage_0910_Item_00()
  FC02_EmmaTrackingComment07Scene.Start()
EndFunction

Function Fragment_Stage_0920_Item_00()
  FC02_EmmaTrackingComment08Scene.Start()
EndFunction

Function Fragment_Stage_0950_Item_00()
  FC02_BanditChatterScene.Start()
  If Self.IsObjectiveDisplayed(800)
    Self.SetObjectiveCompleted(800, True)
    Self.SetObjectiveDisplayed(1000, True, False)
  EndIf
  (FC02_Ruffian02Ref as Actor).EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0970_Item_00()
  Alias_RuffianLeader.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None)
  Utility.Wait(0.5)
  FC02_BanditTracksActivatorE_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  FC02_HelgaTrackingComment05Scene.Start()
  Alias_BanditTracksE.GetReference().Disable(False)
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  (FC02_Ruffian02Ref as Actor).EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1010_Item_00()
  If Alias_Player.GetActorRef().GetDistance(Alias_Emma.GetRef()) > 30.0
    Alias_Emma.GetRef().moveto(FC02_EmmaMoveToCampMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_1050_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FC02_RuffianEnemyFaction)
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1050, True, False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  FC02_HelgaRuffiansDeadScene.Start()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveCompleted(1050, True)
  If !Self.GetStageDOne(1400)
    Self.SetObjectiveDisplayed(1075, True, False)
  EndIf
EndFunction

Function Fragment_Stage_1150_Item_00()
  Quest __temp = Self as Quest
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript
  If Self.IsObjectiveDisplayed(1000)
    Self.SetObjectiveDisplayed(1000, False, False)
  EndIf
  FC02_EmmaSandboxCampGlobal.SetValue(1.0)
  FC02_EmmaFollowing.SetValue(0.0)
  kmyQuest.CheckConditions(None)
  Self.SetObjectiveCompleted(1075, True)
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  If Self.IsObjectiveDisplayed(1075)
    Self.SetObjectiveDisplayed(1075, False, False)
  EndIf
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1300, True, False)
EndFunction

Function Fragment_Stage_1400_Item_00()
  If Self.IsObjectiveDisplayed(1075)
    Self.SetObjectiveDisplayed(1075, False, False)
  EndIf
  Self.SetObjectiveCompleted(1300, True)
  Self.SetObjectiveDisplayed(1400, True, False)
EndFunction

Function Fragment_Stage_1500_Item_00()
  Quest __temp = Self as Quest
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript
  Self.SetObjectiveCompleted(1400, True)
  FC02_EmmaSandboxCampGlobal.SetValue(0.0)
  FC02_EmmaFollowing.SetValue(1.0)
  kmyQuest.CheckConditions(None)
  If Self.GetStageDOne(630) == True
    Self.SetObjectiveDisplayed(1500, True, False)
  EndIf
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetStage(2000)
EndFunction

Function Fragment_Stage_1900_Item_00()
  Self.SetObjectiveCompleted(600, True)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript
  Self.CompleteAllObjectives()
  MissionBoardAccessAllowed_FCR.SetValue(1.0)
  FC02_EmmaFollowing.SetValue(0.0)
  kmyQuest.CheckConditions(None)
  Game.GetPlayer().AddPerk(FactionFreestarCollectivePerk, False)
  Alias_Player.GetActorRef().SetValue(FC02_Completed, 1.0)
  FC02_BE_Quest.SetStage(1000)
  FC03.Start()
  Game.AddAchievement(14)
  Self.Stop()
EndFunction
