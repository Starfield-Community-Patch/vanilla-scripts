ScriptName Fragments:Quests:QF_FFNewHomesteadR05_0021952E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Luthor Auto Const mandatory
ReferenceAlias Property Alias_ChunksVendor Auto Const mandatory
ReferenceAlias Property Alias_SpecialSauce Auto Const mandatory
GlobalVariable Property FFNewHomesteadR05_NumTimesCompleted Auto Const mandatory
Quest Property FFNewHomesteadR05Misc Auto Const mandatory
ActorValue Property FFNewHomesteadR05_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Luthor.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().MoveTo(Alias_ChunksVendor.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Luthor.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If FFNewHomesteadR05Misc.IsRunning()
    FFNewHomesteadR05Misc.SetStage(1000)
  EndIf
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.GetPlayer().AddItem(Alias_SpecialSauce.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().SetValue(FFNewHomesteadR05_Foreknowledge_AV, 1.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  ffnewhomesteadr05questscript kmyQuest = __temp as ffnewhomesteadr05questscript
  Game.GetPlayer().RemoveItem(Alias_SpecialSauce.GetRef() as Form, 1, False, None)
  kmyQuest.SetCooldown()
  FFNewHomesteadR05_NumTimesCompleted.Mod(1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
