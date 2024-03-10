ScriptName Fragments:Terminals:TERM_MissionBoardTerminalFar_00001EE7 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MissionBoardFarCourier01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  MissionBoardFarCourier01.SetStage(10)
EndFunction
