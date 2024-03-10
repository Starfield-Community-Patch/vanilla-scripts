ScriptName Fragments:Terminals:TERM_LC017_RobotLabTerminal_000B109A Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100)
  Int I = 0
  While I < linkedSecurityDoors.Length
    linkedSecurityDoors[I].Unlock(False)
    linkedSecurityDoors[I].SetOpen(True)
    I += 1
  EndWhile
EndFunction
