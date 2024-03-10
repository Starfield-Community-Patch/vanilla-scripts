ScriptName Fragments:Terminals:TERM_UC02_LivestockScanner_O_0010DA12 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC02_LivestockTrackerEnabled Auto Const mandatory
Quest Property UC02_ScannerQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  If UC02_ScannerQuest.IsRunning()
    UC02_ScannerQuest.SetStage(1000)
  EndIf
EndFunction
