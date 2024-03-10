ScriptName Fragments:Terminals:TERM_City_CY_RedTape01_HRSub_001FA6BF Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01_Candidate04Deleted Auto Const mandatory
GlobalVariable Property City_CY_RedTape01_Candidate01Deleted Auto Const mandatory
GlobalVariable Property City_CY_RedTape01_Candidate02Deleted Auto Const mandatory
GlobalVariable Property City_CY_RedTape01_Candidate03Deleted Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_CY_RedTape01_Candidate01Deleted.SetValue(1.0)
  City_CY_RedTape01_Candidate02Deleted.SetValue(1.0)
  City_CY_RedTape01_Candidate03Deleted.SetValue(1.0)
  City_CY_RedTape01_Candidate04Deleted.SetValue(1.0)
EndFunction
