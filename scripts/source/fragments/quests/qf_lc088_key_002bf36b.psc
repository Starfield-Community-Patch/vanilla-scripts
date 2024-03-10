ScriptName Fragments:Quests:QF_LC088_Key_002BF36B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property LC088_Quickstart_Entrance Auto Const mandatory
ObjectReference Property LC088_Quickstart_LastNova Auto Const mandatory
ObjectReference Property LC088_Quickstart_Voss Auto Const mandatory
ObjectReference Property LC088_Quickstart_Range Auto Const mandatory
ObjectReference Property LC088_Quickstart_OperationsEntry Auto Const mandatory
ObjectReference Property LC088_Quickstart_Delgado Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
ObjectReference Property TheKey_CF08_EnableMarker Auto Const mandatory
ObjectReference Property TheKey_CF08_DisableMarker Auto Const mandatory
ObjectReference Property TheKey_CF08_GenericActorsDisableMarker Auto Const mandatory
ReferenceAlias Property Alias_JasmineRobot Auto Const mandatory
Scene Property LC088_Key_200_JasmineIntro Auto Const mandatory
Scene Property LC088_Key_300_BogIntro Auto Const mandatory
Scene Property LC088_Key_400_VossIntro Auto Const mandatory
Scene Property LC088_Key_410_VossDialogue Auto Const mandatory
Scene Property LC088_Key_420_VossAttacked Auto Const mandatory
Scene Property LC088_Key_550_RokovIntro Auto Const mandatory
Scene Property LC088_Key_570_AdlerIntro Auto Const mandatory
Scene Property LC088_Key_250_MathisIntro Auto Const mandatory
Scene Property LC088_Key_600_OperationsIntro Auto Const mandatory
Scene Property LC088_Key_710_HuanIntro Auto Const mandatory
Scene Property LC088_Key_790_Reactor01Complete Auto Const mandatory
Scene Property LC088_Key_890_Reactor02Complete Auto Const mandatory
Scene Property LC088_Key_990_Reactor03Complete Auto Const mandatory
ReferenceAlias Property Alias_Jasmine Auto Const mandatory
ReferenceAlias Property Alias_Voss Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_All Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_ReckonersCore Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor01Group Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor02Group Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor03Group Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Delgado Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor Auto Const mandatory
ReferenceAlias Property Alias_Delgado Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_Reactor01Commander Auto Const mandatory
ReferenceAlias Property Alias_Reactor02Commander Auto Const mandatory
ReferenceAlias Property Alias_Reactor03Commander Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
RefCollectionAlias Property Alias_Reactor01Activators Auto Const mandatory
RefCollectionAlias Property Alias_Reactor02Activators Auto Const mandatory
RefCollectionAlias Property Alias_Reactor03Activators Auto Const mandatory
ReferenceAlias Property Alias_Ops_EntryDoor Auto Const mandatory
ReferenceAlias Property Alias_Jasmine_Terminal Auto Const mandatory
RefCollectionAlias Property Alias_QuartersAmbushDoorsGroup1 Auto Const mandatory
RefCollectionAlias Property Alias_QuartersAmbushDoorsGroup2 Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_AtriumEntryTrigger Auto Const mandatory
Scene Property LC088_Key_490_VossDead Auto Const mandatory
Explosion Property ParticleGrenadeExplosion Auto Const mandatory
Scene Property LC088_Key_1090_SelfDestructAborted Auto Const mandatory
ReferenceAlias Property Alias_NaevaReplacement Auto Const mandatory
ReferenceAlias Property Alias_HuanReplacement Auto Const mandatory
ReferenceAlias Property Alias_EstelleReplacement Auto Const mandatory
ReferenceAlias Property Alias_Rokov_DisableMarker Auto Const mandatory
ObjectReference Property LC088_OpsIntroScene_PlayerMoveToMarker Auto Const
Quest Property CF08_SysDef Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
RefCollectionAlias Property Alias_LoadElevators Auto Const mandatory
ReferenceAlias Property Alias_Rokov_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Rokov_CombatTravelTarget Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_TheKey Auto Const mandatory
RefCollectionAlias Property Alias_Reactor03_Robots Auto Const mandatory
ReferenceAlias Property Alias_DelgadosTerminal Auto Const mandatory
ReferenceAlias Property Alias_JessamineGriffin Auto Const mandatory
Spell Property CritLaser Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_JessamineGriffin_GagarinLocation Auto Const mandatory
Scene Property LC088_Key_Stage160_AludraDeath Auto Const mandatory
Scene Property LC088_Key_Stage170_TKDeath Auto Const mandatory
Scene Property LC088_Key_Stage180_IsraDeath Auto Const mandatory
Scene Property LC088_Key_Stage150_DepotEntry Auto Const mandatory
Quest Property CF_Post Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Ops_FollowerMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_Adler_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
Faction Property CydoniaFaction Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ActorBase Property CF_AdlerKemp Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_01 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_04 Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
LocationAlias Property Alias_LC088KeyInteriorLocation Auto Const mandatory
wwiseevent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const mandatory
RefCollectionAlias Property Alias_CargoBayLoadDoorsNormal Auto Const mandatory
RefCollectionAlias Property Alias_CargoBayLoadDoorsLC088 Auto Const mandatory
RefCollectionAlias Property Alias_OpsEntryDoorsLoad Auto Const mandatory
RefCollectionAlias Property Alias_OpsEntryDoorsNormal Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
Keyword Property SQ_LinkCompanionEliteCrewHomeMarker Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Faction Property SQ_Followers_GroupFormation_Faction Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Mainframe Auto Const mandatory
Keyword Property LinkHome Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0250_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0520_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0530_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Entrance, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_LastNova, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(9)
  Self.SetStage(390)
  Self.SetStage(400)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Voss, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(9)
  Self.SetStage(490)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Range, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_OperationsEntry, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_OpsIntroScene_PlayerMoveToMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(601)
  Self.SetStage(700)
  If !CF_Post.GetStageDone(0)
    Game.GetPlayer().MoveTo(LC088_OpsIntroScene_PlayerMoveToMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0009_Item_00()
  LC088_Space.SetStage(45)
  Alias_playerShip.GetShipRef().InstantDock(Alias_TheKey.GetShipRef() as ObjectReference)
  CF08_SysDef.SetStage(310)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  Alias_LC088KeyInteriorLocation.GetLocation().Reset()
  TheKey_CF08_EnableMarker.Enable(False)
  TheKey_CF08_DisableMarker.Disable(False)
  TheKey_CF08_GenericActorsDisableMarker.Disable(False)
  Alias_CargoBayLoadDoorsNormal.DisableAll(False)
  Alias_CargoBayLoadDoorsLC088.EnableAll(False)
  Alias_OpsEntryDoorsLoad.EnableAll(False)
  Alias_OpsEntryDoorsNormal.DisableAll(False)
  kmyQuest.SetElevatorsLockedDown(True)
  kmyQuest.SetupOpsEntryDoor()
  DialogueCFTheKey.Start()
  DialogueCFTheKey.SetStage(10000)
  kmyQuest.SetupAllCaptainEvents()
  kmyQuest.SetupOtherActors()
  If !CF_Post.GetStageDone(1)
    kmyQuest.SetupAllEnemyGroups()
    kmyQuest.EnableEnemyGroup(1)
  EndIf
  Actor vossRef = Alias_Voss.GetActorRef()
  vossRef.Reset(None)
  vossRef.AddToFaction(PlayerFriendFaction)
  Actor delgadoRef = Alias_Delgado.GetActorRef()
  delgadoRef.Reset(None)
  delgadoRef.Enable(False)
  delgadoRef.MoveToPackageLocation()
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_JessamineGriffin.GetRef().MoveTo(Alias_JessamineGriffin_GagarinLocation.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_02()
  Alias_JessamineGriffin.GetRef().SetLinkedRef(Alias_JessamineGriffin_GagarinLocation.GetRef(), SQ_LinkCompanionEliteCrewHomeMarker, True)
  Alias_JessamineGriffin.GetRef().SetLinkedRef(Alias_JessamineGriffin_GagarinLocation.GetRef(), LinkHome, True)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Actor RokovRef = Alias_Rokov.GetActorRef()
  RokovRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False)
  RokovRef.AddToFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Alias_Mathis.GetActorRef().SetGroupFaction(None)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_Naeva.TryToDisable()
EndFunction

Function Fragment_Stage_0016_Item_00()
  Actor AdlerRef = Alias_Adler.GetActorRef()
  AdlerRef.RemoveFromFaction(CrimeFactionUC)
  AdlerRef.RemoveFromFaction(CydoniaFaction)
  AdlerRef.AddToFaction(CrimeFactionCrimsonFleet)
  AdlerRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False)
