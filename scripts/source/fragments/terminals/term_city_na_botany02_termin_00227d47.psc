ScriptName Fragments:Terminals:TERM_City_NA_Botany02_Termin_00227D47 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_NA_Botany02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  City_NA_Botany02.SetStage(60)
EndFunction
