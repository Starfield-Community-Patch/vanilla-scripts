ScriptName Fragments:Terminals:TERM_TestBountyBoard_0000149D Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BountyQuestFar01 Auto Const mandatory
Quest Property BountyQuestLocal01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  BountyQuestLocal01.SetStage(10)
EndFunction

Function Fragment_Terminal_03(ObjectReference akTerminalRef)
  BountyQuestFar01.SetStage(10)
EndFunction
