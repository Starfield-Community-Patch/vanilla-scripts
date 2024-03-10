ScriptName Fragments:Quests:QF_FFCydoniaZ06_00037E62 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Chris Auto Const mandatory
ReferenceAlias Property Alias_Logan Auto Const mandatory
ReferenceAlias Property Alias_Present Auto Const mandatory
ReferenceAlias Property Alias_Letter Auto Const mandatory
GlobalVariable Property FFCydoniaZ06_TLTimerLogan Auto Const
GlobalVariable Property DaysPassed Auto Const
GlobalVariable Property StoryManager_CydoniaLoad Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  StoryManager_CydoniaLoad.Mod(1.0)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(Alias_Letter.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Present.GetRef() as Form, 1, False)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Letter.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Present.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  FFCydoniaZ06_TLTimerLogan.SetValue(DaysPassed.GetValue() + 1.0)
  Self.Stop()
EndFunction
