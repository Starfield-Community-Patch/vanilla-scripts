ScriptName Fragments:Terminals:TERM_UC07_EclipticOutpost_Te_0009DE51 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Dialogue1OfAKindUC07 Auto Const mandatory
GlobalVariable Property UC07_Niira_PreventCageRelease Auto Const mandatory
Quest Property UC07 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  (Dialogue1OfAKindUC07 as oneofakindquestscript).OpenCageGate()
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  UC07_Niira_PreventCageRelease.SetValue(1.0)
  If UC07.IsRunning()
    UC07.SetStage(615)
  EndIf
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  UC07_Niira_PreventCageRelease.SetValue(0.0)
EndFunction
