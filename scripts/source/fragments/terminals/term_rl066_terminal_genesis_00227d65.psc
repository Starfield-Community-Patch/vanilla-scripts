ScriptName Fragments:Terminals:TERM_RL066_Terminal_Genesis_00227D65 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RL066_Quest Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  RL066_Quest.setstage(50)
EndFunction
