ScriptName MQ204HunterWarpsTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Int CooldownTimer = 10

;-- Properties --------------------------------------
Quest Property MQ204 Auto Const mandatory
Int Property WarpPrereqStage = 105 Auto Const
Int Property WarpTurnOffStage = 600 Auto Const

;-- State -------------------------------------------
State CooldownState

  Event OnTimer(Int aiTimerID)
    Self.GoToState("WaitingForTrigger")
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    ; Empty function
  EndEvent

  Event OnBeginState(String asOldState)
    Self.StartTimer(10.0, 0)
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      If MQ204.GetStageDone(WarpPrereqStage)
        If MQ204.GetStageDone(WarpTurnOffStage)
          Self.Disable(False)
        Else
          Self.GoToState("CooldownState")
          (MQ204 as mq204script).HunterWarps(Self.getLinkedRef(None))
        EndIf
      EndIf
    EndIf
  EndEvent
EndState
