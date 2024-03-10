ScriptName MQ101BarrettShipScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnShipTakeOff(Bool abComplete)
  Quest myQuest = Self.GetOwningQuest()
  If abComplete == False && myQuest.GetStageDone(320)
    myQuest.SetStage(345)
  EndIf
EndEvent

Event OnShipLanding(Bool abComplete)
  Quest myQuest = Self.GetOwningQuest()
  If abComplete && myQuest.GetStageDone(170)
    myQuest.SetStage(180)
  EndIf
EndEvent
