ScriptName Fragments:Quests:QF_CF08_Fleet_001EF7F1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088 Auto Const mandatory
lc088_spacequestscript Property LC088_Space Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Naeva Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Delgado Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Jazz Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ObjectReference Property CF08_Fleet_NaevaMarker_Breifing Auto Const mandatory
ObjectReference Property CF08_Fleet_DelgadoMarker Auto Const mandatory
ObjectReference Property CF08_Fleet_JazzMarker_Briefing Auto Const mandatory
Scene Property LC088_1019_SurrenderScene Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property MathisEliteCrewQuest Auto Const
GlobalVariable Property UC_PlayerSidedWithCF Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Quest Property CF08_Fleet_Misc Auto Const mandatory
Scene Property CF08_Fleet_Stage045_DelgadoIntro Auto Const mandatory
Scene Property CF08_Fleet_Stage050_Delgado_IntroScene Auto Const mandatory
Scene Property CF08_Fleet_Stage040_Naeva_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_DelgadoBriefingMarker01 Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_JasmineBriefingMarker01 Auto Const mandatory
ReferenceAlias Property Alias_CF08_Operations_Marker01 Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const mandatory
ActorValue Property CF08_FleetComplete_AV Auto Const mandatory
ActorValue Property CF08_KibweKilled_AV Auto Const mandatory
ReferenceAlias Property Alias_DataCoreFull Auto Const mandatory
GlobalVariable Property MQ305_CF_PirateEnding Auto Const mandatory
Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Mathis Auto Const mandatory
Scene Property LC088_1020_ExecutionScene Auto Const mandatory
Scene Property CF08_Fleet_Stage520_Delgado_OutroScene Auto Const mandatory
RefCollectionAlias Property Alias_CF_AlarmBattlePrep Auto Const mandatory
ReferenceAlias Property Alias_MathisSitMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_NaevaWaitsMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_DelgadoBriefingMarker04 Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_CrimsonFleet Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_CrimsonFleet_Cooldown Auto Const mandatory
Quest Property CF08_SpeechChallenge_Kibwe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  DialogueCFTheKey.SetStage(300)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False)
  Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF08_Fleet_Jazz.GetActorRef().EvaluatePackage(False)
  CFSD01.SetObjectiveSkipped(100)
  CFSD01.SetObjectiveSkipped(200)
  CFSD01.SetObjectiveSkipped(300)
  CFSD01.Stop()
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  CF08_Fleet_Misc.Start()
  Alias_CF08_Fleet_Delgado.GetRef().MoveTo(Alias_CF08_Fleet_DelgadoBriefingMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_CF08_Fleet_Naeva.GetRef().MoveTo(Alias_CF08_Fleet_NaevaWaitsMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_CF_AlarmBattlePrep.EnableAll(False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  CF08_Fleet_Stage040_Naeva_IntroScene.Start()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  CF08_Fleet_Misc.SetStage(5)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0048_Item_00()
  CF08_Fleet_Stage045_DelgadoIntro.Start()
EndFunction

Function Fragment_Stage_0049_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataCoreFull.GetRef() as Form, 1, False, None)
  LC088_Space.InsertDataCore(True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False)
  Alias_CF08_Fleet_Delgado.GetActorRef().SnapIntoInteraction(Alias_CF08_Fleet_DelgadoBriefingMarker04.GetRef())
  Alias_CF08_Fleet_Jazz.GetActorRef().SnapIntoInteraction(Alias_CF08_Fleet_JasmineBriefingMarker01.GetRef())
  CF08_Fleet_Misc.SetStage(10)
  ObjectReference MathisSitRef = Alias_MathisSitMarker.GetRef()
  Alias_CF08_Fleet_Mathis.GetActorRef().SnapIntoInteraction(MathisSitRef)
EndFunction

Function Fragment_Stage_0051_Item_00()
  CF08_Fleet_Stage045_DelgadoIntro.Stop()
  CF08_Fleet_Stage050_Delgado_IntroScene.Start()
  Alias_CF08_Fleet_Naeva.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0052_Item_00()
  Alias_CF_AlarmBattlePrep.EnableAll(False)
EndFunction

Function Fragment_Stage_0055_Item_00()
  Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF_AlarmBattlePrep.DisableAll(False)
  Wwise_Event_OBJ_Alarm_Starstation_Hostile.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayed(60, True, False)
  Self.SetObjectiveDisplayed(70, True, False)
  LC088_Space.SetStage(110)
  CF08_Fleet_Stage050_Delgado_IntroScene.Stop()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(50, True)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(60, True)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(70, True)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
  Alias_CF08_Fleet_Naeva.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveDisplayed(130, True, False)
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetObjectiveCompleted(130, True)
  Self.SetStage(340)
EndFunction

Function Fragment_Stage_0340_Item_00()
  If LC088_Vigilance.GetStageDone(310) == False && Self.GetStageDone(350) == False
    Self.SetObjectiveDisplayed(140, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(140, True)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(150, True)
EndFunction

Function Fragment_Stage_0375_Item_00()
  If !Self.GetStageDone(370)
    Self.SetObjectiveDisplayed(150, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0380_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(160, True, False)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(170, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(170, True)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(180, True)
EndFunction

Function Fragment_Stage_0440_Item_00()
  Self.SetObjectiveCompleted(190, True)
  UC_PlayerSidedWithCF.SetValue(1.0)
  Game.GetPlayer().SetValue(CF08_KibweKilled_AV, 1.0)
EndFunction

Function Fragment_Stage_0505_Item_00()
  CF08_Fleet_Stage520_Delgado_OutroScene.Start()
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_CF08_Fleet_Delgado.GetActorRef().MoveTo(CF08_Fleet_DelgadoMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage(False)
  Alias_CF08_Fleet_Jazz.GetActorRef().MoveTo(CF08_Fleet_JazzMarker_Briefing, 0.0, 0.0, 0.0, True, False)
  Alias_CF08_Fleet_Jazz.GetActorRef().EvaluatePackage(False)
  CF08_Fleet_Misc.SetStage(100)
  Alias_CF_AlarmBattlePrep.DisableAll(False)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(210, True, False)
  LC088_1019_SurrenderScene.Stop()
  LC088_1020_ExecutionScene.Stop()
  Actor NaevaRef = Alias_CF08_Fleet_Naeva.GetActorRef()
  If NaevaRef.IsDisabled()
    NaevaRef.EnableNoWait(False)
  EndIf
  NaevaRef.MoveTo(CF08_Fleet_NaevaMarker_Breifing, 0.0, 0.0, 0.0, True, False)
  NaevaRef.EvaluatePackage(False)
  CF08_Fleet_Misc.SetStage(120)
EndFunction

Function Fragment_Stage_0525_Item_00()
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0605_Item_00()
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(250, True)
EndFunction

Function Fragment_Stage_0615_Item_00()
  Self.SetObjectiveDisplayed(250, False, False)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveDisplayed(260, True, False)
EndFunction

Function Fragment_Stage_0625_Item_00()
  Self.SetObjectiveCompleted(260, True)
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveDisplayed(260, False, False)
EndFunction

Function Fragment_Stage_0635_Item_00()
  Self.SetObjectiveDisplayed(270, True, False)
EndFunction

Function Fragment_Stage_0640_Item_00()
  Self.SetObjectiveCompleted(270, True)
EndFunction

Function Fragment_Stage_0645_Item_00()
  Self.SetObjectiveDisplayed(270, False, False)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveDisplayed(280, True, False)
EndFunction

Function Fragment_Stage_0655_Item_00()
  Self.SetObjectiveCompleted(280, True)
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveDisplayed(280, False, False)
EndFunction

Function Fragment_Stage_0665_Item_00()
  Self.SetObjectiveDisplayed(290, True, False)
EndFunction

Function Fragment_Stage_0670_Item_00()
  Self.SetObjectiveCompleted(290, True)
EndFunction

Function Fragment_Stage_0675_Item_00()
  Self.SetObjectiveDisplayed(290, False, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.GetStageDone(330)
    Self.SetObjectiveDisplayed(130, False, False)
  EndIf
  If !Self.GetStageDone(350)
    Self.SetObjectiveDisplayed(140, False, False)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  RAD02.SetStage(600)
  Self.SetObjectiveCompleted(210, True)
  MathisEliteCrewQuest.SetStage(1)
  Alias_CF08_Fleet_Mathis.GetActorRef().EvaluatePackage(False)
  CF08_Fleet_Misc.SetStage(500)
  Game.GetPlayer().SetValue(CF08_FleetComplete_AV, 1.0)
  MQ305_CF_PirateEnding.SetValue(1.0)
  Game.AddAchievement(22)
  (Alias_CF08_Fleet_Jazz.GetRef() as shipvendorscript).CheckForInventoryRefresh(True)
  Float currentGameTime = Utility.GetCurrentGameTime()
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue()
  Int I = 0
  While I < Alias_Companions.Length
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_CrimsonFleet_Cooldown, cooldownTime)
    I += 1
  EndWhile
  COM_WantsToTalkEvent_CrimsonFleet.Send(None)
  CF08_SpeechChallenge_Kibwe.Stop()
  Self.Stop()
EndFunction
