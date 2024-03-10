ScriptName Fragments:Quests:QF_RI02_002AAC9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BooneMorgan Auto Const mandatory
ReferenceAlias Property Alias_DossierZolaAdisa Auto Const mandatory
ReferenceAlias Property Alias_DossierArthurCruz Auto Const mandatory
ReferenceAlias Property Alias_BusinessSuit Auto Const mandatory
ReferenceAlias Property Alias_NinaRoomKeyBoone Auto Const mandatory
ReferenceAlias Property Alias_NinaPresentationReplacement Auto Const mandatory
Key Property RI02_NinaRoomKey Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
ReferenceAlias Property Alias_NinaMarker Auto Const mandatory
ReferenceAlias Property Alias_AngeloMarker Auto Const mandatory
ReferenceAlias Property Alias_NinaHart Auto Const mandatory
ReferenceAlias Property Alias_AngeloSoldani Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
GlobalVariable Property RI02_ZolaAdisaDead Auto Const mandatory
GlobalVariable Property RI02_ArthurCruzDead Auto Const mandatory
GlobalVariable Property RI02_NinaHartDead Auto Const mandatory
GlobalVariable Property RI02_AngeloSoldaniDead Auto Const mandatory
ReferenceAlias Property Alias_RyujinTowerStartMarker Auto Const mandatory
ReferenceAlias Property Alias_AstralLoungeStartMarker Auto Const mandatory
Quest Property RI01 Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Scene Property RI02_500_NinaAngeloScene Auto Const mandatory
GlobalVariable Property RI02_NinaHartDrunk Auto Const mandatory
GlobalVariable Property RI02_FinalResult Auto Const mandatory
GlobalVariable Property RI02_PlayerMetNina Auto Const mandatory
GlobalVariable Property RI02_PlayerMetAngelo Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Keyword Property RIR03_QuestStartKeyword Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property RI_LaneUnlockTLs Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property LC051InfinityLTDFaction Auto Const mandatory
ReferenceAlias Property Alias_NinaPresentationActivator Auto Const mandatory
MiscObject Property RI02_NinaPresentation Auto Const mandatory
ReferenceAlias Property Alias_NinaPresentationStatic Auto Const mandatory
ReferenceAlias Property Alias_ZolaAdisa Auto Const mandatory
ReferenceAlias Property Alias_ArthurCruz Auto Const mandatory
ReferenceAlias Property Alias_InfinityLTDMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  RI01_JobAdRadio.Stop()
  Self.SetStage(10)
  Self.SetStage(100)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  RI01_JobAdRadio.Stop()
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
  Utility.Wait(3.0)
  RIR03.SetStage(300)
  Self.SetStage(10)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  Self.SetStage(10)
  Self.SetStage(100)
  Self.SetStage(150)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_AstralLoungeStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  RI01_JobAdRadio.Stop()
  Self.SetStage(600)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  RI_LaneUnlockTLs.SetValue(1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  RIR03.Stop()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 100, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  ObjectReference MyPlayer = Game.GetPlayer() as ObjectReference
  MyPlayer.AddItem(Alias_NinaPresentationReplacement.GetRef() as Form, 1, False)
  MyPlayer.AddItem(Alias_DossierZolaAdisa.GetRef() as Form, 1, False)
  MyPlayer.AddItem(Alias_DossierArthurCruz.GetRef() as Form, 1, False)
  MyPlayer.AddItem(Alias_BusinessSuit.GetRef() as Form, 1, False)
  Alias_NinaHart.GetActorRef().MoveTo(Alias_NinaMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_AngeloSoldani.GetActorRef().MoveTo(Alias_AngeloMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_ZolaAdisa.TryToEnable()
  Alias_ArthurCruz.TryToEnable()
  Alias_NinaPresentationActivator.GetRef().Enable(False)
  Alias_AngeloSoldani.GetActorRef().SetCrimeFaction(CrimeFactionNeon)
  Alias_NinaHart.GetActorRef().SetCrimeFaction(CrimeFactionNeon)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayedAtTop(200)
EndFunction

Function Fragment_Stage_0290_Item_00()
  If Self.GetStageDone(250)
    Self.SetObjectiveCompleted(200, True)
  Else
    Self.SetObjectiveFailed(200, True)
  EndIf
  Self.SetStage(295)
  If Self.GetStageDone(395)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0299_Item_00()
  Self.SetStage(295)
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveFailed(200, True)
    If Self.GetStageDone(395)
      Self.SetStage(500)
      If Self.IsObjectiveDisplayed(400)
        Self.SetObjectiveDisplayed(400, False, False)
      EndIf
    EndIf
  EndIf
  RI02_ZolaAdisaDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayedAtTop(300)
EndFunction

Function Fragment_Stage_0390_Item_00()
  If Self.GetStageDone(350)
    Self.SetObjectiveCompleted(300, True)
  Else
    Self.SetObjectiveFailed(300, True)
  EndIf
  Self.SetStage(395)
  If Self.GetStageDone(295)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0399_Item_00()
  Self.SetStage(395)
  If Self.IsObjectiveDisplayed(300)
    Self.SetObjectiveFailed(300, True)
    If Self.GetStageDone(295)
      Self.SetStage(500)
      If Self.IsObjectiveDisplayed(400)
        Self.SetObjectiveDisplayed(400, False, False)
      EndIf
    EndIf
  EndIf
  RI02_ArthurCruzDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.GetStageDone(420)
    Self.SetObjectiveCompleted(400, True)
  EndIf
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(410)
    Self.SetObjectiveCompleted(400, True)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(400)
    Self.SetObjectiveDisplayed(400, False, False)
  EndIf
  If !Self.GetStageDone(575)
    Self.SetObjectiveDisplayed(500, True, False)
  Else
    Self.SetStage(600)
  EndIf
  If Self.GetStageDone(250) && Self.GetStageDone(350)
    RI02_FinalResult.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0510_Item_00()
  RI02_500_NinaAngeloScene.Start()
EndFunction

Function Fragment_Stage_0520_Item_00()
  If Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveCompleted(550, True)
  EndIf
EndFunction

Function Fragment_Stage_0530_Item_00()
  RI02_NinaHartDrunk.SetValue(1.0)
  RI02_PlayerMetNina.SetValue(1.0)
  Alias_NinaHart.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0535_Item_00()
  RI02_NinaHartDrunk.SetValue(0.0)
  RI02_PlayerMetNina.SetValue(1.0)
  Alias_NinaHart.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0540_Item_00()
  RI02_PlayerMetAngelo.SetValue(1.0)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveDisplayedAtTop(500)
  Self.SetObjectiveDisplayed(550, True, False)
EndFunction

Function Fragment_Stage_0560_Item_00()
  Game.GetPlayer().AddItem(Alias_NinaRoomKeyBoone.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0566_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0567_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0568_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0570_Item_00()
  If Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveCompleted(550, True)
  EndIf
EndFunction

Function Fragment_Stage_0575_Item_00()
  If Self.IsObjectiveDisplayed(500)
    Self.SetStage(600)
  EndIf
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveItem(Alias_NinaPresentationReplacement.GetRef() as Form, 99, False, None)
  PlayerRef.AddItem(RI02_NinaPresentation as Form, 1, False)
  Alias_NinaPresentationActivator.GetRef().Disable(False)
  Alias_NinaPresentationStatic.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0585_Item_00()
  If Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveCompleted(550, True)
  EndIf
EndFunction

Function Fragment_Stage_0599_Item_00()
  RI02_NinaHartDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  If Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveDisplayed(550, False, False)
  EndIf
  RIR04.Start()
EndFunction

Function Fragment_Stage_0699_Item_00()
  RI02_AngeloSoldaniDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Actor AngeloRef = Alias_AngeloSoldani.GetActorRef()
  Actor NinaRef = Alias_NinaHart.GetActorRef()
  AngeloRef.RemoveFromFaction(CrimeFactionNeon)
  AngeloRef.SetCrimeFaction(LC051InfinityLTDFaction)
  AngeloRef.MoveTo(Alias_InfinityLTDMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  AngeloRef.EvaluatePackage(False)
  NinaRef.RemoveFromFaction(CrimeFactionNeon)
  NinaRef.SetCrimeFaction(LC051InfinityLTDFaction)
  NinaRef.MoveTo(Alias_InfinityLTDMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  NinaRef.EvaluatePackage(False)
  Alias_NinaPresentationStatic.GetRef().Disable(False)
  Alias_ZolaAdisa.GetRef().Disable(False)
  Alias_ArthurCruz.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
