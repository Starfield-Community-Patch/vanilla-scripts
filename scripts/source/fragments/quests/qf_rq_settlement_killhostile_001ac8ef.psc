ScriptName Fragments:Quests:QF_RQ_Settlement_KillHostile_001AC8EF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const
ReferenceAlias Property Alias_OverlayMapMarker Auto Const
Perk Property FactionCrimsonFleetPerk Auto Const
MiscObject Property Credits Auto Const
GlobalVariable Property RQ_KillHostileHumans02_BossBribe Auto Const mandatory
ReferenceAlias Property Boss Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept()
  Alias_dungeonMapMarker.GetRef().AddToMapScanned(False)
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveDisplayedAtTop(100)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(150, True, False)
  Self.SetStage(125)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(260)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0240_Item_00()
  If Self.GetStageDone(150)
    Self.SetStage(260)
  EndIf
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveCompleted(150, True)
    Self.SetObjectiveDisplayed(100, False, False)
  Else
    Self.SetObjectiveCompleted(100, True)
  EndIf
  Self.SetStage(350)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetObjectiveFailed(150, True)
  If Self.GetStageDone(300)
    Self.SetStage(350)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  If !Self.GetStageDone(100)
    Self.SetStage(999)
  Else
    If Self.GetStageDone(150)
      Self.SetStage(260)
    EndIf
    Self.SetObjectiveCompleted(100, True)
    Self.SetStage(350)
  EndIf
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.IsObjectiveDisplayed(150)
    If !Self.GetStageDone(250) && !Self.GetStageDone(260)
      Self.SetObjectiveSkipped(150)
    EndIf
  EndIf
  Self.SetObjectiveDisplayed(350, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(350, True)
  If !Self.GetStageDone(990)
    Self.SetStage(995)
  Else
    Self.SetStage(999)
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
