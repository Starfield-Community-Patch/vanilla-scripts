ScriptName SettleRedMileAirlockControlScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property InsideFrontDoor Auto Const mandatory
ObjectReference Property InsideCourseDoor Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  Int openStateFrontDoor = InsideFrontDoor.GetOpenState()
  Int openStateCourseDoor = InsideCourseDoor.GetOpenState()
  While openStateCourseDoor == 4 || openStateFrontDoor == 4
    Utility.Wait(0.100000001)
    openStateFrontDoor = InsideFrontDoor.GetOpenState()
    openStateCourseDoor = InsideCourseDoor.GetOpenState()
  EndWhile
  InsideFrontDoor.SetOpen(True)
  InsideCourseDoor.SetOpen(True)
EndEvent

Event OnCellDetach()
  InsideFrontDoor.SetOpen(False)
  InsideCourseDoor.SetOpen(False)
EndEvent
