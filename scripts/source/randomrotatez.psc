ScriptName RandomRotateZ Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property RotationIncrement = 0.0 Auto Const
{ Set to 0 to have a random rotation }
Float Property TimeBetweenRotations = 10.0 Auto Const
{ Time in seconds between updates to the rotation }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.StartTimer(TimeBetweenRotations, 1)
EndEvent

Event OnTimer(Int aiTimerID)
  If RotationIncrement == 0.0
    Self.SetAngle(0.0, 0.0, Utility.RandomInt(0, 360) as Float)
  Else
    Self.SetAngle(0.0, 0.0, Self.GetAngleZ() + RotationIncrement)
  EndIf
  Self.StartTimer(TimeBetweenRotations, 1)
EndEvent
