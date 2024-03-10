ScriptName LC119RobotPodActivation Extends ObjectReference
{ Robot pod chain activation script for LC119. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property SparedLivvyStage = 400 Auto Const
Int Property LivvyBetrayStage = 475 Auto Const
Keyword Property LinkCustom01 Auto Const mandatory
Quest Property MS04 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference akActionRef)
    If MS04.GetStageDone(SparedLivvyStage) && MS04.GetStageDone(LivvyBetrayStage)
      Self.GoToState("Done")
      robotpodscript[] linkedRobots = Self.GetLinkedRefChain(LinkCustom01, 100) as robotpodscript[]
      Int I = 0
      While I < linkedRobots.Length
        If linkedRobots[I] != None
          linkedRobots[I].WakeRobotFromPod()
        EndIf
        I += 1
      EndWhile
    EndIf
  EndEvent
EndState
