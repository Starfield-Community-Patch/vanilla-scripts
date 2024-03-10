ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_Ervin_00155D21 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Barrett_Q01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  Barrett_Q01.SetStage(1225)
EndFunction
