ScriptName City_Akila_Ashta02_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Function Wait24()
  Self.StartTimerGameTime(24.0, 1)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1
    Self.SetStage(StageToSet)
  EndIf
EndEvent
