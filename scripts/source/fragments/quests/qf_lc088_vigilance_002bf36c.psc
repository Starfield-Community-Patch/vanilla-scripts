ScriptName Fragments:Quests:QF_LC088_Vigilance_002BF36C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Quest Property CF_Post Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF08_Fleet Auto Const mandatory
Quest Property CF08_SpeechChallenge_Kibwe Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Rokov_Ally01 Auto Const mandatory
ReferenceAlias Property Alias_Rokov_Ally02 Auto Const mandatory
ReferenceAlias Property Alias_Rokov_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ReferenceAlias Property Alias_Mathis_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Mathis_EndMarker Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Allies Auto Const mandatory
ReferenceAlias Property Alias_Naeva_StartMarker Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Room1CollisionMarkers Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Room2CollisionMarkers Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Room3CollisionMarkers Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
ReferenceAlias Property Alias_Adler_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Adler_StealthDoor Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_HuanCombat Auto Const mandatory
ReferenceAlias Property Alias_Huan_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Estelle_StartMarker Auto Const mandatory
RefCollectionAlias Property Alias_Estelle_Level2_QuartersAllies Auto Const mandatory
RefCollectionAlias Property Alias_Estelle_Level3_QuartersAllies Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort01 Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort02 Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort03 Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort04 Auto Const mandatory
RefCollectionAlias Property Alias_Brig_Clutter Auto Const mandatory
RefCollectionAlias Property Alias_Brig_ReleasedPrisoners Auto Const mandatory
RefCollectionAlias Property Alias_Flee_NonBossBattleEnemies Auto Const mandatory
RefCollectionAlias Property Alias_Mess_AmbushEnemies Auto Const mandatory
RefCollectionAlias Property Alias_Ops_RobotsAndTurrets Auto Const mandatory
RefCollectionAlias Property Alias_Ops_SurrenderedEnemies Auto Const mandatory
ReferenceAlias Property Alias_Adler_SecurityOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_Mathis_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_Mathis_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Ops_CFBodyguard01 Auto Const mandatory
ReferenceAlias Property Alias_Ops_CFBodyguard02 Auto Const mandatory
ReferenceAlias Property Alias_Ops_FollowerMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_Ops_NaevaSurrenderWaitMarker Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Robotics_EventManager Auto Const mandatory
ReferenceAlias Property Alias_Rokov_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_Toft Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
Scene Property LC088_000_Announcements Auto Const mandatory
Scene Property LC088_100_BoardingAnnouncement Auto Const mandatory
Scene Property LC088_200_Vigilance_BrigPrisonersCheer Auto Const mandatory
Scene Property LC088_300_Rokov_Start Auto Const mandatory
Scene Property LC088_380_Rokov_End Auto Const mandatory
Scene Property LC088_410_Mathis_Start Auto Const mandatory
Scene Property LC088_480_Mathis_End Auto Const mandatory
Scene Property LC088_480_RoboticsEndAnnouncement Auto Const mandatory
Scene Property LC088_511_Naeva_Start Auto Const mandatory
Scene Property LC088_530_Naeva_Breach_1 Auto Const mandatory
Scene Property LC088_550_Naeva_Breach_2 Auto Const mandatory
Scene Property LC088_570_Naeva_Breach_3 Auto Const mandatory
Scene Property LC088_580_EngineEndAnnouncement Auto Const mandatory
Scene Property LC088_581_Naeva_Clear Auto Const mandatory
Scene Property LC088_581_Naeva_End Auto Const mandatory
Scene Property LC088_610_Adler_Start Auto Const mandatory
Scene Property LC088_620_Adler_Greet Auto Const mandatory
Scene Property LC088_650_WeaponsAmbushDoorStuck Auto Const mandatory
Scene Property LC088_650_WeaponsAmbushStart Auto Const mandatory
Scene Property LC088_680_Adler_End Auto Const mandatory
Scene Property LC088_710_Huan_Start Auto Const mandatory
Scene Property LC088_710_Huan_Start_InCombat Auto Const mandatory
Scene Property LC088_750_MessAmbushStart Auto Const mandatory
Scene Property LC088_780_Huan_End Auto Const mandatory
Scene Property LC088_810_Estelle_Start Auto Const mandatory
Scene Property LC088_880_Estelle_End Auto Const mandatory
Scene Property LC088_910_Flee_Start Auto Const mandatory
Scene Property LC088_921_Flee_Shuttle01 Auto Const mandatory
Scene Property LC088_922_Flee_Shuttle02 Auto Const mandatory
Scene Property LC088_923_Flee_Shuttle03 Auto Const mandatory
Scene Property LC088_924_Flee_Shuttle04 Auto Const mandatory
Scene Property LC088_1010_KibweConfrontation Auto Const mandatory
Scene Property LC088_1019_SurrenderScene Auto Const mandatory
Scene Property LC088_1020_ExecutionScene Auto Const mandatory
ObjectReference Property LC082_CFMain_EnableMarker Auto Const mandatory
ObjectReference Property LC088_EnableMarker Auto Const mandatory
ObjectReference Property LC088_DisableMarker Auto Const mandatory
ObjectReference Property LC082_Quickstart_DockingPort Auto Const mandatory
ObjectReference Property LC088_Quickstart_Rokov Auto Const mandatory
ObjectReference Property LC088_Quickstart_Mathis Auto Const mandatory
ObjectReference Property LC088_Quickstart_Naeva Auto Const mandatory
ObjectReference Property LC088_Quickstart_Adler Auto Const mandatory
ObjectReference Property LC088_Quickstart_Estelle Auto Const mandatory
ObjectReference Property LC088_Quickstart_Huan Auto Const mandatory
ObjectReference Property LC088_Quickstart_Flee Auto Const mandatory
ObjectReference Property LC088_Quickstart_Kibwe Auto Const mandatory
lc082_brigmanagerrefscript Property LC082_BrigManagerRef Auto Const mandatory
ObjectReference Property CF08_NaevaSurrenderEntryMarker Auto Const mandatory
ObjectReference Property LC082_AbandonShipAlarmMarkerRef Auto Const mandatory
ObjectReference Property LC082_BoardingAlarmMarkerRef Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
Faction Property CydoniaFaction Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
LeveledItem Property LLI_CrimsonFleet_Heavy Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_01 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_04 Auto Const mandatory
Perk Property LC088_Vigilance_MathisInitialDebuffPerk Auto Const mandatory
Scene Property LC088_1010_KibweConfrontationIntroCamera Auto Const mandatory
LocationAlias Property Alias_LC088VigilanceLocation Auto Const mandatory
wwiseevent Property DRS_QST_CF08_ShipA_VerticalA_Open Auto Const mandatory
ReferenceAlias Property Alias_Ops_Door_EntryDoor Auto Const mandatory
wwiseevent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_02 Auto Const mandatory
ReferenceAlias Property Alias_CF08BattleAlarm Auto Const mandatory
wwiseevent Property WwiseEvent_QST_CF08_Shuttle_Disembark Auto Const mandatory
wwiseevent Property WwiseEvent_ShakeController_p25_p25_03 Auto Const mandatory
ActorValue Property LC088_Vigilance_PlayAnnouncementValue Auto Const mandatory
ReferenceAlias Property Alias_Ops_NaevaSurrenderStartMarker Auto Const mandatory
ReferenceAlias Property Alias_Ops_CrowdWalla Auto Const mandatory
Keyword Property LocTypeShowClothing Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ObjectReference Property LC088_Vigilance_MessHallNavcutRef Auto Const mandatory
ObjectReference Property LC088_Vigilance_QTMarkerWeaponsRef Auto Const mandatory
ObjectReference Property LC088_Vigilance_QTMarkerQuartersRef Auto Const mandatory
ObjectReference Property LC088_Vigilance_EngineRoom01EndBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_EngineRoom02EndBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_EngineRoom03EndBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_MessHallStartBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_MessHallEndBreadcrumb Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0470_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0820_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(9)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Rokov, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Mathis, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Naeva, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Adler, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Huan, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Estelle, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(9)
  Game.GetPlayer().MoveTo(LC088_Quickstart_Flee, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Self.SetStage(9)
  Alias_Flee_NonBossBattleEnemies.DisableAll(False)
  If !CF_Post.GetStageDone(0)
    Game.GetPlayer().MoveTo(LC088_Quickstart_Kibwe, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0009_Item_00()
  LC088_Space.SetStage(40)
  Alias_playerShip.GetShipRef().InstantDock(Alias_Vigilance.GetShipRef() as ObjectReference)
  CF08_Fleet.SetStage(310)
  If !Self.GetStageDone(0)
    Self.SetStage(110)
  EndIf
  If Self.GetStageDone(8)
    LC088_000_Announcements.Stop()
  EndIf
  Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort, 0.0, 0.0, 0.0, True, False)
  While !Self.GetStageDone(12)
    Utility.Wait(0.100000001)
  EndWhile
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Location vigilanceLoc = Alias_LC088VigilanceLocation.GetLocation()
  vigilanceLoc.Reset()
  vigilanceLoc.RemoveKeyword(LocTypeShowClothing)
  LC082_CFMain_EnableMarker.Disable(False)
  LC088_DisableMarker.Disable(False)
  LC088_EnableMarker.Enable(False)
  Alias_Brig_Clutter.EnableAll(False)
  Alias_Flee_NonBossBattleEnemies.EnableAll(False)
  Alias_Ops_CrowdWalla.TryToDisable()
  Alias_Ops_RobotsAndTurrets.EnableAll(False)
  kmyQuest.Ops_InitSecurityDoors()
  LC082_BoardingAlarmMarkerRef.Enable(False)
  kmyQuest.Ops_SetElevatorLockedDown(True)
  kmyQuest.Ops_SetupOps()
  Self.SetStageNoWait(11)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  While !LC082_BrigManagerRef.HasInitilized()
    Utility.Wait(0.100000001)
  EndWhile
  kmyQuest.SetupBrigPrisoners()
  kmyQuest.SetupAllCaptainEvents()
  Self.SetStage(12)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Actor RokovRef = Alias_Rokov.GetActorRef()
  RokovRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False)
  RokovRef.AddToFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Actor MathisRef = Alias_Mathis.GetActorRef()
  MathisRef.AddPerk(LC088_Vigilance_MathisInitialDebuffPerk, False)
  MathisRef.AddItem(LLI_CrimsonFleet_Heavy as Form, 1, False)
