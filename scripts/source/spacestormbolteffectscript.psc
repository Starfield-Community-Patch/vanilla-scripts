ScriptName SpaceStormBoltEffectScript Extends ActiveMagicEffect
{ Script for SpaceStormBoltVFXEffect, the space storm bolt strike effect. }

;-- Variables ---------------------------------------
Float CONST_CameraShakeStrength_Max_InPilotSeat = 0.600000024 Const
Float CONST_CameraShakeStrength_Max_NotInPilotSeat = 0.100000001 Const
Float CONST_CameraShakeStrength_Min_InPilotSeat = 0.200000003 Const
Float CONST_CameraShakeStrength_Min_NotInPilotSeat = 0.01 Const
Float CONST_ControllerShakeStrength_Max_InPilotSeat = 0.600000024 Const
Float CONST_ControllerShakeStrength_Max_NotInPilotSeat = 0.100000001 Const
Float CONST_ControllerShakeStrength_Min_InPilotSeat = 0.200000003 Const
Float CONST_ControllerShakeStrength_Min_NotInPilotSeat = 0.01 Const
Float CONST_IgnoreChance_NotInPilotSeat = 0.5 Const
Float CONST_ShakeDuration_Max_InPilotSeat = 0.899999976 Const
Float CONST_ShakeDuration_Max_NotInPilotSeat = 0.600000024 Const
Float CONST_ShakeDuration_Min_InPilotSeat = 0.5 Const
Float CONST_ShakeDuration_Min_NotInPilotSeat = 0.300000012 Const

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Float cameraShakeStrength = 0.0
  Float controllerShakeStrength = 0.0
  Float shakeDuration = 0.0
  If akTarget == PlayerShip.GetRef()
    If Game.GetPlayer().GetFurnitureUsing() == PlayerShipPilotSeat.GetRef()
      cameraShakeStrength = Utility.RandomFloat(CONST_CameraShakeStrength_Min_NotInPilotSeat, CONST_CameraShakeStrength_Max_NotInPilotSeat)
      controllerShakeStrength = Utility.RandomFloat(CONST_ControllerShakeStrength_Min_NotInPilotSeat, CONST_ControllerShakeStrength_Max_NotInPilotSeat)
      shakeDuration = Utility.RandomFloat(CONST_ShakeDuration_Min_NotInPilotSeat, CONST_ShakeDuration_Max_NotInPilotSeat)
    ElseIf Utility.RandomFloat(0.0, 1.0) < CONST_IgnoreChance_NotInPilotSeat
      
    Else
      cameraShakeStrength = Utility.RandomFloat(CONST_CameraShakeStrength_Min_InPilotSeat, CONST_CameraShakeStrength_Max_InPilotSeat)
      controllerShakeStrength = Utility.RandomFloat(CONST_ControllerShakeStrength_Min_InPilotSeat, CONST_ControllerShakeStrength_Max_InPilotSeat)
      shakeDuration = Utility.RandomFloat(CONST_ShakeDuration_Min_InPilotSeat, CONST_ShakeDuration_Max_InPilotSeat)
    EndIf
    If shakeDuration > 0.0
      Game.ShakeController(controllerShakeStrength, controllerShakeStrength, shakeDuration)
      Game.ShakeCamera(None, cameraShakeStrength, shakeDuration)
    EndIf
  EndIf
EndEvent
