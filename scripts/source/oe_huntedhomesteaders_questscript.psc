ScriptName OE_HuntedHomesteaders_QuestScript Extends Quest

;-- Variables ---------------------------------------
Int WaitTimerID = 1
Float WaitTimerLength = 0.0

;-- Properties --------------------------------------
Group QuestProperties
  Int Property StageToSet = 300 Auto Const
  { This is the stage that will be set when the timer ends. }
  Float Property TimeToSpawn = 15.0 Auto
  { In Seconds -- the minimum time that must pass before the creatures spawn. }
  Float Property MaxTimeToSpawn = 35.0 Auto
  { In seconds, the maxinum amount of time to wait for the Predators to spawn. }
EndGroup


;-- Functions ---------------------------------------

Function StartWaitTimer()
  WaitTimerLength = Utility.RandomFloat(TimeToSpawn, MaxTimeToSpawn) * 0.0167
  Self.StartTimerGametime(WaitTimerLength, WaitTimerID)
EndFunction

Function StopWaitTimer()
  Self.CancelTimerGameTime(WaitTimerID)
EndFunction

Event OnTimerGameTime(Int aiTimerId)
  If aiTimerId == WaitTimerID
    Self.SetStage(StageToSet)
  EndIf
EndEvent
