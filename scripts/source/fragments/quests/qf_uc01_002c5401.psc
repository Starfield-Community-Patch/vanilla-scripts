ScriptName Fragments:Quests:QF_UC01_002C5401 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC01_200_RegistrationCompleteScene Auto Const
ReferenceAlias Property Alias_CurrentOrientationTarget Auto Const mandatory
ReferenceAlias Property Alias_OrientTarget01 Auto Const mandatory
Scene Property UC01_300_ProceedToExam Auto Const mandatory
GlobalVariable Property UC01_SectorReleaseCountActivated Auto Const mandatory
ReferenceAlias Property Alias_MainExamDoor Auto Const mandatory
ObjectReference Property UC01_OrientDebugMarker Auto Const mandatory
ObjectReference Property DebugMarkerStage100 Auto Const
Scene Property UC01_100_TualaIntroScene Auto Const mandatory
ObjectReference Property PrePilotExamDebugMarker Auto Const
ReferenceAlias Property Alias_PilotsExamDoor Auto Const mandatory
Scene Property UC01_410_PilotsEntranceScene Auto Const mandatory
ReferenceAlias Property Alias_PilotExamSeat Auto Const mandatory
Scene Property UC01_600_ReturntoTuala Auto Const mandatory
ReferenceAlias Property Alias_QuickExitToMAST Auto Const mandatory
ReferenceAlias Property Alias_FromPilotExamDoor Auto Const mandatory
LocationAlias Property Alias_PlayerBackgroundLoc Auto Const mandatory
Location Property UC01_UnknownLocation Auto Const mandatory
LeveledItem Property LL_Grendel_Simple Auto Const mandatory
Ammo Property Ammo777mm Auto Const mandatory
Weapon Property FragGrenade Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
Message Property UC01_DEBUG_StealthFixes Auto Const mandatory
GlobalVariable Property UC01_Adaptability_FoundASecretPath Auto Const mandatory
GlobalVariable Property UC01_ResultGlobal Auto Const mandatory
ReferenceAlias Property Alias_Tuala Auto Const mandatory
Message Property UC01_DEBUG_BeaWalkNotWorking Auto Const mandatory
GlobalVariable Property UC01_ShipSim_PlayerKillCount Auto Const mandatory
Quest Property UC02 Auto Const mandatory
ObjectReference Property DebugMarker07 Auto Const
Message Property UC01_DEBUG_ApproachSectorA Auto Const mandatory
Message Property UC01_DEBUG_TheStoryThusFar Auto Const mandatory
Message Property UC01_DEBUG_Murals Auto Const mandatory
Armor Property Spacesuit_UCVanguard_Body_LightArmored Auto Const mandatory
Armor Property Spacesuit_UCVanguard_Helmet_Armored Auto Const mandatory
Faction Property PlayerVanguardFaction Auto Const mandatory
Quest Property UC01_ShipSimulatorHelperQuest Auto Const mandatory
Perk Property FactionUnitedColoniesVanguardPerk Auto Const mandatory
ReferenceAlias Property Alias_PilotExamEntranceTrigger Auto Const mandatory
Message Property UC01_DEBUG_DontBug Auto Const mandatory
Quest Property UC_Tuala_Misc Auto Const mandatory
Quest Property UC_NA_CL_VanguardScene Auto Const mandatory
Key Property VanguardCourseElevatorKey Auto Const mandatory
Quest Property MQ204_NA_StateChangeHandler Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0355_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0395_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0001_Item_00()
  UC01_DEBUG_TheStoryThusFar.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(100)
  Game.GetPlayer().MoveTo(DebugMarkerStage100, 0.0, 0.0, 0.0, True, False)
  UC01_100_TualaIntroScene.Start()
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Game.GetPlayer().MoveTo(UC01_OrientDebugMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Self.SetStage(300)
  Game.GetPlayer().MoveTo(PrePilotExamDebugMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(410)
  UC01_410_PilotsEntranceScene.Stop()
  Self.SetStage(450)
  Alias_PilotExamSeat.GetRef().Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveCompleted(100, True)
  UC01_ShipSim_PlayerKillCount.SetValue(3.0)
  Self.SetStage(600)
  Game.GetPlayer().MoveTo(DebugMarkerStage100, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Self.SetStage(310)
  Self.SetObjectiveCompleted(200, True)
  Game.GetPlayer().MoveTo(DebugMarker07, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0011_Item_00()
  UC01_ShipSimulatorHelperQuest.SetStage(1000)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  If UC_Tuala_Misc.GetStageDone(100)
    UC_Tuala_Misc.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_CurrentOrientationTarget.ForceRefTo(Alias_OrientTarget01.GetRef())
  UC01_200_RegistrationCompleteScene.Start()
  Game.GetPlayer().AddItem(VanguardCourseElevatorKey as Form, 1, True)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetObjectiveDisplayedAtTop(300)
EndFunction

Function Fragment_Stage_0299_Item_00()
  (Alias_QuickExitToMAST.GetRef() as loadelevatorfloorscript).SetAccessible(True)
  If !Self.IsObjectiveCompleted(200)
    Self.SetObjectiveDisplayed(200, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.IsObjectiveCompleted(200)
    Self.SetObjectiveDisplayed(200, False, False)
  EndIf
  If !Self.GetStageDone(400)
    Self.SetObjectiveDisplayed(301, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0302_Item_00()
  Self.SetObjectiveCompleted(301, True)
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  PlayREF.AddItem(LL_Grendel_Simple as Form, 1, False)
  PlayREF.AddItem(Ammo777mm as Form, 100, False)
  PlayREF.AddItem(FragGrenade as Form, 5, False)
  PlayREF.AddItem(Aid_MedPack as Form, 3, False)
EndFunction

Function Fragment_Stage_0303_Item_00()
  If Self.GetStageDone(302)
    Self.SetStage(304)
  EndIf
EndFunction

Function Fragment_Stage_0304_Item_00()
  Self.SetObjectiveCompleted(301, True)
EndFunction

Function Fragment_Stage_0305_Item_00()
  If !Self.GetStageDone(400)
    Self.SetObjectiveDisplayed(315, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0306_Item_00()
  Self.SetObjectiveCompleted(315, True)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.UpdateCurrentInstanceGlobal(UC01_SectorReleaseCountActivated)
  Self.SetObjectiveDisplayed(310, True, False)
EndFunction

Function Fragment_Stage_0325_Item_00()
  If !Self.GetStageDone(400)
    UC01_Adaptability_FoundASecretPath.Mod(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0331_Item_00()
  UC01_DEBUG_StealthFixes.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0345_Item_00()
  If !Self.GetStageDone(400)
    UC01_Adaptability_FoundASecretPath.Mod(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0349_Item_00()
  If !Self.GetStageDone(400)
    Self.SetObjectiveFailed(340, True)
    Self.SetObjectiveFailed(360, True)
    Self.SetObjectiveFailed(370, True)
  Else
    Self.SetStage(348)
  EndIf
EndFunction

Function Fragment_Stage_0360_Item_00()
  If !Self.GetStageDone(370) && !Self.GetStageDone(400)
    Self.SetObjectiveDisplayed(360, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0362_Item_00()
  If Self.GetStageDone(364) && Self.GetStageDone(366)
    Self.SetStage(370)
  EndIf
EndFunction

Function Fragment_Stage_0364_Item_00()
  If Self.GetStageDone(362) && Self.GetStageDone(366)
    Self.SetStage(370)
  EndIf
EndFunction

Function Fragment_Stage_0366_Item_00()
  If Self.GetStageDone(364) && Self.GetStageDone(362)
    Self.SetStage(370)
  EndIf
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(360)
    Self.SetObjectiveCompleted(360, True)
    Self.SetObjectiveDisplayed(370, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0371_Item_00()
  Self.SetObjectiveCompleted(370, True)
EndFunction

Function Fragment_Stage_0390_Item_00()
  If !Self.GetStageDone(400)
    UC01_Adaptability_FoundASecretPath.Mod(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0399_Item_00()
  Self.SetStage(401)
  Alias_PilotsExamDoor.GetRef().Unlock(False)
  Self.SetObjectiveFailed(300, True)
  Self.SetObjectiveFailed(310, True)
  If !Self.IsObjectiveCompleted(301)
    Self.SetObjectiveDisplayed(301, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(360)
    Self.SetObjectiveDisplayed(360, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(370)
    Self.SetObjectiveDisplayed(370, False, False)
  EndIf
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(401)
  Alias_PilotsExamDoor.GetRef().Unlock(False)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(310, True)
  If !Self.IsObjectiveCompleted(301)
    Self.SetObjectiveDisplayed(301, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(360)
    Self.SetObjectiveDisplayed(360, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(370)
    Self.SetObjectiveDisplayed(370, False, False)
  EndIf
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  If !Self.IsObjectiveCompleted(200)
    Self.SetObjectiveDisplayed(200, False, False)
  EndIf
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(410, True, False)
  Alias_PilotExamSeat.GetRef().BlockActivation(False, False)
  UC01_410_PilotsEntranceScene.Start()
EndFunction

Function Fragment_Stage_0425_Item_00()
  Self.SetStage(420)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0599_Item_00()
  UC01_600_ReturntoTuala.Start()
EndFunction

Function Fragment_Stage_0600_Item_00()
  If !UC_NA_CL_VanguardScene.GetStageDone(1000)
    UC_NA_CL_VanguardScene.SetStage(999)
  EndIf
  Alias_FromPilotExamDoor.GetRef().Unlock(False)
  Self.SetObjectiveCompleted(410, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0641_Item_00()
  UC01_ResultGlobal.SetValue(5.0)
EndFunction

Function Fragment_Stage_0642_Item_00()
  UC01_ResultGlobal.SetValue(4.0)
EndFunction

Function Fragment_Stage_0643_Item_00()
  UC01_ResultGlobal.SetValue(3.0)
EndFunction

Function Fragment_Stage_0644_Item_00()
  UC01_ResultGlobal.SetValue(2.0)
EndFunction

Function Fragment_Stage_0645_Item_00()
  UC01_ResultGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(650, True, False)
  Alias_Tuala.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveCompleted(650, True)
  Self.SetObjectiveDisplayed(660, True, False)
EndFunction

Function Fragment_Stage_0690_Item_00()
  Alias_Tuala.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0694_Item_00()
  Alias_Tuala.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddToFaction(PlayerVanguardFaction)
  PlayACT.AddPerk(FactionUnitedColoniesVanguardPerk, False)
  If MQ204_NA_StateChangeHandler.IsRunning() && !MQ204_NA_StateChangeHandler.GetStageDone(100)
    MQ204_NA_StateChangeHandler.SetStage(100)
  EndIf
  UC02.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
