ScriptName Fragments:Quests:QF_CF04_0023C6F1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property CF04_LoveLetter_Slate01Ref Auto Const mandatory
ObjectReference Property CF04_GalbankRecording_Slate01Ref Auto Const mandatory
ReferenceAlias Property Alias_CF04_Dumbrosky Auto Const mandatory
ReferenceAlias Property Alias_CF04_Vera Auto Const mandatory
ReferenceAlias Property Alias_CF04_Swist Auto Const mandatory
ObjectReference Property CF04_DumbroskyLockdownMarker Auto Const mandatory
ObjectReference Property CF04_SwistLockdownMarker Auto Const mandatory
ObjectReference Property CF04_VeraLockdownMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_Rokov Auto Const mandatory
ReferenceAlias Property Alias_CF04_LoveNote Auto Const mandatory
ReferenceAlias Property Alias_CF04_BankData Auto Const mandatory
ReferenceAlias Property Alias_CF04_GalbankCredentials Auto Const mandatory
ObjectReference Property CF04_SheilaDoorRef Auto Const mandatory
ReferenceAlias Property Alias_CF04_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF04_Toft Auto Const mandatory
ObjectReference Property CF03KibweWrapUpMarker Auto Const mandatory
ObjectReference Property CF03ToftWrapUpMarker Auto Const mandatory
ObjectReference Property CF03DelgadoWrapUpMarker Auto Const mandatory
ObjectReference Property CF03NaevaWrapUpMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_Delgado Auto Const mandatory
ReferenceAlias Property Alias_CF04_Naeva Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
LeveledItem Property LL_Credits_Large Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_CF04_StarviewPass Auto Const mandatory
ReferenceAlias Property Alias_CF04_GalbankGuard Auto Const mandatory
GlobalVariable Property CF04_VeraBribe Auto Const mandatory
GlobalVariable Property CF04_DumbroskyBribe Auto Const mandatory
GlobalVariable Property CF04_DumbroskyBribeDone Auto Const mandatory
GlobalVariable Property CF04_VeraBribeDone Auto Const mandatory
GlobalVariable Property CF04_SwistBribe Auto Const mandatory
GlobalVariable Property CF04_SwistBribeDone Auto Const mandatory
GlobalVariable Property CF04_GuardBribeDone Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ActorBase Property CF_LarryDumbrosky Auto Const mandatory
ActorBase Property CF_GabrielVera Auto Const mandatory
ActorBase Property CF_GalbankGuard Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF04_StartMarker Auto Const mandatory
ObjectReference Property CF04_BallroomMarker Auto Const mandatory
ObjectReference Property CF04_FastNilesMarker Auto Const mandatory
ObjectReference Property CF04_FastDumbroskyCabinMarker Auto Const mandatory
ObjectReference Property CF04_FastSabotageMarker Auto Const mandatory
ObjectReference Property CF04_FastGalbankMarker Auto Const mandatory
ObjectReference Property CF04_PlayerReturnsMarker Auto Const mandatory
ObjectReference Property CF01PlayerOpsMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_GalbankAccessCardAlias Auto Const mandatory
ObjectReference Property CF_ArchivesDoorInterior Auto Const mandatory
Quest Property CF03 Auto Const mandatory
ReferenceAlias Property Alias_CF04_Mathis Auto Const mandatory
ObjectReference Property CF04_AccessDoor01Ref Auto Const mandatory
ObjectReference Property CF04_AccessDoor02Ref Auto Const mandatory
ReferenceAlias Property Alias_CF04_Evidence_GalbankScheme Auto Const mandatory
ReferenceAlias Property Alias_CF04_SandinPass Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
ReferenceAlias Property Alias_CF04_ClaimID Auto Const mandatory
ReferenceAlias Property Alias_CF04_Sheila Auto Const mandatory
ReferenceAlias Property Alias_CF_ESAward Auto Const mandatory
GlobalVariable Property CF04_ESAwardNoRokov Auto Const mandatory
GlobalVariable Property CF04_ESAwardWithRokov Auto Const mandatory
ReferenceAlias Property Alias_CF04_Sandin Auto Const mandatory
ObjectReference Property CF04_RokovInitMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_SheilaEvidence Auto Const mandatory
ObjectReference Property CF04_SheilaLockdownMarker Auto Const mandatory
ObjectReference Property CF04_VeraDoorRef Auto Const mandatory
ObjectReference Property CF04_SwistDoorRef Auto Const mandatory
ObjectReference Property CF04_DumbroskyDoorRef Auto Const mandatory
Quest Property LC102LifeSupportSequence Auto Const mandatory
GlobalVariable Property CF04_SandinBribe Auto Const mandatory
ReferenceAlias Property Alias_CF04_Murata Auto Const mandatory
ObjectReference Property CF04_PurserSafeCombatRef Auto Const mandatory
ObjectReference Property CF04_PurserSafeRef Auto Const mandatory
ObjectReference Property CF04_FastSwistPreMarker Auto Const mandatory
ObjectReference Property CF04_FastVeraMarker Auto Const mandatory
ObjectReference Property CF04_DumbroskyCabinMarker Auto Const mandatory
ObjectReference Property CF04_PlayerExitingMarker Auto Const mandatory
ObjectReference Property CF05_Start100MarkerRef Auto Const mandatory
Quest Property CF04GalbankArchivesAmbush Auto Const mandatory
ReferenceAlias Property Alias_CF04_EclipticBoss Auto Const mandatory
Scene Property CF04_StageXXX_SirenEmergencyScene_Interior Auto Const mandatory
Scene Property CF04_StageXXX_SirenEmergencyScene_Exterior Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
ObjectReference Property CF04_SandboxAfterTalkRef Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ObjectReference Property CF04_scLc102MarkerRef Auto Const mandatory
ObjectReference Property CF04StartCrew01Ref Auto Const mandatory
ObjectReference Property VigilancePlayerOpsMarker Auto Const mandatory
GlobalVariable Property CF04_DumbroskyBlock Auto Const mandatory
ObjectReference Property CF04_CombatEnablerRef Auto Const mandatory
ReferenceAlias Property Alias_CF04_Jazz Auto Const mandatory
Quest Property LC102Combat Auto Const mandatory
GlobalVariable Property CF04_UCArrested Auto Const mandatory
Faction Property LC102_SecurityFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ObjectReference Property CF04_LifeSupportAccessComputerRef Auto Const mandatory
ObjectReference Property CF_Key_RokovMarker Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
ObjectReference Property CF04BallroomDoorRef02 Auto Const mandatory
ObjectReference Property CF04_RokovCombatExitMarker Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB21_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_StartMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_FastSwistPreMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_FastSabotageMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_FastVeraMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(150)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_DumbroskyCabinMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(150)
  Self.SetStage(160)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_PlayerExitingMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(310)
  Self.SetStage(330)
  Self.SetStage(340)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_FastGalbankMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(310)
  Self.SetStage(330)
  Self.SetStage(340)
  Self.SetStage(343)
  Self.SetStage(346)
  Self.SetStage(350)
  Self.SetStage(360)
  Self.SetStage(370)
  Self.SetStage(410)
  Self.SetStage(420)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF04_PlayerReturnsMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(310)
  Self.SetStage(330)
  Self.SetStage(340)
  Self.SetStage(343)
  Self.SetStage(346)
  Self.SetStage(350)
  Self.SetStage(360)
  Self.SetStage(370)
  Self.SetStage(410)
  Self.SetStage(420)
  Self.SetStage(430)
  Self.SetStage(450)
  Self.SetStage(460)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(CF05_Start100MarkerRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Self.SetStage(15)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(310)
  Self.SetStage(330)
  Self.SetStage(340)
  Self.SetStage(343)
  Self.SetStage(346)
  Self.SetStage(350)
  Self.SetStage(360)
  Self.SetStage(370)
  Self.SetStage(410)
  Self.SetStage(420)
  Self.SetStage(430)
  Self.SetStage(450)
  Self.SetStage(460)
  Self.SetStage(510)
  Self.SetStage(520)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(VigilancePlayerOpsMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetStage(15)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(15, True, False)
  CF04_scLc102MarkerRef.Enable(False)
  If CF03.GetStageDone(360) == True
    Alias_CF04_Mathis.GetActorRef().Disable(False)
  EndIf
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_RokovInitMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0018_Item_00()
  If Self.IsObjectiveDisplayed(510) == True
    Self.SetObjectiveDisplayed(510, False, False)
    Self.SetStage(1000)
  EndIf
  If Self.IsObjectiveDisplayed(520) == True
    Self.SetObjectiveDisplayed(520, False, False)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(15, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
  LC102Combat.SetStage(0)
EndFunction

Function Fragment_Stage_0031_Item_00()
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetStage(50)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().AddItem(Alias_CF04_StarviewPass.GetRef() as Form, 1, False)
  CF04_SandboxAfterTalkRef.Enable(False)
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0050_Item_00()
  CF_LarryDumbrosky.SetEssential(False)
  CF_LarryDumbrosky.SetProtected(True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(60, True, False)
  CF04StartCrew01Ref.Enable(False)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF04_LoveNote.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
  LC102LifeSupportSequence.Start()
EndFunction

Function Fragment_Stage_0106_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0107_Item_00()
  Self.SetStage(250)
  Alias_CF04_Sandin.GetActorRef().AddItem(Alias_CF04_SandinPass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
  Alias_CF04_Sandin.GetActorRef().EvaluatePackage(False)
  If Self.GetStageDone(107) == False
    Game.GetPlayer().AddItem(Alias_CF04_SandinPass.GetRef() as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
  CF04_AccessDoor01Ref.SetLockLevel(0)
  CF04_AccessDoor01Ref.Unlock(False)
  CF04_AccessDoor02Ref.SetLockLevel(0)
  CF04_AccessDoor02Ref.Unlock(False)
  CF04_AccessDoor01Ref.SetOpen(True)
  CF04_AccessDoor02Ref.SetOpen(True)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
  Alias_CF04_Dumbrosky.GetActorRef().MoveTo(CF04_DumbroskyLockdownMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Dumbrosky.GetActorRef().EvaluatePackage(False)
  Alias_CF04_Swist.GetActorRef().MoveTo(CF04_SwistLockdownMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Swist.GetActorRef().EvaluatePackage(False)
  Alias_CF04_Vera.GetActorRef().MoveTo(CF04_VeraLockdownMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Vera.GetActorRef().EvaluatePackage(False)
  Alias_CF04_Sheila.GetActorRef().MoveTo(CF04_SheilaLockdownMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Sheila.GetActorRef().EvaluatePackage(False)
  CF04_SheilaDoorRef.SetLockLevel(0)
  CF04_SheilaDoorRef.Unlock(False)
  CF04_DumbroskyDoorRef.SetLockLevel(0)
  CF04_DumbroskyDoorRef.Unlock(False)
  CF04_SwistDoorRef.SetLockLevel(0)
  CF04_SwistDoorRef.Unlock(False)
  CF04_VeraDoorRef.SetLockLevel(0)
  CF04_VeraDoorRef.Unlock(False)
  CF_GabrielVera.SetEssential(False)
  CF_GabrielVera.SetProtected(True)
  Alias_CF04_Murata.GetActorRef().Disable(False)
  CF04_StageXXX_SirenEmergencyScene_Interior.Start()
  CF04_StageXXX_SirenEmergencyScene_Exterior.Start()
EndFunction

Function Fragment_Stage_0145_Item_00()
  Alias_CF04_Vera.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_CF04_Vera.GetActorRef().Setvalue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0148_Item_00()
  If CF04_VeraBribeDone.GetValue() == 0.0
    Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None)
    CF04_VeraBribeDone.Setvalue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0149_Item_00()
  If Self.IsObjectiveDisplayed(130) == True
    Self.SetObjectiveDisplayed(130, False, False)
  EndIf
  If Self.GetStageDone(150) == False
    Self.SetObjectiveDisplayed(140, True, False)
    Alias_CF04_Vera.GetActorRef().AddItem(Alias_CF04_BankData.GetRef() as Form, 1, False)
    Alias_CF04_Vera.GetActorRef().AddItem(Alias_CF04_Evidence_GalbankScheme.GetRef() as Form, 1, False)
  EndIf
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Self.IsObjectiveDisplayed(130) == True
    Self.SetObjectiveCompleted(130, True)
  EndIf
  If Self.IsObjectiveDisplayed(140) == True
    Self.SetObjectiveCompleted(140, True)
  EndIf
  Self.SetObjectiveDisplayed(150, True, False)
  If Self.GetStageDone(149) == False
    Game.GetPlayer().AddItem(Alias_CF04_BankData.GetRef() as Form, 1, False)
    Game.GetPlayer().AddItem(Alias_CF04_Evidence_GalbankScheme.GetRef() as Form, 1, False)
  EndIf
  If Self.GetStageDone(250) == False
    Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_PlayerExitingMarker, 0.0, 0.0, 0.0, True, False)
    Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0155_Item_00()
  Alias_CF04_Dumbrosky.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_CF04_Dumbrosky.GetActorRef().Setvalue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0158_Item_00()
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveCompleted(50, True)
  EndIf
  If Self.IsObjectiveDisplayed(260) == True
    Self.SetObjectiveCompleted(260, True)
  EndIf
  If Self.GetStageDone(160) == False
    Alias_CF04_Dumbrosky.GetActorRef().AddItem(Alias_CF04_GalbankCredentials.GetRef() as Form, 1, False)
  EndIf
  If Self.GetStageDone(250) == False
    Self.SetStage(250)
  EndIf
  If Self.GetStageDone(260) == True && Self.GetStageDone(160) == False
    Self.SetStage(270)
  EndIf
  If Self.GetStageDone(158) == True && Self.GetStageDone(160) == True
    Self.SetStage(280)
  EndIf
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_RokovCombatExitMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0158_Item_01()
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveCompleted(50, True)
  EndIf
  If Self.IsObjectiveDisplayed(260) == True
    Self.SetObjectiveCompleted(260, True)
  EndIf
  If Self.GetStageDone(250) == False
    Self.SetStage(250)
  EndIf
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_RokovCombatExitMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(170, True, False)
  If Self.GetStageDone(158) == False
    Game.GetPlayer().RemoveItem(Alias_CF04_BankData.GetRef() as Form, 1, False, None)
    Game.GetPlayer().AddItem(Alias_CF04_GalbankCredentials.GetRef() as Form, 1, False)
    If Self.IsObjectiveDisplayed(50) == True
      Self.SetObjectiveDisplayed(50, False, False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0248_Item_00()
  Self.SetObjectiveCompleted(140, True)
EndFunction

Function Fragment_Stage_0250_Item_00()
  LC102_SecurityFaction.SetEnemy(PlayerFaction, False, False)
  If Self.IsObjectiveCompleted(30) == False
    Self.SetObjectiveDisplayed(30, False, False)
  EndIf
  If Self.IsObjectiveCompleted(40) == False
    Self.SetObjectiveDisplayed(40, False, False)
  EndIf
  If Self.IsObjectiveCompleted(50) == False
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveCompleted(60) == False
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
  If Self.IsObjectiveCompleted(70) == False
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
  If Self.IsObjectiveCompleted(90) == False
    Self.SetObjectiveDisplayed(90, False, False)
  EndIf
  If Self.IsObjectiveCompleted(100) == False
    Self.SetObjectiveDisplayed(100, False, False)
  EndIf
  If Self.IsObjectiveCompleted(110) == False
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
  If Self.IsObjectiveCompleted(120) == False
    Self.SetObjectiveDisplayed(120, False, False)
  EndIf
  If Self.IsObjectiveCompleted(130) == False
    Self.SetObjectiveDisplayed(130, False, False)
  EndIf
  If Self.IsObjectiveCompleted(140) == False
    Self.SetObjectiveDisplayed(140, False, False)
  EndIf
  If Self.IsObjectiveCompleted(150) == False
    Self.SetObjectiveDisplayed(150, False, False)
  EndIf
  If Self.IsObjectiveCompleted(170) == False
    Self.SetObjectiveDisplayed(170, False, False)
  EndIf
  If Self.IsObjectiveCompleted(600) == False
    Self.SetObjectiveDisplayed(600, False, False)
  EndIf
  If Self.IsObjectiveCompleted(610) == False
    Self.SetObjectiveDisplayed(610, False, False)
  EndIf
  If Self.IsObjectiveCompleted(620) == False
    Self.SetObjectiveDisplayed(620, False, False)
  EndIf
  If Self.IsObjectiveCompleted(630) == False
    Self.SetObjectiveDisplayed(630, False, False)
  EndIf
  If Self.IsObjectiveCompleted(640) == False
    Self.SetObjectiveDisplayed(640, False, False)
  EndIf
  If Self.GetStageDone(158) == False
    Self.SetStage(260)
  EndIf
  If Self.GetStageDone(158) == True && Self.GetStageDone(160) == False
    Self.SetStage(270)
  EndIf
  If Self.GetStageDone(158) == True && Self.GetStageDone(160) == True
    Self.SetStage(280)
  EndIf
  If Self.GetStageDone(630) == False
    CF04_PurserSafeCombatRef.Enable(False)
    CF04_PurserSafeRef.Disable(False)
  EndIf
  CF04_CombatEnablerRef.Enable(False)
  CF04BallroomDoorRef02.SetLockLevel(0)
  CF04BallroomDoorRef02.Unlock(False)
  CF_LarryDumbrosky.SetEssential(False)
  CF_LarryDumbrosky.SetProtected(True)
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  Self.SetObjectiveDisplayed(260, True, False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.IsObjectiveDisplayed(260) == True
    Self.SetObjectiveCompleted(260, True)
  EndIf
  Self.SetObjectiveDisplayed(270, True, False)
EndFunction

Function Fragment_Stage_0280_Item_00()
  Self.SetObjectiveCompleted(270, True)
  Self.SetObjectiveDisplayed(280, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  If Self.IsObjectiveDisplayed(170) == True
    Self.SetObjectiveCompleted(170, True)
  EndIf
  If Self.IsObjectiveDisplayed(280) == True
    Self.SetObjectiveCompleted(280, True)
  EndIf
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  Self.SetObjectiveDisplayed(310, True, False)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetObjectiveCompleted(310, True)
  Self.SetObjectiveDisplayed(330, True, False)
  CF_GalbankGuard.SetEssential(False)
  CF_GalbankGuard.SetProtected(True)
  CF04GalbankArchivesAmbush.Start()
EndFunction

Function Fragment_Stage_0340_Item_00()
  Self.SetObjectiveCompleted(330, True)
  Self.SetObjectiveDisplayed(340, True, False)
EndFunction

Function Fragment_Stage_0344_Item_00()
  Alias_CF04_GalbankGuard.GetActorRef().AddItem(Alias_CF04_GalbankAccessCardAlias.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(340, True)
  Self.SetObjectiveDisplayed(346, True, False)
EndFunction

Function Fragment_Stage_0345_Item_00()
  Alias_CF04_GalbankGuard.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_CF04_GalbankGuard.GetActorRef().Setvalue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0346_Item_00()
  CF_ArchivesDoorInterior.Unlock(False)
  Alias_CF04_GalbankGuard.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(340, True)
  Self.SetObjectiveDisplayed(346, True, False)
EndFunction

Function Fragment_Stage_0347_Item_00()
  Alias_CF04_GalbankGuard.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(346, True)
  Self.SetObjectiveDisplayed(350, True, False)
  Alias_CF04_GalbankGuard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(370, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(370, True)
  Self.SetObjectiveDisplayed(410, True, False)
  Alias_CF04_Delgado.GetActorRef().Enable(False)
  Alias_CF04_Delgado.GetActorRef().MoveTo(CF03DelgadoWrapUpMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF04_Naeva.GetActorRef().Enable(False)
  Alias_CF04_Naeva.GetActorRef().MoveTo(CF03NaevaWrapUpMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Naeva.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(410, True)
  Self.SetObjectiveDisplayed(420, True, False)
  If Self.GetStageDone(680) == False
    If Self.IsObjectiveDisplayed(600) == True
      Self.SetObjectiveDisplayed(600, False, False)
    EndIf
    If Self.IsObjectiveDisplayed(610) == True
      Self.SetObjectiveDisplayed(610, False, False)
    EndIf
    If Self.IsObjectiveDisplayed(620) == True
      Self.SetObjectiveDisplayed(620, False, False)
    EndIf
    If Self.IsObjectiveDisplayed(630) == True
      Self.SetObjectiveDisplayed(630, False, False)
    EndIf
    If Self.IsObjectiveDisplayed(640) == True
      Self.SetObjectiveDisplayed(640, False, False)
    EndIf
  EndIf
  CF04_StageXXX_SirenEmergencyScene_Interior.Stop()
  CF04_StageXXX_SirenEmergencyScene_Exterior.Stop()
EndFunction

Function Fragment_Stage_0430_Item_00()
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF_Key_RokovMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF04_Rokov.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet)
  Alias_CF04_Rokov.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False)
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0435_Item_00()
  CrimsonFleetCaptainState_Rokov.Setvalue(1.0)
EndFunction

Function Fragment_Stage_0440_Item_00()
  CrimsonFleetCaptainState_Rokov.Setvalue(1.0)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(420, True)
  Self.SetObjectiveDisplayed(450, True, False)
  Alias_CF04_Naeva.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0460_Item_00()
  Self.SetObjectiveCompleted(450, True)
  Self.SetObjectiveDisplayed(460, True, False)
  Alias_CF04_Naeva.GetActorRef().EvaluatePackage(False)
  If Self.GetStageDone(680) == True
    Self.SetObjectiveDisplayed(680, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0510_Item_00()
  If CF_SysDefShutdown.GetValue() == 0.0
    Self.SetObjectiveCompleted(460, True)
    Self.SetObjectiveDisplayed(510, True, False)
    Alias_CF04_Kibwe.GetActorRef().Enable(False)
    Alias_CF04_Kibwe.GetActorRef().MoveTo(CF03KibweWrapUpMarker, 0.0, 0.0, 0.0, True, False)
    Alias_CF04_Kibwe.GetActorRef().EvaluatePackage(False)
    Alias_CF04_Toft.GetActorRef().Enable(False)
    Alias_CF04_Toft.GetActorRef().MoveTo(CF03ToftWrapUpMarker, 0.0, 0.0, 0.0, True, False)
    Alias_CF04_Toft.GetActorRef().EvaluatePackage(False)
  ElseIf CF_SysDefShutdown.GetValue() == 1.0
    Self.SetObjectiveCompleted(460, True)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(510, True)
  Self.SetObjectiveDisplayed(520, True, False)
EndFunction

Function Fragment_Stage_0530_Item_00()
  CF_Main.SetStage(250)
EndFunction

Function Fragment_Stage_0540_Item_00()
  CF_Main.SetStage(275)
  CF04_UCArrested.Setvalue(1.0)
EndFunction

Function Fragment_Stage_0545_Item_00()
  CF_Main.SetStage(300)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0605_Item_00()
  If Self.GetStageDone(640) == False
    Alias_CF04_Sheila.GetActorRef().AddItem(Alias_CF04_ClaimID.GetRef() as Form, 1, False)
  EndIf
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(610, True, False)
  Alias_CF04_Sheila.GetActorRef().Enable(False)
EndFunction

Function Fragment_Stage_0617_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF04_SheilaEvidence.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveCompleted(610, True)
  Self.SetObjectiveDisplayed(620, True, False)
EndFunction

Function Fragment_Stage_0625_Item_00()
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveCompleted(620, True)
  Self.SetObjectiveDisplayed(630, True, False)
EndFunction

Function Fragment_Stage_0640_Item_00()
  Self.SetObjectiveCompleted(630, True)
  Self.SetObjectiveDisplayed(640, True, False)
  If Self.IsObjectiveDisplayed(610) == True
    Self.SetObjectiveDisplayed(610, False, False)
  EndIf
  If Self.GetStageDone(617) == True
    Game.GetPlayer().RemoveItem(Alias_CF04_SheilaEvidence.GetRef() as Form, 1, False, None)
  EndIf
  Game.GetPlayer().AddItem(Alias_CF04_ClaimID.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Game.GetPlayer().AddItem(Alias_CF04_SheilaEvidence.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0680_Item_00()
  Self.SetObjectiveCompleted(640, True)
EndFunction

Function Fragment_Stage_0685_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF_ESAward.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Credits as Form, CF04_ESAwardNoRokov.GetValueInt(), False)
  Self.SetObjectiveCompleted(680, True)
EndFunction

Function Fragment_Stage_0690_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF_ESAward.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Credits as Form, CF04_ESAwardWithRokov.GetValueInt(), False)
  Self.SetObjectiveCompleted(680, True)
EndFunction

Function Fragment_Stage_0695_Item_00()
  Self.SetObjectiveCompleted(680, True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(520, True)
  CF04_scLc102MarkerRef.Disable(False)
  LC082.UpdateVigilanceLocation("CF05")
  CF05.SetStage(100)
  If Self.GetStageDone(158)
    Float currentGameTime = Utility.GetCurrentGameTime()
    SE_Player_FAB21_Timestamp.Setvalue(currentGameTime + cooldownDays)
  EndIf
  Self.Stop()
EndFunction
