ScriptName Fragments:Quests:QF_BF05_0001C9D3 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayed(60, True, False)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True)
  If Self.IsObjectiveDisplayed(40) == True
    Self.SetObjectiveDisplayed(40, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(60) == True
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(65, True, False)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetObjectiveCompleted(65, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(40, True)
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(60) == True
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
  Self.SetStage(80)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(130, True)
  Self.SetObjectiveDisplayed(140, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveDisplayed(150, True, False)
  Self.SetObjectiveDisplayed(160, True, False)
  Self.SetObjectiveDisplayed(170, True, False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(160, True)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(170, True)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(190, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(210, True, False)
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.SetObjectiveCompleted(210, True)
  Self.SetObjectiveDisplayed(220, True, False)
  Self.Stop()
EndFunction