EndFunction

Function Fragment_Stage_0017_Item_00()
  Alias_Reactor01Commander.ForceRefTo(Alias_Huan.GetRef())
  Alias_HuanReplacement.TryToDisable()
EndFunction

Function Fragment_Stage_0018_Item_00()
  Alias_Reactor03Commander.ForceRefTo(Alias_Estelle.GetRef())
  Alias_EstelleReplacement.TryToDisable()
  Actor EstelleRef = Alias_Estelle.GetActorRef()
  EstelleRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False)
  EstelleRef.RemoveFromFaction(CrimeFactionNeon)
  EstelleRef.AddToFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0019_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.VossBombTickStop()
  CF08_SysDef.SetStage(440)
EndFunction

Function Fragment_Stage_0100_Item_00()
  DialogueCFTheKey.SetStage(10000)
EndFunction

Function Fragment_Stage_0160_Item_00()
  LC088_Key_Stage160_AludraDeath.Start()
EndFunction

Function Fragment_Stage_0170_Item_00()
  LC088_Key_Stage170_TKDeath.Start()
EndFunction

Function Fragment_Stage_0180_Item_00()
  LC088_Key_Stage180_IsraDeath.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  LC088_Key_200_JasmineIntro.Start()
  Utility.Wait(1.0)
  Self.SetStage(201)
