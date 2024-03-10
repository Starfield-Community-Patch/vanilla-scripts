ScriptName Fragments:Terminals:TERM_UC01_SimShipTerminal_Ma_0003D5D7 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01_ShipSimulatorHelperQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).TriggerResetTimer()
EndFunction
