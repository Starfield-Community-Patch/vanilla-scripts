ScriptName Fragments:Quests:QF_FFNeonZ06_00082D5A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
GlobalVariable Property FFNeonZ06_TevinPayment Auto Const
ReferenceAlias Property Alias_Rusty Auto Const mandatory
Quest Property DialogueQuest Auto Const
GlobalVariable Property Timer Auto Const
GlobalVariable Property DaysPassed Auto Const
Quest Property FFNeonGuardPointer_Z06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(0, True, False)
  FFNeonGuardPointer_Z06.SetStage(200)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNeonZ06_TevinPayment.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetObjectiveDisplayed(13, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(13)
    Self.SetObjectiveCompleted(13, True)
  EndIf
  If Self.GetStageDone(9)
    Self.SetObjectiveDisplayed(13, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(0, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_Rusty.GetActorRef().Enable(False)
EndFunction

Function Fragment_Stage_0032_Item_00()
  Alias_Rusty.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 200, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Rusty.GetActorRef().Disable(False)
  Self.CompleteAllObjectives()
  DialogueQuest.SetStage(300)
  Timer.SetValue(DaysPassed.GetValue() + 1.0)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Rusty.GetActorRef().Disable(False)
  Self.CompleteAllObjectives()
  DialogueQuest.SetStage(300)
  Timer.SetValue(DaysPassed.GetValue() + 1.0)
  Self.Stop()
EndFunction
