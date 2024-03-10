ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Partin_000D5430 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CreditGlobal Auto Const mandatory
Book Property UC_NA_Z_PartingGift_Book Auto Const mandatory
ReferenceAlias Property Alias_Letter Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Zawadi Auto Const mandatory
ReferenceAlias Property Alias_Hadiyah Auto Const mandatory
ReferenceAlias Property Alias_Chair Auto Const mandatory
Scene Property City_NewAtlantis_Z_PartingGift_ZawadiHaddie Auto Const mandatory
ReferenceAlias Property Alias_Couch Auto Const mandatory
ReferenceAlias Property Alias_Railing60 Auto Const mandatory
ActorBase Property UC_CY_HaddieGustavsson Auto Const mandatory
ActorBase Property UC_NA_Zawadi Auto Const mandatory
ReferenceAlias Property Alias_Railing90z Auto Const mandatory
ReferenceAlias Property Alias_Railing90h Auto Const mandatory
ObjectReference Property XmarkerHaddie Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Zawadi.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start()
  Alias_Trigger.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  If !Self.GetStageDone(30)
    Self.SetObjectiveFailed(10, True)
    Self.SetStage(6)
  EndIf
EndFunction

Function Fragment_Stage_0007_Item_00()
  Alias_Hadiyah.GetRef().DisableNoWait(False)
  Alias_Zawadi.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  ObjectReference QuestItem = PlayerRef.PlaceAtMe(UC_NA_Z_PartingGift_Book as Form, 1, False, False, True, None, None, True)
  PlayerRef.AddItem(Credits as Form, 1000, False)
  Alias_Letter.ForceRefTo(QuestItem)
  PlayerRef.AddItem(QuestItem as Form, 1, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Game.GetPlayer().RemoveItem(UC_NA_Z_PartingGift_Book as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0039_Item_00()
  If !Self.GetStageDone(2)
    Self.SetStage(2)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor ZawadiRef = Alias_Zawadi.GetActorRef()
  Actor HadiRef = Alias_Hadiyah.GetActorRef()
  ZawadiRef.MoveTo(Alias_Chair.GetRef(), 0.0, 0.0, 0.0, True, False)
  ZawadiRef.EvaluatePackage(False)
  HadiRef.MoveTo(XmarkerHaddie, 0.0, 0.0, 0.0, True, False)
  HadiRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0055_Item_00()
  City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start()
EndFunction

Function Fragment_Stage_0060_Item_00()
  ObjectReference HaddieRef = Alias_Hadiyah.GetRef()
  ObjectReference ZawadiRef = Alias_Zawadi.GetRef()
  ObjectReference HRailRef = Alias_Railing60.GetRef()
  ObjectReference ZRailRef = Alias_Couch.GetRef()
  HRailRef.SetActorOwner(UC_CY_HaddieGustavsson, False)
  ZRailRef.SetActorOwner(UC_NA_Zawadi, False)
  ZawadiRef.MoveTo(ZRailRef, 0.0, 0.0, 0.0, True, False)
  HaddieRef.MoveTo(HRailRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  ObjectReference HRailRef = Alias_Railing60.GetRef()
  ObjectReference ZRailRef = Alias_Couch.GetRef()
  HRailRef.SetActorOwner(None, False)
  ZRailRef.SetActorOwner(None, False)
EndFunction

Function Fragment_Stage_0075_Item_00()
  City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start()
EndFunction

Function Fragment_Stage_0080_Item_00()
  ObjectReference HaddieRef = Alias_Hadiyah.GetRef()
  ObjectReference ZawadiRef = Alias_Zawadi.GetRef()
  ObjectReference HRailRef = Alias_Railing90h.GetRef()
  ObjectReference ZRailRef = Alias_Railing90z.GetRef()
  ZawadiRef.MoveTo(ZRailRef, 0.0, 0.0, 0.0, True, False)
  HaddieRef.MoveTo(HRailRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Zawadi.GetRef().DisableNoWait(False)
  Alias_Zawadi.GetRef().Delete()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveSkipped(10)
  Self.SetObjectiveSkipped(20)
  Self.Stop()
EndFunction
