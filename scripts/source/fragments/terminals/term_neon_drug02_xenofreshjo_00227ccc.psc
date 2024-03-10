ScriptName Fragments:Terminals:TERM_Neon_Drug02_XenofreshJo_00227CCC Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Neon_Drug02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  City_Neon_Drug02.SetStage(250)
EndFunction
