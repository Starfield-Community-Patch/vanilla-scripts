ScriptName Fragments:Terminals:TERM_MQ301EarthTerminal02Sub_0021C75F Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ301 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth07 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth06.Stop()
  AudioLogsQuest_MQ301_Earth07.Stop()
  AudioLogsQuest_MQ301_Earth06.Start()
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth06.Stop()
  AudioLogsQuest_MQ301_Earth07.Stop()
  AudioLogsQuest_MQ301_Earth07.Start()
  MQ301.SetStage(143)
EndFunction
