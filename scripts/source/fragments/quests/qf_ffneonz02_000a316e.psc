ScriptName Fragments:Quests:QF_FFNeonZ02_000A316E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DataSlate Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Quest Property FFNeonZ02_SpeechChallengeQuest Auto Const mandatory
Quest Property FFNeonGuardPointer_Z02 Auto Const mandatory
ReferenceAlias Property Alias_Clover Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveCompleted(5, True)
  If Self.GetStageDone(10)
    Self.SetObjectiveDisplayed(30, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  If Self.GetStageDone(5)
    Self.SetObjectiveDisplayed(30, True, False)
  ElseIf Self.GetStageDone(30)
    Self.SetObjectiveDisplayed(5, True, False)
  Else
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
  FFNeonZ02_SpeechChallengeQuest.Start()
  FFNeonGuardPointer_Z02.SetStage(200)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If !Self.GetStageDone(5)
    Self.SetObjectiveDisplayed(5, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0035_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataSlate.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveSkipped(5)
  Self.SetObjectiveSkipped(20)
  Self.SetObjectiveSkipped(30)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  FFNeonZ02_SpeechChallengeQuest.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  DialogueFCNeon.SetStage(140)
  Actor CloverRef = Alias_Clover.GetActorRef()
  Alias_Clover.Clear()
  CloverRef.SetEssential(False)
  Self.Stop()
EndFunction
