ScriptName Fragments:Quests:QF_RQ_Settlement_KillShips_0_002D7381 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const
ReferenceAlias Property Alias_OverlayMapMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept()
  Alias_dungeonMapMarker.GetRef().AddToMapScanned(False)
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  If !Self.IsObjectiveDisplayed(100)
    Self.SetStage(999)
  Else
    Self.SetObjectiveCompleted(100, True)
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  kmyQuest.SetDialogueAV_Hello_Calm_Success()
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
  rqscript kmyQuest = __temp as rqscript
  If Self.GetStageDone(100)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  If !Self.GetStageDone(990)
    Self.CompleteAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
    kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  EndIf
  Self.SetStage(999)
EndFunction
