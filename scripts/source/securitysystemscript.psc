ScriptName SecuritySystemScript Extends ObjectReference Const
{ Extend this script to handle security system events. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group DefaultProperties collapsedonbase
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Location Property MyLocation Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_AlarmTriggeredOn")
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_AlarmTriggeredOff")
EndEvent

Event SQ_ParentScript.SQ_AlarmTriggeredOn(sq_parentscript source, Var[] akArgs)
  Location alarmLocation = akArgs[0] as Location
  sq_alarmscript alarmQuest = akArgs[1] as sq_alarmscript
  If alarmLocation == MyLocation
    
  EndIf
EndEvent

Event SQ_ParentScript.SQ_AlarmTriggeredOff(sq_parentscript source, Var[] akArgs)
  Location alarmLocation = akArgs[0] as Location
  sq_alarmscript alarmQuest = akArgs[1] as sq_alarmscript
  If alarmLocation == MyLocation
    
  EndIf
EndEvent
