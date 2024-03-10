ScriptName Fragments:Quests:QF_RQ_Settlement_Convince_01_0038BAAC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_TargetNPC Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
Potion Property Aid_MedPack Auto Const
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
ActorValue Property SQ_WoundedState Auto Const mandatory
GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
ReferenceAlias Property Alias_TargetMarker Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
LocationAlias Property Alias_TargetLocation Auto Const mandatory
Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept()
  Self.SetStage(25)
EndFunction

Function Fragment_Stage_0025_Item_00()
  ObjectReference TargetREF = Alias_TargetNPC.GetRef()
  ObjectReference MarkerREF = Alias_TargetMarker.GetRef()
  TargetREF.Disable(False)
  TargetREF.MoveTo(MarkerREF, 0.0, 0.0, 0.0, True, False)
  TargetREF.Enable(False)
  (TargetREF as Actor).EvaluatePackage(False)
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
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0275_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  If !Self.GetStageDone(995)
    Self.SetStage(990)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor targetNPC = Alias_TargetNPC.GetActorRef()
  Self.SetObjectiveDisplayed(300, True, False)
  targetNPC.SetProtected(False)
  targetNPC.AddKeyword(SQ_Captive_HasFollowWaitTopics)
  targetNPC.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  Self.SetObjectiveCompleted(300, True)
  Alias_TargetNPC.GetActorRef().RemoveKeyword(SQ_Captive_HasFollowWaitTopics)
  If !Self.GetStageDone(990)
    Self.SetStage(995)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
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

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  If Self.GetStageDone(100)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
    kmyQuest.SetDialogueAV_Hello_Stressed_Failure()
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
