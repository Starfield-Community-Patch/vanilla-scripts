ScriptName Fragments:Terminals:TERM_UC06_OrlaseShipTerminal_00212A04 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkShipSpaceshipInventory Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkShipSpaceshipInventory).Unlock(False)
EndFunction
