ScriptName Fragments:Terminals:TERM_MissionBoardTerminalLoc_00001EE2 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MissionBoardLocalCourier01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  MissionBoardLocalCourier01.SetStage(10)
EndFunction
