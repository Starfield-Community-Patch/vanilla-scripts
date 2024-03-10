ScriptName MQCheckGravJumpQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property PreReqStageGravJumpRange = 12 Auto Const
Int Property StageToSetGravJumpRange = 13 Auto Const
Int Property GravJumpRangeToCheck = 28 Auto Const

;-- Functions ---------------------------------------

Function CheckSkillsMenu()
  Self.RegisterForMenuOpenCloseEvent("SkillsMenu")
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "SkillsMenu"
    If !abOpening
      spaceshipreference MyShip = PlayerShip.GetShipRef()
      Float myJumpRange = MyShip.GetGravJumpRange()
      If myJumpRange >= GravJumpRangeToCheck as Float
        If Self.GetStageDone(PreReqStageGravJumpRange)
          Self.SetStage(StageToSetGravJumpRange)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent
