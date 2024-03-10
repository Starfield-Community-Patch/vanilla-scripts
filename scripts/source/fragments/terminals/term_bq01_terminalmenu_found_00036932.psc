ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_Found_00036932 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(2134)
EndFunction
