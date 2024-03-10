ScriptName City_AkilaLife04_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const
ReferenceAlias Property KateFoley Auto Const mandatory

;-- Functions ---------------------------------------

Function Wait24()
  Self.StartTimerGameTime(24.0, 1)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1
    Self.SetStage(StageToSet)
    If KateFoley.GetRef().Is3DLoaded()
      Self.SetStage(350)
    EndIf
  EndIf
EndEvent
