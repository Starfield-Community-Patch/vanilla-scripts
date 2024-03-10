ScriptName Fragments:Quests:QF_FFNeonZ01_000B2A73 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Stratos Auto Const mandatory
Quest Property FFNeonZ01_SpeechChallengeQuest Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
GlobalVariable Property CreditAmount Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFNeonZ01_BribeLarge Auto Const mandatory
Potion Property Drug_Aurora Auto Const mandatory
Quest Property FFNeonGuardPointer_Z01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNeonZ01_BribeLarge.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CreditAmount.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Game.GetPlayer().RemoveItem(Drug_Aurora as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_Stratos.GetRef().EnableNoWait(False)
  FFNeonZ01_SpeechChallengeQuest.Start()
  FFNeonGuardPointer_Z01.SetStage(200)
EndFunction

Function Fragment_Stage_0011_Item_00()
  If !Self.GetStageDone(30)
    Self.SetObjectiveSkipped(30)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().AddItem(Alias_Slate.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(30, True)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If !Self.GetStageDone(30)
    Self.SetObjectiveSkipped(30)
  EndIf
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None)
  FFNeonZ01_SpeechChallengeQuest.Stop()
  DialogueFCNeon.SetStage(120)
  Self.Stop()
EndFunction
