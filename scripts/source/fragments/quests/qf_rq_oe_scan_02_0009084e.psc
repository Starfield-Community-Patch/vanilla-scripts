ScriptName Fragments:Quests:QF_RQ_OE_Scan_02_0009084E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript
  Self.SetObjectiveDisplayed(500, True, False)
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept()
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.GetStageDone(900) && Self.GetStageDone(500)
    Self.SetStage(990)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript
  If !Self.GetStageDone(990)
    Self.CompleteAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
    kmyQuest.SetDialogueAV_Hello_Calm_Success()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript
  If Self.GetStageDone(500)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  EndIf
  Self.SetStage(999)
EndFunction
