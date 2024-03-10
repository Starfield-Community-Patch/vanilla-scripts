ScriptName Fragments:Quests:QF_FC06_001F0266 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC06_BenWalkAndTalkScene Auto Const mandatory
Scene Property FC06_BenAriScene Auto Const mandatory
ObjectReference Property FC06_PT1 Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_PrivacyWingKeycard Auto Const mandatory
ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const mandatory
Quest Property FC_EncryptedSlateQuest Auto Const mandatory
ReferenceAlias Property Alias_MayaEncryptedDataslate Auto Const mandatory
ReferenceAlias Property Alias_MayaCruz Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
GlobalVariable Property FC06_ClinicSystemsDisrupted Auto Const mandatory
ObjectReference Property FC06_MayasHideoutMapMarkerRef Auto Const mandatory
Scene Property FC06_MayaCruzPAGreetingScene Auto Const mandatory
ReferenceAlias Property Alias_PrivacyWingGuard Auto Const mandatory
ReferenceAlias Property Alias_VIPWingDoor Auto Const mandatory
Scene Property FC06_AriWalkToTerminal Auto Const mandatory
Scene Property FC06_AriSearchRecords Auto Const mandatory
ReferenceAlias Property Alias_AriMiller Auto Const mandatory
Key Property FC06_ClinicVIPWingKeycard Auto Const mandatory
ActorValue Property FC06_Completed Auto Const mandatory
ReferenceAlias Property Alias_ClinicShip Auto Const mandatory
Faction Property FC06_MayaCruzBoardingFaction Auto Const
Faction Property LC056MayaCruzFaction Auto Const mandatory
Quest Property FC06Post Auto Const mandatory
ReferenceAlias Property Alias_MayasHideoutMapMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_MayasHideoutMapMarker Auto Const mandatory
ReferenceAlias Property Alias_BenArmistead Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ReferenceAlias Property Alias_LC056_LoadElevatorController Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1050_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Alias_Player.GetActorRef().AddItem(Credits as Form, 500, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(100, True, False)
  FC06_ClinicSystemsDisrupted.SetValue(1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  FC06_BenWalkAndTalkScene.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  FC06_BenAriScene.Start()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_BenArmistead.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  FC06_AriWalkToTerminal.Start()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(310, True, False)
EndFunction

Function Fragment_Stage_0420_Item_00()
  FC06_AriSearchRecords.Start()
  Self.SetObjectiveCompleted(310, True)
  Self.SetObjectiveDisplayed(320, True, False)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(320, True)
  Self.SetObjectiveDisplayed(330, True, False)
EndFunction

Function Fragment_Stage_0440_Item_00()
  Alias_AriMiller.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveDisplayed(350, True, False)
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(330, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0525_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(400, False, False)
  Self.SetObjectiveDisplayed(500, False, False)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0570_Item_00()
  Self.SetStage(700)
  Int CreditAmountSmall = NPCDemandMoney_Small.GetValue() as Int
  Int CreditAmountLarge = NPCDemandMoney_Large.GetValue() as Int
  If Self.GetStageDone(760)
    Alias_Player.GetActorRef().AddItem(Credits as Form, CreditAmountLarge, False)
  Else
    Alias_Player.GetActorRef().AddItem(Credits as Form, CreditAmountSmall, False)
  EndIf
EndFunction

Function Fragment_Stage_0580_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(400, True)
  If Self.GetStageDone(700)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(500, True)
  If Self.GetStageDone(600)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(650, True, False)
EndFunction

Function Fragment_Stage_0900_Item_01()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(650, True, False)
EndFunction

Function Fragment_Stage_0900_Item_02()
  Self.SetObjectiveCompleted(600, True)
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_0900_Item_03()
  Self.SetObjectiveCompleted(600, True)
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_0910_Item_00()
  Alias_PrivacyWingGuard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(1050)
  If Self.IsObjectiveDisplayed(650) == True
    Self.SetStage(1100)
  EndIf
EndFunction

Function Fragment_Stage_0975_Item_00()
  Self.SetStage(1050)
  If Self.IsObjectiveDisplayed(650) == True
    Self.SetStage(1100)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_PrivacyWingKeycard.GetRef() as Form, 1, False)
  Self.SetStage(1050)
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_1100_Item_00()
  If Self.IsObjectiveDisplayed(600)
    Self.SetObjectiveCompleted(600, True)
  EndIf
  Self.SetObjectiveCompleted(650, True)
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.SetObjectiveDisplayed(700, False, False)
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_1175_Item_00()
  Self.SetStage(1200)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_1325_Item_00()
  FC06_ClinicSystemsDisrupted.SetValue(0.0)
EndFunction

Function Fragment_Stage_1340_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(310, True)
  Self.SetObjectiveCompleted(320, True)
  Self.SetObjectiveCompleted(330, True)
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveCompleted(650, True)
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveCompleted(950, True)
  Alias_MayasHideoutMapMarker.GetRef().Enable(False)
  Self.SetStage(1350)
EndFunction

Function Fragment_Stage_1350_Item_00()
  Self.SetObjectiveDisplayed(975, True, False)
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.SetObjectiveCompleted(975, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  Alias_MayasHideoutMapMarker.GetRef().AddToMapScanned(False)
  Alias_ClinicShip.GetRef().Enable(False)
  Game.GetPlayer().addtoFaction(FC06_MayaCruzBoardingFaction)
EndFunction

Function Fragment_Stage_1402_Item_00()
  FC06_MayaCruzPAGreetingScene.Start()
EndFunction

Function Fragment_Stage_1405_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1025, True, False)
  Actor MayaCruz = Alias_MayaCruz.GetActorRef()
  MayaCruz.SetNoBleedoutRecovery(True)
  MayaCruz.AllowBleedoutDialogue(True)
  MayaCruz.RemoveFromFaction(PlayerEnemyFaction)
  MayaCruz.RemoveFromFaction(LC056MayaCruzFaction)
  MayaCruz.addtoFaction(PlayerFriendFaction)
  MayaCruz.IgnoreFriendlyHits(True)
  MayaCruz.StopCombat()
  Alias_Companion.GetActorRef().StopCombat()
EndFunction

Function Fragment_Stage_1410_Item_00()
  Actor MayaCruz = Alias_MayaCruz.GetActorRef()
  MayaCruz.RemoveFromFaction(PlayerFriendFaction)
  MayaCruz.SetNoBleedoutRecovery(False)
  MayaCruz.ResetHealthAndLimbs()
  MayaCruz.IgnoreFriendlyHits(False)
EndFunction

Function Fragment_Stage_1425_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_MayaEncryptedDataslate.GetRef() as Form, 1, False)
  Self.SetStage(1600)
  Alias_MayaCruz.GetActorRef().SetEssential(False)
EndFunction

Function Fragment_Stage_1440_Item_00()
  Self.SetObjectiveCompleted(1025, True)
  Self.SetObjectiveDisplayed(1050, True, False)
  Actor MayaCruz = Alias_MayaCruz.GetActorRef()
  MayaCruz.AllowBleedoutDialogue(False)
  MayaCruz.SetEssential(False)
  MayaCruz.addtoFaction(PlayerEnemyFaction)
  MayaCruz.StartCombat(Alias_Player.GetActorRef() as ObjectReference, False)
  MayaCruz.ResetHealthAndLimbs()
EndFunction

Function Fragment_Stage_1450_Item_00()
  Self.SetObjectiveCompleted(1050, True)
  Self.SetStage(1500)
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveCompleted(1025, True)
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1200, True, False)
  Alias_Player.GetReference().ModValue(FC_EncryptedSlatesCollectedAV, 1.0)
  If !FC_EncryptedSlateQuest.IsRunning()
    FC_EncryptedSlateQuest.Start()
  EndIf
  loadelevatorfloorscript floorScript = Alias_LC056_LoadElevatorController.GetRef() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  If Alias_MayaCruz.GetActorRef().IsDead() == False
    FC06Post.Start()
  EndIf
  Alias_Player.GetActorRef().RemoveItem(Alias_MayaEncryptedDataslate.GetRef() as Form, 1, False, None)
  Alias_Player.GetActorRef().SetValue(FC06_Completed, 1.0)
  Game.AddAchievement(15)
  Self.Stop()
EndFunction
