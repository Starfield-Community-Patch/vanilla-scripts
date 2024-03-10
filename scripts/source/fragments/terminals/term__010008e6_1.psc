ScriptName Fragments:Terminals:TERM__010008E6_1 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
ActorValue Property LC012_CreatureAttack Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100)
  Int I = 0
  While I < linkedSecurityDoors.Length
    linkedSecurityDoors[I].SetOpen(True)
    linkedSecurityDoors[I].SetLockLevel(253)
    I += 1
  EndWhile
  ObjectReference[] linkedCreatures = akTerminalRef.GetLinkedRefChain(LinkCustom01, 100)
  Int j = 0
  While j < linkedCreatures.Length
    linkedCreatures[j].SetValue(LC012_CreatureAttack, 1.0)
    j += 1
  EndWhile
  akTerminalRef.SetValue(LC012_CreatureAttack, 1.0)
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100)
  Int I = 0
  While I < linkedSecurityDoors.Length
    linkedSecurityDoors[I].SetOpen(False)
    linkedSecurityDoors[I].SetLockLevel(253)
    I += 1
  EndWhile
  akTerminalRef.SetValue(LC012_CreatureAttack, 0.0)
EndFunction
