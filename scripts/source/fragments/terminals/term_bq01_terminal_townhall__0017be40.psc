ScriptName Fragments:Terminals:TERM_BQ01_Terminal_TownHall__0017BE40 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Barrett_Q01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  Barrett_Q01.SetStage(2100)
EndFunction
