ScriptName LC118RobotPodActivation Extends ObjectReference
{ Robot pod chain activation script for LC118. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Robot1 Auto Const
ObjectReference Property Robot2 Auto Const
ObjectReference Property Robot3 Auto Const
Keyword Property LinkCustom01 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference akActionRef)
    Self.GoToState("Done")
    robotpodscript[] linkedRobots = Self.GetLinkedRefChain(LinkCustom01, 100) as robotpodscript[]
    Int I = 0
    While I < linkedRobots.Length
      If linkedRobots[I] != None
        linkedRobots[I].WakeRobotFromPod()
      EndIf
      I += 1
    EndWhile
  EndEvent
EndState
