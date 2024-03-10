ScriptName Fragments:Terminals:TERM_FC06_CatalinaTerminalMe_01001C60 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  If FC06.GetStageDone(1100)
    FC06.SetStage(1400)
  EndIf
EndFunction
