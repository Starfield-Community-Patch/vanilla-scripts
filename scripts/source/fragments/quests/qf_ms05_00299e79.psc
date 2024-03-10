ScriptName Fragments:Quests:QF_MS05_00299E79 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MS05_RDIntroScene Auto Const
Message Property MS05_Stage300Temp_Message Auto Const
Message Property PMS05_Stage500Temp_Message Auto Const mandatory
Message Property MS05_Stage500Temp_Message Auto Const
ObjectReference Property DebugStaryardMarker Auto Const
GlobalVariable Property MS05Interpersonal Auto Const mandatory
GlobalVariable Property MS05Market Auto Const mandatory
GlobalVariable Property MS05Budget Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property MS05BudgetPlayerPay Auto Const mandatory
GlobalVariable Property MS05ShipDesign Auto Const mandatory
ActorValue Property MS05_Foreknowledge_JulesConvinceAV Auto Const mandatory
ActorValue Property MS05_Foreknowledge_FrankConvinceAV Auto Const mandatory
Quest Property MS05Reward Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_ZW16a_Timestamp Auto Const mandatory
GlobalVariable Property SE_Player_ZW16b_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().moveto(DebugStaryardMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, MS05BudgetPlayerPay.GetValue() as Int, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  MS05_RDIntroScene.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  MS05Budget.SetValue(-1.0)
  Game.GetPlayer().SetValue(MS05_Foreknowledge_JulesConvinceAV, 1.0)
EndFunction

Function Fragment_Stage_0220_Item_00()
  MS05Budget.SetValue(1.0)
  Game.GetPlayer().SetValue(MS05_Foreknowledge_FrankConvinceAV, 1.0)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0260_Item_00()
  MS05Budget.SetValue(-1.0)
  Self.SetObjectiveCompleted(250, True)
  Self.SetObjectiveDisplayed(270, False, False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveDisplayed(270, True, False)
EndFunction

Function Fragment_Stage_0280_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MS05BudgetPlayerPay.GetValue() as Int, False, None)
  MS05Budget.SetValue(-1.0)
  Self.SetObjectiveDisplayed(250, False, False)
  Self.SetObjectiveCompleted(270, True)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  If Self.GetStageDone(320) && Self.GetStageDone(330) && Self.GetStageDone(340) && Self.GetStageDone(350)
    Self.SetStage(360)
  EndIf
EndFunction

Function Fragment_Stage_0320_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(330) && Self.GetStageDone(340) && Self.GetStageDone(350)
    Self.SetStage(360)
  EndIf
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(320) && Self.GetStageDone(340) && Self.GetStageDone(350)
    Self.SetStage(360)
  EndIf
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(320) && Self.GetStageDone(330) && Self.GetStageDone(350)
    Self.SetStage(360)
  EndIf
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(320) && Self.GetStageDone(330) && Self.GetStageDone(340)
    Self.SetStage(360)
  EndIf
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(300, True)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  ms05questscript kmyQuest = __temp as ms05questscript
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(510, True, False)
  Self.SetObjectiveDisplayed(520, True, False)
  kmyQuest.StartMissions()
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Self.IsObjectiveDisplayed(510) && !Self.IsObjectiveCompleted(510)
    Self.SetObjectiveCompleted(510, True)
  EndIf
  If Self.IsObjectiveDisplayed(511) && !Self.IsObjectiveCompleted(511)
    Self.SetObjectiveCompleted(511, True)
  EndIf
  If Self.IsObjectiveDisplayed(520) && !Self.GetStageDone(520)
    Self.SetObjectiveDisplayed(520, False, False)
    Self.SetObjectiveDisplayed(521, True, False)
  EndIf
  If Self.GetStageDone(520)
    Self.SetStage(550)
  EndIf
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0520_Item_00()
  If Self.IsObjectiveDisplayed(520) && !Self.IsObjectiveCompleted(520)
    Self.SetObjectiveCompleted(520, True)
  EndIf
  If Self.IsObjectiveDisplayed(521) && !Self.IsObjectiveCompleted(521)
    Self.SetObjectiveCompleted(521, True)
  EndIf
  If Self.IsObjectiveDisplayed(510) && !Self.GetStageDone(510)
    Self.SetObjectiveDisplayed(510, False, False)
    Self.SetObjectiveDisplayed(511, True, False)
  EndIf
  If Self.GetStageDone(510)
    Self.SetStage(550)
  EndIf
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest
  ms05questscript kmyQuest = __temp as ms05questscript
  kmyQuest.MissionsCompleted()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0601_Item_00()
  Quest __temp = Self as Quest
  ms05questscript kmyQuest = __temp as ms05questscript
  kmyQuest.MissionsCompleted()
  If Self.GetStageDone(550)
    MS05Market.SetValue(-1.0)
  Else
    MS05Market.SetValue(1.0)
  EndIf
  If Self.IsObjectiveDisplayed(511) && !Self.IsObjectiveCompleted(511)
    Self.SetObjectiveFailed(511, True)
  EndIf
  If Self.IsObjectiveDisplayed(521) && !Self.IsObjectiveCompleted(521)
    Self.SetObjectiveFailed(521, True)
  EndIf
EndFunction

Function Fragment_Stage_0610_Item_00()
  MS05Interpersonal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0620_Item_00()
  MS05Interpersonal.SetValue(-1.0)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Float fShipDesignTotal = MS05Budget.GetValue() + MS05Market.GetValue() + MS05Interpersonal.GetValue()
  MS05ShipDesign.SetValue(fShipDesignTotal)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.IsObjectiveCompleted(300)
    Self.SetObjectiveFailed(300, True)
  EndIf
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Float currentGameTime = Utility.GetCurrentGameTime()
  SE_Player_ZW16a_Timestamp.SetValue(currentGameTime + cooldownDays)
  SE_Player_ZW16b_Timestamp.SetValue(currentGameTime + cooldownDays)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  MS05Reward.Start()
EndFunction
