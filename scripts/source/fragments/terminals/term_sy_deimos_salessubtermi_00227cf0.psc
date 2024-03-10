ScriptName Fragments:Terminals:TERM_SY_Deimos_SalesSubTermi_00227CF0 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01Application01 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application02 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application03 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application04 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application05 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01ApplicationTotal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_CY_RedTape01ApplicationTotal.SetValue(City_CY_RedTape01Application01.GetValue() + City_CY_RedTape01Application02.GetValue() + City_CY_RedTape01Application03.GetValue() + City_CY_RedTape01Application04.GetValue() + City_CY_RedTape01Application05.GetValue())
EndFunction
