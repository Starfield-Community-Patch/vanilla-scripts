ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_MineO_002EDB0B Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(5011)
EndFunction

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(5013)
EndFunction
