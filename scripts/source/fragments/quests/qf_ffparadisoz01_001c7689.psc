ScriptName Fragments:Quests:QF_FFParadisoZ01_001C7689 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFParadisoZ01Misc Auto Const mandatory
Book Property FFParadisoZ01_Claim Auto Const mandatory
ReferenceAlias Property Alias_Claim Auto Const mandatory
ReferenceAlias Property Alias_Akachi Auto Const mandatory
ReferenceAlias Property Alias_Emilian Auto Const mandatory
ReferenceAlias Property Alias_Parts Auto Const mandatory
ActorValue Property FFParadisoZ01_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_Akachi.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Emilian.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If FFParadisoZ01Misc.IsRunning()
    FFParadisoZ01Misc.SetStage(1000)
  EndIf
  Self.SetObjectiveDisplayed(100, True, False)
  Game.GetPlayer().AddAliasedItem(FFParadisoZ01_Claim as Form, Alias_Claim as Alias, 1, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  kmyQuest.StartWaitTimer()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript
  Self.SetObjectiveDisplayed(300, True, False)
  kmyQuest.ComputerAllowActivate()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0460_Item_00()
  Quest __temp = Self as Quest
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript
  kmyQuest.ComputerNoActivate()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript
  kmyQuest.StopWaitTimer()
  Self.SetObjectiveCompleted(200, True)
  If Self.IsObjectiveDisplayed(300)
    Self.SetObjectiveCompleted(300, True)
  EndIf
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.RemoveItem(Alias_Claim.GetRef() as Form, 1, False, None)
  myPlayer.AddItem(Alias_Parts.GetRef() as Form, 1, False)
  Self.SetObjectiveCompleted(200, True)
  If Self.IsObjectiveDisplayed(300)
    Self.SetObjectiveCompleted(300, True)
  EndIf
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.SetValue(FFParadisoZ01_Foreknowledge_AV, 1.0)
  myPlayer.RemoveItem(Alias_Parts.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
