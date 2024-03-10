ScriptName Fragments:Terminals:TERM_SY_Trident_SalesTermina_00227D41 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RAD06_KA_Job Auto Const mandatory
Quest Property RAD06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  RAD06.SetStage(50)
EndFunction
