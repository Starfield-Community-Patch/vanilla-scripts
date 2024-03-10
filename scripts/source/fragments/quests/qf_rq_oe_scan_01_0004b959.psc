ScriptName Fragments:Quests:QF_RQ_OE_Scan_01_0004B959 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const
GlobalVariable Property RQ_Settlement_Scan_01_CreditsReward Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetObjectiveDisplayed(150, True, False)
  Self.SetObjectiveDisplayedAtTop(100)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept()
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript
  Self.SetObjectiveFailed(150, True)
  kmyQuest.SetDialogueAV_SecondaryObjectiveFail()
  Float reward = RQ_Settlement_Scan_01_CreditsReward.GetValue() * 0.75
  RQ_Settlement_Scan_01_CreditsReward.SetValueInt(reward as Int)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  If !Self.GetStageDone(150)
    Self.SetObjectiveCompleted(150, True)
  EndIf
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
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript
  If Self.GetStageDone(100)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript
  If !Self.GetStageDone(990)
    Self.CompleteAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
    kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  EndIf
  Self.SetStage(999)
EndFunction