EndFunction

Function Fragment_Stage_0201_Item_00()
  Alias_JasmineRobot.GetActorRef().SetUnconscious(False)
  Actor jasmineRef = Alias_Jasmine.GetActorRef()
  jasmineRef.EvaluatePackage(False)
  jasmineRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
  CF08_SysDef.SetStage(315)
EndFunction

Function Fragment_Stage_0210_Item_00()
  CF08_SysDef.SetStage(316)
EndFunction

Function Fragment_Stage_0210_Item_01()
  LC088_Key_Stage150_DepotEntry.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  LC088_Key_300_BogIntro.Start()
  CF08_SysDef.SetStage(320)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  Alias_AtriumEntryTrigger.TryToEnable()
  CF08_SysDef.SetStage(330)
EndFunction

Function Fragment_Stage_0400_Item_00()
  CF08_SysDef.SetStage(340)
EndFunction

Function Fragment_Stage_0401_Item_00()
  LC088_Key_400_VossIntro.Start()
EndFunction

Function Fragment_Stage_0405_Item_00()
  Utility.Wait(1.0)
  LC088_Key_400_VossIntro.Stop()
  Self.SetStage(410)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  Alias_Voss.TryToEvaluatePackage()
EndFunction

Function Fragment_Stage_0411_Item_00()
  Alias_Voss.TryToEvaluatePackage()
EndFunction

Function Fragment_Stage_0415_Item_00()
  If !Self.GetStageDone(420)
    LC088_Key_420_VossAttacked.Start()
    Self.SetStage(420)
  EndIf
EndFunction

Function Fragment_Stage_0420_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.VossBombArmed()
  Actor vossRef = Alias_Voss.GetActorRef()
  vossRef.RemoveFromFaction(PlayerFriendFaction)
  vossRef.SetValue(Aggression, 1.0)
  vossRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
  vossRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  CF08_SysDef.SetStage(345)
  kmyQuest.VossWaitForSit()
  Alias_Voss.TryToEvaluatePackage()
  Alias_Voss.GetActorRef().AddToFaction(CaptiveFaction)
EndFunction

Function Fragment_Stage_0470_Item_00()
  If !Self.GetStageDone(19)
    Alias_Voss.TryToKill(None)
  EndIf
EndFunction

Function Fragment_Stage_0480_Item_00()
  LC088_Key_490_VossDead.Start()
  CF08_SysDef.SetStage(350)
EndFunction

Function Fragment_Stage_0490_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.EnableEnemyGroup(2)
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_ReckonersCore)
  CF08_SysDef.SetStage(350)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  If Self.GetStageDone(13) && Self.GetStage() < 600
    LC088_Key_550_RokovIntro.Start()
    kmyQuest.OpenDoorCollection(Alias_QuartersAmbushDoorsGroup1)
    Self.SetStage(570)
  EndIf