EndFunction

Function Fragment_Stage_0016_Item_00()
  ObjectReference adlerDoor = Alias_Adler_SecurityOfficeDoor.GetRef()
  adlerDoor.Unlock(False)
  adlerDoor.SetOpen(True)
  Actor AdlerRef = Alias_Adler.GetActorRef()
  AdlerRef.RemoveFromFaction(CrimeFactionUC)
  AdlerRef.RemoveFromFaction(CydoniaFaction)
  AdlerRef.AddToFaction(CrimeFactionCrimsonFleet)
  AdlerRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False)
EndFunction

Function Fragment_Stage_0017_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.EnableCaptain(Alias_Huan, Alias_Huan_StartMarker)
  Alias_Huan.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_02, False)
EndFunction

Function Fragment_Stage_0018_Item_00()
  Actor EstelleRef = Alias_Estelle.GetActorRef()
  EstelleRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False)
  EstelleRef.RemoveFromFaction(CrimeFactionNeon)
  EstelleRef.AddToFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0100_Item_00()
  LC088_100_BoardingAnnouncement.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  LC082_BoardingAlarmMarkerRef.Disable(False)
  LC088_000_Announcements.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF08_Fleet.SetStage(320)
EndFunction

Function Fragment_Stage_0210_Item_00()
  CF08_Fleet.SetStage(350)
