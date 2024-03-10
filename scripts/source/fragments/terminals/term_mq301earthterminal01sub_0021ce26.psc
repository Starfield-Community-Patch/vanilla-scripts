ScriptName Fragments:Terminals:TERM_MQ301EarthTerminal01Sub_0021CE26 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ301 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth01 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth02 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth01.Stop()
  AudioLogsQuest_MQ301_Earth02.Stop()
  AudioLogsQuest_MQ301_Earth03.Stop()
  AudioLogsQuest_MQ301_Earth01.Start()
  MQ301.SetStage(141)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth01.Stop()
  AudioLogsQuest_MQ301_Earth02.Stop()
  AudioLogsQuest_MQ301_Earth03.Stop()
  AudioLogsQuest_MQ301_Earth02.Start()
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth01.Stop()
  AudioLogsQuest_MQ301_Earth02.Stop()
  AudioLogsQuest_MQ301_Earth03.Stop()
  AudioLogsQuest_MQ301_Earth03.Start()
EndFunction
