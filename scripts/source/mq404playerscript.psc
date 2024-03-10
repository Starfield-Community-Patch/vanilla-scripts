ScriptName MQ404PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property BuildArmillaryPrereqStage = 110 Auto Const
Int Property BuildArmillaryStage = 120 Auto Const
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory
Keyword Property ShipTypeStarborn Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnPlayerModifiedShip(spaceshipreference akShip)
  Quest myQuest = Self.GetOwningQuest()
  If akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1.0
    If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryStage) == False
      myQuest.SetStage(BuildArmillaryStage)
    EndIf
  EndIf
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest()
  spaceshipreference PlayerShipREF = PlayerShip.GetShipReference()
  If (akShip == PlayerShipREF as ObjectReference) && akShip.HasKeyword(ShipTypeStarborn)
    If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryStage) == False
      myQuest.SetStage(BuildArmillaryStage)
    EndIf
  EndIf
EndEvent
