ScriptName Fragments:Terminals:TERM_LC030_Lock_GuardPostCom_001F91FC Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  CF03.SetStage(175)
EndFunction
