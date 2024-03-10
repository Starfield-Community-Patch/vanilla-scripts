ScriptName Fragments:Quests:QF_CF08_SysDef_Misc_0030B8A4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property CF08_SysDef_MiscScene01 Auto Const mandatory
ReferenceAlias Property Alias_KibweMarker Auto Const mandatory
ReferenceAlias Property Alias_Ensign01_marker Auto Const mandatory
ReferenceAlias Property Alias_Ensign01 Auto Const mandatory
ReferenceAlias Property Alias_Ensign02 Auto Const mandatory
ReferenceAlias Property Alias_Ensign03 Auto Const mandatory
ReferenceAlias Property CF08_SysDef_HeroWelcomeEnableMarker Auto Const mandatory
Scene Property CF08_SysDef_MiscScene02 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene03 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene04 Auto Const mandatory
ReferenceAlias Property Alias_DoorOperations Auto Const mandatory
ReferenceAlias Property Alias_SysDef_KeyEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Ensign02_marker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Ikande Auto Const mandatory
ReferenceAlias Property Alias_BridgeMarker Auto Const mandatory
ReferenceAlias Property Alias_Soldier09 Auto Const mandatory
ReferenceAlias Property Alias_Soldier10 Auto Const mandatory
ReferenceAlias Property Alias_Soldier11 Auto Const mandatory
ReferenceAlias Property Alias_Soldier12 Auto Const mandatory
Scene Property DialogueUCVigilance_CF_Post_IkandeToftHold Auto Const mandatory
Scene Property CF08_SysDef_MiscScene02b Auto Const mandatory
RefCollectionAlias Property Alias_SoldiersRefColl Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker01 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine01 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine02 Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef11 Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef12 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine03 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine04 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine05 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine06 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene06 Auto Const mandatory
Outfit Property Outfit_Spacesuit_UC_Pilot_SysDef_Helmet Auto Const mandatory
Outfit Property Outfit_Spacesuit_UC_Pilot_SysDef_NoHelmet Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef13 Auto Const mandatory
Outfit Property Outfit_Clothes_UCNavy_Crew_SysDef Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker07 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine07 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine08 Auto Const mandatory
ReferenceAlias Property Alias_KibweBriefing Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef09 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine09 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine10 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine11 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine12 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker13 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene07 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarkerPortA Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarkerPortB Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker12 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine16 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker20 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker02 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker21 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker22 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene08 Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
Scene Property CF08_SysDef_MiscScene05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  CF08_SysDef_MiscScene02.Stop()
  CF08_SysDef_MiscScene02b.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Ensign01_marker.GetRef().EnableNoWait(False)
  Alias_StagingSitMarker01.GetRef().EnableNoWait(False)
  Alias_StagingSitMarker07.GetRef().EnableNoWait(False)
  Alias_KibweBriefing.GetRef().EnableNoWait(False)
  Alias_Soldier11.GetRef().MoveTo(Alias_Soldier_MarkerRef13.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Soldier11.GetActorRef().SnapIntoInteraction(Alias_Soldier_MarkerRef13.GetRef())
  Alias_Soldier12.GetRef().MoveTo(Alias_Soldier_MarkerRef12.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Soldier12.GetActorRef().SnapIntoInteraction(Alias_Soldier_MarkerRef12.GetRef())
  Alias_Ensign03.GetActorRef().SetOutfit(Outfit_Clothes_UCNavy_Crew_SysDef, False)
  DialogueUCVigilance.SetStage(4)
EndFunction

Function Fragment_Stage_0014_Item_00()
  CF08_SysDef_MiscScene01.Stop()
EndFunction

Function Fragment_Stage_0015_Item_00()
  CF08_SysDef_MiscScene02.Stop()
EndFunction

Function Fragment_Stage_0016_Item_00()
  CF08_SysDef_MiscScene06.Start()
  Actor Pilot1 = Alias_TempMarine05.GetActorRef()
  Actor Pilot2 = Alias_TempMarine06.GetActorRef()
  Pilot1.EnableNoWait(False)
  Pilot2.EnableNoWait(False)
  Pilot2.SetOutfit(Outfit_Spacesuit_UC_Pilot_SysDef_NoHelmet, False)
  Pilot1.EvaluatePackage(False)
  Pilot2.EvaluatePackage(False)
  Alias_TempMarine01.GetRef().DisableNoWait(False)
  Alias_TempMarine02.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0017_Item_00()
  Alias_TempMarine03.GetActorRef().EvaluatePackage(False)
  Utility.Wait(1.0)
  Alias_TempMarine04.GetActorRef().EvaluatePackage(False)
  Utility.Wait(1.0)
  Alias_StagingSitMarker07.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0019_Item_00()
  CF08_SysDef_MiscScene08.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  CF08_SysDef_MiscScene01.Start()
  Actor Marine1 = Alias_TempMarine01.GetActorRef()
  Actor Marine2 = Alias_TempMarine02.GetActorRef()
  Alias_TempMarine03.GetRef().EnableNoWait(False)
  Alias_TempMarine04.GetRef().EnableNoWait(False)
  Marine1.EnableNoWait(False)
  Marine1.EvaluatePackage(False)
  Utility.Wait(1.0)
  Marine2.EnableNoWait(False)
  Marine2.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  CF08_SysDef_MiscScene01.Stop()
  Alias_Ensign01.GetActorRef().EvaluatePackage(False)
  Alias_Ensign02.GetActorRef().EvaluatePackage(False)
  Alias_Ensign03.GetActorRef().EvaluatePackage(False)
  Alias_Ensign02_marker.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0048_Item_00()
  Actor Marine01 = Alias_TempMarine04.GetActorRef()
  Actor Marine02 = Alias_TempMarine07.GetActorRef()
  Actor Marine03 = Alias_TempMarine11.GetActorRef()
  Actor Marine04 = Alias_TempMarine12.GetActorRef()
  Marine01.EnableNoWait(False)
  Marine01.MoveTo(Alias_StagingSitMarkerPortA.GetRef(), 0.0, 0.0, 0.0, True, False)
  Marine01.EvaluatePackage(False)
  Utility.Wait(0.5)
  Marine02.EnableNoWait(False)
  Marine02.MoveTo(Alias_StagingSitMarkerPortA.GetRef(), 0.0, 0.0, 0.0, True, False)
  Marine02.EvaluatePackage(False)
  Utility.Wait(0.5)
  Marine03.EnableNoWait(False)
  Marine03.MoveTo(Alias_StagingSitMarkerPortB.GetRef(), 0.0, 0.0, 0.0, True, False)
  Marine03.EvaluatePackage(False)
  Marine04.EnableNoWait(False)
  Marine04.MoveTo(Alias_StagingSitMarkerPortB.GetRef(), 0.0, 0.0, 0.0, True, False)
  Marine04.EvaluatePackage(False)
  CF08_SysDef_MiscScene07.Start()
EndFunction

Function Fragment_Stage_0049_Item_00()
  Actor Marine01 = Alias_TempMarine01.GetActorRef()
  Actor Marine02 = Alias_TempMarine02.GetActorRef()
  Actor Marine03 = Alias_TempMarine03.GetActorRef()
  Marine01.EnableNoWait(False)
  Marine01.MoveTo(Alias_StagingSitMarker12.GetRef(), 0.0, 0.0, 0.0, True, False)
  Marine01.EvaluatePackage(False)
  Utility.Wait(0.5)
  Marine02.EnableNoWait(False)
  Marine02.MoveTo(Alias_StagingSitMarker12.GetRef(), 0.0, 0.0, 0.0, True, False)
  Marine02.EvaluatePackage(False)
  Utility.Wait(0.5)
  Marine03.EnableNoWait(False)
  Marine03.MoveTo(Alias_StagingSitMarker12.GetRef(), 0.0, 0.0, 0.0, True, False)
  Marine03.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  CF08_SysDef_HeroWelcomeEnableMarker.GetRef().EnableNoWait(False)
  Alias_Ensign01_marker.GetRef().DisableNoWait(False)
  Alias_Ensign02_marker.GetRef().EnableNoWait(False)
  Alias_StagingSitMarker01.GetRef().DisableNoWait(False)
  Alias_TempMarine05.GetRef().DisableNoWait(False)
  Alias_TempMarine06.GetRef().DisableNoWait(False)
  Alias_TempMarine09.GetRef().DisableNoWait(False)
  Alias_TempMarine10.GetRef().DisableNoWait(False)
  Alias_StagingSitMarker20.GetRef().EnableNoWait(False)
  Alias_TempMarine16.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Actor TempRef01 = Alias_TempMarine07.GetActorRef()
  Actor TempRef02 = Alias_TempMarine08.GetActorRef()
  TempRef01.MoveTo(Alias_StagingSitMarker21.GetRef(), 0.0, 0.0, 0.0, True, False)
  TempRef01.EvaluatePackage(False)
  TempRef02.MoveTo(Alias_StagingSitMarker22.GetRef(), 0.0, 0.0, 0.0, True, False)
  TempRef02.EvaluatePackage(False)
  CF08_SysDef_MiscScene01.Stop()
  CF08_SysDef_MiscScene02.Start()
  Alias_DoorOperations.GetRef().SetOpen(False)
  Alias_TempMarine01.GetRef().DisableNoWait(False)
  Alias_TempMarine02.GetRef().DisableNoWait(False)
  Alias_TempMarine03.GetRef().DisableNoWait(False)
  Alias_TempMarine04.GetRef().DisableNoWait(False)
  Alias_TempMarine11.GetRef().DisableNoWait(False)
  Alias_TempMarine12.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  CF08_SysDef_MiscScene04.Start()
EndFunction

Function Fragment_Stage_0080_Item_00()
  CF08_SysDef_MiscScene04.Stop()
  CF08_SysDef_MiscScene03.Start()
  Alias_CF08_SysDef_Ikande.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  CF08_SysDef_MiscScene05.Stop()
  CF08_SysDef_MiscScene08.Stop()
  Alias_SoldiersRefColl.EvaluateAll()
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF08_SysDef_MiscScene03.Stop()
  DialogueUCVigilance_CF_Post_IkandeToftHold.Start()
  ObjectReference Marker01 = Alias_BridgeMarker.GetRef()
  ObjectReference Marker02 = Alias_Ensign02.GetRef()
  Alias_Soldier09.GetRef().MoveTo(Marker01, 0.0, 0.0, 0.0, True, False)
  Alias_Soldier10.GetRef().MoveTo(Marker01, 0.0, 0.0, 0.0, True, False)
  Alias_Soldier11.GetRef().MoveTo(Marker02, 0.0, 0.0, 0.0, True, False)
  Alias_Soldier12.GetRef().MoveTo(Marker02, 0.0, 0.0, 0.0, True, False)
  CF08_SysDef_HeroWelcomeEnableMarker.GetRef().DisableNoWait(False)
  Alias_SoldiersRefColl.EvaluateAll()
  Alias_StagingSitMarker20.GetRef().DisableNoWait(False)
  Alias_TempMarine16.GetRef().DisableNoWait(False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_TempMarine07.GetRef().DisableNoWait(False)
  Alias_TempMarine08.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction
