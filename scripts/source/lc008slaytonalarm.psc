ScriptName LC008SlaytonAlarm Extends SecuritySystemScript Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom02 Auto Const
{ Link chain to all the Security Gates }
Keyword Property LinkCustom03 Auto Const
{ Link to alarm klaxon sound }
Float Property AlarmSoundDuration = 10.0 Auto Const
{ Desired duration of the alarm sound }

;-- Functions ---------------------------------------

Event OnTimer(Int aiTimerID)
  ; Empty function
EndEvent

Event SQ_ParentScript.SQ_AlarmTriggeredOn(sq_parentscript source, Var[] akArgs)
  Location alarmLocation = akArgs[0] as Location
  If alarmLocation == MyLocation
    Self.StartTimer(AlarmSoundDuration, 0)
  EndIf
EndEvent
