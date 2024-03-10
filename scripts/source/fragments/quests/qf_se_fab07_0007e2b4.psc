ScriptName Fragments:Quests:QF_SE_FAB07_0007E2B4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_FAB07_100_LillianSeesPC Auto Const mandatory
Scene Property SE_FAB07_200_LillianFightOver Auto Const mandatory
GlobalVariable Property SE_Player_FAB07_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(5.0)
  SE_FAB07_100_LillianSeesPC.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  SE_FAB07_200_LillianFightOver.Start()
EndFunction

Function Fragment_Stage_0210_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0220_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(230)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  SE_Player_FAB07_RunOnce.SetValue(1.0)
  Self.Stop()
EndFunction