EndFunction

Function Fragment_Stage_0570_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  If Self.GetStageDone(16) && Self.GetStage() < 600
    LC088_Key_570_AdlerIntro.Start()
    kmyQuest.OpenDoorCollection(Alias_QuartersAmbushDoorsGroup2)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  CF08_SysDef.SetStage(360)
EndFunction

Function Fragment_Stage_0601_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  SQ_Followers.TeleportFollowers(Alias_Ops_FollowerMoveToMarker.GetRef(), None, True, True, False, False, False)
  Alias_OpsEntryDoorsLoad.DisableAll(False)
  Alias_OpsEntryDoorsNormal.EnableAll(False)
  kmyQuest.SealOpsEntryDoor()
  kmyQuest.SetupReactorBattleNoWait()
EndFunction

Function Fragment_Stage_0650_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.AbortReactorBattleNoWait()
  Self.SetStage(1100)
  Alias_Delgado.GetActorRef().SetEssential(True)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.LockPlayerControls(False)
  kmyQuest.StartReactorBattle()
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor01Group)
  CF08_SysDef.SetStage(370)
EndFunction

Function Fragment_Stage_0710_Item_00()
  LC088_Key_710_HuanIntro.Start()
EndFunction

Function Fragment_Stage_0790_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.SetReactorState(1, kmyQuest.CONST_ReactorState_Active)
  Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  LC088_Key_790_Reactor01Complete.Start()
  CF08_SysDef.SetStage(390)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor02Group)
EndFunction

Function Fragment_Stage_0890_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.SetReactorState(2, kmyQuest.CONST_ReactorState_Active)
  Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  LC088_Key_890_Reactor02Complete.Start()
  CF08_SysDef.SetStage(400)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor03Group)
  robotpodscript[] robots = Alias_Reactor03_Robots.GetArray() as robotpodscript[]
  Int I = 0
  While I < robots.Length
    If robots[I] != None
      robots[I].WakeRobotFromPod()
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.SetReactorState(3, kmyQuest.CONST_ReactorState_Active)
  Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  LC088_Key_990_Reactor03Complete.Start()
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Delgado)
  CF08_SysDef.SetStage(410)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  CF08_SysDef.SetStage(420)
EndFunction

Function Fragment_Stage_1010_Item_00()
  Alias_Delgado.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_1070_Item_00()
  CF08_SysDef.SetStage(430)
EndFunction

Function Fragment_Stage_1080_Item_00()
  CF08_SysDef.SetStage(435)
EndFunction

Function Fragment_Stage_1090_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.EndReactorBattleNoWait()
  LC088_Key_1090_SelfDestructAborted.Start()
  CF08_SysDef.SetStage(437)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.LockPlayerControls(False)
  kmyQuest.EndReactorBattleNoWait()
  kmyQuest.SetElevatorsLockedDown(False)
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_All)
  Alias_CargoBayLoadDoorsNormal.EnableAll(False)
  Alias_CargoBayLoadDoorsLC088.DisableAll(False)
  Alias_OpsEntryDoorsLoad.DisableAll(False)
  Alias_OpsEntryDoorsNormal.EnableAll(False)
  kmyQuest.OpenOpsEntryDoor()
  Alias_DelgadosTerminal.GetRef().Unlock(False)
  LC088_Space.SetStage(293)
  CF_Post.SetStage(200)
  CF08_SysDef.SetStage(510)
EndFunction

Function Fragment_Stage_1101_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.LockPlayerControls(False)
  kmyQuest.EndReactorBattleAndWait()
  kmyQuest.SetElevatorsLockedDown(False)
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_All)
  Alias_CargoBayLoadDoorsNormal.EnableAll(False)
  Alias_CargoBayLoadDoorsLC088.DisableAll(False)
  Alias_OpsEntryDoorsLoad.DisableAll(False)
  Alias_OpsEntryDoorsNormal.EnableAll(False)
  kmyQuest.OpenOpsEntryDoor()
  Alias_DelgadosTerminal.GetRef().Unlock(False)
  CF_Post.SetStage(200)
  CF08_SysDef.SetStage(510)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript
  kmyQuest.Cleanup()
  Self.Stop()
EndFunction
