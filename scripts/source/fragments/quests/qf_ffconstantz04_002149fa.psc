ScriptName Fragments:Quests:QF_FFConstantZ04_002149FA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFConstantZ04_Debt Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
ReferenceAlias Property Alias_Janet Auto Const mandatory
ReferenceAlias Property Alias_Oliver Auto Const mandatory
Quest Property FFConstantZ04Misc Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
ActorValue Property FFConstantZ04_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_Oliver.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().Additem(Credits as Form, FFConstantZ04_Debt.GetValue() as Int, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If FFConstantZ04Misc.IsRunning()
    FFConstantZ04Misc.SetStage(1000)
  EndIf
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFConstantZ04_Debt.GetValue() as Int, False, None)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveCompleted(200, True)
  EndIf
  If Self.IsObjectiveDisplayed(250)
    Self.SetObjectiveCompleted(250, True)
  EndIf
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  DialogueECSConstant.SetStage(1450)
  Game.GetPlayer().SetValue(FFConstantZ04_ForeknowledgeAV, 1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
