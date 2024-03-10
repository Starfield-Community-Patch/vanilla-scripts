ScriptName CF08_AlarmScript Extends Quest

;-- Variables ---------------------------------------
Int alarmInstanceID

;-- Properties --------------------------------------
wwiseevent Property Wwise_Event_OBJ_Alarm_Ship_Battle_Prep Auto Const mandatory
ObjectReference Property CF08_SysDef_WwiseAlarmRef Auto Const mandatory

;-- Functions ---------------------------------------

Function PlayAlarm(Bool abPlay)
  If abPlay == True
    alarmInstanceID = Wwise_Event_OBJ_Alarm_Ship_Battle_Prep.Play(CF08_SysDef_WwiseAlarmRef, None, None)
  Else
    wwiseevent.StopInstance(alarmInstanceID)
  EndIf
EndFunction
