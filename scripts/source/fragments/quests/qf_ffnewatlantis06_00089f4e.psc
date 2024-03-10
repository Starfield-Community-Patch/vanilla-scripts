ScriptName Fragments:Quests:QF_FFNewAtlantis06_00089F4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FFNewAtlantis06_StartingScene01 Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Markkanen Auto Const mandatory
ReferenceAlias Property Alias_NATenableMarker Auto Const mandatory
ReferenceAlias Property Alias_Chair Auto Const mandatory
ReferenceAlias Property Alias_Vandal Auto Const mandatory
Faction Property FFNewAtlantis06Faction Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
Scene Property FFNewAtlantis06_TL_Functionary_Greet Auto Const mandatory
ReferenceAlias Property Alias_MASTMarker Auto Const mandatory
Quest Property City_NewAtlantis_Z_TheKindnessOfStrangers Auto Const mandatory
ReferenceAlias Property Alias_TahirVala Auto Const mandatory
Scene Property FFNewAtlantis06_TL_Mark_Stage60 Auto Const mandatory
Scene Property FFNewAtlantis06_TL_Mark_Stage80 Auto Const mandatory
ReferenceAlias Property Alias_OfficerSweepMarker Auto Const mandatory
ActorBase Property UC_NA_DonnaRain Auto Const mandatory
ReferenceAlias Property Alias_SergeantYumi Auto Const mandatory
Scene Property FFNewAtlantis06_Greet_TahirValaNoCamera Auto Const mandatory
Quest Property FFNewAtlantis06_SpeechChallengeQuest Auto Const mandatory
ReferenceAlias Property Alias_SuspectArrested Auto Const mandatory
ReferenceAlias Property Alias_OfficerSweep Auto Const mandatory
ReferenceAlias Property Alias_Trucker Auto Const mandatory
ReferenceAlias Property Alias_PrisonFunctionary Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory
Quest Property FFNewAtlantis02 Auto Const mandatory
ReferenceAlias Property Alias_PrisonDoor Auto Const mandatory
ReferenceAlias Property Alias_FunctionaryEndMarker Auto Const mandatory
ReferenceAlias Property Alias_MarkannenMarker Auto Const mandatory
ReferenceAlias Property Alias_Book Auto Const mandatory
Scene Property FFNewAtlantis06_085_SC_TahirValaNoCameraEND Auto Const mandatory
Scene Property FFNewAtlantis06_080_TL_Mark_Stage80 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NewAtlantis_Z_TheKindnessOfStrangers.SetStage(100)
  City_NewAtlantis_Z_TheKindnessOfStrangers.SetStage(200)
  FFNewAtlantis02.Stop()
  Self.SetStage(1)
  Game.GetPlayer().MoveTo(Alias_SergeantYumi.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  If Self.GetStageDone(4)
    Self.SetObjectiveCompleted(88, True)
  EndIf
EndFunction

Function Fragment_Stage_0004_Item_00()
  If Self.GetStageDone(3)
    Self.SetObjectiveCompleted(88, True)
  EndIf
EndFunction

Function Fragment_Stage_0008_Item_00()
  FFNewAtlantis02Misc.SetStage(100)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_Markkanen.GetRef().EnableNoWait(False)
  Alias_NATenableMarker.GetRef().EnableNoWait(False)
  ObjectReference SweepMarkerREF = Alias_OfficerSweepMarker.GetRef()
  SweepMarkerREF.SetActorOwner(None, False)
  Alias_OfficerSweep.GetActorRef().SnapIntoInteraction(SweepMarkerREF)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetObjectiveCompleted(89, True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  FFNewAtlantis06_StartingScene01.Start()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  SQ_Followers.SetRoleActive(Alias_Markkanen.GetActorRef(), True, True, 0.0, 0.0)
  Alias_Chair.GetRef().SetFactionOwner(FFNewAtlantis06Faction, False)
  Alias_MASTMarker.GetRef().EnableNoWait(False)
  Alias_Book.GetRef().EnableNoWait(False)
  Alias_Trucker.GetRef().EnableNoWait(False)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_Vandal.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0046_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(45, True, False)
  Alias_Vandal.GetActorRef().EvaluatePackage(False)
  Alias_Terminal.GetRef().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(45, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Alias_Vandal.GetRef().MoveTo(Alias_SergeantYumi.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Alias_TahirVala.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Alias_SergeantYumi.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(70, True, False)
  FFNewAtlantis06_SpeechChallengeQuest.Start()
  ObjectReference Gershon = Alias_Vandal.GetRef()
  ObjectReference Marker = Alias_FunctionaryEndMarker.GetRef()
  If Gershon.GetDistance(Marker) > 5.0
    Gershon.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(90, True, False)
  Alias_SuspectArrested.ForceRefTo(Alias_TahirVala.GetRef())
  FFNewAtlantis06_Greet_TahirValaNoCamera.Start()
EndFunction

Function Fragment_Stage_0078_Item_00()
  FFNewAtlantis06_080_TL_Mark_Stage80.Stop()
  FFNewAtlantis06_085_SC_TahirValaNoCameraEND.Start()
EndFunction

Function Fragment_Stage_0079_Item_00()
  ObjectReference PrisonDoorRef = Alias_PrisonDoor.GetRef()
  PrisonDoorRef.SetOpen(False)
  PrisonDoorRef.Lock(True, False, True)
EndFunction

Function Fragment_Stage_0080_Item_00()
  SQ_Followers.SetRoleInactive(Alias_Markkanen.GetActorRef(), True, False, True)
  FFNewAtlantis06_TL_Mark_Stage80.Start()
  Alias_NATenableMarker.GetRef().DisableNoWait(False)
  Alias_OfficerSweepMarker.GetRef().SetActorOwner(UC_NA_DonnaRain, False)
EndFunction

Function Fragment_Stage_0085_Item_00()
  Alias_TahirVala.GetActorRef().EvaluatePackage(False)
  Alias_Markkanen.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0088_Item_00()
  If !Self.GetStageDone(3) || !Self.GetStageDone(4)
    Self.SetObjectiveDisplayed(88, True, False)
  Else
    Self.SetObjectiveDisplayed(89, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0089_Item_00()
  Actor VandalRef = Alias_Vandal.GetActorRef()
  Actor MarkRef = Alias_Markkanen.GetActorRef()
  SQ_Followers.SetRoleInactive(MarkRef, True, False, True)
  Alias_SuspectArrested.ForceRefTo(VandalRef as ObjectReference)
  VandalRef.EvaluatePackage(False)
  MarkRef.EvaluatePackage(False)
  Alias_NATenableMarker.GetRef().DisableNoWait(False)
  Alias_OfficerSweepMarker.GetRef().SetActorOwner(UC_NA_DonnaRain, False)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Alias_Vandal.GetActorRef().SnapIntoInteraction(Alias_PrisonFunctionary.GetRef())
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Alias_Chair.GetRef().SetFactionOwner(None, False)
  Alias_NATenableMarker.GetRef().DisableNoWait(False)
  FFNewAtlantis06_SpeechChallengeQuest.Stop()
  Alias_Trucker.Clear()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Markkanen.GetRef().DisableNoWait(False)
  Alias_TahirVala.GetRef().DisableNoWait(False)
  Alias_Vandal.GetRef().DisableNoWait(False)
  Alias_MASTMarker.GetRef().DisableNoWait(False)
  ObjectReference PrisonDoorRef = Alias_PrisonDoor.GetRef()
  PrisonDoorRef.Lock(False, False, True)
  Self.Stop()
EndFunction
