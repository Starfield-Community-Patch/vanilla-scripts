ScriptName Fragments:Quests:QF_RQ_Settlement_Rescue_01 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_CaptiveTarget Auto Const mandatory
ReferenceAlias Property Alias_Item Auto Const mandatory
RefCollectionAlias Property Alias_Passengers Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
ActorValue Property SQ_CaptiveState Auto Const mandatory
GlobalVariable Property SQ_CaptiveState_0_Unset Auto Const mandatory
GlobalVariable Property SQ_CaptiveState_1_Captive Auto Const mandatory
GlobalVariable Property SQ_CaptiveState_2_Freed Auto Const mandatory
ReferenceAlias Property Alias_MysteryCaptiveMarker Auto Const mandatory
ReferenceAlias Property Alias_Boss Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DestinationMapMarker Auto Const mandatory
LocationAlias Property Alias_destinationLocation Auto Const mandatory
ReferenceAlias Property Alias_BonusContainer Auto Const mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
ActorValue Property isPlayerKiller Auto Const mandatory
Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0330_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept()
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(255)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Actors.EvaluateAll()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0075_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.SetStage(5)
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept()
  Alias_dungeonMapMarker.GetRef().AddToMapScanned(True)
  Alias_CaptiveTarget.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 0.0)
  Alias_QuestGiver.GetActorRef().SetProtected(True)
  Self.SetStage(75)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(75)
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Alias_destinationLocation == None
    Self.SetStage(475)
  EndIf
  Self.SetStage(255)
EndFunction

Function Fragment_Stage_0255_Item_00()
  ObjectReference CaptiveMarker = Alias_CaptiveMarker.GetRef()
  ObjectReference DungeonMarker = Alias_Item.GetRef()
  Actor CaptiveNPC = Alias_CaptiveTarget.GetActorRef()
  If CaptiveMarker
    CaptiveNPC.MoveTo(CaptiveMarker, 0.0, 0.0, 0.0, True, False)
  ElseIf DungeonMarker
    CaptiveNPC.MoveTo(DungeonMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  CaptiveNPC.Enable(False)
  CaptiveNPC.EvaluatePackage(False)
  CaptiveNPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  defaultcaptivealias CaptiveNPC = Alias_CaptiveTarget as defaultcaptivealias
  CaptiveNPC.FreePrisoner(True, False)
  CaptiveNPC.TryToEvaluatePackage()
  Alias_CaptiveTarget.GetActorRef().SetProtected(False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_CaptiveTarget.GetRef().AddKeyword(SQ_Captive_HasFollowWaitTopics)
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
EndFunction

Function Fragment_Stage_0325_Item_00()
  Alias_BonusContainer.GetRef().AddItem(LL_OE_AlternativeReward as Form, 1, False)
  Self.SetStage(330)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(350, True)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  kmyQuest.AddPassenger(Alias_CaptiveTarget)
  kmyQuest.AddPassengers(Alias_Actors)
  ((Self as Quest) as rqscript).SetDialogueAV_Hello_AboardShip()
  If !Self.GetStageDone(425)
    Self.SetStage(425)
  EndIf
  Self.SetStage(405)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(500, True, False)
  kmyQuest.SetDialogueAV_SecondaryObjectiveKnown()
  Alias_DestinationMapMarker.GetRef().AddToMapScanned(True)
  kmyQuest.AgreeToTransportPassenger()
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.IsObjectiveDisplayed(300)
    Self.SetObjectiveCompleted(300, True)
  EndIf
  Self.SetObjectiveCompleted(400, True)
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0425_Item_00()
  Alias_CaptiveTarget.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics)
  Alias_CaptiveTarget.GetActorRef().SetProtected(False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_QuestGiver.GetActorRef().SetProtected(False)
  If !Self.GetStageDone(850)
    Self.SetStage(425)
  EndIf
EndFunction

Function Fragment_Stage_0460_Item_00()
  Self.SetObjectiveCompleted(350, True)
EndFunction

Function Fragment_Stage_0490_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_Hello_DepartingShip()
  If Self.GetStageDone(810)
    Self.SetObjectiveFailed(500, True)
    Self.SetStage(990)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_Hello_Calm_Success()
  If Self.GetStageDone(810)
    Self.SetObjectiveFailed(500, True)
    Self.SetStage(990)
  Else
    Self.SetObjectiveCompleted(500, True)
    Self.SetStage(995)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_SecondaryObjectiveFail()
  If Self.GetStageDone(75) && !Self.GetStageDone(999)
    Self.SetStage(990)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0810_Item_00()
  If Self.GetStageDone(405) && !Self.GetStageDone(995)
    Self.SetStage(990)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0815_Item_00()
  If !Self.GetStageDone(850)
    Self.SetStage(820)
  EndIf
EndFunction

Function Fragment_Stage_0820_Item_00()
  Self.SetStage(980)
EndFunction

Function Fragment_Stage_0850_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  Self.SetObjectiveFailed(100, True)
  Self.SetObjectiveFailed(300, True)
  Self.SetObjectiveDisplayed(350, True, False)
  Self.SetStage(425)
EndFunction

Function Fragment_Stage_0850_Item_01()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  Self.SetObjectiveFailed(100, True)
  Self.SetObjectiveFailed(300, True)
  Self.SetObjectiveDisplayed(350, True, False)
EndFunction

Function Fragment_Stage_0860_Item_00()
  If Self.GetStageDone(300)
    Self.SetStage(330)
  Else
    Self.SetStage(325)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(75) && !Self.GetStageDone(999)
    Self.SetStage(990)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0950_Item_00()
  If Self.GetStageDone(100) && !Self.GetStageDone(999)
    Self.SetStage(990)
  Else
    Self.SetStage(994)
  EndIf
EndFunction

Function Fragment_Stage_0980_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.CompleteAllObjectives()
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  If Self.GetStageDone(825)
    kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  Else
    kmyQuest.SetDialogueAV_Hello_Calm_Success()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.FailAllObjectives()
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  kmyQuest.SetDialogueAV_Hello_Stressed_Failure()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.CompleteAllObjectives()
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  If Self.GetStageDone(825)
    kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  Else
    kmyQuest.SetDialogueAV_Hello_Calm_Success()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  If !Self.GetStageDone(425)
    Self.SetStage(425)
  EndIf
EndFunction
