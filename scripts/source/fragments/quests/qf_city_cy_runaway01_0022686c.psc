ScriptName Fragments:Quests:QF_City_CY_Runaway01_0022686C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property City_CY_Runaway01_Whiskey Auto Const mandatory
GlobalVariable Property City_CY_Runaway01_WhiskeyPriceNormal Auto Const mandatory
GlobalVariable Property City_CY_Runaway01_WhiskeyPriceReduced Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Whiskey Auto Const mandatory
GlobalVariable Property City_CY_Runaway01_Ending Auto Const mandatory
ReferenceAlias Property Alias_Rivkah Auto Const mandatory
ReferenceAlias Property Alias_Jack Auto Const mandatory
ReferenceAlias Property Alias_Minerva Auto Const mandatory
ReferenceAlias Property Alias_Natan Auto Const mandatory
ReferenceAlias Property Alias_Guard01 Auto Const mandatory
ReferenceAlias Property Alias_Guard02 Auto Const mandatory
Topic Property City_CY_Runaway01_0415_Natan_ApproachTopic Auto Const mandatory
Quest Property DialogueCydonia Auto Const mandatory
Scene Property City_CY_Runaway01_0190_Companion_Whiskey Auto Const mandatory
ActorValue Property City_CY_Runaway01_Foreknowledge_NatanPeacefulAV Auto Const mandatory
ReferenceAlias Property Alias_GovWhiskey Auto Const mandatory
ReferenceAlias Property Alias_NatanDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Minerva.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(100)
  Self.SetStage(105)
  Self.SetStage(110)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  Self.SetStage(2)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_Natan.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().MoveTo(Alias_Rivkah.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueCydonia.SetStage(1301)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_GovWhiskey.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.AddItem(Alias_Whiskey.GetRef() as Form, 1, False)
  myPlayer.RemoveItem(Credits as Form, City_CY_Runaway01_WhiskeyPriceNormal.GetValue() as Int, False, None)
  Self.SetStage(200)
  City_CY_Runaway01_0190_Companion_Whiskey.Start()
EndFunction

Function Fragment_Stage_0191_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.AddItem(Alias_Whiskey.GetRef() as Form, 1, False)
  myPlayer.RemoveItem(Credits as Form, City_CY_Runaway01_WhiskeyPriceReduced.GetValue() as Int, False, None)
  Self.SetStage(200)
  City_CY_Runaway01_0190_Companion_Whiskey.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  If !Self.IsObjectiveCompleted(110) && Self.IsObjectiveDisplayed(110)
    Self.SetObjectiveCompleted(110, True)
  EndIf
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_Natan.GetRef().Enable(False)
  ObjectReference myDoor = Alias_NatanDoor.GetRef()
  myDoor.SetDoorInaccessible(False)
  myDoor.Unlock(False)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0415_Item_00()
  Actor myNatan = Alias_Natan.GetActorRef()
  myNatan.EvaluatePackage(False)
  Utility.Wait(3.0)
  myNatan.Say(City_CY_Runaway01_0415_Natan_ApproachTopic, None, False, None)
EndFunction

Function Fragment_Stage_0440_Item_00()
  City_CY_Runaway01_Ending.SetValue(1.0)
  Game.GetPlayer().SetValue(City_CY_Runaway01_Foreknowledge_NatanPeacefulAV, 1.0)
EndFunction

Function Fragment_Stage_0441_Item_00()
  City_CY_Runaway01_Ending.SetValue(2.0)
EndFunction

Function Fragment_Stage_0442_Item_00()
  City_CY_Runaway01_Ending.SetValue(3.0)
EndFunction

Function Fragment_Stage_0443_Item_00()
  City_CY_Runaway01_Ending.SetValue(4.0)
EndFunction

Function Fragment_Stage_0444_Item_00()
  City_CY_Runaway01_Ending.SetValue(6.0)
  Alias_Guard01.GetRef().Enable(False)
  Alias_Guard02.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(450, True, False)
  Alias_Guard01.GetRef().Enable(False)
  Alias_Guard02.GetRef().Enable(False)
  Alias_Natan.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, True)
EndFunction

Function Fragment_Stage_0460_Item_00()
  City_CY_Runaway01_Ending.SetValue(5.0)
  Self.SetObjectiveCompleted(450, True)
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0550_Item_00()
  If Self.GetStageDone(443)
    Alias_Rivkah.GetRef().Disable(False)
    Self.SetStage(700)
  Else
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0610_Item_00()
  City_CY_Runaway01_Ending.SetValue(7.0)
EndFunction

Function Fragment_Stage_0701_Item_00()
  Self.SetObjectiveDisplayed(500, False, False)
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.IsObjectiveDisplayed(500)
    Self.SetObjectiveCompleted(500, True)
  EndIf
  If Self.IsObjectiveDisplayed(700)
    Self.SetObjectiveCompleted(700, True)
  EndIf
  Alias_Natan.GetRef().Disable(False)
  Self.Stop()
EndFunction
