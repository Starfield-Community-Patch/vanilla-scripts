ScriptName Fragments:Terminals:TERM_MQ206B_TerminalKiosk03_001941C9 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ206B Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  MQ206B.SetStage(660)
EndFunction
