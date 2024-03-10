ScriptName Fragments:Terminals:TERM_CFKey_DelgadosTerminal_001B86F1 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory
Keyword Property LinkTerminalDoor Auto Const mandatory
Keyword Property LinkTerminalRobot Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Faction Property LC043SYFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100)
  Int I = 0
  While I < linkedSecurityDoors.Length
    linkedSecurityDoors[I].Unlock(False)
    linkedSecurityDoors[I].SetOpen(True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  ObjectReference[] linkedDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor, 100)
  Int I = 0
  While I < linkedDoors.Length
    linkedDoors[I].Unlock(False)
    linkedDoors[I].SetOpen(True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Terminal_03(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[]
  Int I = 0
  While I < linkedRobots.Length
    linkedRobots[I].SetUnconscious(True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Terminal_04(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[]
  Int I = 0
  While I < linkedRobots.Length
    linkedRobots[I].AddToFaction(PlayerAllyFaction)
    linkedRobots[I].RemoveFromFaction(LC043SYFaction)
    linkedRobots[I].RemoveFromFaction(LC043SY01Faction)
    linkedRobots[I].RemoveFromFaction(LC043SY02Faction)
    linkedRobots[I].RemoveFromFaction(LC043SY03Faction)
    linkedRobots[I].SetUnconscious(False)
    I += 1
  EndWhile
EndFunction
