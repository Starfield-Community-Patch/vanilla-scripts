ScriptName Fragments:Terminals:TERM_TestPCM_CommsArrayTermi_00255818 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TestPCM_CommsArrayProbeQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  TestPCM_CommsArrayProbeQuest.Start()
EndFunction
