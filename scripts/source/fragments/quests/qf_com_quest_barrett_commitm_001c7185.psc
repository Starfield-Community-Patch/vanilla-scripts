ScriptName Fragments:Quests:QF_COM_Quest_Barrett_Commitm_001C7185 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property BQ01_ForeknowledgeBarrettAV Auto Const mandatory
Quest Property COM_Companion_Barrett Auto Const mandatory
GlobalVariable Property MediumCredits Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LibertySquare_Ellie Auto Const mandatory
ReferenceAlias Property Alias_XMarker_GuestHome_Ellie Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LawOffice_Ellie Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LizzyBar_Ellie Auto Const mandatory
ReferenceAlias Property Alias_Ellie Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
GlobalVariable Property GlobalTimesMarried Auto Const mandatory
ActorValue Property AVTimesEnteredUnity Auto Const mandatory
ActorValue Property AVTimesMarried Auto Const mandatory
Scene Property COM_Scene_Barrett_Commitment_Vasco_GREET_AskToOfficiate Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
Message Property BQ01_BarrettCommitmentMSG Auto Const mandatory
Message Property BQ01_BarretCommitmentQuestOverMSG Auto Const mandatory
ReferenceAlias Property Alias_BarrettCommitmentPosition Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LibertySquare_Barrett Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LawOffice_Barrett01 Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Lodge_Barrett Auto Const mandatory
MiscObject Property CommitmentGift_Barrett_MiscObj Auto Const mandatory
ReferenceAlias Property HarveyGiftName Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LizzyBar_Barrett Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Lodge_Vasco Auto Const mandatory
Activator Property COM_CQ_TxtReplace_QuestName_Barrett Auto Const mandatory
sq_crewscript Property SQ_Crew Auto Const mandatory
ActorValue Property CrewReassignDisabled Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const mandatory
RefCollectionAlias Property CrewGoingToOutposts Auto Const mandatory
GlobalVariable Property COM_BQ01_WaitToggle Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(51) || Self.GetStageDone(52)
    Self.SetStage(100)
  Else
    Self.SetObjectiveDisplayed(50, True, False)
  EndIf
  GlobalTimesMarried.SetValue((Game.GetPlayer().GetValue(AVTimesMarried) as Int) as Float)
  Actor BarrettRef = Alias_Barrett.GetActorReference()
  SQ_Companions.SetRoleActive(BarrettRef, True, True, 0.0, 0.0)
  SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, True, BQ01_BarrettCommitmentMSG, COM_CQ_TxtReplace_QuestName_Barrett)
  COM_BQ01_WaitToggle.SetValue(1.0)
  SQ_Followers.CommandFollow(BarrettRef)
  Self.SetStage(87)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0071_Item_00()
  Self.SetStage(85)
EndFunction

Function Fragment_Stage_0072_Item_00()
  Self.SetStage(85)
EndFunction

Function Fragment_Stage_0073_Item_00()
  Self.SetStage(85)
EndFunction

Function Fragment_Stage_0074_Item_00()
  Self.SetStage(85)
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetStage(85)
EndFunction

Function Fragment_Stage_0076_Item_00()
  Self.SetStage(85)
EndFunction

Function Fragment_Stage_0079_Item_00()
  Self.SetStage(85)
EndFunction

Function Fragment_Stage_0081_Item_00()
  Self.SetStage(550)
EndFunction

Function Fragment_Stage_0082_Item_00()
  Self.SetStage(550)
EndFunction

Function Fragment_Stage_0083_Item_00()
  Self.SetStage(550)
EndFunction

Function Fragment_Stage_0084_Item_00()
  Self.SetStage(550)
EndFunction

Function Fragment_Stage_0088_Item_00()
  Quest __temp = Self as Quest
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
  kmyQuest.GiveCommitmentGift()
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0091_Item_00()
  If Self.GetStageDone(52)
    Self.SetStage(190)
  EndIf
EndFunction

Function Fragment_Stage_0092_Item_00()
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0093_Item_00()
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0094_Item_00()
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetStage(190)
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_Lodge_Barrett.GetRef())
EndFunction

