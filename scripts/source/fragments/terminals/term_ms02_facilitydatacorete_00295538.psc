ScriptName Fragments:Terminals:TERM_MS02_FacilityDatacoreTe_00295538 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  MS02.SetStage(1730)
EndFunction

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  MS02.SetStage(1710)
EndFunction
