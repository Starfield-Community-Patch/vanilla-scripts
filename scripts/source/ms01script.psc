ScriptName MS01Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS01_GroupsRescued Auto Const mandatory
ReferenceAlias Property ScientistDoorPackin Auto Const mandatory
Keyword Property Link_AirlockDoor01 Auto Const mandatory
Keyword Property Link_AirlockDoor02 Auto Const mandatory

;-- Functions ---------------------------------------

Int Function SpacerGroupKilled()
  Int nSpacersKilled = 0
  If Self.GetStageDone(410)
    nSpacersKilled += 1
  EndIf
  If Self.GetStageDone(420)
    nSpacersKilled += 1
  EndIf
  If Self.GetStageDone(430)
    nSpacersKilled += 1
  EndIf
  If Self.GetStageDone(440)
    nSpacersKilled += 1
  EndIf
  MS01_GroupsRescued.SetValue(nSpacersKilled as Float)
  Self.UpdateCurrentInstanceGlobal(MS01_GroupsRescued)
  Self.SetObjectiveDisplayed(300, True, True)
  If nSpacersKilled >= 4
    Self.SetStage(400)
  EndIf
EndFunction

Function LockDoors(Bool bLock)
  ObjectReference myDoor01 = ScientistDoorPackin.GetRef().GetLinkedRef(Link_AirlockDoor01)
  ObjectReference myDoor02 = ScientistDoorPackin.GetRef().GetLinkedRef(Link_AirlockDoor02)
  myDoor01.Lock(bLock, False, True)
  myDoor02.Lock(bLock, False, True)
  If bLock == True
    myDoor01.SetLockLevel(100)
    myDoor02.SetLockLevel(100)
  Else
    myDoor01.SetLockLevel(0)
    myDoor02.SetLockLevel(0)
  EndIf
EndFunction
