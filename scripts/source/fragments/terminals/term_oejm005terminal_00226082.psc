ScriptName Fragments:Terminals:TERM_OEJM005Terminal_00226082 Extends Terminal Const hidden

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(None, 100)
  Int I = 0
  While I < linkedRefChain.Length
    linkedRefChain[I].Unlock(False)
    I += 1
  EndWhile
EndFunction
