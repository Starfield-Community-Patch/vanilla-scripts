ScriptName Botany03_WaitScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Function Wait24()
  Self.StartTimerGameTime(12.0, 1)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1
    Self.SetStage(StageToSet)
  EndIf
EndEvent
