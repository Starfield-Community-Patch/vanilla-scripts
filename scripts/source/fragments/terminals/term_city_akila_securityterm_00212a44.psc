ScriptName Fragments:Terminals:TERM_City_Akila_SecurityTerm_00212A44 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Akila_Ashta02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  City_Akila_Ashta02.SetStage(110)
EndFunction
