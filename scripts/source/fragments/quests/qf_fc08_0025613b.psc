ScriptName Fragments:Quests:QF_FC08_0025613B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC08_SpaceEnc01 Auto Const mandatory
Scene Property FC08_DebriefIntroScene Auto Const mandatory
Scene Property FC08_DebriefScene01 Auto Const mandatory
Scene Property FC08_DebriefScene02 Auto Const mandatory
ReferenceAlias Property Alias_Daniel Auto Const mandatory
ObjectReference Property FC03_DebriefScene_CarsonMarker Auto Const mandatory
ObjectReference Property FC03_DebriefScene_BlakeMarker Auto Const mandatory
ReferenceAlias Property Alias_EmmaWilcox Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC02_EmmaHannahSceneMarker Auto Const mandatory
Scene Property FC08_TauntScene01 Auto Const mandatory
Scene Property FC08_TauntScene02 Auto Const mandatory
Scene Property FC08_TauntScene03 Auto Const mandatory
Scene Property FC08_TauntScene04 Auto Const mandatory
ReferenceAlias Property Alias_MechFactoryMapMarker Auto Const mandatory
ReferenceAlias Property Alias_PaxtonHull Auto Const mandatory
ReferenceAlias Property Alias_EvidenceSlate Auto Const mandatory
Faction Property TheFirstFaction Auto Const mandatory
Scene Property FC08_DebriefScene03 Auto Const mandatory
Scene Property FC08_DebriefInterruptScene Auto Const mandatory
ObjectReference Property FC03_Stage600_EmmaMarker Auto Const mandatory
ReferenceAlias Property Alias_Alex Auto Const mandatory
ReferenceAlias Property Alias_MechFactoryExteriorMainDoor Auto Const mandatory
Quest Property AutumnEliteCrewQuest Auto Const
Quest Property FC09 Auto Const mandatory
Quest Property FC_EvidenceSlateHolderQuest Auto Const mandatory
ActorValue Property FC08_Completed Auto Const mandatory
GlobalVariable Property FCQuests_MeetingRoomPackages Auto Const mandatory
ReferenceAlias Property Alias_HideoutEnableMarker Auto Const mandatory
GlobalVariable Property FC08_DebriefSceneHellosBlocked Auto Const mandatory
Location Property SArcturus_PArcturusII_Surface Auto Const mandatory
Quest Property FC08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FCQuests_MeetingRoomPackages.SetValue(1.0)
  Alias_Daniel.GetRef().MoveTo(FC03_DebriefScene_CarsonMarker, 0.0, 0.0, 0.0, True, False)
  Alias_EmmaWilcox.GetRef().MoveTo(FC03_DebriefScene_BlakeMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Player.GetRef().MoveTo(FC02_EmmaHannahSceneMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  FC08_DebriefIntroScene.Start()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  FC08_DebriefScene01.Start()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(140, True, False)
  FC08_DebriefSceneHellosBlocked.SetValue(1.0)
EndFunction

Function Fragment_Stage_0130_Item_00()
  FC08_DebriefScene02.Start()
EndFunction

Function Fragment_Stage_0135_Item_00()
  FC08_DebriefScene03.Start()
EndFunction

Function Fragment_Stage_0138_Item_00()
  Alias_Alex.GetActorRef().MoveTo(FC03_Stage600_EmmaMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(140)
EndFunction

Function Fragment_Stage_0140_Item_00()
  FC08_DebriefInterruptScene.Start()
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_PaxtonHull.GetRef().Enable(False)
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveDisplayed(180, True, False)
  FC08_DebriefSceneHellosBlocked.SetValue(0.0)
  SArcturus_PArcturusII_Surface.EnableSpaceTravel(FC08, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  FCQuests_MeetingRoomPackages.SetValue(0.0)
  FC08_SpaceEnc01.Start()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_MechFactoryMapMarker.GetRef().Enable(False)
  Alias_MechFactoryMapMarker.GetRef().AddToMapScanned(True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  SArcturus_PArcturusII_Surface.EnableSpaceTravel(FC08, True)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_HideoutEnableMarker.GetRef().Enable(False)
  Utility.Wait(5.0)
  Self.SetObjectiveDisplayed(200, False, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  Self.SetStage(610)
EndFunction

Function Fragment_Stage_0600_Item_00()
  FC08_TauntScene01.Start()
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_MechFactoryExteriorMainDoor.GetRef().SetOpen(True)
EndFunction

Function Fragment_Stage_0620_Item_00()
  FC08_TauntScene02.Start()
EndFunction

Function Fragment_Stage_0640_Item_00()
  FC08_TauntScene03.Start()
EndFunction

Function Fragment_Stage_0660_Item_00()
  FC08_TauntScene04.Start()
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Self.SetObjectiveDisplayed(650, True, False)
EndFunction

Function Fragment_Stage_0740_Item_00()
  Self.SetObjectiveCompleted(600, True)
  If Self.GetStageDone(750)
    Self.SetStage(800)
  EndIf
  Actor PaxtonHull = Alias_PaxtonHull.GetActorRef()
  PaxtonHull.SetNoBleedoutRecovery(True)
  PaxtonHull.RemoveFromFaction(TheFirstFaction)
  PaxtonHull.StopCombat()
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(650, True)
  If Self.GetStageDone(740)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(700, True, False)
  Actor PaxtonHull = Alias_PaxtonHull.GetActorRef()
  PaxtonHull.AllowBleedoutDialogue(True)
  PaxtonHull.StopCombat()
  PaxtonHull.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0825_Item_00()
  Alias_PaxtonHull.GetActorRef().SetNoBleedoutRecovery(False)
  Alias_PaxtonHull.GetActorRef().ResetHealthAndLimbs()
EndFunction

Function Fragment_Stage_0850_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_EvidenceSlate.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Actor PaxtonHull = Alias_PaxtonHull.GetActorRef()
  PaxtonHull.SetNoBleedoutRecovery(False)
  PaxtonHull.AllowBleedoutDialogue(False)
  PaxtonHull.SetEssential(False)
  PaxtonHull.AddToFaction(TheFirstFaction)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Player.GetActorRef().SetValue(FC08_Completed, 1.0)
  Self.CompleteAllObjectives()
  FC09.Start()
  Self.Stop()
EndFunction
