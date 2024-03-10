ScriptName Fragments:Quests:QF_FC04_0026621E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property FC04_OpenWarehouseDoor Auto Const mandatory
Faction Property FC04_EmmettEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_EmmettAndHenchman Auto Const mandatory
Scene Property FC04_JaylenBackupScene Auto Const mandatory
Scene Property FC04_JaylenBillyChatScene Auto Const mandatory
Scene Property FC04_GraceConfessScene Auto Const mandatory
Quest Property FC01 Auto Const mandatory
ObjectReference Property FC04_JaylenTalkToBilly Auto Const mandatory
ReferenceAlias Property Alias_JaylenPryce Auto Const mandatory
ReferenceAlias Property Alias_BillyClayton Auto Const mandatory
ReferenceAlias Property Alias_GraceEarly Auto Const mandatory
Quest Property FC05 Auto Const mandatory
Quest Property FC06 Auto Const mandatory
ReferenceAlias Property Alias_WarehouseDoor Auto Const mandatory
ReferenceAlias Property Alias_EmmetGoodman Auto Const mandatory
ReferenceAlias Property Alias_SyndicateDoorman Auto Const mandatory
Cell Property CityNeonWarehouseEmmetsLair Auto Const mandatory
ObjectReference Property FC04_PT1 Auto Const mandatory
Scene Property FC04_JaylenWalkTalkScene Auto Const mandatory
Scene Property FC04_JaylenBillyIntroductionScene Auto Const mandatory
ReferenceAlias Property Alias_WarehouseKey Auto Const mandatory
Quest Property FC01_PostQuest Auto Const mandatory
ObjectReference Property FC04_JaylenSt800SceneMarker Auto Const mandatory
ReferenceAlias Property Alias_GraceSlate Auto Const mandatory
ActorValue Property FC04_Completed Auto Const mandatory
Quest Property FC_EncryptedSlateQuest Auto Const mandatory
GlobalVariable Property FCQuests_MeetingRoomPackages Auto Const mandatory
Quest Property FC_EvidenceSlateHolderQuest Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ObjectReference Property FC04_CompanionStandMarker Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FC01.SetStage(2000)
  FC01_PostQuest.SetStage(2000)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(50, True, False)
  Alias_BillyClayton.GetRef().Enable(False)
  If COM_Quest_SamCoe_Q01.IsRunning() && !COM_Quest_SamCoe_Q01.GetStageDone(300)
    COM_Quest_SamCoe_Q01.SetStage(110)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(400)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  FC04_JaylenWalkTalkScene.Start()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  FC04_JaylenWalkTalkScene.Stop()
  FC04_JaylenBillyIntroductionScene.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0330_Item_00()
  Alias_Player.GetActorRef().AddItem(Credits as Form, 500, False)
EndFunction

Function Fragment_Stage_0380_Item_00()
  If Alias_SyndicateDoorman.GetActorRef().IsDead() || Alias_SyndicateDoorman.GetActorRef() == None
    Alias_WarehouseDoor.GetRef().Unlock(False)
    Self.SetStage(500)
    Self.SetObjectiveCompleted(200, True)
    Self.SetObjectiveDisplayed(300, True, False)
  Else
    Self.SetStage(400)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_SyndicateDoorman.GetRef().Enable(False)
  Self.SetObjectiveCompleted(200, True)
  If !Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(250, True, False)
  Else
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0450_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValue() as Int, False, None)
  Alias_SyndicateDoorman.GetActorRef().AddItem(Credits as Form, NPCDemandMoney_Small.GetValue() as Int, False)
  Self.SetStage(460)
EndFunction

Function Fragment_Stage_0460_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_WarehouseKey.GetRef() as Form, 1, False)
  FC04_OpenWarehouseDoor.Start()
  CityNeonWarehouseEmmetsLair.SetPublic(True)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(250)
    Self.SetObjectiveCompleted(250, True)
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0510_Item_00()
  Alias_EmmetGoodman.GetActorRef().EvaluatePackage(False)
  Alias_Companion.GetRef().MoveTo(FC04_CompanionStandMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Int CreditAmount = NPCDemandMoney_Large.GetValue() as Int
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, CreditAmount, False, None)
  Alias_EmmetGoodman.GetActorRef().AddItem(Credits as Form, CreditAmount, False)
  If Self.IsObjectiveDisplayed(320)
    Self.SetObjectiveCompleted(320, True)
  EndIf
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetObjectiveDisplayed(320, True, False)
EndFunction

Function Fragment_Stage_0540_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0560_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FC04_EmmettEnemyFaction)
  Alias_EmmettAndHenchman.EvaluateAll()
  Alias_EmmettAndHenchman.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0570_Item_00()
  Self.SetStage(600)
  If Self.IsObjectiveDisplayed(320)
    Self.SetObjectiveDisplayed(320, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_JaylenPryce.GetRef().MoveTo(FC04_JaylenTalkToBilly, 0.0, 0.0, 0.0, True, False)
  FC04_JaylenBillyChatScene.Start()
EndFunction

Function Fragment_Stage_0700_Item_00()
  FC04_JaylenBackupScene.Start()
  Alias_BillyClayton.GetActorRef().EvaluatePackage(False)
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False)
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveCompleted(200, True)
  EndIf
  Alias_GraceEarly.GetRef().Enable(False)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Alias_JaylenPryce.GetRef().MoveTo(FC04_JaylenSt800SceneMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  FC04_GraceConfessScene.Start()
EndFunction

Function Fragment_Stage_0850_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_GraceSlate.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(650, True, False)
  If COM_Quest_SamCoe_Q01.IsRunning() && !COM_Quest_SamCoe_Q01.GetStageDone(300)
    COM_Quest_SamCoe_Q01.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0925_Item_00()
  Self.SetObjectiveCompleted(650, True)
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Alias_GraceSlate.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  Alias_Player.GetActorRef().SetValue(FC04_Completed, 1.0)
  FCQuests_MeetingRoomPackages.SetValue(1.0)
  FC_EncryptedSlateQuest.Start()
  FC05.Start()
  FC06.Start()
  FC_EvidenceSlateHolderQuest.Start()
  Self.Stop()
EndFunction
