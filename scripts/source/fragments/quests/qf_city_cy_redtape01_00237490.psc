ScriptName Fragments:Quests:QF_City_CY_RedTape01_00237490 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueCydonia Auto Const mandatory
Quest Property City_CY_RedTape02 Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Resource01Total Auto Const mandatory
Key Property City_CY_RedTape01_HRKey Auto Const mandatory
RefCollectionAlias Property Alias_IronDeposits Auto Const mandatory
ActorValue Property City_CY_RedTape01_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(InorgCommonIron as Form, City_CY_RedTape01Resource01Total.GetValue() as Int, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If DialogueCydonia.GetStageDone(1105)
    Self.SetStage(200)
  Else
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(250, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(350, True, False)
EndFunction

Function Fragment_Stage_0352_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.AddItem(City_CY_RedTape01_HRKey as Form, 1, False)
  myPlayer.SetValue(City_CY_RedTape01_ForeknowledgeAV, 1.0)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.GetStageDone(420) && Self.GetStageDone(430) && Self.GetStageDone(440)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(410) && Self.GetStageDone(430) && Self.GetStageDone(440)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0430_Item_00()
  If Self.GetStageDone(410) && Self.GetStageDone(420) && Self.GetStageDone(440)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0440_Item_00()
  If Self.GetStageDone(410) && Self.GetStageDone(420) && Self.GetStageDone(430)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  City_CY_RedTape02.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
