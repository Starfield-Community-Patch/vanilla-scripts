ScriptName Fragments:Terminals:TERM_TestBountyBoard_01000868 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BountyQuestLocal01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  BountyQuestLocal01.SetStage(10)
EndFunction
