ScriptName Fragments:Terminals:TERM_MQ207C_Nishina02_II_Freq Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
mq207cquestscript Property MQ207C Auto Const mandatory
ActorValue Property MQ207C_MasterControlTerminalUniverseValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int)
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 20)
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 22)
EndFunction

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 24)
EndFunction

Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 26)
EndFunction

Function Fragment_TerminalMenu_07(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 28)
EndFunction

Function Fragment_TerminalMenu_08(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 30)
EndFunction

Function Fragment_TerminalMenu_09(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 32)
EndFunction

Function Fragment_TerminalMenu_10(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 34)
EndFunction

Function Fragment_TerminalMenu_11(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 36)
EndFunction

Function Fragment_TerminalMenu_12(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 38)
EndFunction

Function Fragment_TerminalMenu_13(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 40)
EndFunction

Function Fragment_TerminalMenu_14(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int)
EndFunction

Function Fragment_TerminalMenu_16(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int)
EndFunction

Function Fragment_TerminalMenu_17(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int)
EndFunction