EndFunction

Function Fragment_Stage_0280_Item_00()
  CF08_Fleet.SetStage(330)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1.0)
EndFunction

Function Fragment_Stage_0310_Item_00()
  If Self.GetStageDone(13)
    LC088_300_Rokov_Start.Start()
  EndIf
  Int I = 0
  While I < Alias_Brig_ReleasedPrisoners.GetCount()
    (Alias_Brig_ReleasedPrisoners.GetAt(I) as Actor).EvaluatePackage(False)
    I += 1
  EndWhile
  CF08_Fleet.SetStage(700)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.EnableCaptainAlly(Alias_Rokov_Ally01)
  kmyQuest.EnableCaptainAlly(Alias_Rokov_Ally02)
  kmyQuest.EnableCaptain(Alias_Rokov, Alias_Rokov_StartMarker)
EndFunction

Function Fragment_Stage_0380_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  If Self.GetStageDone(13)
    kmyQuest.SetCaptainComplete(Alias_Rokov.GetActorRef())
    kmyQuest.SetCaptainComplete(Alias_Rokov_Ally01.GetActorRef())
    kmyQuest.SetCaptainComplete(Alias_Rokov_Ally02.GetActorRef())
    If Self.GetStage() < 400
      CF08_Fleet.SetStage(605)
    EndIf
  EndIf
  kmyQuest.SetCaptainAlliesComplete(Alias_Brig_ReleasedPrisoners)
