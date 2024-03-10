ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D895 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Barrett_Q01 Auto Const mandatory
Quest Property BarrettCommitmentQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  BarrettCommitmentQuest.SetStage(310)
EndFunction

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  BarrettCommitmentQuest.SetStage(315)
EndFunction
