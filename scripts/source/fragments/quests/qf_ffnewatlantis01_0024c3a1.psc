ScriptName Fragments:Quests:QF_FFNewAtlantis01_0024C3A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueUCNewAtlantisSpaceportIntro_001_Scene Auto Const mandatory
Scene Property FFNewAtlantis01_001_Scene Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property FFNewAtlantis01Misc Auto Const mandatory
ReferenceAlias Property Alias_RepresentativeChisolm Auto Const mandatory
ReferenceAlias Property Alias_OfficerWilkes Auto Const mandatory
ReferenceAlias Property Alias_Guard01 Auto Const mandatory
ReferenceAlias Property Alias_Radcliff Auto Const mandatory
Quest Property UC04 Auto Const mandatory
ReferenceAlias Property Alias_RadcliffChairMeetingRoom Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
GlobalVariable Property CreditsRewardMinorExtortion Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor ChisolmRef = Alias_RepresentativeChisolm.GetActorRef()
  Actor GuardRef = Alias_Guard01.GetActorRef()
  ChisolmRef.EnableNoWait(False)
  GuardRef.MoveTo(ChisolmRef as ObjectReference, 0.0, 0.0, 0.0, True, False)
  GuardRef.EvaluatePackage(False)
  Alias_OfficerWilkes.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference ChisolmRef = Alias_RepresentativeChisolm.GetRef()
  ObjectReference WilkesRef = Alias_OfficerWilkes.GetRef()
  If Self.IsObjectiveDisplayed(5) || Self.IsObjectiveDisplayed(10) || !Self.GetStageDone(10)
    WilkesRef.DisableNoWait(False)
    ChisolmRef.DisableNoWait(False)
    Alias_Trigger.GetRef().DisableNoWait(False)
  EndIf
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference ChisolmRef = Alias_RepresentativeChisolm.GetRef()
  ObjectReference WilkesRef = Alias_OfficerWilkes.GetRef()
  If Self.IsObjectiveDisplayed(5) || Self.IsObjectiveDisplayed(10) || !Self.GetStageDone(10)
    WilkesRef.EnableNoWait(False)
    ChisolmRef.EnableNoWait(False)
    Alias_Trigger.GetRef().EnableNoWait(False)
  EndIf
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_RepresentativeChisolm.GetRef().DisableNoWait(False)
  Alias_OfficerWilkes.GetRef().DisableNoWait(False)
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveFailed(10, True)
  Alias_RepresentativeChisolm.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveCompleted(5, False)
  Self.SetObjectiveSkipped(10)
  Self.SetObjectiveDisplayed(5, True, True)
EndFunction

Function Fragment_Stage_0010_Item_00()
  FFNewAtlantis01_001_Scene.Start()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(5, True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Guard01.GetActorRef().EvaluatePackage(False)
  Alias_OfficerWilkes.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveDisplayed(5, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  FFNewAtlantis01Misc.SetStage(100)
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_Radcliff.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0032_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 50, False)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0034_Item_00()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0036_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, CreditsRewardMinorExtortion.GetValueInt(), False)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveDisplayed(10, False, False)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small as Form, 1, False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Alias_RepresentativeChisolm.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_RepresentativeChisolm.GetRef().MoveTo(Alias_RadcliffChairMeetingRoom.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_OfficerWilkes.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction
