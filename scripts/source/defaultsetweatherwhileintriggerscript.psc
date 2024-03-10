ScriptName DefaultSetWeatherWhileInTriggerScript Extends ObjectReference default
{ Set the weather that should display while the player is in this trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weather Property WeatherToSetActive Auto Const mandatory
{ Defaults to CommonwealthClear }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  WeatherToSetActive.SetActive(True, False)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  Weather.ReleaseOverride()
EndEvent
