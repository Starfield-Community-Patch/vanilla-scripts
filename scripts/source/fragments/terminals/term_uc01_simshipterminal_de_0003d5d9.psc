ScriptName Fragments:Terminals:TERM_UC01_SimShipTerminal_De_0003D5D9 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkShipSpaceshipInventory Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkShipSpaceshipInventory).Unlock(False)
EndFunction
