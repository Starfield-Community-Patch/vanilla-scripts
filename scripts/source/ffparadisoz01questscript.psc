ScriptName FFParadisoZ01QuestScript Extends Quest

;-- Variables ---------------------------------------
Int WaitTimerID = 1

;-- Properties --------------------------------------
Int Property WaitTimerEndStage = 450 Auto Const
ReferenceAlias Property Akachi Auto Const mandatory
ReferenceAlias Property Computer Auto Const mandatory
Float Property WaitTimerLength = 43200.0 Auto

;-- Functions ---------------------------------------

Function ComputerNoActivate()
  Computer.GetRef().BlockActivation(True, True)
EndFunction

Function ComputerAllowActivate()
  Computer.GetRef().BlockActivation(False, False)
EndFunction

Function StartWaitTimer()
  WaitTimerLength = Utility.GetHoursUntilLocalHour(11.0)
  Self.StartTimerGametime(WaitTimerLength, WaitTimerID)
EndFunction

Function StopWaitTimer()
  Self.CancelTimerGameTime(WaitTimerID)
EndFunction

Event OnTimerGameTime(Int aiTimerId)
  If aiTimerId == WaitTimerID
    Self.SetStage(WaitTimerEndStage)
  EndIf
EndEvent
