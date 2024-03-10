ScriptName Mq305PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property BuildArmillaryPrereqStage = 10 Auto Const
Int Property BuildArmillaryStage = 40 Auto Const
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory

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
  If akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1.0
    If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryStage) == False
      myQuest.SetStage(BuildArmillaryStage)
    EndIf
  EndIf
EndEvent
