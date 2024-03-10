ScriptName Fragments:Quests:QF_RQ_Settlement_Collect01_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
MiscObject Property RQS_CollectColonist_Meat Auto Const mandatory
GlobalVariable Property RQS_CollectColonist_MaxMeat Auto Const mandatory
RefCollectionAlias Property Alias_Creatures Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_collectscript kmyQuest = __temp as rq_collectscript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rq_collectscript kmyQuest = __temp as rq_collectscript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept()
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
  Alias_DungeonMapMarker.GetRef().AddToMapScanned(True)
  kmyQuest.StartTrackingCollection()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rq_collectscript kmyQuest = __temp as rq_collectscript
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If !Self.GetStageDone(990)
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

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  rq_collectscript kmyQuest = __temp as rq_collectscript
  If Self.GetStageDone(100)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest
  rq_collectscript kmyQuest = __temp as rq_collectscript
  If !Self.GetStageDone(990)
    Self.CompleteAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
    kmyQuest.SetDialogueAV_Hello_Calm_Success()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().RemoveItem(RQS_CollectColonist_Meat as Form, 99, True, None)
  RQS_CollectColonist_MaxMeat.SetValue(0.0)
EndFunction
