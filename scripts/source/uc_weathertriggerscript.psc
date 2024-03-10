ScriptName UC_WeatherTriggerScript Extends ObjectReference Const
{ Set or force a weather on the player when this trigger loads }

;-- Variables ---------------------------------------
Int iTimerID = 1 Const
Int iTimerLoop = 5 Const

;-- Properties --------------------------------------
Group Required_Properties
  Weather Property TargetWeather Auto Const mandatory
  { The weather we want to turn on }
EndGroup

Group Optional_Properties
  Bool Property SetAsOverride = False Auto Const
  { If TRUE, this weather will remain in place until the player leaves this planet OR this trigger unloads }
  Bool Property UseAcceleratedTransition = False Auto Const
  { If TRUE, the game will attempt to transition to this weather in its accelerated state }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If Self.IsEnabled()
    Self.StartWeatherChange()
  EndIf
EndEvent

Function StartWeatherChange()
  If Weather.GetCurrentWeather() != TargetWeather
    TargetWeather.SetActive(SetAsOverride, UseAcceleratedTransition)
  EndIf
  Self.StartTimer(iTimerLoop as Float, iTimerID)
EndFunction

Function CleanupWeather()
  If SetAsOverride
    Weather.ReleaseOverride()
  EndIf
EndFunction

Function CheckCleanupCriteria()
  If !Self.Is3DLoaded()
    Self.CleanupWeather()
  Else
    Self.StartWeatherChange()
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID
    Self.CheckCleanupCriteria()
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
