ScriptName Fragments:Quests:QF_CF07_001EF7F2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
Quest Property LC107 Auto Const mandatory
ReferenceAlias Property Alias_CF07_DataCoreEmpty Auto Const mandatory
ReferenceAlias Property Alias_CF07_Jazz Auto Const mandatory
ReferenceAlias Property Alias_CF07_Delgado Auto Const mandatory
ObjectReference Property CF07_DelgadoSceneMarkerRef Auto Const mandatory
ObjectReference Property CF07_JazzSceneMarkerRef Auto Const mandatory
Scene Property CF07_Stage000_Delgado_PreScene Auto Const mandatory
ObjectReference Property CF07_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_CF07_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF07_Toft Auto Const mandatory
Scene Property CF07_zLegacy002_Callout_VaultAccess Auto Const mandatory
Scene Property CF07_Stage110_Kibwe_PreScene Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Message Property CF07_Stage500_Message Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
Quest Property LC088 Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Message Property CF06_ConductionGridMessage Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF07_KibweMarkerRef Auto Const mandatory
ObjectReference Property CF07_ToftMarkerRef Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Message Property CF05_ComSpikeMessage Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
ObjectReference Property CF01PlayerOpsMarker Auto Const mandatory
Location Property LC107LegacyLocation Auto Const mandatory
Location Property LC107LegacySpaceCellLocation Auto Const mandatory
ReferenceAlias Property Alias_CF07_VigilanceShip Auto Const mandatory
ReferenceAlias Property Alias_CF07_CGDecryptedSlate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0240_Item_01()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
  Self.SetStage(10)
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False)
  LC082.UpdateVigilanceLocation("CF07")
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
  Self.SetStage(10)
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().MoveTo(CF07_StartMarker, 0.0, 0.0, 0.0, True, False)
  LC082.UpdateVigilanceLocation("CF07")
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(1)
  CF05.SetStage(2200)
  CF05.SetStage(11000)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(40)
  Self.SetStage(110)
  Self.SetStage(120)
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False)
  Game.GetPlayer().MoveTo(CF01PlayerOpsMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(Alias_CF07_CGDecryptedSlate.GetRef() as Form, 1, True)
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False)
  LC082.UpdateVigilanceLocation("CF07")
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0012_Item_00()
  CF07_Stage000_Delgado_PreScene.Start()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF07_CGDecryptedSlate.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0018_Item_00()
  If Self.IsObjectiveDisplayed(110) == True
    Self.SetObjectiveDisplayed(110, False, False)
    Self.SetStage(210)
  EndIf
  If Self.IsObjectiveDisplayed(120) == True
    Self.SetObjectiveDisplayed(120, False, False)
    Self.SetStage(210)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Game.GetPlayer().AddItem(Alias_CF07_DataCoreEmpty.GetRef() as Form, 1, False)
  CF06_ConductionGridMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Alias_CF07_Delgado.TryToEvaluatePackage()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0040_Item_01()
  Self.SetObjectiveCompleted(20, True)
  Self.SetStage(210)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(110, True, False)
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False)
  DialogueUCVigilance.SetStage(5)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  CF07_Stage110_Kibwe_PreScene.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  CF_Main.SetStage(275)
  Self.SetObjectiveCompleted(120, True)
  Self.SetStage(210)
EndFunction

Function Fragment_Stage_0160_Item_00()
  CF_Main.SetStage(300)
  Self.SetObjectiveCompleted(120, True)
  Self.SetStage(210)
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF_Main.SetStage(1)
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False)
  LC107LegacyLocation.Reset()
  LC107LegacySpaceCellLocation.Reset()
  LC107.SetStage(0)
  Self.SetStage(230)
EndFunction

