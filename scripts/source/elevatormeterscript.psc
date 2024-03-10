ScriptName ElevatorMeterScript Extends ObjectReference Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property StartOn = False Auto Const
{ ONLY FOR LOAD ELEVATORS!  If this meter is above the EXTERIOR door then this should be set to TRUE }
Bool Property StartMoving = False Auto Const
{ ONLY FOR LOAD ELEVATORS!  If this meter is above the INTERIOR door then this should be set to TRUE }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If StartOn
    Self.WaitFor3DLoad()
    Self.PlayAnimation("StartOn")
  EndIf
  If StartMoving
    Self.WaitFor3DLoad()
    Self.PlayAnimation("Play01")
  EndIf
EndEvent
