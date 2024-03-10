ScriptName Fragments:Quests:QF_FC01_0029A8F0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC01_RobberLeaderShowHostagesScene Auto Const mandatory
Scene Property FC01_RobberLeaderWarningScene Auto Const mandatory
Quest Property FC02 Auto Const mandatory
ObjectReference Property FC01_PT1 Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Scene Property FC01_BlakeAnnouncePlayerScene Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_BankRobbersAll Auto Const mandatory
Message Property FC01_UnlockRearDoor_MSG Auto Const mandatory
ReferenceAlias Property Alias_GalBankRearDoor Auto Const mandatory
Scene Property FC01_PlayerPickedUpGun Auto Const mandatory
ReferenceAlias Property Alias_RobberLeaderInt_Rename Auto Const mandatory
ReferenceAlias Property Alias_DanielBlake Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Quest Property City_Akila_Ashta01 Auto Const mandatory
Scene Property FC01_ThreatenBankManagerScene Auto Const mandatory
Key Property FC01_GallBankRearDoorKey Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_RobberLeaderInt Auto Const mandatory
ReferenceAlias Property Alias_WilliamCrowley Auto Const mandatory
Faction Property FC01_GunmanEnemyFaction Auto Const mandatory
GlobalVariable Property FC01_RobbersSurrendered Auto Const mandatory
Quest Property FC01_PostQuest Auto Const mandatory
ReferenceAlias Property Alias_VaultDoor Auto Const mandatory
ReferenceAlias Property Alias_GalBankFrontDoor Auto Const mandatory
ReferenceAlias Property Alias_InteriorLightsOn_EnableMarker Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property AkilaCityShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
ReferenceAlias Property Alias_RobberLeaderExt Auto Const mandatory
Scene Property FC01_CompanionReactSurrender Auto Const mandatory
ReferenceAlias Property Alias_Robber02 Auto Const mandatory
ReferenceAlias Property Alias_Robber03 Auto Const mandatory
ReferenceAlias Property Alias_Robber04 Auto Const mandatory
ReferenceAlias Property Alias_Robber05 Auto Const mandatory
ReferenceAlias Property Alias_Robber06 Auto Const mandatory
GlobalVariable Property FC01CrowdDisable Auto Const mandatory
ActorValue Property FC01_Completed Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
ReferenceAlias Property Alias_ElizabethCardwell Auto Const mandatory
ObjectReference Property FC01_ElizabethCowerMarker Auto Const mandatory
ReferenceAlias Property Alias_MarkoJansen Auto Const mandatory
ObjectReference Property FC01_Marko_CowerMarker Auto Const mandatory
Keyword Property ObjectTypeWeapon Auto Const mandatory
Quest Property FC_JobsDoneSlateHolderQuest Auto Const mandatory
Quest Property FC01_DialogueHolderQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0300_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0320_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0530_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().moveto(FC01_PT1, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.moveto(AkilaCityShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(AkilaCityShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  FC01CrowdDisable.SetValue(1.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_VaultDoor.GetRef().SetOpen(True)
  Alias_VaultDoor.GetRef().SetLockLevel(0)
  Alias_ElizabethCardwell.GetRef().moveto(FC01_ElizabethCowerMarker, 0.0, 0.0, 0.0, True, False)
  Alias_MarkoJansen.GetRef().moveto(FC01_Marko_CowerMarker, 0.0, 0.0, 0.0, True, False)
  Alias_InteriorLightsOn_EnableMarker.GetRef().Disable(False)
  Alias_RobberLeaderExt.GetRef().BlockActivation(True, True)
  FC01CrowdDisable.SetValue(1.0)
  Alias_Guard.GetActorRef().EvaluatePackage(False)
  FC_JobsDoneSlateHolderQuest.Start()
  FC01_DialogueHolderQuest.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Guard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  If MQ103.IsRunning() && MQ103.GetStageDone(100)
    MQ103.SetStage(220)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  FC01_RobberLeaderWarningScene.Start()
  If MQ103.IsRunning() && MQ103.GetStageDone(100)
    MQ103.SetStage(220)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0203_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  FC01_BlakeAnnouncePlayerScene.Start()
  Alias_RobberLeaderExt.GetRef().BlockActivation(False, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Alias_RobberLeaderInt_Rename.Clear()
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetStage(320)
  Self.SetStage(345)
EndFunction

Function Fragment_Stage_0340_Item_00()
  Self.SetStage(345)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(200, True)
  FC01_RobbersSurrendered.SetValue(1.0)
  Alias_RobberLeaderInt.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_RobberLeaderInt_Rename.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Robber02.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Robber03.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Robber04.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Robber05.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Robber06.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_BankRobbersAll.RemoveFromFaction(PlayerEnemyFaction)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0355_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveFailed(200, True)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0370_Item_00()
  FC01_CompanionReactSurrender.Start()
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveFailed(200, True)
  EndIf
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0470_Item_00()
  FC01_UnlockRearDoor_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Alias_GalBankRearDoor.GetRef().Unlock(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Player.GetRef().AddItem(FC01_GallBankRearDoorKey as Form, 1, False)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(410, True, False)
  Alias_BankRobbersAll.RemoveFromFaction(PlayerEnemyFaction)
  Alias_GalBankFrontDoor.GetRef().SetLockLevel(0)
  Alias_GalBankFrontDoor.GetRef().Unlock(False)
  Alias_RobberLeaderExt.GetRef().BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0517_Item_00()
  Self.SetStage(510)
EndFunction

Function Fragment_Stage_0520_Item_00()
  If Alias_Player.GetActorRef().GetItemCount(ObjectTypeWeapon as Form) != 0 && !Self.GetStageDone(517)
    FC01_PlayerPickedUpGun.Start()
  Else
    FC01_RobberLeaderShowHostagesScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0540_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveCompleted(410, True)
  Self.SetObjectiveDisplayed(420, True, False)
  Alias_RobberLeaderExt.GetRef().BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0545_Item_00()
  FC01_RobberLeaderShowHostagesScene.Stop()
  If Game.GetPlayer().IsDetectedBy(Alias_RobberLeaderInt.GetActorRef())
    FC01_PlayerPickedUpGun.Start()
    Alias_RobberLeaderInt.GetActorRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0550_Item_00()
  Alias_BankRobbersAll.AddToFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0555_Item_00()
  FC01_ThreatenBankManagerScene.Start()
  Alias_WilliamCrowley.GetActorRef().EvaluatePackage(False)
  Alias_Robber02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0560_Item_00()
  Alias_WilliamCrowley.GetActorRef().SetEssential(False)
  Alias_WilliamCrowley.GetActorRef().EvaluatePackage(False)
  Alias_Robber02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0570_Item_00()
  Alias_WilliamCrowley.GetActorRef().Kill(None)
  Alias_Robber02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Alias_WilliamCrowley.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(420, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False)
  Alias_Player.GetActorRef().SetValue(FC01_Completed, 1.0)
  FC01_PostQuest.Start()
  FC02.Start()
  If Self.GetStageDone(350)
    Self.SetStage(2010)
  Else
    Self.SetStage(2020)
  EndIf
  If MQ103.IsRunning() && MQ103.GetStageDone(100)
    MQ103.SetStage(230)
  EndIf
  RAD02.SetStage(300)
  City_Akila_Ashta01.SetStage(5)
  DialogueFCAkilaCity.SetStage(1000)
  Alias_InteriorLightsOn_EnableMarker.GetRef().Enable(False)
  FC01CrowdDisable.SetValue(0.0)
  Self.Stop()
EndFunction
