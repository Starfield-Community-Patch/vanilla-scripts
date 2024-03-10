ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D65E Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Barrett_Q01 Auto Const mandatory
Quest Property BarrettCommitmentQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  BarrettCommitmentQuest.SetStage(320)
EndFunction
