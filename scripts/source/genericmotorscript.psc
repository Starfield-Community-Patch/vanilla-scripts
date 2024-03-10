ScriptName GenericMotorScript Extends ObjectReference
{ script for objects with powered rotating motors }

;-- Variables ---------------------------------------
Bool init = False

;-- Properties --------------------------------------
String Property MotorName Auto Const
Float Property MotorVelocity Auto Const
Int Property MotorRotationAxis Auto Const
{ 0 = x, 1 = y, 2 = z }
Float Property MotorForce Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  ; Empty function
EndEvent

Event OnLoad()
  If init == False
    init = True
    Float aAxisX = 0.0
    Float aAxisY = 0.0
    Float aAxisZ = 0.0
    If MotorRotationAxis == 0
      aAxisX = MotorVelocity
    ElseIf MotorRotationAxis == 1
      aAxisY = MotorVelocity
    ElseIf MotorRotationAxis == 2
      aAxisZ = MotorVelocity
    EndIf
    Self.ApplyFanMotor(MotorName, aAxisX, aAxisY, aAxisZ, MotorForce, False)
  EndIf
EndEvent

Event OnPowerOff()
  Self.FanMotorOn(False)
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
  If Self.IsDestroyed() == False
    Self.FanMotorOn(True)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Self.StartTimer(2.0, 0)
EndEvent

Event OnTimer(Int aiTimerID)
  Int openState = Self.GetOpenState()
  If openState >= 3 && Self.IsPowered() == True
    Self.FanMotorOn(True)
  Else
    Self.FanMotorOn(False)
  EndIf
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If Self.IsDestroyed()
    Self.FanMotorOn(False)
  ElseIf aiCurrentStage == 0
    Self.StartTimer(2.0, 0)
  EndIf
EndEvent
