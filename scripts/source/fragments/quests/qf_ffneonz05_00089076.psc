ScriptName Fragments:Quests:QF_FFNeonZ05_00089076 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Abbie Auto Const mandatory
ReferenceAlias Property Alias_Supplies Auto Const mandatory
Quest Property FFNeonDialogue Auto Const
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
MiscObject Property Supplies Auto Const
ReferenceAlias Property Alias_Supplies01 Auto Const mandatory
GlobalVariable Property Timer Auto Const
GlobalVariable Property DaysPassed Auto Const
Quest Property FFNeonGuardPointer_Z05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  FFNeonGuardPointer_Z05.SetStage(200)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef() as Form, 1, False)
  Alias_Supplies.GetRef().Enable(False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef() as Form, 1, False)
  Alias_Supplies.GetRef().Enable(False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef() as Form, 1, False)
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies01.GetRef() as Form, 1, False)
  Alias_Supplies.GetRef().Enable(False)
  Alias_Supplies01.GetRef().Enable(False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  FFNeonDialogue.SetStage(280)
  Timer.SetValue(DaysPassed.GetValue() + 2.0)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None)
  Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies01.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  FFNeonDialogue.SetStage(280)
  Timer.SetValue(DaysPassed.GetValue() + 2.0)
  Self.Stop()
EndFunction
