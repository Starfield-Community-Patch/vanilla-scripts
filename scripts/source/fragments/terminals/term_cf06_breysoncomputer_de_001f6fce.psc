ScriptName Fragments:Terminals:TERM_CF06_BreysonComputer_De_001F6FCE Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  CF06.SetStage(185)
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  CF06.SetStage(180)
EndFunction
