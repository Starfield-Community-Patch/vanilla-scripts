ScriptName Fragments:Terminals:TERM_CFKey_DelgadosTerminalS_00147DBE Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088_Key Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  LC088_Key.SetStage(1090)
EndFunction
