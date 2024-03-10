ScriptName Fragments:Quests:QF_RI06_001A9560 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RI06StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Veena Auto Const mandatory
ReferenceAlias Property Alias_Camden Auto Const mandatory
ReferenceAlias Property Alias_MasakoIntroSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_CamdenIntroSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_VeenaIntroSceneMarker Auto Const mandatory
Quest Property RI05 Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostKeyCamden Auto Const mandatory
Key Property RI06_CMOutpostRC1AccessKey Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property RI06_Bribe Auto Const mandatory
GlobalVariable Property RI04_Track_PlayerStoleCamdenChoInfo Auto Const mandatory
Potion Property Drug_Aurora Auto Const mandatory
ReferenceAlias Property Alias_SecureWingAccessKey Auto Const mandatory
Scene Property RI06_1200_Guard_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostTerminalQS Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostMapMarker Auto Const mandatory
Quest Property RIR06 Auto Const mandatory
Scene Property RI06_0100_Masako_TriggeredScene Auto Const mandatory
ReferenceAlias Property Alias_VeenaOfficeDoor Auto Const mandatory
Scene Property RI06_1375_Guard_DrOsianScene Auto Const mandatory
ReferenceAlias Property Alias_DrOsian Auto Const mandatory
ReferenceAlias Property Alias_DrOsianSceneFurniture Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Scene Property RI06_1220_SecureWing_TriggeredScene Auto Const mandatory
ReferenceAlias Property Alias_TheClinicMapMarker Auto Const mandatory
GlobalVariable Property RI05_Track_BayuDispleased Auto Const mandatory
Quest Property RI07 Auto Const mandatory
ReferenceAlias Property Alias_VeenaOfficeSceneTrigger Auto Const mandatory
ReferenceAlias Property Alias_GuardSecureWingMoveTo Auto Const mandatory
Scene Property RI06_1258_Sean_CallSecurityScene Auto Const mandatory
Scene Property RI06_1258_DrLane_CallSecurityScene Auto Const mandatory
ReferenceAlias Property Alias_AriQS Auto Const mandatory
GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const mandatory
GlobalVariable Property RI06_Extort Auto Const mandatory
Faction Property RI06_SecureWingFaction Auto Const mandatory
ObjectReference Property NewGameShipMarkerREF Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_RothiciteShipment Auto Const mandatory
ReferenceAlias Property Alias_DrLane Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_Sean Auto Const mandatory
ReferenceAlias Property Alias_DrLaneTerminal Auto Const mandatory
Book Property RI05_KumihoSlate Auto Const mandatory
ReferenceAlias Property Alias_Guard_SecureWing Auto Const mandatory
Keyword Property RIR06_QuestStartKeyword Auto Const mandatory
ActorValue Property RI06_Foreknowledge_LucasDrexlerEvilAV Auto Const mandatory
GlobalVariable Property RI06_SeanDead Auto Const mandatory
GlobalVariable Property RI06_KendrickDead Auto Const mandatory
ReferenceAlias Property Alias_SecureWingDoor Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
MiscObject Property RI06_RothiciteShipment Auto Const mandatory
ReferenceAlias Property Alias_RothiciteShipmentPost Auto Const mandatory
Cell Property StationTheClinicSecureWing01 Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostTowerNPCsEnableMarker Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
GlobalVariable Property RI_UnlockRothicite Auto Const mandatory
GlobalVariable Property RIR06_RadiantCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(20)
  RI05.SetStage(15)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(200)
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Alias_Camden.GetRef().MoveTo(Alias_CamdenIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
  Alias_VeenaOfficeDoor.GetRef().SetOpen(True)
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(20)
  Self.SetStage(300)
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(20)
  Self.SetStage(400)
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(20)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(700)
  Self.SetStage(750)
  Game.GetPlayer().MoveTo(Alias_CMOutpostTerminalQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(20)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(700)
  Self.SetStage(750)
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(610)
  Self.SetStage(700)
  Self.SetStage(710)
  Self.SetStage(750)
  Self.SetStage(751)
  Self.SetStage(755)
  Self.SetStage(760)
  Self.SetStage(850)
  Self.SetStage(860)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(610)
  Self.SetStage(700)
  Self.SetStage(710)
  Self.SetStage(750)
  Self.SetStage(751)
  Self.SetStage(755)
  Self.SetStage(760)
  Self.SetStage(850)
  Self.SetStage(860)
  Self.SetStage(900)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(610)
  Self.SetStage(700)
  Self.SetStage(710)
  Self.SetStage(750)
  Self.SetStage(751)
  Self.SetStage(755)
  Self.SetStage(760)
  Self.SetStage(850)
  Self.SetStage(860)
  Self.SetStage(900)
  Self.SetStage(1000)
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(610)
  Self.SetStage(700)
  Self.SetStage(710)
  Self.SetStage(750)
  Self.SetStage(751)
  Self.SetStage(755)
  Self.SetStage(760)
  Self.SetStage(850)
  Self.SetStage(860)
  Self.SetStage(900)
  Self.SetStage(1000)
  Self.SetStage(1100)
  Self.SetStage(1200)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_AriQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(610)
  Self.SetStage(700)
  Self.SetStage(710)
  Self.SetStage(750)
  Self.SetStage(751)
  Self.SetStage(755)
  Self.SetStage(760)
  Self.SetStage(850)
  Self.SetStage(860)
  Self.SetStage(900)
  Self.SetStage(1000)
  Self.SetStage(1100)
  Self.SetStage(1200)
  Self.SetStage(1300)
  Self.SetStage(1305)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_AriQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetStage(20)
  Self.SetStage(1400)
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetStage(20)
  Self.SetStage(1600)
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0016_Item_00()
  Self.SetStage(20)
  Self.SetStage(100)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(610)
  Self.SetStage(850)
EndFunction

Function Fragment_Stage_0020_Item_00()
  RI_Support.SetStage(3)
  Alias_RothiciteShipment.GetRef().SetActorRefOwner(Alias_DrLane.GetActorRef(), False)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddItem(Credits as Form, 10000, False)
  PlayerRef.AddItem(Drug_Aurora as Form, 5, False)
  Alias_Yuko.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Alias_Camden.GetRef().MoveTo(Alias_CamdenIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Else
    Alias_Camden.GetRef().Disable(False)
  EndIf
  Alias_VeenaOfficeDoor.GetRef().SetOpen(True)
EndFunction

Function Fragment_Stage_0110_Item_00()
  RI06_0100_Masako_TriggeredScene.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Game.GetPlayer().AddItem(Alias_CMOutpostKeyCamden.GetRef() as Form, 1, False)
  Self.SetStage(820)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0
    Self.SetStage(410)
  EndIf
  If Self.IsObjectiveDisplayed(400)
    Self.SetObjectiveCompleted(400, True)
  EndIf
  If Self.IsObjectiveDisplayed(100)
    Self.SetObjectiveCompleted(100, True)
  EndIf
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveCompleted(200, True)
  EndIf
  Self.SetObjectiveDisplayed(500, True, False)
  Alias_CMOutpostMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
  Alias_CMOutpostMapMarker.GetRef().AddToMapScanned(True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveCompleted(600, True)
  Self.SetStage(850)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveCompleted(700, True)
  If Self.GetStageDone(755)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveDisplayed(750, True, False)
EndFunction

Function Fragment_Stage_0751_Item_00()
  Self.SetObjectiveDisplayed(751, True, False)
EndFunction

Function Fragment_Stage_0755_Item_00()
  Self.SetStage(900)
  Self.SetStage(760)
  Self.SetObjectiveCompleted(751, True)
  Self.SetObjectiveCompleted(700, True)
EndFunction

Function Fragment_Stage_0760_Item_00()
  Self.SetObjectiveCompleted(750, True)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_0805_Item_00()
  Alias_CMOutpostTowerNPCsEnableMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0810_Item_00()
  If Self.IsObjectiveDisplayed(800)
    Self.SetObjectiveCompleted(800, True)
  EndIf
EndFunction

Function Fragment_Stage_0820_Item_00()
  If Self.IsObjectiveDisplayed(800)
    Self.SetObjectiveCompleted(800, True)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveDisplayed(850, True, False)
EndFunction

Function Fragment_Stage_0860_Item_00()
  Self.SetObjectiveCompleted(850, True)
  Self.SetStage(700)
  Self.SetStage(750)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False)
  Alias_TheClinicMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
  Alias_TheClinicMapMarker.GetRef().AddToMapScanned(True)
  Alias_SecureWingDoor.GetRef().SetLockLevel(25)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)
  Self.SetObjectiveCompleted(1600, True)
  If RI05_Track_BayuDispleased.GetValue() == 0.0
    RI07.SetStage(100)
    RIR06_RadiantCount.SetValue(1.0)
  EndIf
  Game.GetPlayer().SetValue(RI06_Foreknowledge_LucasDrexlerEvilAV, 1.0)
  RI_UnlockRothicite.SetValue(1.0)
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  If Self.IsObjectiveDisplayed(900)
    Self.SetObjectiveCompleted(900, True)
  EndIf
  If Self.IsObjectiveDisplayed(1000)
    Self.SetObjectiveCompleted(1000, True)
  EndIf
  If Self.IsObjectiveDisplayed(1100)
    Self.SetObjectiveCompleted(1100, True)
  EndIf
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayedAtTop(1200)
  Self.SetStage(1250)
  Alias_SecureWingDoor.GetRef().SetLockLevel(25)
EndFunction

Function Fragment_Stage_1210_Item_00()
  RI06_1200_Guard_IntroScene.Start()
EndFunction

Function Fragment_Stage_1220_Item_00()
  RI06_1220_SecureWing_TriggeredScene.Start()
EndFunction

Function Fragment_Stage_1221_Item_00()
  Alias_Sean.GetActorRef().EvaluatePackage(False)
  Alias_DrLane.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1225_Item_00()
  Alias_Sean.GetActorRef().EvaluatePackage(False)
  Alias_DrLane.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1230_Item_00()
  Quest __temp = Self as Quest
  ri06_questscript kmyQuest = __temp as ri06_questscript
  Self.SetObjectiveCompleted(1200, True)
  If Self.GetStageDone(1280)
    Self.SetStage(1400)
  EndIf
  kmyQuest.CheckForAccess(Alias_RothiciteShipment.GetRef())
EndFunction

Function Fragment_Stage_1235_Item_00()
  ObjectReference TerminalRef = Alias_DrLaneTerminal.GetRef()
  TerminalRef.SetFactionOwner(PlayerFaction, False)
  TerminalRef.Lock(False, False, True)
  Alias_RothiciteShipment.GetRef().SetFactionOwner(PlayerFaction, False)
EndFunction

Function Fragment_Stage_1236_Item_00()
  Alias_SecureWingDoor.GetRef().SetFactionOwner(PlayerFaction, False)
  Actor SecureWingGuardRef = Alias_Guard_SecureWing.GetActorRef()
  If SecureWingGuardRef.IsDisabled()
    Alias_Guard.GetRef().Disable(False)
    SecureWingGuardRef.Enable(False)
    SecureWingGuardRef.EvaluatePackage(False)
  EndIf
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)
  RI06_SecureWingFaction.SetEnemy(PlayerFaction, False, False)
  StationTheClinicSecureWing01.SetPublic(False)
EndFunction

Function Fragment_Stage_1240_Item_00()
  RI06_1220_SecureWing_TriggeredScene.Stop()
  Alias_Sean.GetActorRef().EvaluatePackage(False)
  Alias_DrLane.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1245_Item_00()
  Alias_Sean.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().StopCombatAlarm()
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetObjectiveDisplayedAtTop(1250)
EndFunction

Function Fragment_Stage_1257_Item_00()
  Quest __temp = Self as Quest
  ri06_questscript kmyQuest = __temp as ri06_questscript
  kmyQuest.SeanStartTimer()
EndFunction

Function Fragment_Stage_1258_Item_00()
  RI06_1258_Sean_CallSecurityScene.Start()
  Self.SetStage(1236)
EndFunction

Function Fragment_Stage_1259_Item_00()
  Self.SetObjectiveDisplayed(1259, True, False)
EndFunction

Function Fragment_Stage_1260_Item_00()
  Self.SetStage(1280)
EndFunction

Function Fragment_Stage_1261_Item_00()
  Quest __temp = Self as Quest
  ri06_questscript kmyQuest = __temp as ri06_questscript
  kmyQuest.CheckForAccess(Alias_DrLaneTerminal.GetRef())
EndFunction

Function Fragment_Stage_1270_Item_00()
  Self.SetStage(1235)
EndFunction

Function Fragment_Stage_1271_Item_00()
  ObjectReference TerminalRef = Alias_DrLaneTerminal.GetRef()
  TerminalRef.SetFactionOwner(PlayerFaction, False)
  TerminalRef.Lock(False, False, True)
  Alias_DrLane.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(1259, True)
EndFunction

Function Fragment_Stage_1272_Item_00()
  Quest __temp = Self as Quest
  ri06_questscript kmyQuest = __temp as ri06_questscript
  kmyQuest.DrLaneStartTimer()
EndFunction

Function Fragment_Stage_1273_Item_00()
  RI06_1258_DrLane_CallSecurityScene.Start()
  Self.SetStage(1236)
EndFunction

Function Fragment_Stage_1275_Item_00()
  If Self.IsObjectiveDisplayed(1259)
    Self.SetObjectiveCompleted(1259, True)
  EndIf
  Self.SetStage(1235)
EndFunction

Function Fragment_Stage_1276_Item_00()
  Alias_DrLane.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1280_Item_00()
  Self.SetObjectiveCompleted(1250, True)
  If Self.GetStageDone(1230)
    Self.SetStage(1400)
  EndIf
EndFunction

Function Fragment_Stage_1282_Item_00()
  Self.SetStage(1235)
EndFunction

Function Fragment_Stage_1283_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RI06_Extort.GetValueInt(), False)
  Self.SetStage(1235)
