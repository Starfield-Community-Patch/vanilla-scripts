ScriptName LC102PassengerCombatStateChangeScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- State -------------------------------------------
State Done

  Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
    Self.GotoState("Done")
    Quest owningQuest = Self.GetOwningQuest()
    owningQuest.SetStage(StageToSet)
  EndEvent
EndState
