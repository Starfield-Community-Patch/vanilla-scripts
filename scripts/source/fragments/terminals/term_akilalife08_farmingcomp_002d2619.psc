ScriptName Fragments:Terminals:TERM_AkilaLife08_FarmingComp_002D2619 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_AkilaLife04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_AkilaLife04.SetStage(230)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  City_AkilaLife04.SetStage(300)
EndFunction
