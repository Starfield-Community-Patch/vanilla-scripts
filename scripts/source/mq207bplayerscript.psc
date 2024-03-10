ScriptName MQ207BPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property PreReqStageGravJumpRange = 12 Auto Const
Int Property StageToSetGravJumpRange = 13 Auto Const
Int Property GravJumpRangeToCheck = 28 Auto Const

;-- Functions ---------------------------------------

Event OnPlayerModifiedShip(spaceshipreference akShip)
  Quest myQuest = Self.GetOwningQuest()
  Float myGravJumpRange = akShip.GetGravJumpRange()
  If akShip == PlayerShip.GetShipRef()
    If myGravJumpRange >= GravJumpRangeToCheck as Float
      If myQuest.GetStageDone(PreReqStageGravJumpRange)
        myQuest.SetStage(StageToSetGravJumpRange)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnHomeShipSet(spaceshipreference akShip, spaceshipreference akPrevious)
  Quest myQuest = Self.GetOwningQuest()
  Float myGravJumpRange = akShip.GetGravJumpRange()
  If myGravJumpRange >= GravJumpRangeToCheck as Float
    If myQuest.GetStageDone(PreReqStageGravJumpRange)
      myQuest.SetStage(StageToSetGravJumpRange)
    EndIf
  EndIf
EndEvent
