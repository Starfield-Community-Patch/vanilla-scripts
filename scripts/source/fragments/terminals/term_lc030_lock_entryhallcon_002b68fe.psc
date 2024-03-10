ScriptName Fragments:Terminals:TERM_LC030_Lock_EntryHallCon_002B68FE Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  CF03.SetStage(130)
EndFunction
