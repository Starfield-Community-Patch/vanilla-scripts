ScriptName Fragments:Quests:QF_City_AkilaLife04_000F24FA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property City_AkilaLife04_400_StonerootInn Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(100)
    Self.SetObjectiveDisplayed(25, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  city_akilalife04_script kmyQuest = __temp as city_akilalife04_script
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  kmyQuest.Wait24()
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  City_AkilaLife04_400_StonerootInn.Start()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
