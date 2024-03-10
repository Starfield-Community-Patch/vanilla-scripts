ScriptName UC01_VanguardTerminalScript Extends TerminalMenu Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC01_UCCrimeGold_VanguardTerminal Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  UC01_UCCrimeGold_VanguardTerminal.SetValue(CrimeFactionUC.GetCrimeGold() as Float)
  akTerminalRef.AddTextReplacementValue("CrimeGold", UC01_UCCrimeGold_VanguardTerminal.GetValueInt() as Float)
  akTerminalRef.AddTextReplacementData("PlayerName", Game.GetPlayer() as Form)
  akTerminalRef.AddTextReplacementData("ShipName", PlayerShip.GetRef() as Form)
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
