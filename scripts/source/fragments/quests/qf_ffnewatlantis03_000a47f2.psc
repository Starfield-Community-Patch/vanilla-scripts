ScriptName Fragments:Quests:QF_FFNewAtlantis03_000A47F2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FFNewAtlantis03_Scene01 Auto Const mandatory
ReferenceAlias Property Alias_Functionary Auto Const mandatory
ReferenceAlias Property Alias_Chisolm Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ReferenceAlias Property Alias_Wilkes Auto Const mandatory
Quest Property FFNewAtlantis01 Auto Const mandatory
ReferenceAlias Property Alias_HelenaChambers Auto Const mandatory
ReferenceAlias Property Alias_RicardoBosch Auto Const mandatory
ReferenceAlias Property Alias_BobbyKatz Auto Const mandatory
ReferenceAlias Property Alias_RicardoMarker Auto Const mandatory
ReferenceAlias Property Alias_BobbyMarker Auto Const mandatory
ReferenceAlias Property Alias_HelenaPQMarker Auto Const mandatory
Outfit Property Outfit_Clothes_Service_Uniform_Terrabrew Auto Const mandatory
ActorBase Property UC_NA_HelenaChambers Auto Const mandatory
ReferenceAlias Property Alias_TerraManager Auto Const mandatory
ReferenceAlias Property Alias_SweepMarker Auto Const mandatory
Scene Property FFNewAtlantis03B_Helena_Scene01 Auto Const mandatory
ReferenceAlias Property Alias_BobbyPQMarker Auto Const mandatory
ReferenceAlias Property Alias_BobbyDad Auto Const mandatory
ReferenceAlias Property Alias_BobbyMom Auto Const mandatory
ReferenceAlias Property Alias_RicardoPQMarker Auto Const mandatory
Scene Property FFNewAtlantis03B_Helena_Scene02 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Quest Property City_NewAtlantis_Z_OliveBranch Auto Const mandatory
Quest Property FFNewAtlantis01TopLevels Auto Const mandatory
Quest Property City_NewAtlantis_Z_PartingGift Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_BobbyKatz.GetRef().MoveTo(Alias_BobbyMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_RicardoBosch.GetRef().MoveTo(Alias_RicardoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_01()
  City_NewAtlantis_Z_OliveBranch.Start()
  FFNewAtlantis01TopLevels.Start()
  City_NewAtlantis_Z_PartingGift.Start()
EndFunction

Function Fragment_Stage_0002_Item_00()
  FFNewAtlantis03B_Helena_Scene01.Stop()
  FFNewAtlantis03B_Helena_Scene02.Start()
  Alias_SweepMarker.GetRef().EnableNoWait(False)
  Alias_TerraManager.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Alias_TerraManager.GetRef().DisableNoWait(False)
  Alias_TerraManager.GetRef().Delete()
EndFunction

Function Fragment_Stage_0004_Item_00()
  If Self.GetStageDone(300)
    Self.SetObjectiveCompleted(300, True)
    Self.SetObjectiveDisplayed(400, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_TerraManager.GetRef().EnableNoWait(False)
  Alias_BobbyMom.GetRef().EnableNoWait(False)
  Alias_BobbyDad.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0009_Item_00()
  FFNewAtlantis03_Scene01.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  FFNewAtlantis03_Scene01.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  FFNewAtlantis03_Scene01.Stop()
  Alias_Functionary.GetActorRef().EvaluatePackage(False)
  Alias_HelenaChambers.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  FFNewAtlantis03B_Helena_Scene01.Start()
EndFunction

Function Fragment_Stage_0099_Item_00()
  Alias_HelenaChambers.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  ObjectReference HelenaRef = Alias_HelenaChambers.GetRef()
  UC_NA_HelenaChambers.SetOutfit(Outfit_Clothes_Service_Uniform_Terrabrew, False)
  Alias_HelenaChambers.GetActorRef().SetOutfit(Outfit_Clothes_Service_Uniform_Terrabrew, False)
  HelenaRef.MoveTo(Alias_HelenaPQMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  HelenaRef.DisableNoWait(False)
  Alias_BobbyKatz.GetRef().MoveTo(Alias_BobbyPQMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_RicardoBosch.GetRef().MoveTo(Alias_RicardoPQMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(5)
  Alias_Functionary.GetRef().DisableNoWait(False)
  Alias_Functionary.GetRef().Delete()
  Alias_Guard.Clear()
  FFNewAtlantis01.Start()
  FFNewAtlantis03_Scene01.Stop()
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.GetStageDone(4)
    Self.SetObjectiveDisplayed(300, True, False)
  Else
    Self.SetObjectiveDisplayed(400, True, False)
  EndIf
  Alias_MapMarker.GetRef().AddToMapScanned(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.CompleteAllObjectives()
EndFunction
