ScriptName RI08_PostQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iTimer Auto Const mandatory
Int Property iQuestStage Auto Const mandatory

;-- Functions ---------------------------------------

Function StartPostQuestTimer()
  Self.StartTimerGameTime(iTimer as Float, 1)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1
    Self.SetStage(iQuestStage)
  EndIf
EndEvent