Function Fragment_Stage_0096_Item_00()
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  If Self.GetStageDone(52)
    Self.SetObjectiveDisplayed(110, True, False)
  Else
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(110, True)
  Self.SetStage(201)
  If Self.GetStageDone(52)
    Self.SetStage(300)
  Else
    Self.SetStage(400)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0201_Item_00()
  Self.SetObjectiveCompleted(200, True)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetStage(520)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MediumCredits.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetStage(60)
  Self.SetStage(350)
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0320_Item_01()
  Alias_Ellie.GetRef().MoveTo(Alias_XMarker_LibertySquare_Ellie.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_LibertySquare_Barrett.GetRef())
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()
  If BarrettRef.GetDistance(BarrettPosition) > 5.0
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0320_Item_02()
  Alias_Ellie.GetActorRef().EvaluatePackage(False)
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_LawOffice_Barrett01.GetRef())
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()
  If BarrettRef.GetDistance(BarrettPosition) > 5.0
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0320_Item_03()
  Alias_Ellie.GetActorRef().EvaluatePackage(False)
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_LizzyBar_Barrett.GetRef())
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()
  If BarrettRef.GetDistance(BarrettPosition) > 5.0
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0340_Item_00()
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()
  If BarrettRef.GetDistance(BarrettPosition) > 10.0
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_Vasco.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_01()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0400_Item_02()
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(500, True, False)
  Actor VascoRef = Alias_Vasco.GetActorRef()
  Self.SetStage(60)
  If Self.GetStageDone(51)
    Self.SetStage(510)
    If Self.GetStageDone(95)
      VascoRef.EvaluatePackage(False)
    EndIf
  Else
    Self.SetStage(505)
  EndIf
  SQ_Crew.SetRoleInactive(VascoRef, False, True, False)
  CrewGoingToOutposts.RemoveRef(VascoRef as ObjectReference)
  DisembarkingCrew.RemoveRef(VascoRef as ObjectReference)
  DismissedCrew.RemoveRef(VascoRef as ObjectReference)
  VascoRef.SetValue(CrewReassignDisabled, 1.0)
EndFunction

Function Fragment_Stage_0500_Item_01()
  Actor VascoRef = Alias_Vasco.GetActorRef()
  VascoRef.MoveTo(Alias_XMarker_Lodge_Vasco.GetRef(), 0.0, 0.0, 0.0, True, False)
  VascoRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0505_Item_00()
  Alias_Ellie.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Self.GetStageDone(90)
    SQ_Followers.SetRoleActive(Alias_Vasco.GetActorRef(), True, True, 0.0, 0.0)
    SQ_Followers.CommandFollow(Alias_Vasco.GetActorRef())
    Alias_Vasco.TryToEvaluatePackage()
  Else
    Alias_Vasco.GetActorRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0535_Item_00()
  Self.SetStage(5000)
EndFunction

Function Fragment_Stage_0557_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(400, True)
  Self.SetStage(60)
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0558_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(400, True)
  Self.SetStage(60)
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_4000_Item_00()
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, BQ01_BarretCommitmentQuestOverMSG, None)
EndFunction

Function Fragment_Stage_5000_Item_00()
  Quest __temp = Self as Quest
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
  Self.CompleteAllObjectives()
  COM_Companion_Barrett.SetStage(1000)
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, BQ01_BarretCommitmentQuestOverMSG, None)
  COM_BQ01_WaitToggle.SetValue(0.0)
  kmyQuest.MakeCommitted()
  Self.Stop()
EndFunction

Function Fragment_Stage_6000_Item_00()
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, BQ01_BarretCommitmentQuestOverMSG, None)
  COM_Companion_Barrett.SetStage(950)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Actor VascoRef = Alias_Vasco.GetActorRef()
  If VascoRef.GetValue(CrewReassignDisabled) == 1.0
    VascoRef.SetValue(CrewReassignDisabled, 0.0)
  EndIf
EndFunction
