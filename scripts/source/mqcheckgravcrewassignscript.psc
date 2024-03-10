ScriptName MQCheckGravCrewAssignScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PreReqStageGravJumpRange = 12 Auto Const
Int Property StageToSetGravJumpRange = 13 Auto Const
Int Property GravJumpRangeToCheck = 28 Auto Const

;-- Functions ---------------------------------------

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  spaceshipreference MyShip = Self.GetShipRef()
  If MyShip.GetGravJumpRange() >= GravJumpRangeToCheck as Float
    Quest myQuest = Self.GetOwningQuest()
    If myQuest.GetStageDone(PreReqStageGravJumpRange)
      myQuest.SetStage(StageToSetGravJumpRange)
    EndIf
  EndIf
EndEvent
