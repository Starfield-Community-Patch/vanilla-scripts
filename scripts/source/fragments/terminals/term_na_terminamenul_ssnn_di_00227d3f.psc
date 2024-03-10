ScriptName Fragments:Terminals:TERM_NA_TerminaMenul_SSNN_Di_00227D3F Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_NA_Botany03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  City_NA_Botany03.SetStage(75)
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  City_NA_Botany03.SetStage(65)
EndFunction