EndFunction

Function Fragment_Stage_0390_Item_00()
  CF08_Fleet.SetStage(610)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1.0)
  If Self.GetStageDone(14)
    kmyQuest.EnableCaptain(Alias_Mathis, Alias_Mathis_StartMarker)
    LC088_410_Mathis_Start.Start()
    kmyQuest.Robotics_StartRoboticsBayBattle()
  EndIf
  If !CF08_Fleet.GetStageDone(610)
    CF08_Fleet.SetStage(615)
  EndIf
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  If Self.GetStageDone(14)
    Alias_Mathis.GetActorRef().RemovePerk(LC088_Vigilance_MathisInitialDebuffPerk)
  Else
    kmyQuest.Robotics_StartRoboticsBayBattle()
  EndIf
  kmyQuest.Robotics_SealRoboticsBayDoors()
EndFunction

Function Fragment_Stage_0480_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_000_Announcements.Stop()
  LC088_480_RoboticsEndAnnouncement.Start()
  If Self.GetStageDone(14)
    kmyQuest.SetCaptainComplete(Alias_Mathis.GetActorRef())
    If Self.GetStage() < 500
      CF08_Fleet.SetStage(620)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0481_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.Robotics_UnsealRoboticsBayDoors()
EndFunction

Function Fragment_Stage_0490_Item_00()
  CF08_Fleet.SetStage(625)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  If Self.GetStageDone(15)
    kmyQuest.EnableCaptain(Alias_Naeva, Alias_Naeva_StartMarker)
    Int I = 0
    Int count = Alias_Naeva_Allies.GetCount()
    While I < count
      kmyQuest.EnableCaptainAllyRef(Alias_Naeva_Allies.GetAt(I) as Actor)
      I += 1
    EndWhile
  EndIf
  If !CF08_Fleet.GetStageDone(625)
    CF08_Fleet.SetStage(630)
  EndIf
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.EVPNaevaAndAllies()
EndFunction

Function Fragment_Stage_0511_Item_00()
  LC088_511_Naeva_Start.Start()
EndFunction

Function Fragment_Stage_0520_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.EVPNaevaAndAllies()
EndFunction

Function Fragment_Stage_0530_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom01EndBreadcrumb, 0.0, 0.0, 0.0, True, False)
  Alias_Naeva_Room1CollisionMarkers.DisableAll(False)
  If Self.GetStageDone(15)
    LC088_511_Naeva_Start.Stop()
    LC088_530_Naeva_Breach_1.Start()
    kmyQuest.EVPNaevaAndAllies()
    Utility.Wait(2.0)
    kmyQuest.EVPNaevaAndAllies()
    Utility.Wait(2.0)
    kmyQuest.EVPNaevaAndAllies()
  EndIf
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom02EndBreadcrumb, 0.0, 0.0, 0.0, True, False)
  Alias_Naeva_Room2CollisionMarkers.DisableAll(False)
  If Self.GetStageDone(15)
    LC088_550_Naeva_Breach_2.Start()
    kmyQuest.EVPNaevaAndAllies()
  EndIf
EndFunction

Function Fragment_Stage_0570_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom03EndBreadcrumb, 0.0, 0.0, 0.0, True, False)
  Alias_Naeva_Room3CollisionMarkers.DisableAll(False)
  If Self.GetStageDone(15)
    LC088_570_Naeva_Breach_3.Start()
    kmyQuest.EVPNaevaAndAllies()
  EndIf
EndFunction

Function Fragment_Stage_0580_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.EVPNaevaAndAllies()
  If Self.GetStageDone(15) && Alias_Naeva.GetActorRef().GetCombatState() == 0
    Self.SetStage(581)
  Else
    Self.SetStage(585)
  EndIf
