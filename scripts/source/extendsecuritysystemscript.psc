ScriptName ExtendSecuritySystemScript Extends securitysystemscript Const
{ Example Script for Extending SecuritySystemScript }

;-- Functions ---------------------------------------

Event SQ_ParentScript.SQ_AlarmTriggeredOn(sq_parentscript source, Var[] akArgs)
  Location alarmLocation = akArgs[0] as Location
  If alarmLocation == MyLocation
    Self.GetLinkedRef(None).Enable(Self as Bool)
  EndIf
EndEvent
