ScriptName Fragments:Quests:QF_CF_Post_00143472 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CFPost_CFEnableMarker Auto Const mandatory
ReferenceAlias Property CFPost_SDEnableMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property CF08_Fleet Auto Const mandatory
Quest Property CF08_SysDef Auto Const mandatory
Quest Property LC088 Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_LC088_KeyTurretsEnableMarker Auto Const mandatory
ObjectReference Property LC082_Quickstart_DockingPort Auto Const mandatory
ObjectReference Property cTestCOCMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_CFPost_SysDefatKeyEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_FleetatVigilanceEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_Post_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF_Post_Toft Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_CF08_Key_DataCoreAnalyzer_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Key_DataCoreAnalyzer_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_Key_DataCoreAnalyzer_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_Key_DataCoreAnalyzer_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_Key_DataCoreAnalyzer Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  cf_postquestscript kmyQuest = __temp as cf_postquestscript
  LC088.SetStage(10)
  LC088_Vigilance.SetStage(8)
  LC088_Vigilance.SetStage(1101)
  LC088_Space.SetStage(195)
  CF08_Fleet.SetStage(1000)
  Game.GetPlayer().MoveTo(cTestCOCMarkerRef, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(110)
  kmyQuest.QuickstartToKey()
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  cf_postquestscript kmyQuest = __temp as cf_postquestscript
  LC088.SetStage(10)
  LC088_Key.SetStage(9)
  Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort, 0.0, 0.0, 0.0, True, False)
  LC088_Key.SetStage(1101)
  LC088_Key.SetStage(2000)
  LC088_Space.SetStage(295)
  CF08_SysDef.SetStage(1000)
  Game.GetPlayer().MoveTo(cTestCOCMarkerRef, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(200)
  Self.SetStage(210)
  kmyQuest.QuickstartToKey()
EndFunction

Function Fragment_Stage_0030_Item_00()
  DialogueCFTheKey.SetStage(950)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  cf_postquestscript kmyQuest = __temp as cf_postquestscript
  kmyQuest.CF_CleanupAllCaptainShips()
  kmyQuest.CF_ConvertVigilance()
  kmyQuest.RegisterForPostquestLocationChange()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  cf_postquestscript kmyQuest = __temp as cf_postquestscript
  LC088.SetStage(2000)
  kmyQuest.CF_DisableCaptainShips()
  kmyQuest.CF_MoveAndCrippleVigilance()
  Alias_LC088_KeyTurretsEnableMarker.TryToDisable()
  CFPost_CFEnableMarker.TryToEnable()
  Alias_CFPost_FleetatVigilanceEnableMarker.GetRef().EnableNoWait(False)
  If LC088_Vigilance.GetStageDone(1019)
    (LC082 as lc082_brigquestscript).AddPrisoner(Alias_CF_Post_Kibwe.GetActorRef(), 1)
    (LC082 as lc082_brigquestscript).AddPrisoner(Alias_CF_Post_Toft.GetActorRef(), 2)
  EndIf
  Alias_CF08_Key_DataCoreAnalyzer_EnableMarker.TryToDisable()
  Alias_CF08_Key_DataCoreAnalyzer_DisableMarker.TryToEnable()
  Alias_CFPost_Key_DataCoreAnalyzer_EnableMarker.TryToEnable()
  Alias_CFPost_Key_DataCoreAnalyzer_DisableMarker.TryToDisable()
  (Alias_CFPost_Key_DataCoreAnalyzer.GetRef() as defaultmultistateactivator).SetAnimationState("Done", False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  cf_postquestscript kmyQuest = __temp as cf_postquestscript
  kmyQuest.RegisterForPostquestLocationChange()
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest
  cf_postquestscript kmyQuest = __temp as cf_postquestscript
  LC088.SetStage(2000)
  kmyQuest.SD_CleanupAllCaptainShips()
  LC082.SetStage(211)
  kmyQuest.SD_MoveVigilance()
  Alias_LC088_KeyTurretsEnableMarker.TryToDisable()
  CFPost_SDEnableMarker.TryToEnable()
  Alias_CFPost_SysDefatKeyEnableMarker.TryToEnableNoWait()
EndFunction