EndFunction

Function Fragment_Stage_0581_Item_00()
  LC088_581_Naeva_Clear.Start()
EndFunction

Function Fragment_Stage_0582_Item_00()
  Self.SetStage(585)
EndFunction

Function Fragment_Stage_0585_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_000_Announcements.Stop()
  LC088_580_EngineEndAnnouncement.Start()
  If Self.GetStageDone(15)
    kmyQuest.SetCaptainComplete(Alias_Naeva.GetActorRef())
    kmyQuest.SetCaptainAlliesComplete(Alias_Naeva_Allies)
    If Self.GetStage() < 600
      CF08_Fleet.SetStage(665)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0590_Item_00()
  CF08_Fleet.SetStage(670)
EndFunction

Function Fragment_Stage_0600_Item_00()
  If Self.GetStageDone(16)
    Self.SetStage(610)
  EndIf
  If !CF08_Fleet.GetStageDone(670)
    CF08_Fleet.SetStage(675)
  EndIf
EndFunction

Function Fragment_Stage_0610_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.EnableCaptain(Alias_Adler, Alias_Adler_StartMarker)
  LC088_610_Adler_Start.Start()
  CF08_Fleet.SetStage(360)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Alias_Adler.TryToEvaluatePackage()
EndFunction

Function Fragment_Stage_0630_Item_00()
  Alias_Adler.TryToEvaluatePackage()
EndFunction

Function Fragment_Stage_0631_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Self.SetStage(640)
  Alias_Adler_StealthDoor.GetRef().Unlock(False)
  kmyQuest.Weapons_ConvertRobotsAndTurrets()
  CF08_Fleet.SetStage(370)
EndFunction

Function Fragment_Stage_0632_Item_00()
  Alias_Adler_StealthDoor.GetRef().Unlock(False)
  CF08_Fleet.SetStage(370)
EndFunction

Function Fragment_Stage_0633_Item_00()
  CF08_Fleet.SetStage(370)
EndFunction

Function Fragment_Stage_0640_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.Weapons_SealWeaponBays()
EndFunction

Function Fragment_Stage_0650_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Alias_Adler.TryToEvaluatePackage()
  CF08_Fleet.SetStage(375)
  kmyQuest.Weapons_StartAmbush()
  LC088_650_WeaponsAmbushStart.Start()
  If Self.GetStageDone(640)
    LC088_650_WeaponsAmbushDoorStuck.Start()
  EndIf
EndFunction

Function Fragment_Stage_0680_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  If Self.GetStageDone(16)
    kmyQuest.SetCaptainComplete(Alias_Adler.GetActorRef())
  EndIf
EndFunction

Function Fragment_Stage_0690_Item_00()
  CF08_Fleet.SetStage(370)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_Vigilance_QTMarkerQuartersRef.MoveTo(LC088_Vigilance_MessHallStartBreadcrumb, 0.0, 0.0, 0.0, True, False)
  If Self.GetStageDone(17)
    Self.SetStage(710)
  EndIf
  If !CF08_Fleet.GetStageDone(370)
    CF08_Fleet.SetStage(375)
  EndIf
EndFunction

Function Fragment_Stage_0710_Item_00()
  If Self.GetStageDone(17)
    If Game.GetPlayer().IsInCombat() || Alias_Huan.GetActorRef().IsInCombat()
      LC088_710_Huan_Start_InCombat.Start()
    Else
      Alias_Huan.TryToEvaluatePackage()
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0720_Item_00()
  Alias_Huan.TryToEvaluatePackage()
EndFunction

Function Fragment_Stage_0730_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_Vigilance_QTMarkerQuartersRef.MoveTo(LC088_Vigilance_MessHallEndBreadcrumb, 0.0, 0.0, 0.0, True, False)
  LC088_Vigilance_MessHallNavcutRef.Disable(False)
  Utility.Wait(2.0)
  If Self.GetStageDone(17)
    Alias_HuanCombat.ForceRefTo(Alias_Huan.GetRef())
    Alias_Huan.TryToEvaluatePackage()
  EndIf
EndFunction

Function Fragment_Stage_0750_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.Mess_StartAmbush()
  LC088_750_MessAmbushStart.Start()
