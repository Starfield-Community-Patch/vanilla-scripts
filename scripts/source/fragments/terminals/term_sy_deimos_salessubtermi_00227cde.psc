ScriptName Fragments:Terminals:TERM_SY_Deimos_SalesSubTermi_00227CDE Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01Application03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_CY_RedTape01Application03.SetValue(0.0)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  City_CY_RedTape01Application03.SetValue(1.0)
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  City_CY_RedTape01Application03.SetValue(2.0)
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  City_CY_RedTape01Application03.SetValue(0.0)
EndFunction
