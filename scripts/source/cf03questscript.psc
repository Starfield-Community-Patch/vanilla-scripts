ScriptName CF03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Function WaitQT()
  Self.StartTimer(120.0, 1)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1
    Self.SetStage(StageToSet)
  EndIf
EndEvent
