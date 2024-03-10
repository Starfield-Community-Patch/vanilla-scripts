ScriptName AkilaLife01_InvestigateTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_AkilaLife01 Auto Const mandatory
Int Property StageToSet Auto Const
Int Property TimerID Auto Const
GlobalVariable Property City_AkilaLife01_Timer Auto Const mandatory
GlobalVariable Property City_AkilaLife01_TriggerActive Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    City_AkilaLife01_TriggerActive.SetValue(1.0)
    If City_AkilaLife01.GetStageDone(100) && City_AkilaLife01.GetStageDone(150) == False
      If Game.GetLocalTime() > 20.0 || Game.GetLocalTime() < 4.0
        City_AkilaLife01.SetStage(StageToSet)
      Else
        Self.StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If City_AkilaLife01_TriggerActive.GetValue() as Int == 1
      City_AkilaLife01_TriggerActive.SetValue(0.0)
    EndIf
  EndIf
EndEvent

Event OnTimerGameTime(Int TimerID)
  If Game.GetLocalTime() > 20.0 || Game.GetLocalTime() < 4.0
    If City_AkilaLife01_TriggerActive.GetValue() as Int == 1
      City_AkilaLife01.SetStage(StageToSet)
    Else
      Self.StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID)
    EndIf
  Else
    Self.StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID)
  EndIf
EndEvent
