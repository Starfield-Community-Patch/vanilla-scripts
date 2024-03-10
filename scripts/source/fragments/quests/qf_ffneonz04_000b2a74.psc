ScriptName Fragments:Quests:QF_FFNeonZ04_000B2A74 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFNeonZ04_DietrichBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property FFNeonZ04_SpeechChallengeQuest Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Quest Property FFNeonGuardPointer_Z04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  If !DialogueFCNeon.GetStageDone(445)
    Self.SetObjectiveDisplayed(15, True, False)
  EndIf
  FFNeonZ04_SpeechChallengeQuest.Start()
  FFNeonGuardPointer_Z04.SetStage(200)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNeonZ04_DietrichBribe.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(10, True)
  If !DialogueFCNeon.GetStageDone(445)
    Self.SetObjectiveSkipped(15)
  EndIf
  Self.SetObjectiveDisplayed(20, True, False)
  DialogueFCNeon.SetStage(160)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  FFNeonZ04_SpeechChallengeQuest.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  DialogueFCNeon.SetStage(225)
  Self.Stop()
EndFunction
