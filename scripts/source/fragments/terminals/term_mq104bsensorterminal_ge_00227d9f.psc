ScriptName Fragments:Terminals:TERM_MQ104BSensorTerminal_Ge_00227D9F Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ104B Auto Const mandatory
Scene Property AudioLogs_MQ104B_BarrettHeller Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  MQ104B.SetStage(100)
  AudioLogs_MQ104B_BarrettHeller.Start()
EndFunction
