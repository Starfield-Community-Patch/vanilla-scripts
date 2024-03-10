ScriptName Fragments:Terminals:TERM_SY_Taiyo_SalesTerminal_00260A18 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RAD06_KA_Job Auto Const mandatory
Quest Property RAD06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  RAD06.SetStage(50)
EndFunction
