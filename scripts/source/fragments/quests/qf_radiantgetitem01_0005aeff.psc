ScriptName Fragments:Quests:QF_RadiantGetItem01_0005AEFF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_QuestItem Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(100) == False
    Self.SetObjectiveDisplayed(10, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(10) == True
    Self.SetObjectiveCompleted(10, True)
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Game.GetPlayer().RemoveItem(Alias_QuestItem.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
