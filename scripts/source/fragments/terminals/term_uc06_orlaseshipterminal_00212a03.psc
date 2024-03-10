ScriptName Fragments:Terminals:TERM_UC06_OrlaseShipTerminal_00212A03 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkShipSpaceshipInventory Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkShipSpaceshipInventory).Unlock(False)
EndFunction
