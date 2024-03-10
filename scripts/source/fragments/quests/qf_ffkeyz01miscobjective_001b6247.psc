ScriptName Fragments:Quests:QF_FFKeyZ01MiscObjective_001B6247 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TheKeyStartMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property FFKeyZ01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC082.SetStage(12)
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  FFKeyZ01.SetStage(200)
  Self.SetStage(10000)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.Stop()
EndFunction
