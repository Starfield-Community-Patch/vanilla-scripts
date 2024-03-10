ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D897 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettCommitmentQuest Auto Const mandatory
ActorValue Property AV_SelfAddress Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 79.0)
EndFunction

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 72.0)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  Int SelfAddress = Game.GetPlayer().GetValue(AV_SelfAddress) as Int
  If SelfAddress == 71
    BarrettCommitmentQuest.SetStage(71)
  ElseIf SelfAddress == 72
    BarrettCommitmentQuest.SetStage(72)
  ElseIf SelfAddress == 73
    BarrettCommitmentQuest.SetStage(73)
  ElseIf SelfAddress == 74
    BarrettCommitmentQuest.SetStage(74)
  ElseIf SelfAddress == 75
    BarrettCommitmentQuest.SetStage(75)
  Else
    BarrettCommitmentQuest.SetStage(79)
  EndIf
  BarrettCommitmentQuest.SetStage(85)
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 71.0)
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 74.0)
EndFunction

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 73.0)
EndFunction

Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 75.0)
EndFunction
