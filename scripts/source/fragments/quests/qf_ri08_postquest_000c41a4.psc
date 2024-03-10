ScriptName Fragments:Quests:QF_RI08_PostQuest_000C41A4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const mandatory
Keyword Property MissionStoryKeywordHack_RIR01 Auto Const mandatory
Keyword Property MissionStoryKeywordPlantEvidence_RIR02 Auto Const mandatory
Keyword Property MissionStoryKeywordSabotage_RIR04 Auto Const mandatory
GlobalVariable Property RI08_AcquiredInfinity Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_InfinityShutdownEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_InfinityRyujinEnableMarker Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
Quest Property RI08 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_InfinityDeziEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_InfinityPosterEnableMarker Auto Const mandatory
Quest Property LC051 Auto Const mandatory
ReferenceAlias Property Alias_Angelo Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_ImogeneOfficeMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  ri08_postquestscript kmyQuest = __temp as ri08_postquestscript
  kmyQuest.StartPostQuestTimer()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_Imogene.GetRef().Enable(False)
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneOfficeMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.IsObjectiveDisplayed(100) == True
    Self.SetObjectiveCompleted(100, True)
    MissionBoardAccessAllowed_RI.SetValue(1.0)
  EndIf
  Self.SetObjectiveDisplayed(200, True, False)
  MissionStoryKeywordHack_RIR01.SendStoryEvent(None, None, None, 0, 0)
  MissionStoryKeywordPlantEvidence_RIR02.SendStoryEvent(None, None, None, 0, 0)
  MissionStoryKeywordSabotage_RIR04.SendStoryEvent(None, None, None, 0, 0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  If Self.GetStageDone(500)
    Self.SetStage(10000)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  If RI08_AcquiredInfinity.GetValue() == 1.0
    LC044.SetStage(2000)
    LC051.SetStage(1000)
    Alias_InfinityRyujinEnableMarker.GetRef().Enable(False)
    Alias_InfinityPosterEnableMarker.GetRef().Disable(False)
    Alias_Angelo.GetRef().Disable(False)
    Alias_Stanley.GetRef().Disable(False)
  Else
    Alias_InfinityShutdownEnableMarker.GetRef().Enable(False)
    Alias_InfinityDeziEnableMarker.GetRef().Disable(False)
    Alias_Angelo.GetRef().Disable(False)
    Alias_Stanley.GetRef().Disable(False)
    LC051.SetStage(2000)
  EndIf
  If RI06_Track_PlayerWitholdsClinicNames.GetValue() == 1.0
    RI_Support.SetStage(2100)
  EndIf
  If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1.0 && RI08_MasakoRemainedCEO.GetValue() == 1.0 && RI08.GetStageDone(1010)
    RI_Support.SetStage(4000)
  EndIf
  Self.SetStage(600)
  If Self.GetStageDone(300)
    Self.SetStage(10000)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue()
  If fMasakoCEO == 1.0
    Alias_Ularu.GetRef().Disable(False)
  ElseIf fMasakoCEO == 0.0
    Alias_Masako.GetRef().Disable(False)
    RI_Support.SetStage(3000)
  EndIf
  Alias_ExecutiveGenericNPCs.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.Stop()
EndFunction
