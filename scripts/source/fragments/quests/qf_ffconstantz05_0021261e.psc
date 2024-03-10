ScriptName Fragments:Quests:QF_FFConstantZ05_0021261E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFConstantZ05_Food Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
ReferenceAlias Property Alias_Janet Auto Const mandatory
ReferenceAlias Property Alias_Diana Auto Const mandatory
Quest Property FFConstantZ05Misc Auto Const mandatory
ActorValue Property FFConstantZ05_ForeknowledgeAV Auto Const mandatory
Potion Property Food_Produce_Potato Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_Diana.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().AddItem(Food_Produce_Potato as Form, FFConstantZ05_Food.GetValue() as Int, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If FFConstantZ05Misc.IsRunning()
    FFConstantZ05Misc.SetStage(1000)
  EndIf
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Game.GetPlayer().RemoveItem(Food_Produce_Potato as Form, FFConstantZ05_Food.GetValue() as Int, False, None)
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
  Self.CompleteAllObjectives()
  Game.GetPlayer().SetValue(FFConstantZ05_ForeknowledgeAV, 1.0)
  Self.Stop()
EndFunction
