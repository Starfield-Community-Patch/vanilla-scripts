ScriptName Fragments:Quests:QF_RQ_OE_BountyHunter_01_0032C2EE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const
ReferenceAlias Property Alias_OverlayMapMarker Auto Const
ReferenceAlias Property Alias_QuestGiver Auto Const
ReferenceAlias Property Alias_DungeonEdgeMarker Auto Const mandatory
Scene Property AssaultBarkScene Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const
Faction Property REPlayerAlly Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_Hello_None()
  ObjectReference dungeonMapMarkerRef = Alias_dungeonMapMarker.GetRef()
  dungeonMapMarkerRef.AddToMapScanned(False)
  dungeonMapMarkerRef.SetMapMarkerCategory(0)
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
  Alias_QuestGiver.TryToAddToFaction(REPlayerAlly)
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0120_Item_00()
  AssaultBarkScene.Start()
  Alias_QuestGiver.GetActorRef().SetValue(Game.GetAggressionAV(), 0.0)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor QuestGiver = Alias_QuestGiver.GetActorRef()
  ObjectReference EdgeMarker = Alias_DungeonEdgeMarker.GetRef()
  QuestGiver.MoveTo(EdgeMarker, 0.0, 0.0, 0.0, True, False)
  QuestGiver.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Actor QuestGiver = Alias_QuestGiver.GetActorRef()
  QuestGiver.SetValue(Game.GetAggressionAV(), 1.0)
  QuestGiver.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.FailAllObjectives()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  If !Self.IsObjectiveDisplayed(200)
    Self.SetStage(990)
  Else
    Self.SetObjectiveCompleted(200, True)
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  Self.SetObjectiveCompleted(300, True)
  Self.SetStage(995)
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  kmyQuest.SetDialogueAV_Hello_Calm_Success()
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.FailAllObjectives()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Alias_QuestGiver.TryToRemoveFromFaction(REPlayerAlly)
EndFunction

Function Fragment_Stage_0997_Item_00()
  Actor QuestGiver = Alias_QuestGiver.GetActorRef()
  QuestGiver.MoveTo(Alias_CenterMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  QuestGiver.EvaluatePackage(False)
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.SetStage(990)
EndFunction
