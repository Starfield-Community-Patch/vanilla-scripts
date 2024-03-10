ScriptName Fragments:Quests:QF_MS02_Delivery_002534D4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property InorgCommonCopper Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Game.GetPlayer().RemoveItem(InorgCommonCopper as Form, 150, False, None)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