EndFunction

Function Fragment_Stage_0780_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  If Self.GetStageDone(17)
    kmyQuest.SetCaptainComplete(Alias_Huan.GetActorRef())
    If Self.GetStage() < 800
      CF08_Fleet.SetStage(635)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0790_Item_00()
  CF08_Fleet.SetStage(640)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1.0)
  kmyQuest.SetupEstelle()
  If !CF08_Fleet.GetStageDone(640)
    CF08_Fleet.SetStage(645)
  EndIf
EndFunction

Function Fragment_Stage_0810_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.EnableEstelle()
EndFunction

Function Fragment_Stage_0880_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Self.SetStage(820)
  If Self.GetStageDone(18)
    kmyQuest.SetCaptainComplete(Alias_Estelle.GetActorRef())
    kmyQuest.SetCaptainAlliesComplete(Alias_Estelle_Level2_QuartersAllies)
    kmyQuest.SetCaptainAlliesComplete(Alias_Estelle_Level3_QuartersAllies)
    If Self.GetStage() < 900
      CF08_Fleet.SetStage(650)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0890_Item_00()
  CF08_Fleet.SetStage(655)
EndFunction

Function Fragment_Stage_0900_Item_00()
  If !CF08_Fleet.GetStageDone(655)
    CF08_Fleet.SetStage(660)
  EndIf
EndFunction

Function Fragment_Stage_0901_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_000_Announcements.Stop()
  LC088_910_Flee_Start.Start()
  Self.SetStage(902)
EndFunction

Function Fragment_Stage_0902_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Utility.Wait(1.0)
  kmyQuest.Flee_StartFleeing()
EndFunction

Function Fragment_Stage_0903_Item_00()
  LC082_AbandonShipAlarmMarkerRef.Enable(False)
EndFunction

Function Fragment_Stage_0921_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort01.GetRef()
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None)
  dockingPortMarker.Disable(False)
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0)
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None)
  LC088_921_Flee_Shuttle01.Start()
EndFunction

Function Fragment_Stage_0922_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort02.GetRef()
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None)
  dockingPortMarker.Disable(False)
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0)
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None)
  LC088_922_Flee_Shuttle02.Start()
EndFunction

Function Fragment_Stage_0923_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort03.GetRef()
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None)
  dockingPortMarker.Disable(False)
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0)
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None)
  LC088_923_Flee_Shuttle03.Start()
EndFunction

Function Fragment_Stage_0924_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort04.GetRef()
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None)
  dockingPortMarker.Disable(False)
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0)
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None)
  LC088_924_Flee_Shuttle04.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  LC088_000_Announcements.Stop()
  LC082_AbandonShipAlarmMarkerRef.Disable(False)
  Alias_Ops_Door_EntryDoor.GetRef().SetOpen(True)
  Self.SetStage(1010)
EndFunction

Function Fragment_Stage_1003_Item_00()
  Alias_Kibwe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1005_Item_00()
  LC088_1010_KibweConfrontationIntroCamera.Stop()
  Alias_Kibwe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1010_Item_00()
  If !Self.GetStageDone(1100)
    LC088_1010_KibweConfrontationIntroCamera.Start()
    CF08_SpeechChallenge_Kibwe.Start()
  EndIf
  CF08_Fleet.SetStage(380)
EndFunction

Function Fragment_Stage_1011_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.Ops_LockPlayerControls(True)
  kmyQuest.Ops_SetFastTravelEnabled(False)
  Alias_CF08BattleAlarm.TryToEnable()
  Actor KibweRef = Alias_Kibwe.GetActorRef()
  Actor ToftRef = Alias_Toft.GetActorRef()
  KibweRef.SetValue(Aggression, 0.0)
  ToftRef.SetValue(Aggression, 0.0)
  KibweRef.StopCombat()
  ToftRef.StopCombat()
EndFunction

Function Fragment_Stage_1012_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  SQ_Followers.TeleportFollowers(Alias_Ops_FollowerMoveToMarker.GetRef(), None, True, True, False, False, False)
  Alias_Ops_Door_EntryDoor.GetRef().SetOpen(False)
  kmyQuest.Ops_SealSecurityDoors()
