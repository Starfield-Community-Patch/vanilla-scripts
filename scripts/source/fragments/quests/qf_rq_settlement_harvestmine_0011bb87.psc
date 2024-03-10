ScriptName Fragments:Quests:QF_RQ_Settlement_HarvestMine_0011BB87 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
ReferenceAlias Property Alias_MineralLocationMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept()
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
  Alias_MineralLocationMapMarker.GetRef().AddToMapScanned(True)
EndFunction

Function Fragment_Stage_0300_Item_00()
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
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript
  If Self.GetStageDone(100)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript
  If !Self.GetStageDone(990)
    Self.CompleteAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
    kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  EndIf
  Self.SetStage(999)
EndFunction
