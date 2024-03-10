ScriptName MQ204ShipWorkshopScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property BuildArmillaryPrereqStage = 510 Auto Const
Int Property BuildArmillaryTurnOffStage = 620 Auto Const
Int Property BuildArmillaryTutorialStage = 520 Auto Const

;-- Functions ---------------------------------------

Event OnWorkshopMode(Bool aStart)
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryTurnOffStage) == False && myQuest.GetStageDone(BuildArmillaryTutorialStage) == False
    myQuest.SetStage(BuildArmillaryTutorialStage)
  EndIf
EndEvent
