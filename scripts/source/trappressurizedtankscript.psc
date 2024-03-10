ScriptName TrapPressurizedTankScript Extends ObjectReference
{ Script that handles the pressurized tank trap }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapPressurizedTankData
  Float Property randomAngleRange = 45.0 Auto Const
  { Random range for force applied during boost. 0 = fly straight. }
  Float Property flyForce = 50.0 Auto Const
  { magnitude of the impluse applied on direction modification }
  Float Property impulsePeriod = 1.0 Auto Const
EndGroup

Group Audio
  wwiseevent Property WwiseEvent_TRP_PressurizedTank_AirRelease Auto Const mandatory
EndGroup


;-- State -------------------------------------------
State DestroyedState
EndState

;-- State -------------------------------------------
State FlyingState

  Event OnDestroyed(ObjectReference akDestroyer)
    Self.GotoState("DestroyedState")
  EndEvent

  Event OnTimer(Int aiTimerID)
    Float eulerAngleX = Self.getAngleX() + Utility.RandomFloat(-1.0 * randomAngleRange, randomAngleRange)
    Float eulerAngleY = Self.getAngleY() + Utility.RandomFloat(-1.0 * randomAngleRange, randomAngleRange)
    Float cosX = Math.cos(eulerAngleX)
    Float cosY = Math.cos(eulerAngleY)
    Float sinX = Math.sin(eulerAngleX)
    Float sinY = Math.sin(eulerAngleY)
    Float angleX = sinY
    Float angleY = -sinX * cosY
    Float angleZ = cosX * cosY
    Self.ApplyHavokImpulse(angleX, angleY, angleZ, flyForce)
    Self.StartTimer(impulsePeriod, 0)
  EndEvent

  Event OnBeginState(String asOldState)
    Self.StartTimer(impulsePeriod, 0)
    WwiseEvent_TRP_PressurizedTank_AirRelease.Play(Self as ObjectReference, None, None)
  EndEvent
EndState

;-- State -------------------------------------------
Auto State IdleState

  Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
    Self.GotoState("FlyingState")
  EndEvent
EndState
