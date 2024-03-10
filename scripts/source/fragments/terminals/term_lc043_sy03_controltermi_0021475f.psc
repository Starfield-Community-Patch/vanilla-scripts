ScriptName Fragments:Terminals:TERM_LC043_SY03_ControlTermi_0021475F Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  CF05.SetStage(35)
EndFunction
