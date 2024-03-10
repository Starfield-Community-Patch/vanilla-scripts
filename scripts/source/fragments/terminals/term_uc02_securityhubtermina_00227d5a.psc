ScriptName Fragments:Terminals:TERM_UC02_SecurityHubTermina_00227D5A Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  UC02.SetStage(600)
EndFunction
