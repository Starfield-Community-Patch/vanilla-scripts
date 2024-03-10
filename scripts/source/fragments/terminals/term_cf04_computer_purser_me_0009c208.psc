ScriptName Fragments:Terminals:TERM_CF04_Computer_Purser_Me_0009C208 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  If CF04.GetStageDone(610) == True
    CF04.SetStage(630)
  EndIf
EndFunction
