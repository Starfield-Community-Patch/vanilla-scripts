ScriptName Fragments:Quests:QF_RQ_OE_Rescue_01_001D3080 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_Victim Auto Const mandatory
ReferenceAlias Property Alias_Item Auto Const mandatory
RefCollectionAlias Property Alias_Passengers Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept()
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.SetObjectiveDisplayed(300, True, False)
  kmyQuest.SetDialogueAV_SecondaryObjectiveKnown()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Self.SetObjectiveFailedIfNotCompleted(200)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(500, True, False)
  kmyQuest.AddPassenger(Alias_Victim)
  kmyQuest.AddPassengers(Alias_Actors)
  ((Self as Quest) as rqscript).SetDialogueAV_Hello_AboardShip()
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  Self.SetObjectiveCompleted(300, True)
  kmyQuest.SetDialogueAV_SecondaryObjectiveSuccess()
EndFunction

Function Fragment_Stage_0490_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetStage(495)
EndFunction

Function Fragment_Stage_0495_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  kmyQuest.SetDialogueAV_Hello_DepartingShip()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If !Self.GetStageDone(990)
    Self.SetStage(995)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  If Self.GetStageDone(100)
    Self.SetStage(995)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100)
    Self.SetStage(990)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  If Self.GetStageDone(100)
    Self.SetStage(990)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  If Self.GetStageDone(100)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest
  rq_rescuescript kmyQuest = __temp as rq_rescuescript
  If !Self.GetStageDone(990)
    Self.CompleteAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
    kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  EndIf
  Self.SetStage(999)
EndFunction
