ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_TheBoo_000D700D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Antonio Auto Const mandatory
ReferenceAlias Property Alias_Altagracia Auto Const mandatory
ReferenceAlias Property Alias_AntonioStart Auto Const mandatory
ReferenceAlias Property Alias_AltaStart Auto Const mandatory
Scene Property City_NewAtlantis_Z_TheBoot_Intro Auto Const mandatory
ReferenceAlias Property Alias_Buyer Auto Const mandatory
GlobalVariable Property CreditsRewardMiscQuestSmall Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
ReferenceAlias Property Alias_Crate Auto Const mandatory
ReferenceAlias Property Alias_CrateActivator Auto Const mandatory
MiscObject Property UC_Den_Z_TheBoot_Boots Auto Const mandatory
ReferenceAlias Property Alias_Boots Auto Const mandatory
Scene Property City_NewAtlantis_Z_TheBoot_Buyer Auto Const mandatory
ReferenceAlias Property Alias_MarkerFlip Auto Const mandatory
Quest Property City_NewAtlantis_Z_TheKindnessOfStrangers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Antonio.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(20)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 500, False)
  Self.SetStage(3)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 1000, False)
  Self.SetStage(3)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().RemoveItem(UC_Den_Z_TheBoot_Boots as Form, 1, False, None)
  Self.SetStage(75)
EndFunction

Function Fragment_Stage_0004_Item_00()
  City_NewAtlantis_Z_TheKindnessOfStrangers.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Actor AltaRef = Alias_Altagracia.GetActorRef()
  Alias_Antonio.GetRef().MoveTo(Alias_AntonioStart.GetRef(), 0.0, 0.0, 0.0, True, False)
  AltaRef.MoveTo(Alias_AltaStart.GetRef(), 0.0, 0.0, 0.0, True, False)
  AltaRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  City_NewAtlantis_Z_TheBoot_Intro.Start()
EndFunction

Function Fragment_Stage_0035_Item_00()
  City_NewAtlantis_Z_TheBoot_Buyer.Start()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor AltaRef = Alias_Altagracia.GetActorRef()
  AltaRef.EvaluatePackage(False)
  AltaRef.SetEssential(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
  Actor Buyer = Alias_Buyer.GetActorRef()
  ObjectReference Seat = Buyer.GetLinkedRef(None)
  Buyer.EnableNoWait(False)
  Buyer.SnapIntoInteraction(Seat)
  Alias_CrateActivator.GetRef().EnableNoWait(False)
  Alias_Crate.GetRef().EnableNoWait(False)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  ObjectReference BootsRef = PlayerRef.PlaceAtMe(UC_Den_Z_TheBoot_Boots as Form, 1, False, False, True, None, None, True)
  Alias_Boots.ForceRefTo(BootsRef)
  PlayerRef.AddItem(BootsRef as Form, 1, False)
EndFunction

Function Fragment_Stage_0055_Item_00()
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetObjectiveCompleted(60, False)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveSkipped(70)
  Self.SetObjectiveDisplayed(80, True, False)
  Alias_CrateActivator.GetRef().DisableNoWait(False)
  Game.GetPlayer().RemoveItem(Alias_Boots.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveSkipped(60)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
  Alias_CrateActivator.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(80, True)
  If Self.GetStageDone(75)
    Alias_MarkerFlip.GetRef().DisableNoWait(False)
  EndIf
  Alias_Buyer.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  If !Self.GetStageDone(75)
    Self.Stop()
  EndIf
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_MarkerFlip.GetRef().EnableNoWait(False)
  Self.Stop()
EndFunction
