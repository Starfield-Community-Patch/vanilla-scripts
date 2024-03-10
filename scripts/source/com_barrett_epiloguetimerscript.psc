ScriptName COM_Barrett_EpilogueTimerScript Extends Quest
{ A timer that counts down days after an event and sets a stage }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const mandatory
Int Property idNumber Auto Const mandatory
Int Property cooldownHours Auto Const mandatory

;-- Functions ---------------------------------------

Function StartCooldownTimer()
  Self.StartTimerGameTime(cooldownHours as Float, idNumber)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == idNumber
    Self.SetStage(StageToSet)
  EndIf
EndEvent
