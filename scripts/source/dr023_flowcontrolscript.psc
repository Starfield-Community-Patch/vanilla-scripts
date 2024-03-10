ScriptName DR023_FlowControlScript Extends ObjectReference

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State RandomDoorState

  Event OnCellLoad()
    Self.GotoState("Done")
    ObjectReference[] DR023doors = Self.GetLinkedRefChain(None, 100)
    ObjectReference DoorUnlocked = DR023doors[Utility.RandomInt(0, DR023doors.Length - 1)]
    DoorUnlocked.SetOpen(True)
  EndEvent
EndState
