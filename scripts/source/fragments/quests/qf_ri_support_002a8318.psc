ScriptName Fragments:Quests:QF_RI_Support_002A8318 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property RIR03_QuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
GlobalVariable Property RIR03_RadiantCount Auto Const mandatory
GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const mandatory
ReferenceAlias Property Alias_PlayerOfficeQS Auto Const mandatory
GlobalVariable Property RI_NPCRadiantAvailable Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_PointerQuestNPCQS Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
Quest Property RI08 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
Keyword Property RIR05_QuestStartKeyword Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
GlobalVariable Property RIR05_RadiantCount Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property PlayerJoined_Ryujin Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property RI06 Auto Const mandatory
Quest Property RIR06 Auto Const mandatory
Keyword Property RIR06_QuestStartKeyword Auto Const mandatory
GlobalVariable Property RI01_TomoDead Auto Const mandatory
GlobalVariable Property RIR06_RadiantCount Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
Keyword Property RI_RadiantQuestStartKeyword Auto Const mandatory
Keyword Property RIR07_QuestStartKeyword Auto Const mandatory
Quest Property RIR07 Auto Const mandatory
Quest Property DialogueFCRyujinTower Auto Const mandatory
RefCollectionAlias Property Alias_VentDoors Auto Const mandatory
ReferenceAlias Property Alias_HoldingCellDoor Auto Const mandatory
ReferenceAlias Property Alias_Kendrick Auto Const mandatory
ReferenceAlias Property Alias_Sean Auto Const mandatory
ReferenceAlias Property Alias_Kai Auto Const mandatory
ReferenceAlias Property Alias_ClinicSecureWingDoor Auto Const mandatory
ReferenceAlias Property Alias_ClinicSecurityGuard Auto Const mandatory
GlobalVariable Property RI06_SeanDead Auto Const mandatory
GlobalVariable Property RI06_KendrickDead Auto Const mandatory
ReferenceAlias Property Alias_KendrickMoveMarker Auto Const mandatory
ReferenceAlias Property Alias_SeanMoveMarker Auto Const mandatory
Perk Property Skill_Manipulation_InternalNeuroampBonus Auto Const mandatory
GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_RI04_CraneButton Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_YukoOfficeDoor Auto Const mandatory
Quest Property RI01 Auto Const mandatory
GlobalVariable Property RI_LaneUnlockTLs Auto Const mandatory
GlobalVariable Property RI05_UlaruDead Auto Const mandatory
ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_RadiantPointerFurniture Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
GlobalVariable Property RI02_NinaHartDead Auto Const mandatory
ReferenceAlias Property Alias_Nina Auto Const mandatory
ReferenceAlias Property Alias_Harper Auto Const mandatory
GlobalVariable Property RI02_AngeloSoldaniDead Auto Const mandatory
GlobalVariable Property RI03_StanleyDead Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_Angelo Auto Const mandatory
GlobalVariable Property RI08_UlaruRemainedCFO Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_PlayerOfficeDoor Auto Const mandatory
Quest Property RI08_PostQuest Auto Const mandatory
LocationAlias Property Alias_Location_LaredoLocation Auto Const mandatory
Keyword Property LocTypeCFR03NotAllowed Auto Const mandatory
LocationAlias Property Alias_Location_TridentLocation Auto Const mandatory
LocationAlias Property Alias_Location_AkilaCityLocation Auto Const mandatory
LocationAlias Property Alias_Location_AkilaTradeAuthorityLocation Auto Const mandatory
Keyword Property LocTypeRIRadiantsNotAllowed Auto Const mandatory
Keyword Property LocTypeShowClothing Auto Const mandatory
Keyword Property LocTypeShowSpacesuit Auto Const mandatory
LocationAlias Property Alias_Location_InfinityLTD Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerJoined_Ryujin.SetValue(1.0)
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False)
  RI01_JobAdRadio.Stop()
  RI01.SetStage(10000)
  RI_LaneUnlockTLs.SetValue(1.0)
  DialogueFCRyujinTower.SetStage(110)
  LC044.SetStage(200)
  LC044.SetStage(300)
  LC044.SetStage(400)
  RI01.Stop()
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerJoined_Ryujin.SetValue(1.0)
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False)
  RI01_JobAdRadio.Stop()
  DialogueFCRyujinTower.SetStage(110)
  LC044.SetStage(1000)
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True)
  RI01.SetStage(10000)
  RI01.Stop()
  RI_LaneUnlockTLs.SetValue(1.0)
  If RI05_UlaruDead.GetValue() == 0.0
    Alias_UlaruChairSwapMarker.GetRef().Disable(False)
  Else
    Alias_Ularu.GetRef().Disable(False)
  EndIf
  Alias_Yuko.GetRef().Enable(False)
  If RI02_NinaHartDead.GetValue() == 1.0
    Alias_Nina.GetRef().Disable(False)
    Alias_Harper.GetRef().Enable(False)
  EndIf
  If RI02_AngeloSoldaniDead.GetValue() == 1.0
    Alias_Angelo.GetRef().Disable(False)
  EndIf
  If RI03_StanleyDead.GetValue() == 1.0
    Alias_Stanley.GetRef().Disable(False)
  EndIf
  RIR03_RadiantCount.SetValue(1.0)
  RIR05_RadiantCount.SetValue(1.0)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.AddPerk(Manipulation, False)
  PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus, False)
  PlayerJoined_Ryujin.SetValue(1.0)
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False)
  RI01_JobAdRadio.Stop()
  DialogueFCRyujinTower.SetStage(110)
  LC044.SetStage(1000)
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True)
  RI01.SetStage(10000)
  RI01.Stop()
  RI_LaneUnlockTLs.SetValue(1.0)
  If RI05_UlaruDead.GetValue() == 0.0
    Alias_UlaruChairSwapMarker.GetRef().Disable(False)
  Else
    Alias_Ularu.GetRef().Disable(False)
  EndIf
  If RI05_ImogeneDead.GetValue() == 1.0
    Alias_Imogene.GetRef().Disable(False)
  EndIf
  If RI08_MasakoRemainedCEO.GetValue() == 1.0 && RI08_UlaruRemainedCFO.GetValue() != 1.0
    Alias_Ularu.GetRef().Disable(False)
  EndIf
  Alias_Yuko.GetRef().Enable(False)
  If RI02_NinaHartDead.GetValue() == 1.0
    Alias_Nina.GetRef().Disable(False)
    Alias_Harper.GetRef().Enable(False)
  EndIf
  If RI02_AngeloSoldaniDead.GetValue() == 1.0
    Alias_Angelo.GetRef().Disable(False)
  EndIf
  If RI03_StanleyDead.GetValue() == 1.0
    Alias_Stanley.GetRef().Disable(False)
  EndIf
  If RI05_Track_PlayerSidedWithMasako.GetValue() == 0.0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0.0
    RI05_Track_PlayerSidedWithMasako.SetValue(1.0)
  EndIf
  RIR03_RadiantCount.SetValue(1.0)
  RIR05_RadiantCount.SetValue(1.0)
  Self.SetStage(5010)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerJoined_Ryujin.SetValue(1.0)
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False)
  RI01_JobAdRadio.Stop()
  DialogueFCRyujinTower.SetStage(110)
  LC044.SetStage(1000)
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_MasakoOfficeDoor.GetRef().SetOpen(True)
  Alias_UlaruOfficeDoor.GetRef().Lock(False, False, True)
  Alias_UlaruOfficeDoor.GetRef().SetOpen(True)
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_YukoOfficeDoor.GetRef().SetOpen(True)
  RI01.SetStage(10000)
  RI01.Stop()
  RI_LaneUnlockTLs.SetValue(1.0)
  If RI05_UlaruDead.GetValue() == 0.0
    Alias_UlaruChairSwapMarker.GetRef().Disable(False)
  Else
    Alias_Ularu.GetRef().Disable(False)
  EndIf
  If RI05_ImogeneDead.GetValue() == 1.0
    Alias_Imogene.GetRef().Disable(False)
  EndIf
  Alias_Yuko.GetRef().Enable(False)
  If RI02_NinaHartDead.GetValue() == 1.0
    Alias_Nina.GetRef().Disable(False)
    Alias_Harper.GetRef().Enable(False)
  EndIf
  If RI02_AngeloSoldaniDead.GetValue() == 1.0
    Alias_Angelo.GetRef().Disable(False)
  EndIf
  If RI03_StanleyDead.GetValue() == 1.0
    Alias_Stanley.GetRef().Disable(False)
  EndIf
  If RI05_Track_PlayerSidedWithMasako.GetValue() == 0.0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0.0
    RI05_Track_PlayerSidedWithMasako.SetValue(1.0)
  EndIf
  RIR03_RadiantCount.SetValue(1.0)
  RIR05_RadiantCount.SetValue(1.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.AddPerk(Manipulation, False)
  PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus, False)
  PlayerJoined_Ryujin.SetValue(1.0)
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False)
  RI01_JobAdRadio.Stop()
  DialogueFCRyujinTower.SetStage(110)
  LC044.SetStage(1000)
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_PlayerOfficeDoor.GetRef().Lock(False, False, True)
  RI01.SetStage(10000)
  RI01.Stop()
  RI_LaneUnlockTLs.SetValue(1.0)
  RI08_PostQuest.SetStage(600)
  If RI05_UlaruDead.GetValue() == 0.0
    Alias_UlaruChairSwapMarker.GetRef().Disable(False)
  Else
    Alias_Ularu.GetRef().Disable(False)
  EndIf
  If RI05_ImogeneDead.GetValue() == 1.0 || RI08_MasakoRemainedCEO.GetValue() == 0.0
    Alias_Imogene.GetRef().Disable(False)
  EndIf
  If RI08_MasakoRemainedCEO.GetValue() == 1.0
    RI_RadiantQuestGiver.SetValue(1.0)
    If RI08_UlaruRemainedCFO.GetValue() != 1.0
      Alias_Ularu.GetRef().Disable(False)
    EndIf
  Else
    RI_RadiantQuestGiver.SetValue(2.0)
  EndIf
  Alias_Yuko.GetRef().Enable(False)
  If RI02_NinaHartDead.GetValue() == 1.0
    Alias_Nina.GetRef().Disable(False)
    Alias_Harper.GetRef().Enable(False)
  EndIf
  If RI02_AngeloSoldaniDead.GetValue() == 1.0
    Alias_Angelo.GetRef().Disable(False)
  EndIf
  If RI03_StanleyDead.GetValue() == 1.0
    Alias_Stanley.GetRef().Disable(False)
  EndIf
  If RI05_Track_PlayerSidedWithMasako.GetValue() == 0.0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0.0
    RI05_Track_PlayerSidedWithMasako.SetValue(1.0)
  EndIf
  MissionBoardAccessAllowed_RI.SetValue(1.0)
  RIR03_RadiantCount.SetValue(1.0)
  RIR05_RadiantCount.SetValue(1.0)
  Self.SetStage(5010)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(2)
  RI08.SetStage(6)
  RIR03_RadiantCount.SetValue(1.0)
  RIR05_RadiantCount.SetValue(1.0)
  RI_RadiantQuestGiver.SetValue(1.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(2)
  RI08.SetStage(6)
  RI05_ImogeneDead.SetValue(1.0)
  Alias_Imogene.GetRef().Disable(False)
  RIR03_RadiantCount.SetValue(1.0)
  RIR05_RadiantCount.SetValue(1.0)
  RI_RadiantQuestGiver.SetValue(1.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(2)
  RI08.SetStage(7)
  RI05_ImogeneDead.SetValue(1.0)
  Alias_Imogene.GetRef().Disable(False)
  RIR03_RadiantCount.SetValue(1.0)
  RI_RadiantQuestGiver.SetValue(2.0)
EndFunction

Function Fragment_Stage_0040_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0)
  Self.SetStage(4)
  Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0)
  RI05_ImogeneDead.SetValue(1.0)
  Self.SetStage(4)
  Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0)
  Self.SetStage(4)
  Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0)
  Self.SetStage(4)
  RI_NPCRadiantAvailable.SetValue(1.0)
  RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  RI_RadiantPointerQuest.SetStage(10)
  Actor ImogeneRef = Alias_Imogene.GetActorRef()
  ImogeneRef.MoveTo(Alias_RadiantPointerFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
  ImogeneRef.EvaluatePackage(False)
  Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0)
  RI05_ImogeneDead.SetValue(1.0)
  Self.SetStage(4)
  RI_NPCRadiantAvailable.SetValue(1.0)
  RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  RI_RadiantPointerQuest.SetStage(10)
  Actor YukoRef = Alias_Yuko.GetActorRef()
  YukoRef.MoveTo(Alias_RadiantPointerFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
  YukoRef.EvaluatePackage(False)
  Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0)
  Self.SetStage(4)
  RI_NPCRadiantAvailable.SetValue(1.0)
  RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  RI_RadiantPointerQuest.SetStage(10)
  Actor YukoRef = Alias_Yuko.GetActorRef()
  YukoRef.MoveTo(Alias_RadiantPointerFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
  YukoRef.EvaluatePackage(False)
  Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Utility.Wait(3.0)
  RIR03.SetStage(0)
EndFunction

Function Fragment_Stage_0310_Item_00()
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Utility.Wait(3.0)
  RIR03.SetStage(1)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetStage(2)
  Self.SetStage(5010)
  RI_RadiantQuestGiver.SetValue(1.0)
  RIR03_RadiantCount.SetValue(1.0)
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Utility.Wait(3.0)
  RIR03.SetStage(2)
  Game.GetPlayer().AddPerk(Manipulation, False)
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetStage(2)
  Self.SetStage(5010)
  RI_RadiantQuestGiver.SetValue(2.0)
  RIR03_RadiantCount.SetValue(1.0)
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Utility.Wait(3.0)
  RIR03.SetStage(3)
  Game.GetPlayer().AddPerk(Manipulation, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  RIR04.SetStage(2)
EndFunction

Function Fragment_Stage_0510_Item_00()
  RIR05_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Utility.Wait(3.0)
  RIR05.SetStage(1)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(2)
  Self.SetStage(5010)
  RI_RadiantQuestGiver.SetValue(1.0)
  RIR05_RadiantCount.SetValue(1.0)
  RIR05_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Utility.Wait(3.0)
  RIR05.SetStage(2)
  Game.GetPlayer().AddPerk(Manipulation, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  RI06.SetStage(15)
EndFunction

Function Fragment_Stage_0610_Item_00()
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  RIR06.SetStage(1)
  Self.SetStage(1)
EndFunction

Function Fragment_Stage_0620_Item_00()
  RI01_TomoDead.SetValue(1.0)
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  RIR06.SetStage(1)
  Self.SetStage(1)
EndFunction

Function Fragment_Stage_0630_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0)
  Self.SetStage(5010)
  RI01_TomoDead.SetValue(1.0)
  RIR06_RadiantCount.SetValue(2.0)
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  RIR06.SetStage(3)
  Self.SetStage(2)
  Game.GetPlayer().AddPerk(Manipulation, False)
EndFunction

Function Fragment_Stage_0640_Item_00()
  RI_RadiantQuestGiver.SetValue(2.0)
  Self.SetStage(5010)
  RI08_MasakoRemainedCEO.SetValue(0.0)
  RI05_ImogeneDead.SetValue(1.0)
  RI01_TomoDead.SetValue(1.0)
  RIR06_RadiantCount.SetValue(1.0)
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  RIR06.SetStage(3)
  Self.SetStage(2)
EndFunction

Function Fragment_Stage_0650_Item_00()
  RI_RadiantQuestGiver.SetValue(2.0)
  Self.SetStage(5010)
  RI08_MasakoRemainedCEO.SetValue(0.0)
  RIR06_RadiantCount.SetValue(1.0)
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  RIR06.SetStage(3)
  Self.SetStage(2)
  Game.GetPlayer().AddPerk(Manipulation, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(2)
  RI_RadiantQuestGiver.SetValue(1.0)
  RI08_MasakoRemainedCEO.SetValue(1.0)
  RIR07_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  RIR07.SetStage(1)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetStage(2)
  RI_RadiantQuestGiver.SetValue(2.0)
  RI08_MasakoRemainedCEO.SetValue(0.0)
  RIR07_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
  RIR07.SetStage(2)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  ri_radiantsupportquestscript kmyQuest = __temp as ri_radiantsupportquestscript
  Alias_VentDoors.BlockActivation(True, True)
  Alias_HoldingCellDoor.GetRef().BlockActivation(True, True)
  kmyQuest.LockVentDoors()
EndFunction

Function Fragment_Stage_1100_Item_00()
  Alias_RI04_CraneButton.GetRef().BlockActivation(True, True)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_ClinicSecurityGuard.GetRef().Disable(False)
  Alias_ClinicSecureWingDoor.GetRef().BlockActivation(True, True)
  Alias_Kendrick.GetRef().Disable(False)
  Alias_Sean.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_2100_Item_00()
  ObjectReference SeanRef = Alias_Sean.GetRef()
  ObjectReference KendrickRef = Alias_Kendrick.GetRef()
  If RI06_SeanDead.GetValue() == 0.0 && RI06_KendrickDead.GetValue() == 0.0
    SeanRef.Enable(False)
    SeanRef.MoveTo(Alias_SeanMoveMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
    KendrickRef.Enable(False)
    KendrickRef.MoveTo(Alias_KendrickMoveMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_3000_Item_00()
  Alias_UlaruOfficeEnableMarker.GetRef().Disable(False)
  Alias_MasakoOfficeEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_4000_Item_00()
  Alias_Imogene.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_5000_Item_00()
  Alias_Location_LaredoLocation.GetLocation().AddKeyword(LocTypeCFR03NotAllowed)
  Alias_Location_TridentLocation.GetLocation().AddKeyword(LocTypeCFR03NotAllowed)
  Alias_Location_LaredoLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
  Alias_Location_TridentLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
  Alias_Location_AkilaCityLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
  Alias_Location_AkilaTradeAuthorityLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
EndFunction

Function Fragment_Stage_5010_Item_00()
  Alias_Location_LaredoLocation.GetLocation().RemoveKeyword(LocTypeCFR03NotAllowed)
  Alias_Location_TridentLocation.GetLocation().RemoveKeyword(LocTypeCFR03NotAllowed)
  Alias_Location_LaredoLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
  Alias_Location_TridentLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
  Alias_Location_AkilaCityLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
  Alias_Location_AkilaTradeAuthorityLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
EndFunction

Function Fragment_Stage_6000_Item_00()
  Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowClothing)
EndFunction

Function Fragment_Stage_6010_Item_00()
  Alias_Location_InfinityLTD.GetLocation().RemoveKeyword(LocTypeShowClothing)
  Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowSpacesuit)
EndFunction

Function Fragment_Stage_6020_Item_00()
  Alias_Location_InfinityLTD.GetLocation().RemoveKeyword(LocTypeShowSpacesuit)
  Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowClothing)
EndFunction
