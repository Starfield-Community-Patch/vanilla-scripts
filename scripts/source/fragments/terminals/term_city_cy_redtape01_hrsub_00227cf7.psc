ScriptName Fragments:Terminals:TERM_City_CY_RedTape01_HRSub_00227CF7 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01_Candidate03Deleted Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_CY_RedTape01_Candidate03Deleted.SetValue(1.0)
EndFunction
