ScriptName Fragments:Quests:QF_BF01_00009136 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF01_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF01_UCSGuard01 Auto Const mandatory
ReferenceAlias Property Alias_CF01_UCSGuard02 Auto Const mandatory
ObjectReference Property CF01PlayerStartMarker Auto Const mandatory
Scene Property CF01_Stage120_InitialGuardScene Auto Const mandatory
Message Property CF01_Stage10Temp_Message Auto Const mandatory
MiscObject Property CF01_AuroraShipSample Auto Const mandatory
ReferenceAlias Property Alias_CF01_AuroraSample Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
ObjectReference Property CF01KibweOpsMarker Auto Const mandatory
ObjectReference Property LC082_InterrogationRoomDoorRef Auto Const mandatory
ObjectReference Property LC082_PlayerShipDockingPortAccessDoorRef Auto Const mandatory
ObjectReference Property LC082_OperationsCenterElevatorAccessDoorRef Auto Const mandatory
ObjectReference Property CF01UCSGuard01AfterLtMarker Auto Const mandatory
Scene Property CF01_Stage165_UCSGuard01_EnterRoomScene Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ReferenceAlias Property Alias_CF01_KarlFielding Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Scene Property CF01_Stage140_Kibwe_AcceptOfferScene Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF01KibweStartMarker Auto Const mandatory
ReferenceAlias Property Alias_CF01_AdlerKemp Auto Const mandatory
Scene Property CF01_Stage180_UCSGuard01_EscortingScene Auto Const mandatory
Scene Property CF01_Stage185_UCSGuard01_EscortingSceneEnding Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Message Property CF01_Stage205Debug_Message Auto Const mandatory
ObjectReference Property LC082_Quickstart_DockingPort Auto Const mandatory
Scene Property CF01_Stage209_UCSoldier_AssignmentFinalScene Auto Const mandatory
ObjectReference Property CF01_AltMeet_UCGuard01Marker Auto Const mandatory
Scene Property CF01_Stage208_UCSoldier_AssignmentEscortScene Auto Const mandatory
ReferenceAlias Property Alias_CF01_Sebastian Auto Const mandatory
ReferenceAlias Property Alias_CF01_InviteSlate Auto Const mandatory
ObjectReference Property CF01_InterrogationChairRef Auto Const mandatory
ObjectReference Property LoadElevator_ProximityTrigger017 Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
GlobalVariable Property CF01_KarlDebt Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const
ObjectReference Property CF01_FollowerWaitMarker Auto Const mandatory
Quest Property CF01_KarlFielding_SpeechChallenges Auto Const mandatory
ReferenceAlias Property Alias_CF01_Toft Auto Const mandatory
Cell Property LC082Vigilance01 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew01 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew02 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew03 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew04 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew05 Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Quest Property DialogueCrimeGuards Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
RefCollectionAlias Property VigilanceMainActors Auto Const mandatory
Faction Property CrimeFactionUCSysDef Auto Const mandatory
ReferenceAlias Property Alias_HomeShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0300_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0309_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 1000, False)
  CF01_Stage10Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(205)
  Utility.Wait(1.0)
  Game.GetPlayer().AddItem(Credits as Form, 1000, False)
  Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Actor SysDef01 = Alias_Ops_Crew01.GetActorRef()
  Actor SysDef02 = Alias_Ops_Crew02.GetActorRef()
  Actor SysDef03 = Alias_Ops_Crew03.GetActorRef()
  Actor SysDef04 = Alias_Ops_Crew04.GetActorRef()
  Actor SysDef05 = Alias_Ops_Crew05.GetActorRef()
  VigilanceMainActors.AddRef(SysDef01 as ObjectReference)
  VigilanceMainActors.AddRef(SysDef02 as ObjectReference)
  VigilanceMainActors.AddRef(SysDef03 as ObjectReference)
  VigilanceMainActors.AddRef(SysDef04 as ObjectReference)
  VigilanceMainActors.AddRef(SysDef05 as ObjectReference)
  SysDef01.SetCrimeFaction(CrimeFactionUCSysDef)
  SysDef02.SetCrimeFaction(CrimeFactionUCSysDef)
  SysDef03.SetCrimeFaction(CrimeFactionUCSysDef)
  SysDef04.SetCrimeFaction(CrimeFactionUCSysDef)
  SysDef05.SetCrimeFaction(CrimeFactionUCSysDef)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  cf01questscript kmyQuest = __temp as cf01questscript
  Self.SetObjectiveDisplayed(10, True, False)
  LC082.UpdateVigilanceLocation("CF01")
  LC082Vigilance01.EnableFastTravel(False)
  Alias_playerShip.GetShipRef().StopCombatAlarm()
  Game.GetPlayer().StopCombatAlarm()
  LC082_InterrogationRoomDoorRef.Lock(True, False, True)
  LC082_InterrogationRoomDoorRef.SetLockLevel(253)
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweStartMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False)
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
  Alias_CF01_UCSGuard02.GetActorRef().EvaluatePackage(False)
  LoadElevator_ProximityTrigger017.Disable(False)
  kmyQuest.RemovePlayerContraband()
  CrimeFactionUC.SetPlayerEnemy(False)
  Actor[] waitingFollowers = SQ_Followers.AllFollowersWait(CF01_FollowerWaitMarker, False, False)
  SQ_Followers.TeleportFollowers(CF01_FollowerWaitMarker, waitingFollowers, True, True, False, False, False)
  Game.GetPlayer().MoveTo(CF01PlayerStartMarker, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().SnapIntoInteraction(CF01_InterrogationChairRef)
  Game.GetPlayer().SetRestrained(True)
  Utility.Wait(5.0)
  Alias_HomeShip.TryToInstantDock(Alias_Vigilance)
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0120_Item_00()
  CF01_Stage120_InitialGuardScene.Start()
  (DialogueCrimeGuards as cf01dialoguecrimeguardsscript).EnablePlayerControlsAfterCF01Arrest()
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().Disable(False)
  Alias_CF01_UCSGuard01.GetActorRef().MoveTo(CF01UCSGuard01AfterLtMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetStage(160)
  CrimeFactionUC.SetCrimeGold(0)
  CrimeFactionUC.SetCrimeGoldViolent(0)
  CrimeFactionUC.SetPlayerEnemy(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(160)
EndFunction

Function Fragment_Stage_0165_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  LC082_InterrogationRoomDoorRef.Unlock(False)
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)
  LC082.SetStage(200)
  Alias_CF01_UCSGuard01.GetActorRef().Enable(False)
  Utility.Wait(1.0)
  CF01_Stage165_UCSGuard01_EnterRoomScene.Start()
  Game.GetPlayer().SetRestrained(False)
  SQ_Followers.AllFollowersFollow(None)
EndFunction

Function Fragment_Stage_0166_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest
  cf01questscript kmyQuest = __temp as cf01questscript
  Game.GetPlayer().SetRestrained(False)
  SQ_Followers.AllFollowersFollow(None)
  kmyQuest.SendPlayerToJail()
  Utility.Wait(10.0)
  Self.SetStage(175)
EndFunction

Function Fragment_Stage_0175_Item_00()
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False)
  LC082_InterrogationRoomDoorRef.Unlock(False)
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)
  Self.SetStage(245)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
  CF01_Stage180_UCSGuard01_EscortingScene.Start()
  CF01_Stage140_Kibwe_AcceptOfferScene.Stop()
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0185_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0190_Item_00()
  CF01_Stage185_UCSGuard01_EscortingSceneEnding.Start()
