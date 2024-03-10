ScriptName Fragments:Quests:QF_FFNeonZ07_0006E0A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FlyersHandedOut Auto Const
GlobalVariable Property NewillFlyerHandedOut Auto Const
ReferenceAlias Property Alias_Flyer Auto Const mandatory
ReferenceAlias Property Alias_Saburo Auto Const mandatory
ReferenceAlias Property Alias_Flyer01 Auto Const mandatory
ReferenceAlias Property Alias_Flyer02 Auto Const mandatory
ReferenceAlias Property Alias_Flyer03 Auto Const mandatory
ReferenceAlias Property Alias_Flyer04 Auto Const mandatory
ReferenceAlias Property Alias_Flyer05 Auto Const mandatory
ReferenceAlias Property Alias_Flyer06 Auto Const mandatory
ReferenceAlias Property Alias_Flyer07 Auto Const mandatory
ReferenceAlias Property Alias_Flyer08 Auto Const mandatory
ReferenceAlias Property Alias_Flyer09 Auto Const mandatory
Quest Property NeonDialogueQuest Auto Const
GlobalVariable Property TLTimer Auto Const
GlobalVariable Property DaysPassed Auto Const
GlobalVariable Property TLTimer2 Auto Const
GlobalVariable Property KosmoLeeFlyerHandedOut Auto Const
Quest Property FFNeonGuardPointer_Z07 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Game.GetPlayer().AddItem(Alias_Flyer.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Flyer01.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Flyer02.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Flyer03.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Flyer04.GetRef() as Form, 1, False)
  FFNeonGuardPointer_Z07.SetStage(200)
EndFunction

Function Fragment_Stage_0020_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  NewillFlyerHandedOut.Mod(1.0)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0060_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0070_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  KosmoLeeFlyerHandedOut.Mod(1.0)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0080_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0090_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False)
  If FlyersHandedOut.GetValue() == 5.0
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  NeonDialogueQuest.SetStage(460)
  TLTimer.SetValue(DaysPassed.GetValue() + 2.0)
  TLTimer2.SetValue(DaysPassed.GetValue() + 4.0)
  Self.CompleteAllObjectives()
  Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer05.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer06.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer07.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer08.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Flyer09.GetRef() as Form, 1, False, None)
  Self.Stop()
EndFunction
