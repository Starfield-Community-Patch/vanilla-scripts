ScriptName Fragments:Terminals:TERM_LC168_StorageTerminal_D_002D4A51 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkCustom01).Unlock(False)
  akTerminalRef.GetLinkedRef(LinkCustom01).SetOpen(True)
EndFunction
