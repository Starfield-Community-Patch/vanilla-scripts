ScriptName Fragments:Terminals:TERM_MQ207C_Nishina02_Securi_00223FEF Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ207C Auto Const
ActorValue Property MQ207C_SecurityOverrideActiveValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  MQ207C.SetStage(618)
  akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1.0)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MQ207C.SetStage(625)
  akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1.0)
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  MQ207C.SetStage(638)
  akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1.0)
EndFunction

Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
  MQ207C.SetStage(628)
  akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1.0)
EndFunction
