ScriptName UC03_TextReplacementScript Extends TerminalMenu Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC03_JakobsDebtAmount Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_01 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_02 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_03 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_04 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_05 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  akTerminalRef.AddTextReplacementValue("CurrentDebt", UC03_JakobsDebtAmount.GetValueInt() as Float)
  akTerminalRef.AddTextReplacementValue("Debt00", UC03_JakobsDebtNewValue_00.GetValueInt() as Float)
  akTerminalRef.AddTextReplacementValue("Debt01", UC03_JakobsDebtNewValue_01.GetValueInt() as Float)
  akTerminalRef.AddTextReplacementValue("Debt02", UC03_JakobsDebtNewValue_02.GetValueInt() as Float)
  akTerminalRef.AddTextReplacementValue("Debt03", UC03_JakobsDebtNewValue_03.GetValueInt() as Float)
  akTerminalRef.AddTextReplacementValue("Debt04", UC03_JakobsDebtNewValue_04.GetValueInt() as Float)
  akTerminalRef.AddTextReplacementValue("Debt05", UC03_JakobsDebtNewValue_05.GetValueInt() as Float)
EndEvent
