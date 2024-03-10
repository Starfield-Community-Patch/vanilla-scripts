ScriptName UC_WeatherTriggerScript_OnEnter Extends ObjectReference Const
{ Set or force a weather on the player when this trigger is entered by the player }

;-- Variables ---------------------------------------
Int iTimerID = 1 Const
Int iTimerLoop = 10 Const

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
  Int Property ShutdownStage = -1 Auto Const
  { If this stage has been set, clean up this weather }
  Quest Property ShutdownQuest Auto Const
  { The quest to check to see if we should shut down this weather }
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage)
    Self.StartWeatherChange()
  Else
    Self.CleanupWeather()
  EndIf
EndEvent

Function StartWeatherChange()
  If ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage)
    If Weather.GetCurrentWeather() != TargetWeather
      TargetWeather.SetActive(SetAsOverride, UseAcceleratedTransition)
    EndIf
    Self.StartTimer(iTimerLoop as Float, iTimerID)
  Else
    Self.CleanupWeather()
  EndIf
EndFunction

Function CleanupWeather()
  If SetAsOverride
    Weather.ReleaseOverride()
  EndIf
EndFunction

Function CheckCleanupCriteria()
  If Self.IsInTrigger(Game.GetPlayer() as ObjectReference) && (ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage))
    Self.StartWeatherChange()
  Else
    Self.CleanupWeather()
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
