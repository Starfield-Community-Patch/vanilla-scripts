ScriptName Fragments:Quests:QF_FFNewHomesteadZ01_0021710B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFNewHomesteadZ01_TourTip Auto Const mandatory
Quest Property FFNewHomesteadZ01Misc Auto Const mandatory
ReferenceAlias Property Alias_Bill Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour01 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour02 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour03 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour04 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour05 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour06 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour07 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour08 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour09 Auto Const mandatory
ActorValue Property FFNewHomesteadZ01_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  FFNewHomesteadZ01Misc.SetStage(1000)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Bill.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
  FFNewHomesteadZ01_Bill_Tour02.Start()
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(250, True)
  Self.SetObjectiveDisplayed(300, True, False)
  FFNewHomesteadZ01_Bill_Tour03.Start()
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(350, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(400, True, False)
  FFNewHomesteadZ01_Bill_Tour04.Start()
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(450, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(450, True)
  Self.SetObjectiveDisplayed(500, True, False)
  FFNewHomesteadZ01_Bill_Tour05.Start()
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(550, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(550, True)
  Self.SetObjectiveDisplayed(600, True, False)
  FFNewHomesteadZ01_Bill_Tour06.Start()
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(650, True, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(650, True)
  Self.SetObjectiveDisplayed(700, True, False)
  FFNewHomesteadZ01_Bill_Tour07.Start()
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(750, True, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(750, True)
  Self.SetObjectiveDisplayed(800, True, False)
  FFNewHomesteadZ01_Bill_Tour08.Start()
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(850, True, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(850, True)
  Self.SetObjectiveDisplayed(900, True, False)
  FFNewHomesteadZ01_Bill_Tour09.Start()
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(950, True, False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNewHomesteadZ01_TourTip.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().SetValue(FFNewHomesteadZ01_Foreknowledge_AV, 1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
