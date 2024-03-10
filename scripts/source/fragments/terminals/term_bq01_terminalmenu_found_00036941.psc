ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_Found_00036941 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(160)
EndFunction
