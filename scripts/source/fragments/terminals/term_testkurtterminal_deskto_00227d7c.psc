ScriptName Fragments:Terminals:TERM_TestKurtTerminal_Deskto_00227D7C Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TestKurtQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  TestKurtQuest.setstage(50)
EndFunction
