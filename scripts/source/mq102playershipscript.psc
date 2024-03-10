ScriptName MQ102PlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MoaraShip Auto Const mandatory
Int Property DockStageToSet Auto Const mandatory
ReferenceAlias Property NovaGalacticStaryard Auto Const mandatory
Int Property NovaDockStageToSet Auto Const mandatory
Int Property PreReqStage = 200 Auto Const

;-- Functions ---------------------------------------

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Quest MyQuest = Self.GetOwningQuest()
  If akParent == MoaraShip.GetShipReference() && abComplete
    MyQuest.SetStage(DockStageToSet)
  EndIf
  If akParent == NovaGalacticStaryard.GetShipReference() && abComplete && MyQuest.GetStageDone(PreReqStage)
    MyQuest.SetStage(NovaDockStageToSet)
  EndIf
EndEvent
