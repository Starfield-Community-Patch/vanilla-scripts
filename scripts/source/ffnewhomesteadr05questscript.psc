ScriptName FFNewHomesteadR05QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property CooldownTimerDays = 3.0 Auto Const
GlobalVariable Property FFNewHomesteadR05_CooldownTime Auto Const mandatory

;-- Functions ---------------------------------------

Function SetCooldown()
  FFNewHomesteadR05_CooldownTime.SetValue(Utility.GetCurrentGameTime() + CooldownTimerDays)
EndFunction
