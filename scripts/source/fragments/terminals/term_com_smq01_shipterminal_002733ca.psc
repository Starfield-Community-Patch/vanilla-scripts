ScriptName Fragments:Terminals:TERM_COM_SMQ01_ShipTerminal_002733CA Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ105 Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  COM_Quest_SarahMorgan_Q01.SetStage(110)
EndFunction
