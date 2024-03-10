ScriptName Fragments:Quests:QF_DialogueRedDevilsHQ_001E7A0B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR04 Auto Const mandatory
GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const mandatory
ReferenceAlias Property Alias_Jakob Auto Const mandatory
ObjectReference Property UC07_JakobTeleportMarker Auto Const mandatory
GlobalVariable Property UC09_KaiserSandboxing_PostUC08 Auto Const mandatory
ReferenceAlias Property Alias_Kaiser Auto Const mandatory
ObjectReference Property UCR04_DebugMarker Auto Const mandatory
Quest Property UC09 Auto Const mandatory
ObjectReference Property UC09_KaiserTeleportMarker Auto Const mandatory
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
Scene Property DialogueRedDevilsHQ_000_Hadrian_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06 Auto Const mandatory
ReferenceAlias Property Alias_ExteriorGuard Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_FCObservers_Stage01_PostUC06 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage02_LateUC07 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_FCObservers_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_Aliens_Stage02_LateUC07 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_Aliens_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const mandatory
Quest Property UC09_PostQuestline_HadrianScene Auto Const mandatory
Key Property UC03_RedDevilsHQKey Auto Const mandatory
Quest Property UC07 Auto Const mandatory
Quest Property UC08 Auto Const mandatory
GlobalVariable Property UC_RHQ_RCAllowed Auto Const mandatory
Quest Property CREW_EliteCrew_Hadrian Auto Const mandatory
Quest Property UCR04_MiscPointer Auto Const mandatory
ReferenceAlias Property Alias_ExteriorMarine Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_Objects Auto Const mandatory
ObjectReference Property RHQ_ExtDebugMarker Auto Const
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_DeepMines Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_Freight Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_FreightElevator_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_Mine_Stage03_PostUC09 Auto Const mandatory
RefCollectionAlias Property Alias_IntroSceneNPCs Auto Const mandatory
ReferenceAlias Property Alias_ShipServices Auto Const mandatory
ReferenceAlias Property Alias_HQMapMarker Auto Const mandatory
LocationAlias Property Alias_LC028FreightElevatorLoc Auto Const mandatory
LocationAlias Property Alias_LandingCellNameOverride Auto Const mandatory
LocationAlias Property Alias_InteriorCellNameOverride Auto Const mandatory
LocationAlias Property Alias_POI064RedDevilsHQ Auto Const mandatory
ReferenceAlias Property Alias_RHQElevatorManager Auto Const mandatory
Message Property UC_RHQ_TMDNameOverride Auto Const mandatory
ReferenceAlias Property Alias_RHQ_FloorMarker_Int Auto Const mandatory
ReferenceAlias Property Alias_RHQ_FloorMarker_Ext Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, True)
  ObjectReference MMRef = Alias_HQMapMarker.GetRef()
  MMRef.Enable(False)
  MMRef.SetMarkerVisibleOnStarMap(True)
  UC04_JakobSandboxing_PostUC03.SetValue(1.0)
  Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False)
  UC09_KaiserSandboxing_PostUC08.SetValue(1.0)
  Actor KaiACT = Alias_Kaiser.GetActorRef()
  KaiACT.MoveTo(UC09_KaiserTeleportMarker, 0.0, 0.0, 0.0, True, False)
  KaiACT.Enable(False)
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0)
  Actor HadACT = Alias_Hadrian.GetActorRef()
  HadACT.MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False)
  HadACT.Enable(False)
  UC08.SetStage(150)
  Utility.Wait(1.0)
  UC08.SetStage(1000)
  UC09.Start()
  Utility.Wait(1.0)
  UC09.SetStage(500)
  Self.SetStage(7)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(35)
  DialogueUCNewAtlantisUCFaction.SetStage(550)
  DialogueUCNewAtlantisUCFaction.SetStage(600)
  DialogueUCNewAtlantisUCFaction.SetObjectiveDisplayed(550, False, False)
  UC_RHQ_RCAllowed.SetValue(1.0)
  If !UCR04.IsRunning()
    Game.GetPlayer().MoveTo(UCR04_DebugMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0002_Item_00()
  UC07.SetStage(1)
  UC_RHQ_RCAllowed.SetValue(1.0)
EndFunction

Function Fragment_Stage_0003_Item_00()
  UC07.SetStage(9)
  UC07.SetStage(1000)
  UC08.SetStage(150)
  UC_RHQ_RCAllowed.SetValue(1.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(12)
  Self.SetStage(32)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, True)
  ObjectReference MMRef = Alias_HQMapMarker.GetRef()
  MMRef.Enable(False)
  MMRef.SetMarkerVisibleOnStarMap(True)
  UC04_JakobSandboxing_PostUC03.SetValue(1.0)
  Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False)
  UC09_KaiserSandboxing_PostUC08.SetValue(1.0)
  Actor KaiACT = Alias_Kaiser.GetActorRef()
  KaiACT.MoveTo(UC09_KaiserTeleportMarker, 0.0, 0.0, 0.0, True, False)
  KaiACT.Enable(False)
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0)
  Actor HadACT = Alias_Hadrian.GetActorRef()
  HadACT.MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False)
  HadACT.Enable(False)
  UC08.SetStage(150)
  Utility.Wait(1.0)
  UC08.SetStage(1000)
  UC09.Start()
  Utility.Wait(1.0)
  UC09.SetStage(500)
  Self.SetStage(7)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(35)
  Self.SetStage(500)
  DialogueUCNewAtlantisUCFaction.SetStage(550)
  DialogueUCNewAtlantisUCFaction.SetStage(600)
  DialogueUCNewAtlantisUCFaction.SetObjectiveDisplayed(550, False, False)
  If !UCR04.IsRunning()
    Game.GetPlayer().MoveTo(RHQ_ExtDebugMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0007_Item_00()
  (Alias_RHQ_FloorMarker_Ext.GetRef() as loadelevatorfloorscript).SetAccessible(True)
  (Alias_RHQ_FloorMarker_Int.GetRef() as loadelevatorfloorscript).SetAccessible(True)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_ExteriorGuard.GetRef().Enable(False)
  Alias_ShipServices.GetRef().Enable(False)
  Alias_RHQEnableMarker_General_Stage01_PostUC06.GetRef().Enable(False)
  Alias_RHQEnableMarker_General_Stage01_PostUC06_Objects.GetRef().Disable(False)
  Alias_RHQEnableMarker_General_Stage01_PostUC06_DeepMines.GetRef().Disable(False)
  Alias_RHQEnableMarker_General_Stage01_PostUC06_Freight.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_RHQEnableMarker_FCObservers_Stage01_PostUC06.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_RHQEnableMarker_General_Stage02_LateUC07.GetRef().Enable(False)
  Alias_RHQEnableMarker_Aliens_Stage02_LateUC07.GetRef().Enable(False)
  Alias_ExteriorMarine.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_RHQEnableMarker_General_Stage03_PostUC09.GetRef().Enable(False)
  Alias_RHQEnableMarker_Aliens_Stage03_PostUC09.GetRef().Enable(False)
  Alias_RHQEnableMarker_FreightElevator_Stage03_PostUC09.GetRef().Enable(False)
  Alias_RHQEnableMarker_Mine_Stage03_PostUC09.GetRef().Enable(False)
  Self.SetStage(35)
EndFunction

Function Fragment_Stage_0032_Item_00()
  Alias_RHQEnableMarker_FCObservers_Stage03_PostUC09.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_LandingCellNameOverride.ForceLocationTo(Alias_LC028FreightElevatorLoc.GetLocation())
  Alias_InteriorCellNameOverride.ForceLocationTo(Alias_POI064RedDevilsHQ.GetLocation())
  (Alias_RHQElevatorManager.GetRef() as loadelevatormanagerscript).SetFirstFloorName(UC_RHQ_TMDNameOverride)
EndFunction

Function Fragment_Stage_0120_Item_00()
  UCR04_MiscPointer.Start()
  CREW_EliteCrew_Hadrian.SetStage(1)
EndFunction

Function Fragment_Stage_0200_Item_00()
  DialogueUCNewAtlantisUCFaction.SetStage(650)
EndFunction

Function Fragment_Stage_0350_Item_00()
  UCR04.SetStage(350)
EndFunction

Function Fragment_Stage_0401_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0500_Item_00()
  UC_RHQ_RCAllowed.SetValue(0.0)
EndFunction

Function Fragment_Stage_0505_Item_00()
  DialogueRedDevilsHQ_000_Hadrian_IntroScene.Start()
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest
  rhq_questscript kmyQuest = __temp as rhq_questscript
  UC_RHQ_RCAllowed.SetValue(1.0)
  kmyQuest.StaggerEVP(Alias_IntroSceneNPCs)
EndFunction

Function Fragment_Stage_0600_Item_00()
  If UC08.IsRunning() && !UC08.GetStageDone(165) && !UC08.GetStageDone(1000)
    UC08.SetStage(151)
  EndIf
EndFunction
