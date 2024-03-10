ScriptName CFSD01_QuestScript Extends Quest

;-- Variables ---------------------------------------
Actor PlayerRef

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property CFSD01_Evidence_CF01_Kemp Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF03_Carter Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF03_LockRiots Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF04_Rokov Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF04_GalbankScheme Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF05_Daiyu Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF05_ComSpike Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF06_BayuGenerdyne Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF06_AyumiKomiko Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF06_EstelleVincent Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF07_KryxFate Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CFKeyZ01_Maddie Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CFKeyZ02_Kirova Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Durand Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Voss Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Jaso Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Chunks Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Chiroptera Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_HopeTown Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Kreet Auto Const mandatory
  ReferenceAlias Property CFSD01_AdlerKemp Auto Const mandatory
  ReferenceAlias Property CFSD01_EstelleVincent Auto Const mandatory
  ReferenceAlias Property CFSD01_LarryDumbrosky Auto Const mandatory
  ReferenceAlias Property CFSD01_HuanDaiyu Auto Const mandatory
  ReferenceAlias Property CFSD01_EvgenyRokov Auto Const mandatory
  ReferenceAlias Property CFSD01_Delgado Auto Const mandatory
  ReferenceAlias Property CFSD01_AyumiKomiko Auto Const mandatory
EndGroup

ActorValue Property CFSD01Evidence Auto Const mandatory
ActorValue Property CFSD01EvidenceTotal Auto Const mandatory
Book[] Property EvidenceList Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  PlayerRef = Game.GetPlayer()
EndEvent

Function EvidenceCheck()
  Int I = 0
  While I < EvidenceList.Length
    If PlayerRef.GetItemCount(EvidenceList[I] as Form) >= 1
      PlayerRef.SetValue(CFSD01Evidence, 1.0)
      Self.SetObjectiveDisplayed(100, False, False)
      Self.SetObjectiveDisplayed(200, True, False)
      Return 
    EndIf
    I += 1
  EndWhile
  PlayerRef.SetValue(CFSD01Evidence, 0.0)
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetObjectiveDisplayed(200, False, False)
EndFunction

Function EvidenceCounter()
  PlayerRef.ModValue(CFSD01EvidenceTotal, 1.0)
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 3.0
    Self.SetStage(310)
  EndIf
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 7.0
    Self.SetStage(330)
  EndIf
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 11.0
    Self.SetStage(350)
  EndIf
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 15.0
    Self.SetStage(1000)
  EndIf
EndFunction

Function DebugAddAll()
  PlayerRef.AddItem(CFSD01_Evidence_CF01_Kemp.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF03_Carter.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF03_LockRiots.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF04_Rokov.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF04_GalbankScheme.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF05_Daiyu.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF05_ComSpike.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF06_BayuGenerdyne.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF06_AyumiKomiko.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF06_EstelleVincent.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CF07_KryxFate.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CFKeyZ01_Maddie.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_CFKeyZ02_Kirova.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Durand.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Voss.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Jaso.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Chunks.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Chiroptera.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_MSC_HopeTown.GetRef() as Form, 1, False)
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Kreet.GetRef() as Form, 1, False)
EndFunction

Function JailCheck()
  If Self.GetStageDone(15) == True && !Self.GetStageDone(410) && CF01.IsCompleted()
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_AdlerKemp.GetActorRef(), 1)
    Self.SetStage(410)
  EndIf
  If Self.GetStageDone(45) == True && !Self.GetStageDone(420) && CF04.IsCompleted()
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_EvgenyRokov.GetActorRef(), 2)
    Self.SetStage(420)
  EndIf
  If CF04.GetStageDone(158) == False
    If Self.GetStageDone(55) == True && !Self.GetStageDone(460) && CF04.IsCompleted()
      (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_LarryDumbrosky.GetActorRef(), 7)
      Self.SetStage(460)
    EndIf
  EndIf
  If Self.GetStageDone(65) == True && !Self.GetStageDone(430) && CF05.IsCompleted()
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_HuanDaiyu.GetActorRef(), 3)
    Self.SetStage(430)
  EndIf
  If Self.GetStageDone(85) == True && !Self.GetStageDone(440) && CF06.IsCompleted()
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_EstelleVincent.GetActorRef(), 4)
    Self.SetStage(440)
  EndIf
  If CF06.GetStageDone(70) == False
    If Self.GetStageDone(105) == True && !Self.GetStageDone(470) && CF06.IsCompleted()
      (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_AyumiKomiko.GetActorRef(), 8)
      Self.SetStage(470)
    EndIf
  EndIf
  If LC088_Key.GetStageDone(650) == True && !Self.GetStageDone(450)
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_Delgado.GetActorRef(), 5)
    Self.SetStage(450)
  EndIf
EndFunction
