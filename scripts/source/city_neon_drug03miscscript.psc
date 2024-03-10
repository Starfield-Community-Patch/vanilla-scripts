ScriptName City_Neon_Drug03MiscScript Extends Quest
{ pops objective when Yannick will give you another shift }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Neon_Drug03_CooldownTimestamp Auto Const mandatory
Int Property ShiftObjective = 10 Auto Const

;-- Functions ---------------------------------------

Function StartShiftTimer()
  Self.SetObjectiveDisplayed(ShiftObjective, False, False)
  Neon_Drug03_CooldownTimestamp.SetValue(Utility.GetCurrentGameTime() + 1.0)
  Self.StartTimerGameTime(24.0, 0)
EndFunction

Function ClearShiftTimer()
  Self.SetObjectiveCompleted(ShiftObjective, True)
  Self.CancelTimerGameTime(0)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.SetObjectiveCompleted(ShiftObjective, False)
  Self.SetObjectiveDisplayed(ShiftObjective, True, False)
  Neon_Drug03_CooldownTimestamp.SetValue(Utility.GetCurrentGameTime())
EndEvent
