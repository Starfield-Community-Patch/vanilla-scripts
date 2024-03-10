ScriptName Fragments:Terminals:TERM_AkilaLife04_Computer_Me_002D1D2C Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_AkilaLife04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_AkilaLife04.SetStage(230)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  City_AkilaLife04.SetStage(210)
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  City_AkilaLife04.SetStage(220)
EndFunction
