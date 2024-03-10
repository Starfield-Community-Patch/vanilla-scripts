ScriptName Fragments:Quests:QF_BF04_0001BD20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF06Microdrive Auto Const mandatory
ReferenceAlias Property Alias_CF06Evidence Auto Const mandatory
ReferenceAlias Property Alias_CF06GenerdynePass Auto Const mandatory
GlobalVariable Property CF06Count Auto Const mandatory
ReferenceAlias Property Alias_CF06Naeva Auto Const mandatory
ObjectReference Property CF06NaevaTalkMarker Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
ReferenceAlias Property Alias_CF06_Komiko Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0060_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
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
  Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True)
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(70) == True
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
  Alias_CF06_Komiko.GetActorRef().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  If Self.GetStageDone(110) == False
    Self.SetObjectiveCompleted(50, True)
    Self.SetObjectiveDisplayed(70, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(70, True)
  If Self.IsObjectiveDisplayed(60) == True
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.IsObjectiveDisplayed(50) == True
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(60) == True
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(70) == True
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Game.GetPlayer().RemoveItem(Alias_CF06Microdrive.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
  Alias_CF06Naeva.GetActorRef().Moveto(CF06NaevaTalkMarker, 0.0, 0.0, 0.0, True, False)
  Alias_CF06Naeva.GetActorRef().Enable(False)
  If City_NA_Viewport02.IsRunning()
    City_NA_Viewport02.SetStage(22)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(130, True)
  Self.Stop()
EndFunction
