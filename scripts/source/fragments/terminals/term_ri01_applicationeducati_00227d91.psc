ScriptName Fragments:Terminals:TERM_RI01_ApplicationEducati_00227D91 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI01_Track_AppEducation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  RI01_Track_AppEducation.SetValue(0.0)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  RI01_Track_AppEducation.SetValue(1.0)
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  RI01_Track_AppEducation.SetValue(2.0)
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  RI01_Track_AppEducation.SetValue(3.0)
EndFunction
