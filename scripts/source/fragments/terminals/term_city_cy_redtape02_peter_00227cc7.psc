ScriptName Fragments:Terminals:TERM_City_CY_RedTape02_Peter_00227CC7 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape02Request04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_CY_RedTape02Request04.SetValue(1.0)
EndFunction
