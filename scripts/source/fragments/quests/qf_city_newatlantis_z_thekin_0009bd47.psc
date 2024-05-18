ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_TheKin_0009BD47 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_TahirVala Auto Const mandatory
Potion Property Food_RS_Tavern_VeggieGrinder Auto Const mandatory
ReferenceAlias Property Alias_Miso Auto Const mandatory
Scene Property City_NA_Z_TKoS_End_Tahir Auto Const mandatory
Potion Property Miso_Soup_Individual Auto Const mandatory
ReferenceAlias Property Alias_UCGuard Auto Const mandatory
Scene Property City_NA_Z_TKoS_UCTahirScene Auto Const mandatory
ReferenceAlias Property Alias_TahirSeat Auto Const mandatory
GlobalVariable Property City_NAZ_TahirFollow_Global Auto Const mandatory
ReferenceAlias Property Alias_TriggerVolume Auto Const mandatory
ReferenceAlias Property Alias_TriggerVolume01 Auto Const mandatory
Quest Property City_NewAtlantis_Z_TheBoot Auto Const mandatory
ReferenceAlias Property Alias_Kay Auto Const mandatory
ReferenceAlias Property Alias_KayWait Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const mandatory
Quest Property FFNewAtlantis06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NewAtlantis_Z_TheBoot.Start()
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_TriggerVolume.GetRef().DisableNoWait(False)
  Alias_TriggerVolume01.GetRef().DisableNoWait(False)
  Actor TahirRef = Alias_TahirVala.GetActorRef()
  ObjectReference TahirSeat = Alias_TahirSeat.GetRef()
  SQ_Followers.SetRoleInactive(Alias_TahirVala.GetActorRef(), True, False, True)
  City_NAZ_TahirFollow_Global.SetValue(1.0)
  TahirRef.MoveTo(TahirSeat, 0.0, 0.0, 0.0, True, False)
  TahirRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_01()
  Self.SetObjectiveCompleted(10, False)
  Self.SetObjectiveDisplayed(20, False, False)
  Self.SetObjectiveDisplayed(10, True, True)
EndFunction

Function Fragment_Stage_0002_Item_00()
  SQ_Followers.SetRoleActive(Alias_TahirVala.GetActorRef(), True, True, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  City_NA_Z_TKoS_UCTahirScene.Start()
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_UCGuard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Actor TahirRef = Alias_TahirVala.GetActorRef()
  SQ_Followers.SetRoleActive(TahirRef, True, True, 0.0, 0.0)
  TahirRef.EvaluatePackage(False)
  Alias_TriggerVolume.GetRef().EnableNoWait(False)
  Alias_TriggerVolume01.GetRef().EnableNoWait(False)
  City_NAZ_TahirFollow_Global.SetValue(0.0)
EndFunction

Function Fragment_Stage_0007_Item_01()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, True)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_TahirVala.GetRef().EnableNoWait(False)
  Alias_UCGuard.GetRef().EnableNoWait(False)
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_02_Medium as Form, 1, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If !Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
  Self.SetObjectiveDisplayed(30, True, False)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  ObjectReference MisoRef = PlayerRef.PlaceAtMe(Miso_Soup_Individual as Form, 1, False, False, True, None, None, True)
  Alias_Miso.ForceRefTo(MisoRef)
  PlayerRef.AddItem(MisoRef as Form, 1, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(2)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_Kay.GetRef().MoveTo(Alias_KayWait.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Game.GetPlayer().RemoveItem(Alias_Miso.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0080_Item_00()
  City_NA_Z_TKoS_End_Tahir.Start()
EndFunction

Function Fragment_Stage_0090_Item_00()
  Actor TahirRef = Alias_TahirVala.GetActorRef()
  If Game.GetPlayer().GetDistance(TahirRef as ObjectReference) < 12.0
    City_NA_Z_TKoS_End_Tahir.Start()
  EndIf
  Alias_TriggerVolume.GetRef().DisableNoWait(False)
  Alias_TriggerVolume01.GetRef().DisableNoWait(False)
  SQ_Followers.SetRoleInactive(TahirRef, True, False, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Alias_Miso.Clear()
  Alias_TahirVala.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If !FFNewAtlantis06.GetStageDone(60) || FFNewAtlantis06.GetStageDone(200)
    Alias_TahirVala.GetRef().DisableNoWait(False)
  EndIf
  Alias_UCGuard.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction
