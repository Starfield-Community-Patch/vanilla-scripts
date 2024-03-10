ScriptName Fragments:Terminals:TERM_UC02_LivestockScanner_F_00227D5C Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC02_ScannerQuest Auto Const mandatory
Quest Property UC02 Auto Const mandatory
GlobalVariable Property UC02_TrackerSystemTuned Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  If UC02_TrackerSystemTuned.GetValue() <= 0.0
    UC02_TrackerSystemTuned.SetValue(1.0)
  EndIf
  If !UC02_ScannerQuest.IsRunning()
    UC02_ScannerQuest.Start()
  EndIf
  If UC02.GetStageDone(605) && !UC02.GetStageDone(700)
    UC02.SetStage(607)
  EndIf
EndFunction
