ScriptName LC044Jail_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iTurnOffStage Auto Const mandatory

;-- Functions ---------------------------------------

Function StartJailTimer()
  Self.StartTimer(60.0, 1)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1 && !Self.GetStageDone(iTurnOffStage)
    Self.SetStage(iStageToSet)
  EndIf
EndEvent
