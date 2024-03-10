ScriptName Mq301Script Extends Quest

;-- Variables ---------------------------------------
Int MoonLogCountCurrent

;-- Properties --------------------------------------
Int Property MoonLogCountTotal = 6 Auto Const
Int Property MoonLogsDoneStage = 50 Auto Const
Int Property MoonLogObj = 12 Auto Const
Int Property MoonLogsFirstStage = 25 Auto Const

;-- Functions ---------------------------------------

Function UpdateMoonLogCount()
  MoonLogCountCurrent += 1
  If MoonLogCountCurrent == MoonLogCountTotal
    Self.SetStage(MoonLogsDoneStage)
  EndIf
  If Self.GetStageDone(MoonLogsFirstStage) == False
    Self.SetStage(MoonLogsFirstStage)
  EndIf
  Self.SetObjectiveDisplayed(MoonLogObj, True, False)
EndFunction
