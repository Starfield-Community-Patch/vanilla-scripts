ScriptName Fragments:Terminals:TERM_CF04_Computer_Purser_Su_0009C207 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  If CF04.GetStageDone(600) == True
    CF04.SetStage(610)
  EndIf
EndFunction
