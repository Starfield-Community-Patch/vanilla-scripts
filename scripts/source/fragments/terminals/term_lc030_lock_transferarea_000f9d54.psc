ScriptName Fragments:Terminals:TERM_LC030_Lock_TransferArea_000F9D54 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  CF03.SetStage(130)
EndFunction
