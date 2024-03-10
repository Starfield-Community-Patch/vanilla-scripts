ScriptName HoursWithoutIncidentSignScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Int iOneHourTimerID = 1 Const

;-- Properties --------------------------------------
ActorValue Property Variable09 Auto Const mandatory
{ use this AV to track last time we rolled for an incident }
ActorValue Property Variable10 Auto Const mandatory
{ use this AV to track elapsed time since "last incident" }
Int Property incidentChancePerInterval = 10 Auto Const
{ for each elapsed day, this is the chance for an incident }
Float Property incidentRollInterval = 0.5 Auto Const
{ interval in days per roll }
Float Property maxTimeSinceIncident = 999.0 Auto Const
Float Property minTimeSinceIncident = 0.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.ResetSign()
  Self.StartTimerGameTime(1.0, iOneHourTimerID)
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor")
EndEvent

Event OnUnload()
  Self.CancelTimerGameTime(iOneHourTimerID)
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor")
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  Self.ResetSign()
  Self.StartTimerGameTime(1.0, iOneHourTimerID)
EndEvent

Event Actor.OnPlayerAssaultActor(Actor akSource, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  If aeCrime
    Self.SetValue(Variable10, Utility.GetCurrentGameTime())
    Self.ResetSign()
  EndIf
EndEvent

Function ResetSign()
  Float currentTime = Utility.GetCurrentGameTime()
  Float elapsedTimeSinceRoll = currentTime - Self.GetValue(Variable09)
  Bool incidentHappened = False
  While elapsedTimeSinceRoll > 0.0 && incidentHappened == False
    incidentHappened = Game.GetDieRollSuccess(incidentChancePerInterval, 1, 100, -1, -1)
    elapsedTimeSinceRoll -= incidentRollInterval
  EndWhile
  If incidentHappened
    Float lastIncident = currentTime - elapsedTimeSinceRoll - incidentRollInterval
    Self.SetValue(Variable10, lastIncident)
  EndIf
  Float timeSinceIncident = currentTime - Self.GetValue(Variable10)
  timeSinceIncident = Math.Min(timeSinceIncident * 24.0, maxTimeSinceIncident)
  timeSinceIncident = Math.Max(timeSinceIncident, minTimeSinceIncident)
  Float currentPosition = timeSinceIncident / maxTimeSinceIncident
  Self.SetAnimationVariableFloat("currentPosition", currentPosition)
  Self.SetValue(Variable09, currentTime)
EndFunction