EndFunction

Function Fragment_Stage_0195_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(40, True, False)
  LoadElevator_ProximityTrigger017.Enable(False)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False)
  LC082.UpdateVigilanceLocation("CF01")
  Alias_CF01_UCSGuard01.GetActorRef().MoveTo(CF01_AltMeet_UCGuard01Marker, 0.0, 0.0, 0.0, True, False)
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
EndFunction

Function Fragment_Stage_0206_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(35, True, False)
  LC082.SetStage(200)
  LoadElevator_ProximityTrigger017.Disable(False)
EndFunction

Function Fragment_Stage_0207_Item_00()
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(36, True, False)
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
  CF01_Stage208_UCSoldier_AssignmentEscortScene.Start()
EndFunction

Function Fragment_Stage_0208_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0209_Item_00()
  CF01_Stage209_UCSoldier_AssignmentFinalScene.Start()
EndFunction

Function Fragment_Stage_0210_Item_00()
  If Self.IsObjectiveDisplayed(36) == True
    Self.SetObjectiveCompleted(36, True)
  EndIf
  If Self.GetStageDone(230) == False
    If Self.IsObjectiveDisplayed(40) == False
      Self.SetObjectiveDisplayed(40, True, False)
    EndIf
  EndIf
  If Self.GetStageDone(205) == True
    LoadElevator_ProximityTrigger017.Enable(False)
  EndIf
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0215_Item_00()
  CF_Main.SetStage(300)
  Alias_CF01_Kibwe.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_CF01_Kibwe.GetActorRef().SetValue(Aggression, 1.0)
  Alias_CF01_Toft.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_CF01_Toft.GetActorRef().SetValue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Alias_CF01_Toft.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.IsObjectiveDisplayed(10)
    Self.SetObjectiveDisplayed(10, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(20)
    Self.SetObjectiveDisplayed(20, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(30)
    Self.SetObjectiveDisplayed(30, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(35)
    Self.SetObjectiveDisplayed(35, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(36)
    Self.SetObjectiveDisplayed(36, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(37)
    Self.SetObjectiveDisplayed(37, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(40)
    Self.SetObjectiveDisplayed(40, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(50)
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  Self.SetObjectiveDisplayed(52, True, False)
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
  LC082Vigilance01.EnableFastTravel(True)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(52, True)
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0245_Item_00()
  Self.SetObjectiveCompleted(10, True)
  CF_Main.SetStage(300)
  Self.SetStage(250)
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
  LC082Vigilance01.EnableFastTravel(True)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(54, True, False)
  Alias_CF01_Sebastian.GetActorRef().Enable(False)
  Alias_CF01_Sebastian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0255_Item_00()
  Alias_CF01_Sebastian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Game.GetPlayer().AddItem(Alias_CF01_InviteSlate.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(54, True)
  Self.SetObjectiveDisplayed(55, True, False)
  Alias_CF01_AdlerKemp.TryToEnable()
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Game.GetPlayer().AddItem(Alias_CF01_AuroraSample.GetRef() as Form, 1, False)
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
  CF_Main.SetStage(20)
  CFSD01.SetStage(5)
  CF01_KarlFielding_SpeechChallenges.Start()
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStageDone(270) == False
    Self.SetObjectiveCompleted(60, True)
    Self.SetObjectiveDisplayed(70, True, False)
  EndIf
  If Self.GetStageDone(270) == True
    Self.SetObjectiveCompleted(60, True)
    Self.SetStage(340)
  EndIf
EndFunction

Function Fragment_Stage_0336_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.IsObjectiveDisplayed(70) == True
    Self.SetObjectiveCompleted(70, True)
  EndIf
  Self.SetObjectiveDisplayed(80, True, False)
  Alias_CF01_AdlerKemp.TryToEnable()
EndFunction

Function Fragment_Stage_0340_Item_01()
  Self.SetObjectiveCompleted(55, True)
  Self.SetObjectiveDisplayed(80, True, False)
  Alias_CF01_AdlerKemp.TryToEnable()
EndFunction

Function Fragment_Stage_0347_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF01_AuroraSample.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
  Actor KarlRef = Alias_CF01_KarlFielding.GetActorRef()
  KarlRef.Enable(False)
  KarlRef.SetEssential(False)
  KarlRef.SetProtected(True)
  Alias_CF01_Sebastian.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_CF01_KarlFielding.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0367_Item_00()
  Self.SetStage(370)
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.IsObjectiveDisplayed(90)
    Self.SetObjectiveCompleted(90, True)
  EndIf
  If Self.IsObjectiveDisplayed(100)
    Self.SetObjectiveCompleted(100, True)
  EndIf
  Self.SetObjectiveDisplayed(110, True, False)
  If Self.GetStageDone(365) == True
    Game.GetPlayer().AddItem(Credits as Form, CF01_KarlDebt.GetValueInt(), False)
  EndIf
EndFunction

Function Fragment_Stage_0375_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CF01_KarlDebt.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor KarlRef = Alias_CF01_KarlFielding.GetActorRef()
  KarlRef.Disable(False)
  Self.SetObjectiveCompleted(110, True)
  CF02.SetStage(10)
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew01.GetRef())
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew02.GetRef())
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew03.GetRef())
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew04.GetRef())
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew05.GetRef())
  Alias_Ops_Crew01.GetRef().DisableNoWait(False)
  Alias_Ops_Crew02.GetRef().DisableNoWait(False)
  Alias_Ops_Crew03.GetRef().DisableNoWait(False)
  Alias_Ops_Crew04.GetRef().DisableNoWait(False)
  Alias_Ops_Crew05.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction
