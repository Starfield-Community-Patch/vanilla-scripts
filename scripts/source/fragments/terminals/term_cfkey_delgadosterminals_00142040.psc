ScriptName Fragments:Terminals:TERM_CFKey_DelgadosTerminalS_00142040 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088_Key Auto Const mandatory
Quest Property CF08_SysDef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  LC088_Key.SetStage(19)
EndFunction
