ScriptName Fragments:Terminals:TERM_LC082_Weapons_BaySecuri_00227D4E Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088_Vigilance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  LC088_Vigilance.SetStage(640)
EndFunction
