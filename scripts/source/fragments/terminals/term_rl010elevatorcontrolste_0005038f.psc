ScriptName Fragments:Terminals:TERM_RL010ElevatorControlsTe_0005038F Extends TerminalMenu Const hidden

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  loadelevatormanagerscript loadElevatorManager = akTerminalRef.GetLinkedRef(None) as loadelevatormanagerscript
  loadElevatorManager.SetElevatorOperational(True)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  loadelevatormanagerscript loadElevatorManager = akTerminalRef.GetLinkedRef(None) as loadelevatormanagerscript
  loadElevatorManager.SetElevatorOperational(False)
EndFunction
