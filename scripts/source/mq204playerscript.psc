ScriptName MQ204PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int EyePathRunToShipPrereq = 480
Int EyePathRunToShipStage = 490
Int NewAtlantisToShipPrereqStage = 110
Int NewAtlantisToShipStage = 135

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property BuildArmillaryPrereqStage = 510 Auto Const
Int Property BuildArmillaryStage = 620 Auto Const
Int Property EyePathPostRescuedEyeStage = 455 Auto Const
Int Property EyePathPostRescuedEyePrereq = 450 Auto Const
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory
Keyword Property ShipTypeStarborn Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myMQ204 = Self.GetOwningQuest()
  spaceshipreference PlayerShipREF = PlayerShip.GetShipReference()
  If akShip == PlayerShipREF as ObjectReference
    If myMQ204.GetStageDone(NewAtlantisToShipPrereqStage)
      myMQ204.SetStage(NewAtlantisToShipStage)
    EndIf
    If myMQ204.GetStageDone(EyePathRunToShipPrereq)
      myMQ204.SetStage(EyePathRunToShipStage)
    EndIf
    If myMQ204.GetStageDone(EyePathPostRescuedEyePrereq)
      myMQ204.SetStage(EyePathPostRescuedEyeStage)
    EndIf
  EndIf
EndEvent
