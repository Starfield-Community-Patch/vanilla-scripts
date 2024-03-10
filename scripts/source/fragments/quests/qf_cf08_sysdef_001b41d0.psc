ScriptName Fragments:Quests:QF_CF08_SysDef_001B41D0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088 Auto Const mandatory
lc088_spacequestscript Property LC088_Space Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ObjectReference Property CF08_SysDef_Kibwe_BriefingMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Ikande Auto Const mandatory
ObjectReference Property CF08_SysDef_Toft_BriefingMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Toft Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
ActorValue Property CF08_SysDefComplete_AV Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_ToftBriefingMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_IkandeBriefingMarker Auto Const mandatory
Quest Property CF08_SysDef_Misc Auto Const mandatory
ReferenceAlias Property Alias_DataCoreFull Auto Const mandatory
Quest Property CF08_SpeechChallenge_Delgado Auto Const mandatory
ReferenceAlias Property Alias_CF08_Toft_EndMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Kibwe_EndMarker Auto Const mandatory
ObjectReference Property CF08_PlayerRoomDoorRef Auto Const mandatory
GlobalVariable Property MQ305_CF_SysDefEnding Auto Const mandatory
Quest Property CFKey_TerminalQuest Auto Const mandatory
Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const mandatory
RefCollectionAlias Property Alias_ComTriggerKey Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Mathis Auto Const mandatory
Scene Property CF08_SysDef_Stage030_Ikande_IntroScene Auto Const mandatory
Scene Property CF08_SysDef_Stage520_Ikande_OutroPre Auto Const mandatory
LocationAlias Property Alias_StationTheKeyInteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Delgado Auto Const mandatory
ReferenceAlias Property Alias_AlarmStation Auto Const mandatory
RefCollectionAlias Property Alias_CF_AlarmBattlePrep Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Voss Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_VossSurrenderMarker Auto Const mandatory
Quest Property FFKeyZ01 Auto Const mandatory
Quest Property FFKeyZ01MiscObjective Auto Const mandatory
Quest Property FFKeyZ02 Auto Const mandatory
Quest Property MB_Piracy01Far_CFR01 Auto Const mandatory
Quest Property MB_Piracy02Far_CFR01 Auto Const mandatory
Quest Property MB_Piracy03Far_CFR01 Auto Const mandatory
Quest Property MB_Smuggle01_CFR02 Auto Const mandatory
Quest Property MB_Smuggle01_CFR0200 Auto Const mandatory
Quest Property MB_Smuggle01_CFR0201 Auto Const mandatory
Quest Property MB_Steal01Far_CFR03 Auto Const mandatory
Quest Property MB_Steal02Far_CFR03 Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_CrimsonFleet Auto Const mandatory
affinityevent Property CF08_SysDef_Stage030_Ikande_IntroScene_Action05_Choice01 Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_ZW11_Timestamp Auto Const mandatory
GlobalVariable Property SE_Player_ZW12_Timestamp Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_CrimsonFleet_Cooldown Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  DialogueCFTheKey.SetStage(300)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_CF08_SysDef_Mathis.GetActorRef().SetEssential(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataCoreFull.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0007_Item_00()
  CF08_SysDef_Stage030_Ikande_IntroScene.Start()
EndFunction

Function Fragment_Stage_0008_Item_00()
  CF08_SysDef_Stage520_Ikande_OutroPre.Start()
EndFunction

Function Fragment_Stage_0009_Item_00()
  CF08_SysDef_Stage030_Ikande_IntroScene_Action05_Choice01.Send(None)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
  Self.SetObjectiveDisplayed(10, True, False)
  CF08_SysDef_Misc.Start()
  ObjectReference IkandeMarkerRef = Alias_CF08_SysDef_IkandeBriefingMarker.GetRef()
  Alias_CF08_SysDef_Ikande.GetRef().MoveTo(IkandeMarkerRef, 0.0, 0.0, 0.0, True, False)
  Alias_CF08_SysDef_Toft.GetRef().MoveTo(Alias_CF08_SysDef_ToftBriefingMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  CFKey_TerminalQuest.Stop()
  Alias_ComTriggerKey.DisableAll(False)
  DialogueCFTheKey.SetStage(20)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0010_Item_01()
  FFKeyZ01.SetStage(66)
EndFunction

Function Fragment_Stage_0010_Item_02()
  FFKeyZ01MiscObjective.SetStage(66)
EndFunction

Function Fragment_Stage_0010_Item_03()
  FFKeyZ02.SetStage(66)
EndFunction

Function Fragment_Stage_0010_Item_04()
  If MB_Piracy01Far_CFR01.IsRunning()
    MB_Piracy01Far_CFR01.FailAllObjectives()
    MB_Piracy01Far_CFR01.SetStage(200)
  EndIf
  If MB_Piracy02Far_CFR01.IsRunning()
    MB_Piracy02Far_CFR01.FailAllObjectives()
    MB_Piracy02Far_CFR01.SetStage(200)
  EndIf
  If MB_Piracy03Far_CFR01.IsRunning()
    MB_Piracy03Far_CFR01.FailAllObjectives()
    MB_Piracy03Far_CFR01.SetStage(200)
  EndIf
  If MB_Smuggle01_CFR02.IsRunning()
    MB_Smuggle01_CFR02.FailAllObjectives()
    MB_Smuggle01_CFR02.SetStage(200)
  EndIf
  If MB_Smuggle01_CFR0200.IsRunning()
    MB_Smuggle01_CFR0200.FailAllObjectives()
    MB_Smuggle01_CFR0200.SetStage(200)
  EndIf
  If MB_Smuggle01_CFR0201.IsRunning()
    MB_Smuggle01_CFR0201.FailAllObjectives()
    MB_Smuggle01_CFR0201.SetStage(200)
  EndIf
  If MB_Steal01Far_CFR03.IsRunning()
    MB_Steal01Far_CFR03.FailAllObjectives()
    MB_Steal01Far_CFR03.SetStage(200)
  EndIf
  If MB_Steal02Far_CFR03.IsRunning()
    MB_Steal02Far_CFR03.FailAllObjectives()
    MB_Steal02Far_CFR03.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_AlarmStation.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  CF08_SysDef_Misc.SetStage(40)
EndFunction

Function Fragment_Stage_0110_Item_00()
  LC088_Space.SetStage(210)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  CF08_SysDef_Stage030_Ikande_IntroScene.Stop()
  LC088_Space.InsertDataCore(False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetStage(210)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0315_Item_00()
  If Self.GetStage() == 315
    Self.SetObjectiveDisplayed(100, False, False)
    Self.SetObjectiveDisplayed(105, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0316_Item_00()
  If Self.GetStage() == 316
    Self.SetObjectiveCompleted(105, True)
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0320_Item_00()
  If Self.GetStage() == 320
    Self.SetObjectiveDisplayed(100, False, False)
    Self.SetObjectiveDisplayed(110, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStage() == 330
    Self.SetObjectiveCompleted(110, True)
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.GetStage() == 340
    Self.SetObjectiveDisplayed(100, False, False)
    Self.SetObjectiveDisplayed(120, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0345_Item_00()
  If Self.GetStage() == 345
    Self.SetObjectiveDisplayed(125, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0349_Item_00()
  Self.SetObjectiveFailed(125, True)
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStage() == 350
    Self.SetObjectiveCompleted(120, True)
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0358_Item_00()
  Alias_CF08_SysDef_Delgado.GetActorRef().SetGhost(False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(130, True, False)
  CF08_SpeechChallenge_Delgado.Start()
  Alias_CF08_SysDef_Delgado.GetActorRef().SetGhost(True)
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(130, True)
  Self.SetObjectiveDisplayed(140, True, False)
  Self.SetObjectiveDisplayed(150, True, False)
  Alias_CF_AlarmBattlePrep.DisableAll(False)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(160, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(170, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveCompleted(170, True)
  Self.SetStage(420)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveDisplayed(180, True, False)
  Alias_CF08_SysDef_Delgado.GetActorRef().SetGhost(False)
EndFunction

Function Fragment_Stage_0425_Item_00()
  CF08_SysDef_Misc.SetStage(200)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(185, True, False)
EndFunction

Function Fragment_Stage_0435_Item_00()
  Self.SetObjectiveCompleted(185, True)
  Self.SetObjectiveDisplayed(188, True, False)
EndFunction

Function Fragment_Stage_0437_Item_00()
  Self.SetObjectiveCompleted(188, True)
  Self.SetStage(510)
EndFunction

Function Fragment_Stage_0440_Item_00()
  Self.SetObjectiveCompleted(125, True)
  Alias_CF08_SysDef_VossSurrenderMarker.GetRef().EnableNoWait(False)
  Actor VossRef = Alias_CF08_SysDef_Voss.GetActorRef()
  VossRef.SetEssential(True)
  VossRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Self.GetStageDone(440) == False
    
  EndIf
EndFunction

Function Fragment_Stage_0495_Item_00()
  CF08_SysDef_Misc.SetStage(100)
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Self.IsObjectiveDisplayed(130) == True
    Self.SetObjectiveCompleted(130, True)
  EndIf
  If Self.IsObjectiveDisplayed(140) == True
    Self.SetObjectiveCompleted(140, True)
  EndIf
  Self.SetObjectiveDisplayed(190, True, False)
  Actor KibweRef = Alias_CF08_SysDef_Ikande.GetActorRef()
  Actor ToftRef = Alias_CF08_SysDef_Toft.GetActorRef()
  KibweRef.MoveTo(Alias_CF08_Kibwe_EndMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  KibweRef.EvaluatePackage(False)
  ToftRef.MoveTo(Alias_CF08_Toft_EndMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  ToftRef.EvaluatePackage(False)
  CF08_SysDef_Misc.SetStage(50)
  Alias_CF_AlarmBattlePrep.DisableAll(False)
  Alias_AlarmStation.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(190, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_CF_AlarmBattlePrep.DisableAll(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  RAD02.SetStage(700)
  Self.SetObjectiveCompleted(200, True)
  CF08_SpeechChallenge_Delgado.Stop()
  Game.GetPlayer().SetValue(CF08_SysDefComplete_AV, 1.0)
  CF08_PlayerRoomDoorRef.Lock(False, False, True)
  MQ305_CF_SysDefEnding.SetValue(1.0)
  CF08_SysDef_Misc.SetStage(200)
  Float currentGameTime = Utility.GetCurrentGameTime()
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue()
  Int I = 0
  While I < Alias_Companions.Length
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_CrimsonFleet_Cooldown, cooldownTime)
    I += 1
  EndWhile
  COM_WantsToTalkEvent_CrimsonFleet.Send(None)
  SE_Player_ZW11_Timestamp.SetValue(currentGameTime + cooldownDays)
  SE_Player_ZW12_Timestamp.SetValue(currentGameTime + cooldownDays)
  Game.AddAchievement(22)
  Self.Stop()
EndFunction
