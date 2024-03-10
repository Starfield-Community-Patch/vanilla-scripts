ScriptName MQ305ArmillaryAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
inputenablelayer MQ305ArmillaryEnableLayer

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const
GlobalVariable Property MQArmillaryCompleteGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef()
  If abRemove
    PlayerShipREF.LockPowerAllocation(3, -1, False)
    MQ305ArmillaryEnableLayer.EnableGravJump(True)
    MQ305ArmillaryEnableLayer = None
  ElseIf MQArmillaryCompleteGlobal.GetValueInt() == 1
    PlayerShipREF.LockPowerAllocation(3, -1, True)
    PlayerShipREF.SetPartPower(3, -1, 0)
    MQ305ArmillaryEnableLayer = inputenablelayer.Create()
    MQ305ArmillaryEnableLayer.EnableGravJump(False)
  EndIf
EndEvent
