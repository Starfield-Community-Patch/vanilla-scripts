ScriptName Fragments:Terminals:TERM_BQ01_TerminalSubMenu_Cl_0017BE3F Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Companion_Barrett Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  ; Empty function
EndFunction

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  COM_Companion_Barrett.SetStage(10)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  COM_Companion_Barrett.SetStage(11)
EndFunction
