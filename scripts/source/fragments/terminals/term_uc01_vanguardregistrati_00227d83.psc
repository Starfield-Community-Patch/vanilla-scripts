ScriptName Fragments:Terminals:TERM_UC01_VanguardRegistrati_00227D83 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  If !UC01.GetStageDone(350)
    UC01.SetStage(200)
  EndIf
EndFunction
