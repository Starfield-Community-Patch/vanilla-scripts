ScriptName Fragments:Terminals:TERM_UC02_LivestockScanner_O_00227D5D Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC02_LivestockTrackerEnabled Auto Const mandatory
Quest Property UC02_ScannerQuest Auto Const mandatory
GlobalVariable Property UC02_TrackerSystemTuned Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  If UC02_TrackerSystemTuned.GetValue() <= 0.0
    If UC02_LivestockTrackerEnabled.GetValue() <= 0.0
      UC02_LivestockTrackerEnabled.SetValue(1.0)
    EndIf
  EndIf
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  If !UC02_ScannerQuest.IsRunning()
    UC02_ScannerQuest.Start()
  EndIf
EndFunction
