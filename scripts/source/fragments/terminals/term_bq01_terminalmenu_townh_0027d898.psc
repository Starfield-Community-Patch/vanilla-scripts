ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D898 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettCommitmentQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  BarrettCommitmentQuest.SetStage(86)
EndFunction
