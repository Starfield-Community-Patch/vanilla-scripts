ScriptName Fragments:Terminals:TERM_LC043_SY02_DataAccessTe_0021476A Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  CF05.SetStage(1205)
EndFunction
