ScriptName MQ305PlayerShipAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Armillary Auto Const mandatory
ActorValue Property SpaceshipGravJumpPower Auto Const mandatory
GlobalVariable Property MQArmillaryCompleteGlobal Auto Const mandatory
Scene Property MQ305_000_GravJumpUnity Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  If akSystem == SpaceshipGravJumpPower && abAddPower && abDamageRelated == False
    ObjectReference ArmillaryREF = Armillary.GetRef()
    Int iArmillaryComplete = MQArmillaryCompleteGlobal.GetValueInt()
    ObjectReference ArmillaryShipREF = ArmillaryREF.GetCurrentShipRef() as ObjectReference
    spaceshipreference MyShipREF = Self.GetShipReference()
    If (ArmillaryShipREF == MyShipREF as ObjectReference) && iArmillaryComplete >= 1 && MyShipREF.IsInSpace()
      MQ305_000_GravJumpUnity.Start()
    EndIf
  EndIf
EndEvent
