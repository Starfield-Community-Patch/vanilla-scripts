ScriptName Fragments:Terminals:TERM_MS02_FacilityDoorTermin_00227D0F Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MS02.SetStage(1890)
EndFunction