EndFunction

Function Fragment_Stage_1290_Item_00()
  RI06_SeanDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_1295_Item_00()
  RI06_KendrickDead.SetValue(1.0)
  If Self.IsObjectiveDisplayed(1259)
    Self.SetObjectiveDisplayed(1259, False, False)
  EndIf
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveDisplayed(1300, True, False)
EndFunction

Function Fragment_Stage_1305_Item_00()
  Alias_Guard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1310_Item_00()
  Self.SetStage(1394)
EndFunction

Function Fragment_Stage_1330_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI06_Bribe.GetValueInt(), False, None)
  Self.SetStage(1394)
EndFunction

Function Fragment_Stage_1340_Item_00()
  Game.GetPlayer().RemoveItem(Drug_Aurora as Form, 1, False, None)
  Self.SetStage(1390)
  Self.SetStage(1394)
EndFunction

Function Fragment_Stage_1370_Item_00()
  Actor DrOsianRef = Alias_DrOsian.GetActorRef()
  DrOsianRef.MoveTo(Alias_DrOsianSceneFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
  DrOsianRef.EvaluatePackage(False)
  Alias_Guard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1375_Item_00()
  RI06_1375_Guard_DrOsianScene.Start()
EndFunction

Function Fragment_Stage_1376_Item_00()
  Alias_DrOsian.GetActorRef().EvaluatePackage(False)
  Alias_Guard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1385_Item_00()
  Self.SetStage(1390)
  Self.SetStage(1394)
EndFunction

Function Fragment_Stage_1390_Item_00()
  Game.GetPlayer().AddItem(Alias_SecureWingAccessKey.GetRef() as Form, 1, False)
  If Self.IsObjectiveDisplayed(1300)
    Self.SetObjectiveCompleted(1300, True)
  EndIf
EndFunction

Function Fragment_Stage_1394_Item_00()
  If Self.IsObjectiveDisplayed(1300)
    Self.SetObjectiveCompleted(1300, True)
  EndIf
EndFunction

Function Fragment_Stage_1395_Item_00()
  If Self.IsObjectiveDisplayed(1300)
    Self.SetObjectiveCompleted(1300, True)
  EndIf
EndFunction

Function Fragment_Stage_1400_Item_00()
  If Self.IsObjectiveDisplayed(1300)
    Self.SetObjectiveCompleted(1300, True)
  EndIf
  Self.SetObjectiveCompleted(1200, True)
  Self.SetObjectiveDisplayed(1400, True, False)
  If Self.IsObjectiveDisplayed(1259)
    Self.SetObjectiveDisplayed(1259, False, False)
  EndIf
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1400, True)
  Self.SetObjectiveDisplayed(1500, True, False)
EndFunction

Function Fragment_Stage_1510_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveItem(Alias_RothiciteShipmentPost.GetRef() as Form, 1, False, None)
  PlayerRef.RemoveItem(Alias_RothiciteShipment.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveCompleted(1500, True)
  Self.SetObjectiveDisplayed(1600, True, False)
  If RI05_Track_BayuDispleased.GetValue() == 1.0 || RI05_Track_BayuDispleased.GetValue() == -1.0
    RIR06_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  EndIf
EndFunction

Function Fragment_Stage_1610_Item_00()
  Game.GetPlayer().RemoveItem(RI05_KumihoSlate as Form, 99, False, None)
EndFunction

Function Fragment_Stage_1620_Item_00()
  RI06_Track_PlayerWitholdsClinicNames.SetValue(1.0)
EndFunction
