ScriptName Fragments:Quests:QF_FFNeonZ05_010036C5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Abbie Auto Const mandatory
ReferenceAlias Property Alias_Supplies Auto Const mandatory
Quest Property FFNeonDialogue Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_Supplies.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_Supplies.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_Supplies.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  FFNeonDialogue.SetStage(280)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  FFNeonDialogue.SetStage(280)
  Self.Stop()
EndFunction
