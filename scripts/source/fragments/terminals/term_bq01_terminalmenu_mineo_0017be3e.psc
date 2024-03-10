ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_MineO_0017BE3E Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(5105)
EndFunction
