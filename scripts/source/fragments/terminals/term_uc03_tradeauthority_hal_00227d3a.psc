ScriptName Fragments:Terminals:TERM_UC03_TradeAuthority_Hal_00227D3A Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC03_JakobsDebtAmount Auto Const mandatory
Quest Property UC03 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_01 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_02 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_03 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_04 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_01.GetValueInt() as Float)
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
  EndIf
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700)
    UC03.SetStage(700)
  EndIf
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_02.GetValueInt() as Float)
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
  EndIf
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700)
    UC03.SetStage(700)
  EndIf
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_00.GetValueInt() as Float)
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
  EndIf
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700)
    UC03.SetStage(700)
  EndIf
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_03.GetValueInt() as Float)
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
  EndIf
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700)
    UC03.SetStage(700)
  EndIf
EndFunction

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_04.GetValueInt() as Float)
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
  EndIf
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700)
    UC03.SetStage(700)
  EndIf
EndFunction

Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_05.GetValueInt() as Float)
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
  EndIf
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700)
    UC03.SetStage(700)
  EndIf
EndFunction

Function Fragment_TerminalMenu_07(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(1.0)
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
  EndIf
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700)
    UC03.SetStage(700)
  EndIf
EndFunction