EndFunction

Function Fragment_Stage_1019_Item_00()
  Actor KibweRef = Alias_Kibwe.GetActorRef()
  Actor ToftRef = Alias_Toft.GetActorRef()
  KibweRef.SetValue(Aggression, 0.0)
  ToftRef.SetValue(Aggression, 0.0)
  KibweRef.StopCombat()
  ToftRef.StopCombat()
  Alias_Ops_SurrenderedEnemies.AddRef(KibweRef as ObjectReference)
  Alias_Ops_SurrenderedEnemies.AddRef(ToftRef as ObjectReference)
  Self.SetStage(1100)
  Alias_Ops_CFBodyguard01.GetActorRef().SetGhost(True)
  Alias_Ops_CFBodyguard02.GetActorRef().SetGhost(True)
EndFunction

Function Fragment_Stage_1020_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  If !Self.GetStageDone(1100)
    Self.SetStage(1011)
    Self.SetStage(1012)
    kmyQuest.Ops_LockPlayerControls(False)
    kmyQuest.Ops_StartBattleNoWait()
    CF08_Fleet.SetStage(390)
    CF08_Fleet.SetStage(400)
    CF08_Fleet.SetStage(410)
  EndIf
  Actor KibweRef = Alias_Kibwe.GetActorRef()
  Actor ToftRef = Alias_Toft.GetActorRef()
  KibweRef.SetValue(Aggression, 1.0)
  ToftRef.SetValue(Aggression, 1.0)
  KibweRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
  ToftRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_1050_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  CF08_Fleet.SetStage(420)
  kmyQuest.Ops_ActivateAllTurrets()
  kmyQuest.Ops_ActivateAllRobots()
EndFunction

Function Fragment_Stage_1051_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  CF08_Fleet.SetStage(430)
  kmyQuest.Ops_ActivateAllTurrets()
  kmyQuest.Ops_ActivateAllRobots()
EndFunction

Function Fragment_Stage_1094_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  LC088_581_Naeva_Clear.Stop()
  Alias_Ops_CFBodyguard01.TryToEnableNoWait()
  Alias_Ops_CFBodyguard02.TryToEnableNoWait()
  Alias_Naeva.TryToEnable()
  Alias_Naeva.TryToMoveTo(Alias_Ops_NaevaSurrenderStartMarker.GetRef())
  Alias_Naeva.GetActorRef().SetGhost(True)
  If Self.GetStageDone(1019)
    LC088_1019_SurrenderScene.Start()
  Else
    LC088_1020_ExecutionScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.Ops_LockPlayerControls(False)
  kmyQuest.Ops_EndBattleNoWait()
  CF08_Fleet.SetStageNoWait(440)
  CF08_Fleet.SetStageNoWait(510)
EndFunction

Function Fragment_Stage_1101_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  kmyQuest.Ops_LockPlayerControls(False)
  kmyQuest.Ops_EndBattle()
  CF08_Fleet.SetStage(440)
  CF08_Fleet.SetStage(510)
EndFunction

Function Fragment_Stage_1110_Item_00()
  Alias_Kibwe.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_1111_Item_00()
  Alias_Toft.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_1112_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Actor NaevaRef = Alias_Naeva.GetActorRef()
  NaevaRef.SetGhost(False)
  NaevaRef.Disable(False)
  Alias_Ops_CFBodyguard01.GetActorRef().SetGhost(False)
  Alias_Ops_CFBodyguard02.GetActorRef().SetGhost(False)
EndFunction

Function Fragment_Stage_1119_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Self.SetStage(1110)
  Self.SetStage(1111)
  Self.SetStage(1112)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
  Self.SetStage(1090)
  Alias_Flee_NonBossBattleEnemies.DisableAll(False)
  Alias_Ops_RobotsAndTurrets.DisableAll(False)
  Alias_Kibwe.TryToDisable()
  Alias_Toft.TryToDisable()
  Alias_Mathis_EnableMarker.TryToDisable()
  Alias_Mathis_DisableMarker.TryToDisable()
  kmyQuest.Robotics_UnsealRoboticsBayDoors()
  kmyQuest.Cleanup()
  CF08_SpeechChallenge_Kibwe.Stop()
  Self.Stop()
EndFunction
