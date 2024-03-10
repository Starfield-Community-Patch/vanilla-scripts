ScriptName Fragments:Terminals:TERM_CF_JasmineTerminal_LC08_01001007 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalRobot Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[]
  Int I = 0
  While I < linkedRobots.Length
    linkedRobots[I].SetUnconscious(True)
    I += 1
  EndWhile
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[]
  Int I = 0
  While I < linkedRobots.Length
    linkedRobots[I].RemoveFromAllFactions()
    linkedRobots[I].AddToFaction(PlayerAllyFaction)
    linkedRobots[I].SetUnconscious(False)
    I += 1
  EndWhile
EndFunction
