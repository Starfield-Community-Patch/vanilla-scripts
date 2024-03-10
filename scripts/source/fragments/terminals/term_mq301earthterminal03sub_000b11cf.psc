ScriptName Fragments:Terminals:TERM_MQ301EarthTerminal03Sub_000B11CF Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ301 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth07 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth06 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth08 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth09 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth10 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth09.Stop()
  AudioLogsQuest_MQ301_Earth10.Stop()
  AudioLogsQuest_MQ301_Earth08.Start()
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth08.Stop()
  AudioLogsQuest_MQ301_Earth10.Stop()
  AudioLogsQuest_MQ301_Earth09.Start()
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth08.Stop()
  AudioLogsQuest_MQ301_Earth09.Stop()
  AudioLogsQuest_MQ301_Earth10.Start()
  MQ301.SetStage(144)
EndFunction
