ScriptName Fragments:Terminals:TERM_MQ207C_Nishina02_LabCon_00224A69 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
mq207cquestscript Property MQ207C Auto Const mandatory
ActorValue Property MQ207C_LabControlTerminalUniverseValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MQ207C.TryToStartDegaussing(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as Int)
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  MQ207C.TryToStartDegaussing(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as Int)
EndFunction
