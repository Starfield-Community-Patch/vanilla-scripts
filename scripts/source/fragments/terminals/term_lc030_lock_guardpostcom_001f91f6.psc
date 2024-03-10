ScriptName Fragments:Terminals:TERM_LC030_Lock_GuardPostCom_001F91F6 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC030 Auto Const mandatory
Quest Property CF03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  LC030.SetStage(411)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  LC030.SetStage(412)
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  LC030.SetStage(413)
  CF03.SetStage(176)
EndFunction