Function Fragment_Stage_0201_Item_00()
  CF_Main.SetStage(1)
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False)
  LC107LegacyLocation.Reset()
  LC107LegacySpaceCellLocation.Reset()
  LC107.SetStage(4)
  Self.SetStage(230)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(210, True, False)
  LC107LegacyLocation.Reset()
  LC107LegacySpaceCellLocation.Reset()
  LC107.SetStage(20)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True)
  Self.SetObjectiveDisplayed(220, True, False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(220, True)
  Self.SetObjectiveDisplayed(230, True, False)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveDisplayed(240, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(240, True)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0255_Item_00()
  CF07_zLegacy002_Callout_VaultAccess.Start()
  Self.SetObjectiveCompleted(250, True)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetObjectiveDisplayed(260, True, False)
EndFunction

Function Fragment_Stage_0265_Item_00()
  Self.SetObjectiveCompleted(260, True)
EndFunction

Function Fragment_Stage_0266_Item_00()
  If !Self.IsObjectiveCompleted(260)
    Self.SetObjectiveDisplayed(260, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(230, True)
  Self.SetObjectiveDisplayed(270, True, False)
EndFunction

Function Fragment_Stage_0275_Item_00()
  If Self.GetStageDone(276) == True
    Self.SetStage(280)
  EndIf
EndFunction

Function Fragment_Stage_0276_Item_00()
  If Self.GetStageDone(275) == True
    Self.SetStage(280)
  EndIf
EndFunction

Function Fragment_Stage_0280_Item_00()
  Self.SetObjectiveCompleted(270, True)
  Self.SetObjectiveDisplayed(280, True, False)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(280, True)
  Self.SetObjectiveDisplayed(290, True, False)
  LC107.SetStage(330)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(290, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(360, True, False)
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(360, True)
  Self.SetObjectiveDisplayed(370, True, False)
EndFunction

Function Fragment_Stage_0380_Item_00()
  Self.SetObjectiveCompleted(370, True)
  Self.SetObjectiveDisplayed(380, True, False)
EndFunction

Function Fragment_Stage_0390_Item_00()
  LC107.SetStage(500)
EndFunction

Function Fragment_Stage_0395_Item_00()
  LC107.SetStage(510)
EndFunction

Function Fragment_Stage_0397_Item_00()
  LC107.SetStage(520)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(380, True)
  Self.SetObjectiveDisplayed(400, True, False)
  If !Self.IsObjectiveCompleted(270)
    Self.SetObjectiveDisplayed(270, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(280)
    Self.SetObjectiveDisplayed(280, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(290)
    Self.SetObjectiveDisplayed(290, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(300)
    Self.SetObjectiveDisplayed(300, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(360)
    Self.SetObjectiveDisplayed(360, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(370)
    Self.SetObjectiveDisplayed(370, False, False)
  EndIf
  If !Self.IsObjectiveCompleted(380)
    Self.SetObjectiveDisplayed(380, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0499_Item_00()
  CF07_Stage500_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0500_Item_00()
  LC107.SetStageNoWait(1000)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(410, True, False)
  Self.SetObjectiveDisplayed(420, True, False)
  Self.SetStage(550)
  LC088.Start()
  LC088_Space.Start()
EndFunction

Function Fragment_Stage_0500_Item_01()
  LC107.SetStage(1000)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(430, True, False)
  LC088.Start()
  LC088_Space.Start()
EndFunction

Function Fragment_Stage_0550_Item_00()
  If Alias_Companion.GetRef() != None
    Self.SetObjectiveDisplayed(450, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0555_Item_00()
  Self.SetObjectiveCompleted(450, True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(410, True)
  Self.SetObjectiveDisplayed(420, False, False)
  LC107.SetStage(2000)
  CF_Main.SetStage(200)
  Self.Stop()
EndFunction

Function Fragment_Stage_1500_Item_00()
  If CF_Main.GetStageDone(300) == False
    CF_Main.SetStage(300)
  EndIf
  If Self.IsObjectiveDisplayed(420) == True
    Self.SetObjectiveCompleted(420, True)
  EndIf
  If Self.IsObjectiveDisplayed(430) == True
    Self.SetObjectiveCompleted(430, True)
  EndIf
  Self.SetObjectiveDisplayed(410, False, False)
  LC107.SetStage(2000)
  Self.Stop()
EndFunction

Function Fragment_Stage_1500_Item_01()
  If CF_Main.GetStageDone(300) == False
    CF_Main.SetStage(300)
  EndIf
  If Self.IsObjectiveDisplayed(420) == True
    Self.SetObjectiveCompleted(420, True)
  EndIf
  If Self.IsObjectiveDisplayed(430) == True
    Self.SetObjectiveCompleted(430, True)
  EndIf
  Self.SetObjectiveDisplayed(410, False, False)
  LC107.SetStage(2000)
  Self.Stop()
EndFunction
