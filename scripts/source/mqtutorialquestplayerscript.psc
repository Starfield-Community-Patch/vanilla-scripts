ScriptName MQTutorialQuestPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property EnterPlayerShipStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  If akShip == PlayerShip.GetRef()
    Self.GetOwningQuest().SetStage(EnterPlayerShipStage)
  EndIf
EndEvent
