ScriptName Fragments:Quests:QF_RQ_Settlement_CollectColo_0012F188 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
MiscObject Property RQS_CollectColonist_Meat Auto Const mandatory
GlobalVariable Property RQS_CollectColonist_MaxMeat Auto Const mandatory
RefCollectionAlias Property Alias_Creatures Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept()
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
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept()
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
  RQS_CollectColonist_MaxMeat.SetValue(Alias_Creatures.GetCount() as Float)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetStage(990)
  Game.GetPlayer().RemoveItem(RQS_CollectColonist_Meat as Form, 99, False, None)
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100)
    Self.SetStage(990)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Game.GetPlayer().RemoveItem(RQS_CollectColonist_Meat as Form, 99, True, None)
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
