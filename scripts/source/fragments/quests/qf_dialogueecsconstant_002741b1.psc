ScriptName Fragments:Quests:QF_DialogueECSConstant_002741B1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BomaniRida Auto Const mandatory
ReferenceAlias Property Alias_DianaBrackenridge Auto Const mandatory
ReferenceAlias Property Alias_MabhutiDaCosta Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard01 Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard02 Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard03 Auto Const mandatory
ReferenceAlias Property Alias_DianaIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_BomaniIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MabhutiIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_DianaBridgeMarker01 Auto Const mandatory
ReferenceAlias Property Alias_BomaniBridgeMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MabhutiHomeMarker01 Auto Const mandatory
Scene Property DialogueECS_Establishing01 Auto Const mandatory
Scene Property DialogueECS_Establishing02 Auto Const
Scene Property DialogueECS_Establishing03 Auto Const
Quest Property MS06 Auto Const mandatory
ReferenceAlias Property Alias_JanetYang Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
Quest Property FFConstantZ04 Auto Const mandatory
Quest Property FFConstantZ04Misc Auto Const mandatory
Quest Property FFConstantZ05 Auto Const mandatory
Quest Property FFConstantZ05Misc Auto Const mandatory
ReferenceAlias Property Alias_AbeLevitz Auto Const mandatory
ReferenceAlias Property Alias_CompanionIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
GlobalVariable Property FFConstantR02_CompletedNextToLast Auto Const mandatory
GlobalVariable Property FFConstantR02_NumTimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_CargoColonist Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
RefCollectionAlias Property Alias_NamedECSNPCs Auto Const mandatory
Keyword Property ECSConstantRoamingHandlerQuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantShip Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantGravDrive Auto Const mandatory
ReferenceAlias Property Alias_EmptyModule Auto Const mandatory
RefCollectionAlias Property Alias_GravDriveModules Auto Const mandatory
RefCollectionAlias Property Alias_GenericNPCs Auto Const mandatory
RefCollectionAlias Property Alias_IntroNPCs Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_DianaBrackenridge.GetRef().MoveTo(Alias_DianaIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_BomaniRida.GetRef().MoveTo(Alias_BomaniIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_MabhutiDaCosta.GetRef().MoveTo(Alias_MabhutiIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_IntroNPCs.SetGhost(True)
EndFunction

Function Fragment_Stage_0001_Item_00()
  MS06.Start()
  MS06.SetStage(400)
  DialogueECS_Establishing01.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  ECS_EndState.SetValue(0.0)
EndFunction

Function Fragment_Stage_0021_Item_00()
  ECS_EndState.SetValue(1.0)
EndFunction

Function Fragment_Stage_0022_Item_00()
  ECS_EndState.SetValue(2.0)
EndFunction

Function Fragment_Stage_0052_Item_00()
  Self.SetStage(110)
  Self.SetStage(200)
  MS06.SetStage(2410)
  Game.GetPlayer().MoveTo(Alias_AbeLevitz.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0054_Item_00()
  ECS_EndState.SetValue(1.0)
  Game.GetPlayer().MoveTo(Alias_JanetYang.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0055_Item_00()
  ECS_EndState.SetValue(2.0)
  Game.GetPlayer().MoveTo(Alias_JanetYang.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0062_Item_00()
  FFConstantR02_NumTimesCompleted.SetValue(FFConstantR02_CompletedNextToLast.GetValue())
  Self.SetStage(52)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If !MS06.GetStageDone(1)
    Alias_Companion.GetRef().MoveTo(Alias_CompanionIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
    DialogueECS_Establishing01.Stop()
    DialogueECS_Establishing02.Start()
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  MS06.SetStage(500)
  DialogueECS_Establishing03.Start()
  Alias_IntroNPCs.SetGhost(False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  MS06.SetStage(600)
  Alias_CargoColonist.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  dialogueecsconstantquestscript kmyQuest = __temp as dialogueecsconstantquestscript
  Alias_NamedECSNPCs.RefillAlias()
  kmyQuest.MoveNPCs()
  Alias_GenericNPCs.DisableAll(False)
  DialogueParadiso.SetStage(2010)
EndFunction

Function Fragment_Stage_1400_Item_00()
  If !FFConstantZ04.IsRunning() && !FFConstantZ04.IsCompleted()
    FFConstantZ04Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1401_Item_00()
  If FFConstantZ04Misc.IsRunning()
    FFConstantZ04Misc.SetStage(1000)
  EndIf
  FFConstantZ04.Start()
EndFunction

Function Fragment_Stage_1451_Item_00()
  Alias_JanetYang.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_1500_Item_00()
  If !FFConstantZ05.IsRunning() && !FFConstantZ05.IsCompleted()
    FFConstantZ05Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_1501_Item_00()
  If FFConstantZ05Misc.IsRunning()
    FFConstantZ05Misc.SetStage(1000)
  EndIf
  FFConstantZ05.Start()
EndFunction

Function Fragment_Stage_1600_Item_00()
  Alias_CargoColonist.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_2100_Item_00()
  Alias_EmptyModule.GetRef().Disable(False)
  Alias_GravDriveModules.EnableAll(False)
  ECSConstantRoamingHandlerQuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  Self.SetObjectiveDisplayed(2100, True, False)
EndFunction
