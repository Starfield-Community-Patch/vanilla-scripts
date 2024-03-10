ScriptName Fragments:Quests:QF_CFSD01_001E8E2A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CFSD01_Evidence_CF01_Kemp Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF03_Carter Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF03_LockRiots Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF04_Rokov Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF04_GalbankScheme Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF05_Daiyu Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF05_ComSpike Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF06_BayuGenerdyne Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF06_AyumiKomiko Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF06_EstelleVincent Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF07_KryxFate Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CFKeyZ01_Maddie Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CFKeyZ02_Kirova Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Durand Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Voss Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Jaso Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Chunks Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Chiroptera Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Paradiso Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Kreet Auto Const mandatory
ObjectReference Property CF01_Evidence_KempRef Auto Const mandatory
ObjectReference Property CF06_Evidence_EstelleVincentRef Auto Const mandatory
ObjectReference Property CF06_Evidence_AyumiKomikoRef Auto Const mandatory
ObjectReference Property CFKeyZ02_Evidence_AytonRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_HopeTownRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_ChunksRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_KreetRef Auto Const mandatory
ObjectReference Property CF05_Evidence_HuanDaiyuRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_ChiopteraRef Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CydoniaFaction Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_AdlerKemp Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_EstelleVincent Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_EvgenyRokov Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_CFSD01_Tofts Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ObjectReference Property CF06_TTGWallSafeRef Auto Const mandatory
ActorBase Property Player Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1)
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  CF_Main.SetStage(1)
  Self.SetStage(5)
  kmyQuest.DebugAddAll()
EndFunction

Function Fragment_Stage_0005_Item_00()
  If CF_Main.GetStageDone(300) == False
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
  CF01_Evidence_KempRef.Enable(False)
  CF06_Evidence_EstelleVincentRef.Enable(False)
  Alias_CFSD01_Evidence_CF06_AyumiKomiko.GetRef().Enable(False)
  CF06_TTGWallSafeRef.AddItem(Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef() as Form, 1, False)
  CFKeyZ02_Evidence_AytonRef.Enable(False)
  CFSD01_Evidence_MSC_HopeTownRef.Enable(False)
  CFSD01_Evidence_MSC_ChunksRef.Enable(False)
  CFSD01_Evidence_MSC_KreetRef.Enable(False)
  CF05_Evidence_HuanDaiyuRef.Enable(False)
  CFSD01_Evidence_MSC_ChiopteraRef.Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF01_Kemp.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF03_Carter.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0035_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF03_LockRiots.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0045_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF04_Rokov.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0055_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF04_GalbankScheme.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0065_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF05_Daiyu.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0075_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF05_ComSpike.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0080_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0085_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_EstelleVincent.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
  Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef().SetActorOwner(Player, False)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0105_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_AyumiKomiko.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0115_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF07_KryxFate.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0125_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Durand.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0135_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Voss.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0145_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CFKeyZ01_Maddie.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0155_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CFKeyZ02_Kirova.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0160_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0165_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Jaso.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0175_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Chunks.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0180_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0185_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Chiroptera.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0190_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0195_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Paradiso.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  If CF_Main.GetStageDone(300) == False
    kmyQuest.EvidenceCheck()
  EndIf
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Kreet.GetRef() as Form, 1, False, None)
  Utility.wait(1.0)
  kmyQuest.EvidenceCheck()
  kmyQuest.EvidenceCounter()
EndFunction

Function Fragment_Stage_0410_Item_00()
  Alias_CFSD01_AdlerKemp.GetActorRef().RemoveFromFaction(CrimeFactionUC)
  Alias_CFSD01_AdlerKemp.GetActorRef().RemoveFromFaction(CydoniaFaction)
  Alias_CFSD01_AdlerKemp.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet)
  CrimsonFleetCaptainState_Adler.SetValue(3.0)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Alias_CFSD01_EvgenyRokov.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet)
  CrimsonFleetCaptainState_Rokov.SetValue(3.0)
EndFunction

Function Fragment_Stage_0430_Item_00()
  CrimsonFleetCaptainState_Huan.SetValue(3.0)
EndFunction

Function Fragment_Stage_0440_Item_00()
  Actor EstelleRef = Alias_CFSD01_EstelleVincent.GetActorRef()
  EstelleRef.RemoveFromFaction(CrimeFactionNeon)
  EstelleRef.AddToFaction(CrimeFactionCrimsonFleet)
  CrimsonFleetCaptainState_Estelle.SetValue(3.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.IsObjectiveDisplayed(100) == True
    Self.SetObjectiveDisplayed(100, False, False)
  EndIf
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_1500_Item_00()
  If Self.IsObjectiveDisplayed(100) == True
    Self.SetObjectiveDisplayed(10, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(200) == True
    Self.SetObjectiveDisplayed(200, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(300) == True
    Self.SetObjectiveDisplayed(300, False, False)
  EndIf
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Game.GetPlayer().AddItem(LL_Weapon_Reward_CFSD01_Tofts as Form, 1, False)
EndFunction
