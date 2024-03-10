ScriptName Fragments:Terminals:TERM_SY_Deimos_SalesTerminal_0025EFA3 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RAD06_KA_Job Auto Const mandatory
Quest Property RAD06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  RAD06.SetStage(50)
EndFunction
