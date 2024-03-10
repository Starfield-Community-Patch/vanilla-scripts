ScriptName Fragments:Quests:QF_CF06_0001BD20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF06Microdrive Auto Const mandatory
ReferenceAlias Property Alias_CF06Evidence Auto Const mandatory
ReferenceAlias Property Alias_CF06GenerdynePass Auto Const mandatory
GlobalVariable Property CF06Count Auto Const mandatory
ReferenceAlias Property Alias_CF06Naeva Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
ReferenceAlias Property Alias_CF06_Komiko Auto Const mandatory
ReferenceAlias Property Alias_CF06_Cypher Auto Const mandatory
ReferenceAlias Property Alias_CF06_BreysonBayu Auto Const mandatory
ReferenceAlias Property Alias_CF06_CGSchematicsEncrypted Auto Const mandatory
ReferenceAlias Property Alias_CF06_CGSchematicsDecrypted Auto Const mandatory
ReferenceAlias Property Alias_CF06_Estelle Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const mandatory
ObjectReference Property CF06_AstralLoungeBayuMarker Auto Const mandatory
ReferenceAlias Property Alias_CF06_BenjaminBayu Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ObjectReference Property CF06_MSPMarker Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ObjectReference Property CF06_NaevaWaitsMarker Auto Const mandatory
Scene Property CF06_Stage170_BenjaminBayu_CalloutScene Auto Const mandatory
GlobalVariable Property CF06_KomikoBribeLow Auto Const mandatory
GlobalVariable Property CF06_KomikoBribeHigh Auto Const mandatory
GlobalVariable Property CF06_KomikoBribeMedium Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_CF06_Receptionist Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property CFKey Auto Const mandatory
ObjectReference Property CF06_GDYMarker Auto Const mandatory
Quest Property LC039 Auto Const mandatory
ObjectReference Property CF06_GenerdyneInnerDoorRef01 Auto Const mandatory
ObjectReference Property CF06_GenerdyneInnerDoorRef02 Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF06_EPHMarker Auto Const mandatory
ObjectReference Property CF06_ASLMarker Auto Const mandatory
ObjectReference Property CF02_TheKeyStartRef Auto Const mandatory
Quest Property CF07 Auto Const mandatory
ObjectReference Property CF07_DelgadoSceneMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_CF06_Delgado Auto Const mandatory
ObjectReference Property CF07_JazzSceneMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_CF06_Jazz Auto Const mandatory
ReferenceAlias Property Alias_CF06_ReceptionistPass Auto Const mandatory
ReferenceAlias Property Alias_CF06_Safe Auto Const mandatory
ActorBase Property FC_Neon_BenjaminBayu Auto Const mandatory
Scene Property CF06_Stage200_BenjaminBayu_CalloutScene Auto Const mandatory
ObjectReference Property CF06_EnablerRef Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
GlobalVariable Property Neon_Euphorika_LoungeCost Auto Const mandatory
GlobalVariable Property CF06_MykaRefund Auto Const mandatory
ReferenceAlias Property Alias_CF06_Bodyguard01 Auto Const mandatory
ReferenceAlias Property Alias_CF06_Bodyguard02 Auto Const mandatory
Key Property PCF06_GenerdyneExecutiveElevatorKey Auto Const mandatory
GlobalVariable Property CF06_EstelleShareHigh Auto Const mandatory
GlobalVariable Property CF06_EstelleShareMedium Auto Const mandatory
GlobalVariable Property CF06_EstelleShareLow Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0165_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0227_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0500_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(10)
  Self.SetStage(20)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().MoveTo(CF06_MSPMarker, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().MoveTo(CF06_EPHMarker, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(120)
  Alias_CF06_Receptionist.GetActorRef().Enable(False)
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef() as Form, 1, False)
  Game.GetPlayer().MoveTo(CF06_GDYMarker, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(120)
  Self.SetStage(122)
  Self.SetStage(123)
  Self.SetStage(124)
  Self.SetStage(125)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(175)
  Self.SetStage(180)
  Self.SetStage(185)
  Self.SetStage(190)
  Alias_CF06_Receptionist.GetActorRef().Enable(False)
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().MoveTo(CF06_ASLMarker, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(120)
  Self.SetStage(122)
  Self.SetStage(123)
  Self.SetStage(124)
  Self.SetStage(125)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(175)
  Self.SetStage(180)
  Self.SetStage(185)
  Self.SetStage(190)
  Self.SetStage(205)
  Self.SetStage(207)
  Self.SetStage(220)
  Self.SetStage(230)
  Alias_CF06_Receptionist.GetActorRef().Enable(False)
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().MoveTo(CF06_MSPMarker, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(120)
  Self.SetStage(122)
  Self.SetStage(123)
  Self.SetStage(124)
  Self.SetStage(125)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(175)
  Self.SetStage(180)
  Self.SetStage(185)
  Self.SetStage(190)
  Self.SetStage(205)
  Self.SetStage(207)
  Self.SetStage(225)
  Self.SetStage(230)
  Alias_CF06_Receptionist.GetActorRef().Enable(False)
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().MoveTo(CF06_MSPMarker, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(120)
  Self.SetStage(122)
  Self.SetStage(123)
  Self.SetStage(124)
  Self.SetStage(125)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(175)
  Self.SetStage(180)
  Self.SetStage(185)
  Self.SetStage(190)
  Self.SetStage(205)
  Self.SetStage(207)
  Self.SetStage(210)
  Self.SetStage(230)
  Self.SetStage(280)
  Alias_CF06_Receptionist.GetActorRef().Enable(False)
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().MoveTo(CF02_TheKeyStartRef, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(120)
  Self.SetStage(122)
  Self.SetStage(123)
  Self.SetStage(124)
  Self.SetStage(125)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(175)
  Self.SetStage(180)
  Self.SetStage(185)
  Self.SetStage(190)
  Self.SetStage(205)
  Self.SetStage(207)
  Self.SetStage(220)
  Self.SetStage(230)
  Self.SetStage(280)
  Alias_CF06_Receptionist.GetActorRef().Enable(False)
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
  Game.GetPlayer().MoveTo(CF02_TheKeyStartRef, 0.0, 0.0, 0.0, True, False)
  CF_Main.SetStage(1)
  CFSD01.SetStage(5)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_CF06_Estelle.GetActorRef().Enable(False)
  Alias_CF06_Estelle.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(50, True, False)
  Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef() as Form, 1, False)
  CF06_EnablerRef.Enable(False)
  Alias_CF06_Komiko.GetActorRef().Enable(False)
  Utility.Wait(2.0)
  Alias_CF06_Komiko.GetActorRef().EvaluatePackage(False)
  Alias_CF06Evidence.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0042_Item_00()
  Alias_CF06_Safe.GetRef().SetLockLevel(0)
  Alias_CF06_Safe.GetRef().Unlock(False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(45, True, False)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0047_Item_00()
  If CF06_MykaRefund.GetValue() == 0.0
    Game.GetPlayer().AddItem(Credits as Form, Neon_Euphorika_LoungeCost.GetValueInt(), False)
    CF06_MykaRefund.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_CF06_Komiko.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_CF06_Komiko.GetActorRef().SetValue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True)
  If Self.IsObjectiveDisplayed(40) == True
    Self.SetObjectiveDisplayed(40, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(70) == True
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
  Alias_CF06_Komiko.GetActorRef().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  If Self.GetStageDone(110) == False
    Self.SetObjectiveCompleted(50, True)
    Self.SetObjectiveDisplayed(70, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(70, True)
  If Self.IsObjectiveDisplayed(40) == True
    Self.SetObjectiveDisplayed(40, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(60) == True
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0093_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0098_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.IsObjectiveDisplayed(40) == True
    Self.SetObjectiveCompleted(40, True)
  EndIf
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(60) == True
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(70) == True
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(45, True)
  Self.SetObjectiveDisplayed(80, True, False)
  Alias_CF06_Receptionist.GetActorRef().Enable(False)
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False)
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(70) == True
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(100, True, False)
  LC039.SetStage(200)
  Alias_CF06_Komiko.GetActorRef().Disable(False)
  CF06_EnablerRef.Disable(False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_CF06_Receptionist.GetActorRef().AddItem(Alias_CF06_ReceptionistPass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Game.GetPlayer().AddItem(Alias_CF06_CGSchematicsEncrypted.GetRef() as Form, 1, False)
  LC039.SetStage(700)
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
  Alias_CF06_BreysonBayu.GetActorRef().Enable(False)
  Alias_CF06_BreysonBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_CF06_Estelle.GetActorRef().Disable(False)
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(130, True)
  Game.GetPlayer().AddItem(Alias_CF06_Cypher.GetRef() as Form, 1, False)
  Self.SetStage(175)
EndFunction

Function Fragment_Stage_0175_Item_00()
  If Self.IsObjectiveDisplayed(140) == True
    Self.SetObjectiveDisplayed(140, False, False)
  EndIf
  Self.SetObjectiveDisplayed(150, True, False)
  Self.SetObjectiveDisplayed(160, True, False)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF06_Cypher.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_CF06_CGSchematicsEncrypted.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_CF06_CGSchematicsDecrypted.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(150, True)
  If Self.GetStageDone(185) == True
    Self.SetStage(190)
  EndIf
EndFunction

Function Fragment_Stage_0185_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Game.GetPlayer().RemoveItem(Alias_CF06Microdrive.GetRef() as Form, 1, False, None)
  If Self.GetStageDone(180) == True
    Self.SetStage(190)
  EndIf
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveDisplayed(170, True, False)
  Game.GetPlayer().AddItem(PCF06_GenerdyneExecutiveElevatorKey as Form, 1, True)
  Alias_CF06_BenjaminBayu.GetActorRef().SetGhost(True)
  Alias_CF06_BenjaminBayu.GetActorRef().MoveTo(CF06_AstralLoungeBayuMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0195_Item_00()
  Alias_CF06_BreysonBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(170, True)
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  CrimsonFleetCaptainState_Estelle.SetValue(2.0)
  Self.SetStage(227)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_CF06_BreysonBayu.GetActorRef().Disable(False)
  Self.SetStage(227)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Self.SetStage(227)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Quest __temp = Self as Quest
  cf06questscript kmyQuest = __temp as cf06questscript
  Self.SetObjectiveCompleted(180, True)
  Self.SetStage(280)
  If City_NA_Viewport02.IsRunning()
    City_NA_Viewport02.SetStage(22)
  EndIf
  Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF06Naeva.GetActorRef().EvaluatePackage(False)
  CrimsonFleetCaptainState_Estelle.SetValue(2.0)
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0230_Item_01()
  Quest __temp = Self as Quest
  cf06questscript kmyQuest = __temp as cf06questscript
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(190, True, False)
  If City_NA_Viewport02.IsRunning()
    City_NA_Viewport02.SetStage(22)
  EndIf
  Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF06Naeva.GetActorRef().EvaluatePackage(False)
  Alias_CF06_Estelle.GetActorRef().Enable(False)
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0230_Item_02()
  Quest __temp = Self as Quest
  cf06questscript kmyQuest = __temp as cf06questscript
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(190, True, False)
  If City_NA_Viewport02.IsRunning()
    City_NA_Viewport02.SetStage(22)
  EndIf
  Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF06Naeva.GetActorRef().EvaluatePackage(False)
  Alias_CF06_Estelle.GetActorRef().Enable(False)
  Self.SetStage(400)
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0230_Item_03()
  Quest __temp = Self as Quest
  cf06questscript kmyQuest = __temp as cf06questscript
  kmyQuest.ReleasePlayer()
EndFunction

Function Fragment_Stage_0235_Item_00()
  If Self.GetStageDone(210) == False
    Self.SetObjectiveCompleted(190, True)
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0240_Item_00()
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(1.0)
  Game.GetPlayer().RemoveItem(Credits as Form, CF06_EstelleShareLow.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0250_Item_00()
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(2.0)
  Game.GetPlayer().RemoveItem(Credits as Form, CF06_EstelleShareMedium.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0260_Item_00()
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(3.0)
  Game.GetPlayer().RemoveItem(Credits as Form, CF06_EstelleShareHigh.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0270_Item_00()
  CrimsonFleetCaptainState_Estelle.SetValue(1.0)
EndFunction

Function Fragment_Stage_0280_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0280_Item_01()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetStage(320)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveDisplayed(320, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  cf06questscript kmyQuest = __temp as cf06questscript
  kmyQuest.StartGetOffPlanetTimer()
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest
  cf06questscript kmyQuest = __temp as cf06questscript
  kmyQuest.CallNeonCrime()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(320, True)
  LC039.SetStage(10000)
  Game.GetPlayer().RemoveItem(Alias_CF06_CGSchematicsDecrypted.GetRef() as Form, 1, True, None)
  CF07.SetStage(10)
  Alias_CF06_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF06_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF06_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF06_Jazz.GetActorRef().EvaluatePackage(False)
  Alias_CF06_BenjaminBayu.GetActorRef().SetGhost(False)
  Self.Stop()
EndFunction
