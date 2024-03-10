ScriptName POIBB001WeatherScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weather Property wStorm Auto Const mandatory
ObjectReference Property DustMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.Disable(False)
  wStorm.SetActive(True, False)
  Utility.Wait(40.0)
  DustMarker.Enable(False)
EndEvent

Event OnUnload()
  Weather.ReleaseOverride()
EndEvent
